import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/models/question_SW_model.dart';
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/repositories/input_test_repository.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:final_project/services/speaking_api_service.dart';
import 'package:final_project/services/supabase_service.dart';
import 'package:final_project/services/writing_api_service.dart';
import 'package:final_project/widgets/audio_player_widget.dart';
import 'package:final_project/widgets/network_audio_player_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';

class PracticeFullPage extends StatefulWidget {
  /// format: materialId|levelId|partId|lessonId
  final String practiceId;
  final Future<void> Function()? onDone;
  final int? itemIndex;

  const PracticeFullPage({
    super.key,
    required this.practiceId,
    this.onDone,
    this.itemIndex,
  });

  @override
  State<PracticeFullPage> createState() => PracticeFullPageState();
}

class PracticeFullPageState extends State<PracticeFullPage> {
  final testRepo = InputTestRepository();
  final resultRepo = ResultRepository();
  final roadmapRepo = RoadmapRepository();
  final player = AudioPlayer();
  final recorder = AudioRecorder();
  final _supabaseService = SupabaseService(
    bucket: "practice_lesson_SW_recordings",
  );

  late final String materialId, levelId, partId, lessonId;

  // Listening & Reading specific
  List<QuestionLR> questionsLR = [];
  List<int?> answersLR = [];
  String? audioUrlLR;

  // Speaking & Writing specific
  List<QuestionSW> questionsSW = [];
  int currentIndex = 0;

  bool isPlaying = false;
  bool showAnswers = false;
  bool isFinishedAll = false;
  bool isStarted = false;
  bool isRecording = false;

  int correctCount = 0;
  int totalScore = 0;
  DateTime? latestAttemptTime;
  Timer? prepareTimer;
  Timer? recordTimer;

  int remainingPrepareSeconds = 0;
  int remainingRecordSeconds = 0;

  StreamSubscription<PlayerState>? _sub;

  // Speaking/Writing specific
  Map<String, String> recordings = {}; // questionId -> local file path
  Map<String, TextEditingController> textControllers = {};
  Map<String, String> answers = {}; // questionId -> text answer
  final Map<String, String> _uploadedAudioUrls = {};
  final Map<String, String> _uploadedStoragePaths = {};
  Map<String, GlobalKey<AudioPlayerWidgetState>> playerKeys = {};
  Map<String, GlobalKey<NetworkAudioPlayerWidgetState>> netPlayerKeys = {};
  Map<String, String> remotePlayUrls = {};
  Map<String, dynamic> evaluationResults = {};

  static const _partName = {
    // Listening
    'lis1': 'Listening - Part 1: Picture Description',
    'lis2': 'Listening - Part 2: Question & Response',
    'lis3': 'Listening - Part 3: Conversations',
    'lis4': 'Listening - Part 4: Talks',
    // Reading
    'read1': 'Reading - Part 5: Incomplete Sentences',
    'read2': 'Reading - Part 6: Text Completion',
    'read3': 'Reading - Part 7: Reading Comprehension',
    // Speaking
    'speak1': 'Speaking - Part 1: Read a text aloud',
    'speak2': 'Speaking - Part 2: Description a picture',
    'speak3': 'Speaking - Part 3: Respond to questions',
    'speak4':
        'Speaking - Part 4: Respond to questions using information provided',
    'speak5': 'Speaking - Part 5: Express an opinion',
    // Writing
    'write1': 'Writing - Part 6: Write a sentence based on picture',
    'write2': 'Writing - Part 7: Respond to a written request',
    'write3': 'Writing - Part 8: Write an opinion essay',
  };

  @override
  void initState() {
    super.initState();
    final seg = widget.practiceId.split('|');
    if (seg.length != 4) {
      throw ArgumentError('practiceId phải là material|level|part|lesson');
    }
    materialId = seg[0];
    levelId = seg[1];
    partId = seg[2];
    lessonId = seg[3];

    _requestPermission();
    _load();

    _sub = player.playerStateStream.listen((s) {
      if (!mounted) return;
      setState(() => isPlaying = s.playing);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    prepareTimer?.cancel();
    recordTimer?.cancel();
    player.dispose();
    try {
      recorder.dispose();
    } catch (_) {}
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.microphone.request();
    return status.isGranted;
  }

  bool _isListeningPart() {
    return partId.startsWith('lis');
  }

  bool _isReadingPart() {
    return partId.startsWith('read');
  }

  bool _isSpeakingPart() {
    return partId.startsWith('speak');
  }

  bool _isWritingPart() {
    return partId.startsWith('write');
  }

  Future<void> _load() async {
    try {
      if (_isListeningPart() || _isReadingPart()) {
        await _loadListeningReading();
      } else if (_isSpeakingPart() || _isWritingPart()) {
        await _loadSpeakingWriting();
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không tải được dữ liệu: $e')));
    }
  }

  Future<void> _loadListeningReading() async {
    final meta = await testRepo.getPartMetaByLesson(
      materialId: materialId,
      levelId: levelId,
      partId: partId,
      lessonId: lessonId,
    );
    final qs = await testRepo.getQuestionsLRByLesson(
      materialId: materialId,
      levelId: levelId,
      partId: partId,
      lessonId: lessonId,
    );

    final audioPath = meta['audioPath'] as String?;
    final url = (audioPath == null || audioPath.isEmpty)
        ? null
        : testRepo.getPublicUrl('study_materials', audioPath);

    final latest = await roadmapRepo.getLatestRoadmap();

    if (!mounted) return;

    final initAns = List<int?>.filled(qs.length, null);
    var review = false;
    var restoredScore = 0;
    DateTime? ts;

    final item = latest != null
        ? (latest['data']['items'] as List<dynamic>? ?? []).asMap().containsKey(
                widget.itemIndex ?? -1,
              )
              ? (latest['data']['items'] as List<dynamic>)[widget.itemIndex ??
                    -1]
              : null
        : null;

    if (item['answers'] != null || item['status'] == 'done') {
      final saved = Map<String, dynamic>.from(item['answers'] ?? {});
      for (int i = 0; i < qs.length; i++) {
        final v = saved[qs[i].id];
        if (v is num) initAns[i] = v.toInt();
      }
      review = true;
      restoredScore = (item['score'] as num?)?.toInt() ?? 0;
      final t = item['createdAt'];
      if (t is Timestamp) ts = t.toDate();
    }

    setState(() {
      questionsLR = qs;
      answersLR = initAns;
      audioUrlLR = url;
      showAnswers = review;
      correctCount = review ? restoredScore : 0;
      latestAttemptTime = ts;
      isStarted = review;
      isFinishedAll = review;
    });

    if (url != null) await player.setUrl(url);
  }

  Future<void> _loadSpeakingWriting() async {
    final qs = await testRepo.getQuestionsSWByLesson(
      materialId: materialId,
      levelId: levelId,
      partId: partId,
      lessonId: lessonId,
    );

    final latest = await roadmapRepo.getLatestRoadmap();

    if (!mounted) return;

    final item = latest != null
        ? (latest['data']['items'] as List<dynamic>? ?? []).asMap().containsKey(
                widget.itemIndex ?? -1,
              )
              ? (latest['data']['items'] as List<dynamic>)[widget.itemIndex ??
                    -1]
              : null
        : null;

    bool review = false;
    DateTime? ts;
    int restoredScore = 0;

    if (item['answer'] != null || item['status'] == 'done') {
      review = true;
      final t = item['createdAt'];
      if (t is Timestamp) ts = t.toDate();
      restoredScore = (item['score'] as num?)?.toInt() ?? 0;

      // Load saved answers/recordings
      final saved = Map<String, dynamic>.from(item['answers'] ?? {});
      for (var q in qs) {
        final v = saved[q.id];
        if (v is String) {
          if (v.startsWith('http')) {
            remotePlayUrls[q.id] = v; // URL for speaking
          } else {
            answers[q.id] = v; // Text for writing
          }
        }
      }

      // Load evaluation results
      final results = Map<String, dynamic>.from(item['results'] ?? {});
      if (results.isNotEmpty) {
        evaluationResults = results;
      }
    }

    // Initialize controllers for writing questions
    for (var q in qs) {
      if (_isSpeakingPart()) {
        playerKeys[q.id] = GlobalKey<AudioPlayerWidgetState>();
      } else {
        textControllers[q.id] = TextEditingController(
          text: answers[q.id] ?? '',
        );
        answers[q.id] = answers[q.id] ?? '';
      }
    }

    setState(() {
      questionsSW = qs;
      showAnswers = review;
      latestAttemptTime = ts;
      isFinishedAll = review;
      isStarted = review;
      totalScore = restoredScore;
      correctCount = restoredScore;
    });
  }

  // ========== Listening & Reading Methods ==========

  int _calcScoreLR() {
    var s = 0;
    for (int i = 0; i < questionsLR.length; i++) {
      final a = answersLR[i];
      if (a != null && a == questionsLR[i].correctIndex) s++;
    }
    return s;
  }

  Future<void> _submitLR() async {
    if (!mounted) return;

    final score = _calcScoreLR();
    setState(() {
      showAnswers = true;
      correctCount = score;
      latestAttemptTime = DateTime.now();
    });

    final byId = <String, int?>{
      for (int i = 0; i < questionsLR.length; i++)
        questionsLR[i].id: answersLR[i],
    };

    try {
      await roadmapRepo.savePracticeLessonResult(
        materialId: materialId,
        levelId: levelId,
        partId: partId,
        lessonId: lessonId,
        itemIndex: widget.itemIndex ?? -1,
        score: score,
        total: questionsLR.length,
        answersByQuestionId: byId,
      );
    } catch (e) {
      debugPrint('Error saving practice result: $e');
    }

    try {
      await widget.onDone?.call();
    } catch (_) {}
  }

  void _retakeLR() {
    if (!mounted) return;
    setState(() {
      answersLR = List<int?>.filled(questionsLR.length, null);
      showAnswers = false;
      correctCount = 0;
    });
  }

  // ========== Speaking & Writing Methods ==========

  Future<void> _startRecording(String questionId, int recordTime) async {
    if (isFinishedAll) return;

    final hasPermission = await _requestPermission();
    if (!hasPermission) return;

    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/recording_$questionId.m4a';

    await recorder.start(const RecordConfig(), path: filePath);

    setState(() {
      isRecording = true;
      remainingRecordSeconds = recordTime;
    });

    recordTimer?.cancel();
    recordTimer = Timer.periodic(const Duration(seconds: 1), (t) async {
      if (!mounted || isFinishedAll) {
        t.cancel();
        return;
      }
      if (remainingRecordSeconds <= 0) {
        await _stopRecording(questionId);
        t.cancel();

        if (currentIndex < questionsSW.length - 1) {
          _startQuestion(currentIndex + 1);
        } else {
          _onTestFinished();
        }
      } else {
        setState(() {
          remainingRecordSeconds--;
        });
      }
    });
  }

  Future<void> _stopRecording(String questionId) async {
    final recordFile = await recorder.stop();
    if (recordFile != null && File(recordFile).existsSync()) {
      setState(() {
        recordings[questionId] = recordFile;
        isRecording = false;
      });
      _uploadedAudioUrls.remove(questionId);
      _uploadedStoragePaths.remove(questionId);
      debugPrint("✅ Saved record for $questionId at $recordFile");
    }
  }

  void _startQuestion(int index) {
    // ✅ Allow navigation in review mode (when showAnswers is true)
    if (isFinishedAll && !showAnswers) return;

    final q = questionsSW[index];

    if (_isSpeakingPart()) {
      setState(() {
        currentIndex = index;
        remainingPrepareSeconds = q.prepareTime ?? 0;
        remainingRecordSeconds = q.recordTime ?? 0;
        isRecording = false;
      });

      prepareTimer?.cancel();
      recordTimer?.cancel();

      if (q.prepareTime! > 0) {
        prepareTimer = Timer.periodic(const Duration(seconds: 1), (t) {
          if (!mounted || isFinishedAll) {
            t.cancel();
            return;
          }
          if (remainingPrepareSeconds <= 0) {
            t.cancel();
            _startRecording(q.id, q.recordTime ?? 0);
          } else {
            setState(() {
              remainingPrepareSeconds--;
            });
          }
        });
      } else {
        _startRecording(q.id, q.recordTime ?? 0);
      }
    } else {
      // Writing part
      FocusScope.of(context).unfocus();
      if (questionsSW.isNotEmpty && currentIndex < questionsSW.length) {
        final currentQuestionId = questionsSW[currentIndex].id;
        answers[currentQuestionId] =
            textControllers[currentQuestionId]?.text ?? '';
      }

      setState(() {
        currentIndex = index;
      });

      if (index < questionsSW.length) {
        final newQuestionId = questionsSW[index].id;
        final savedAnswer = answers[newQuestionId] ?? '';
        textControllers[newQuestionId]?.text = savedAnswer;
      }
    }
  }

  void _onTestFinished() {
    setState(() {
      isFinishedAll = true;
    });
    recordTimer?.cancel();

    // ✅ Tự động submit sau khi record xong câu cuối
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _submitSW();
      }
    });
  }

  void _retakeSW() {
    if (!mounted) return;
    FocusScope.of(context).unfocus();

    setState(() {
      currentIndex = 0;
      recordings.clear();
      answers.clear();
      remotePlayUrls.clear();
      evaluationResults.clear();
      isRecording = false;
      isFinishedAll = false;
      showAnswers = false;

      for (var controller in textControllers.values) {
        controller.clear();
      }
    });

    _startQuestion(0);
  }

  Future<void> _submitSW() async {
    if (!mounted) return;

    // ✅ Prevent duplicate submission
    if (showAnswers) {
      debugPrint('Already submitted, skipping duplicate submit');
      return;
    }

    // Prepare answers based on part type
    final Map<String, dynamic> submittedAnswers = {};
    Map<String, dynamic> result = {};

    if (_isSpeakingPart()) {
      final uploadedUrls = await _ensureRecordingsUploaded();
      submittedAnswers.addAll(uploadedUrls);

      result = await getSpeakingResult();
      print('Speaking result: $result');
      print('Submitted answers: $submittedAnswers');
      showFeedbacksMode(result['results']);
    } else {
      for (var q in questionsSW) {
        final txt = textControllers[q.id]?.text ?? '';
        answers[q.id] = txt;
        submittedAnswers[q.id] = txt;
      }
      result = await getWritingResult();
      print('Writing result: $result');
      showFeedbacksMode(result['results']);
    }

    setState(() {
      showAnswers = true;
      isFinishedAll = true;
      isStarted = true;
      latestAttemptTime = DateTime.now();
      if (_isSpeakingPart()) {
        totalScore = result['score'] ?? 0;
        correctCount = result['score'] ?? 0;
      } else {
        correctCount = result['score'] ?? 0;
        totalScore = result['score'] ?? 0;
      }
      prepareTimer?.cancel();
      recordTimer?.cancel();
      recorder.stop();
    });
    print('Total score: $totalScore, Correct count: $correctCount');

    // Save to Firestore
    try {
      final scoreToSave = _isSpeakingPart() ? totalScore : correctCount;
      await roadmapRepo.savePracticeLessonResult(
        materialId: materialId,
        levelId: levelId,
        partId: partId,
        lessonId: lessonId,
        itemIndex: widget.itemIndex ?? -1,
        score: scoreToSave,
        total: _isSpeakingPart()
            ? questionsSW.length * 3
            : questionsSW.length * 3,
        answersByQuestionId: submittedAnswers.map((k, v) => MapEntry(k, v)),
        evaluationResults: result['results'] as Map<String, dynamic>?,
      );
      print(submittedAnswers.map((k, v) => MapEntry(k, v)));
    } catch (e) {
      debugPrint('Error saving practice result: $e');
    }

    try {
      await widget.onDone?.call();
    } catch (_) {}
  }

  Future<Map<String, String>> _ensureRecordingsUploaded() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? 'anonymous';
    final remoteUrls = <String, String>{};

    for (final entry in recordings.entries) {
      final questionId = entry.key;
      final localPath = entry.value;

      // nếu đã có url cached thì dùng luôn
      final existingUrl = _uploadedAudioUrls[questionId];
      if (existingUrl != null && existingUrl.isNotEmpty) {
        remoteUrls[questionId] = existingUrl;
        continue;
      }

      final file = File(localPath);
      if (!file.existsSync()) {
        debugPrint('⚠️ Local file for $questionId not found at $localPath');
        continue;
      }

      final storagePath =
          '$userId/$materialId/$levelId/$partId/$lessonId/$questionId-${DateTime.now().millisecondsSinceEpoch}.m4a';

      try {
        final publicUrl = await _supabaseService.uploadAndGetPublicUrl(
          localPath: localPath,
          storagePath: storagePath,
        );

        if (publicUrl.isEmpty) {
          debugPrint('❌ Upload returned empty URL for $questionId');
          continue;
        }

        _uploadedAudioUrls[questionId] = publicUrl;
        _uploadedStoragePaths[questionId] = storagePath;
        remoteUrls[questionId] = publicUrl;

        debugPrint('✅ Uploaded $questionId -> $publicUrl');
      } catch (e, st) {
        debugPrint('❌ Failed to upload $questionId: $e\n$st');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Không upload được audio $questionId: $e')),
          );
        }
      }
    }

    // đảm bảo chèn các url đã có trước đó
    for (final entry in _uploadedAudioUrls.entries) {
      remoteUrls.putIfAbsent(entry.key, () => entry.value);
    }

    return remoteUrls;
  }

  void showFeedbacksMode(dynamic results) async {
    // results có thể là List (mỗi item có questionId) hoặc Map
    final Map<String, dynamic> normalized = {};
    if (results is List) {
      for (final e in results) {
        if (e is Map) {
          final m = Map<String, dynamic>.from(e);
          final qid = (m['questionId'] ?? m['id'] ?? m['qid'])?.toString();
          if (qid != null) normalized[qid] = m;
        }
      }
    } else if (results is Map) {
      // Nếu là map đã có sẵn dạng {qid: {...}}
      normalized.addAll(Map<String, dynamic>.from(results));
    }

    setState(() {
      evaluationResults = normalized;
      isFinishedAll = true;
      isStarted = true;
    });
  }

  Future<Map<String, dynamic>> getSpeakingResult() async {
    final uploadedUrls = await _ensureRecordingsUploaded();
    final api = SpeakingApiService(baseUrl: 'http://10.22.64.43:8002');

    Map<String, dynamic> results = {};
    var imageUrl = '';

    for (var q in questionsSW) {
      final audioUrl = uploadedUrls[q.id];
      debugPrint('Audio URL for ${q.id}: $audioUrl');
      if (q.type == 'Describe a picture' ||
          q.type == "Respond to questions using information provided") {
        imageUrl =
            "https://ewycqwtiuttrvpubkwgm.supabase.co/storage/v1/object/public/practice_tests/${q.imagePath}";
      } else {
        imageUrl = '';
      }

      if (audioUrl == null || audioUrl.isEmpty) {
        results[q.id] = {
          "score": 0,
          "max_score": q.maxScore,
          "transcript": "No audio submitted",
          "feedback": "Recording missing for this question.",
        };
        continue;
      }
      try {
        final resp = await api.submitSpeaking(
          question: "${q.type} ${q.text} $imageUrl",
          audio_url: audioUrl,
          max_score: q.maxScore,
        );

        results[q.id] = {
          "score": resp['score'] ?? 0,
          "transcript": resp['transcript'] ?? "No transcript.",
          "feedback": resp['feedback'] ?? "No feedback",
          "grammar_feedback": resp['grammar_feedback'] ?? "No grammar feedback",
        };
      } catch (e) {
        results[q.id] = {
          "score": 0,
          "transcript": "Error",
          "feedback": "Error: $e",
          "grammar_feedback": "Error",
        };
      }
    }
    return {
      'score': results.values.fold<int>(
        0,
        (sum, r) => sum + ((r['score'] ?? 0) as int),
      ),
      'total': 18,
      'answerAudioUrls': uploadedUrls,
      'answers': uploadedUrls,
      'results': results,
    };
  }

  Future<Map<String, dynamic>> getWritingResult() async {
    final api = WritingApiService(baseUrl: 'http://10.22.64.43:8000');

    Map<String, dynamic> results = {};
    var imageUrl = '';

    for (var q in questionsSW) {
      final answer = answers[q.id] ?? '';
      if (q.type == 'Write a sentence based on a picture') {
        imageUrl =
            "https://ewycqwtiuttrvpubkwgm.supabase.co/storage/v1/object/public/practice_tests/${q.imagePath}";
      } else {
        imageUrl = '';
      }
      try {
        final resp = await api.submitWriting(
          requirement: "${q.type} ${q.text} ${q.directions} $imageUrl",
          answer: answer,
          max_score: q.maxScore,
        );

        results[q.id] = {
          "score": resp['score'] ?? 0,
          "grammar_feedback": resp['grammar_feedback'] ?? "No grammar feedback",
          "feedback": resp['feedback'] ?? "No feedback",
        };
      } catch (e) {
        results[q.id] = {
          "score": 0,
          "grammar_feedback": "Error",
          "feedback": "Error: $e",
        };
      }
    }

    return {
      'score': results.values.fold<int>(
        0,
        (sum, r) => sum + ((r['score'] ?? 0) as int),
      ),
      'total': 12,
      'answers': answers,
      'results': results,
    };
  }

  void _stopOtherAudios(String currentQuestionId) {
    for (var entry in playerKeys.entries) {
      if (entry.key != currentQuestionId) {
        entry.value.currentState?.stopAudio();
      }
    }

    for (var entry in netPlayerKeys.entries) {
      if (entry.key != currentQuestionId) {
        entry.value.currentState?.stopAudio();
      }
    }
  }

  Future<void> _dismissKeyboard() async {
    FocusScope.of(context).unfocus();
  }

  void _showStartDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          _isSpeakingPart() ? 'Speaking Practice' : 'Writing Practice',
        ),
        content: Text(
          _isSpeakingPart()
              ? 'You have ${questionsSW.length} questions. You will have time to prepare before recording your answer.'
              : 'You have ${questionsSW.length} questions to answer. Good luck!',
        ),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context), Navigator.pop(context)},
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => isStarted = true);
              _startQuestion(0);
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordingPlayer(String questionId) {
    final filePath = recordings[questionId];
    if (filePath == null) return const SizedBox();

    return AudioPlayerWidget(
      key: playerKeys[questionId],
      filePath: filePath,
      onStartPlaying: () => _stopOtherAudios(questionId),
    );
  }

  Widget _buildRecordedPlayer(String questionId) {
    final url = remotePlayUrls[questionId];
    if (url == null) return const SizedBox();

    netPlayerKeys.putIfAbsent(
      questionId,
      () => GlobalKey<NetworkAudioPlayerWidgetState>(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: NetworkAudioPlayerWidget(
        key: netPlayerKeys[questionId],
        url: url,
        onStartPlaying: () => _stopOtherAudios(questionId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titlePart = _partName[partId] ?? partId.toUpperCase();

    // ========== Listening & Reading Build ==========
    if (_isListeningPart() || _isReadingPart()) {
      if (questionsLR.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
          actions: [
            if (!showAnswers)
              TextButton.icon(
                onPressed: _submitLR,
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              )
            else ...[
              TextButton.icon(
                onPressed: _retakeLR,
                icon: const Icon(Icons.replay, color: Colors.white),
                label: const Text(
                  'Retake',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white),
                label: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ],
            const SizedBox(width: 8),
          ],
        ),
        body: Column(
          children: [
            if (showAnswers)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      'Score: $correctCount / ${questionsLR.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    if (latestAttemptTime != null)
                      Text(
                        'Latest: $latestAttemptTime',
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                  ],
                ),
              ),
            if (audioUrlLR != null)
              Card(
                margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                color: Colors.grey[200],
                child: ListTile(
                  title: const Text(
                    'Lesson Audio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async =>
                        isPlaying ? player.pause() : player.play(),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                itemCount: questionsLR.length,
                itemBuilder: (context, i) {
                  final q = questionsLR[i];
                  final imageUrl =
                      (q.imagePath != null && q.imagePath!.isNotEmpty)
                      ? testRepo.getPublicUrl('study_materials', q.imagePath!)
                      : null;

                  Color? colorOf(int idx) {
                    if (!showAnswers) return null;
                    final isSel = answersLR[i] == idx;
                    final isCor = q.correctIndex == idx;
                    if (isCor) return Colors.green;
                    if (isSel && !isCor) return Colors.red;
                    return null;
                  }

                  FontWeight fwOf(int idx) =>
                      showAnswers &&
                          (answersLR[i] == idx || q.correctIndex == idx)
                      ? FontWeight.bold
                      : FontWeight.normal;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Question ${i + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              (q.question != null && q.question!.isNotEmpty)
                              ? Text(q.question!)
                              : null,
                        ),
                        if (imageUrl != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Center(
                                child: Image.network(
                                  imageUrl,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    height: 200,
                                    color: Colors.grey[300],
                                    alignment: Alignment.center,
                                    child: const Text('Không tải được ảnh'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: List.generate(q.options.length, (opt) {
                              return RadioListTile<int>(
                                value: opt,
                                groupValue: answersLR[i],
                                onChanged: showAnswers
                                    ? null
                                    : (v) => setState(() => answersLR[i] = v),
                                title: Text(
                                  q.options[opt],
                                  style: TextStyle(
                                    color: colorOf(opt),
                                    fontWeight: fwOf(opt),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        if (showAnswers && q.explain.isNotEmpty)
                          Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            elevation: 1.5,
                            color: Colors.blue[50],
                            child: ExpansionTile(
                              title: const Text(
                                'Explain',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(q.explain),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    // ========== Speaking Build ==========
    if (_isSpeakingPart()) {
      if (questionsSW.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      if (!isFinishedAll) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
            actions: [
              if (!showAnswers)
                TextButton.icon(
                  onPressed: _submitSW,
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                )
              else ...[
                TextButton.icon(
                  onPressed: _retakeSW,
                  icon: const Icon(Icons.replay, color: Colors.white),
                  label: const Text(
                    'Retake',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.orange),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.grey),
                ),
              ],
              const SizedBox(width: 8),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${currentIndex + 1}/${questionsSW.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  questionsSW[currentIndex].type,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  questionsSW[currentIndex].directions,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                if (questionsSW[currentIndex].text != null &&
                    questionsSW[currentIndex].text!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      questionsSW[currentIndex].text!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                if (questionsSW[currentIndex].imagePath != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      testRepo.getPublicUrl(
                        'study_materials',
                        questionsSW[currentIndex].imagePath!,
                      ),
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 250,
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Text('Image not available'),
                      ),
                    ),
                  ),
                const SizedBox(height: 32),
                if (remainingPrepareSeconds > 0)
                  Card(
                    color: Colors.amber[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book, color: Colors.orange, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'Preparing...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$remainingPrepareSeconds s',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (isRecording)
                  Card(
                    color: Colors.red[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mic, color: Colors.red, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'Recording...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$remainingRecordSeconds s',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      } else {
        // Speaking - Review/Feedback mode
        return Scaffold(
          appBar: AppBar(
            title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
            actions: [
              TextButton.icon(
                onPressed: _retakeSW,
                icon: const Icon(Icons.replay, color: Colors.white),
                label: const Text(
                  'Retake',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white),
                label: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Column(
            children: [
              // Score header
              if (showAnswers)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Score: $totalScore / ${questionsSW.length * 3}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (latestAttemptTime != null)
                        Text(
                          'Latest: $latestAttemptTime',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: questionsSW.length,
                  itemBuilder: (context, index) {
                    final q = questionsSW[index];
                    final imageUrl = q.imagePath != null
                        ? testRepo.getPublicUrl('study_materials', q.imagePath!)
                        : null;
                    final result =
                        evaluationResults[q.id] as Map<String, dynamic>?;

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              "Question ${index + 1}: ${q.type}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (imageUrl != null)
                            Center(
                              child: Image.network(
                                imageUrl,
                                height: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox();
                                },
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              q.text ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          if (recordings.containsKey(q.id))
                            _buildRecordingPlayer(q.id)
                          else if (remotePlayUrls.containsKey(q.id))
                            _buildRecordedPlayer(q.id)
                          else
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'No recording for this question.',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          Card(
                            elevation: 2,
                            color: Colors.orange[100],
                            child: ExpansionTile(
                              initiallyExpanded: false,
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.orange[700],
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Feedback',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildFeedbackField(
                                              "Transcript",
                                              result?['transcript']?.toString(),
                                            ),
                                            const SizedBox(height: 15),
                                            _buildFeedbackField(
                                              "Score",
                                              result != null &&
                                                      result['score'] != null
                                                  ? "${result['score']}/${q.maxScore}"
                                                  : null,
                                            ),
                                            const SizedBox(height: 15),
                                            _buildFeedbackField(
                                              "Grammar",
                                              result?['grammar_feedback']
                                                  ?.toString(),
                                            ),
                                            const SizedBox(height: 15),
                                            _buildFeedbackField(
                                              "Comment",
                                              result?['feedback']?.toString(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card(
                            elevation: 2,
                            color: Colors.blue[100],
                            child: ExpansionTile(
                              initiallyExpanded: false,
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.blue[700],
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Sample Answer',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(q.sampleAnswer),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    }

    // ========== Writing Build ==========
    if (!isStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showStartDialog();
      });
    }

    if (questionsSW.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Practice • $titlePart • ${lessonId.toUpperCase()}'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final q = questionsSW[currentIndex];
    final imageUrl = q.imagePath != null
        ? testRepo.getPublicUrl('study_materials', q.imagePath!)
        : null;

    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$titlePart • Q${currentIndex + 1}/${questionsSW.length}',
          ),
          actions: [
            if (!showAnswers)
              TextButton.icon(
                onPressed: _submitSW,
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              )
            else ...[
              TextButton.icon(
                onPressed: _retakeSW,
                icon: const Icon(Icons.replay, color: Colors.white),
                label: const Text(
                  'Retake',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white),
                label: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ],
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Score header when showing answers
              if (showAnswers)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Text(
                        'Score: $totalScore / 12',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (latestAttemptTime != null)
                        Text(
                          'Latest: $latestAttemptTime',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
              // Question navigation - Always show for easy switching
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(questionsSW.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () => _startQuestion(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: index == currentIndex
                                  ? Colors.blue
                                  : Colors.grey[300],
                              elevation: index == currentIndex ? 4 : 1,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: index == currentIndex
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Question ${currentIndex + 1}: ${q.type}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Directions: ${q.directions}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              if (imageUrl != null)
                Center(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  ),
                ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  q.text ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Answer:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  controller: textControllers[q.id],
                  maxLines: 15,
                  minLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Write your answer here...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  enabled: !showAnswers,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(height: 20),
              if (showAnswers && evaluationResults.containsKey(q.id))
                _buildFeedbackCard(q.id, evaluationResults[q.id]),
              if (showAnswers)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sample Answer',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(q.sampleAnswer),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackCard(String questionId, Map<String, dynamic> feedback) {
    return Card(
      elevation: 2,
      color: Colors.orange[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.orange[700]),
                const SizedBox(width: 12),
                const Text(
                  'Feedback',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildFeedbackField(
              'Score',
              feedback['score']?.toString() ?? 'N/A',
            ),
            const SizedBox(height: 12),
            if (feedback['grammar_feedback'] != null)
              _buildFeedbackField(
                'Grammar',
                feedback['grammar_feedback']?.toString() ?? 'N/A',
              ),
            if (feedback['transcript'] != null)
              _buildFeedbackField(
                'Transcript',
                feedback['transcript']?.toString() ?? 'N/A',
              ),
            const SizedBox(height: 12),
            _buildFeedbackField(
              'Comment',
              feedback['feedback']?.toString() ?? 'No feedback',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackField(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.red[600],
          ),
        ),
        const SizedBox(height: 6),
        Text(value ?? 'Not available'),
      ],
    );
  }
}
