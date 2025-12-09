import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/services/speaking_api_service.dart';
import 'package:final_project/services/supabase_service.dart';
import 'package:final_project/widgets/audio_player_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/question_SW_model.dart';
import 'package:final_project/repositories/input_test_repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';

class SWPart1Page extends StatefulWidget {
  final String testId;
  final VoidCallback? onTestStart;
  const SWPart1Page({super.key, required this.testId, this.onTestStart});

  @override
  State<SWPart1Page> createState() => SWPart1PageState();
}

class SWPart1PageState extends State<SWPart1Page> {
  final testRepo = InputTestRepository();
  final resultRepo = ResultRepository();

  final recorder = AudioRecorder();
  final player = AudioPlayer();
  final _supabaseService = SupabaseService(bucket: "input_test_SW_recordings");

  final Map<String, String> _uploadedAudioUrls = {};
  final Map<String, String> _uploadedStoragePaths = {};

  List<QuestionSW> questions = [];
  int currentIndex = 0;
  Timer? prepareTimer;
  Timer? recordTimer;

  int remainingPrepareSeconds = 0;
  int remainingRecordSeconds = 0;
  bool isRecording = false;

  bool isFinishedAll = false;
  bool isStarted = false;
  bool showAnswers = false;

  // Lưu file record và reference đến AudioPlayerWidget
  Map<String, String> recordings = {};
  Map<String, GlobalKey<AudioPlayerWidgetState>> playerKeys = {};
  Map<String, String> requirements = {};
  Map<String, dynamic> evaluationResults = {};

  // Public getters để SWTestPage có thể access
  Map<String, String> get getRecordings => recordings;
  List<QuestionSW> get getQuestions => questions;
  bool get isTestCompleted => isFinishedAll;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _load();
  }

  Future<void> _load() async {
    final qs = await testRepo.getQuestionsSW(widget.testId, 'part1');
    if (qs.isNotEmpty) {
      setState(() {
        questions = qs;
        // Tạo key cho mỗi câu hỏi
        for (var q in qs) {
          playerKeys[q.id] = GlobalKey<AudioPlayerWidgetState>();
        }
      });
    }
  }

  /// Bắt đầu ghi âm
  Future<void> _startRecording(String questionId, int recordTime) async {
    if (isFinishedAll) return; // ✅ đã submit thì không ghi nữa
    final hasPermission = await _requestPermission();
    if (!hasPermission) {
      debugPrint("❌ Microphone permission not granted");
      return;
    }

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
        // ✅ guard
        t.cancel();
        return;
      }

      if (remainingRecordSeconds <= 0) {
        await _stopRecording(questionId);
        t.cancel();

        if (currentIndex < questions.length - 1) {
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

  /// Dừng ghi âm
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

  Future<Map<String, dynamic>> getResult() async {
    final uploadedUrls = await _ensureRecordingsUploaded();
    final api = SpeakingApiService(baseUrl: 'http://192.168.1.8:8002');

    Map<String, dynamic> results = {};
    var imageUrl = '';

    for (var q in questions) {
      // final answer = answers[q.id] ?? '';
      final audioUrl = uploadedUrls[q.id];
      debugPrint('Audio URL for ${q.id}: $audioUrl');
      if (q.type == 'Describe a picture' ||
          q.type == "Respond to questions using information provided") {
        imageUrl =
            // "${q.imagePath}";
            "https://ewycqwtiuttrvpubkwgm.supabase.co/storage/v1/object/public/toeic-assets/${q.imagePath}";
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
          // requirement: "${q.requirement} ${q.directions}  ${q.text} ",
          question: "${q.type} ${q.text} $imageUrl",
          audio_url: audioUrl,
          max_score: q.maxScore,
        );

        // Lưu đủ data cho từng câu
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
      // 'score': 100, //// CẦN CHỈNH LẠI SCORE
      'total': 18,
      'answerAudioUrls': uploadedUrls,
      'answers': uploadedUrls,
      'results': results, // chứa thông tin chi tiết từng câu
    };
  }

  Future<Map<String, String>> _ensureRecordingsUploaded() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    // final ownerId = user?.uid ?? 'anonymous';
    final remoteUrls = <String, String>{};
    final itemsToSave = <Map<String, dynamic>>[];

    for (final entry in recordings.entries) {
      final questionId = entry.key;
      final localPath = entry.value;
      final existingUrl = _uploadedAudioUrls[questionId];
      if (existingUrl != null) {
        remoteUrls[questionId] = existingUrl;
        continue;
      }

      final file = File(localPath);
      if (!file.existsSync()) {
        debugPrint('⚠️ Local file for $questionId not found at $localPath');
        continue;
      }

      final storagePath =
          _uploadedStoragePaths[questionId] ??
          '$userId/${widget.testId}/$questionId-${DateTime.now().millisecondsSinceEpoch}.m4a';

      try {
        final publicUrl = await _supabaseService.uploadAndGetPublicUrl(
          localPath: localPath,
          storagePath: storagePath,
        );
        _uploadedAudioUrls[questionId] = publicUrl;
        _uploadedStoragePaths[questionId] = storagePath;
        remoteUrls[questionId] = publicUrl;

        // if (user != null) {
        itemsToSave.add({
          'questionId': questionId,
          'audioUrl': publicUrl,
          'storagePath': storagePath,
          'uploadedAt': FieldValue.serverTimestamp(),
        });
        // }
      } catch (e) {
        debugPrint('❌ Failed to upload audio for $questionId: $e');
      }
    }

    // Ensure we return all known URLs even if no uploads occurred in this call.
    for (final entry in recordings.entries) {
      final url = _uploadedAudioUrls[entry.key];
      if (url != null) {
        remoteUrls[entry.key] = url;
      }
    }

    // debugPrint(remoteUrls.entries.first.key);

    return remoteUrls;
  }

  void showFeedbacksMode(Map<String, dynamic> results) async {
    await forceStopAll();
    setState(() {
      evaluationResults = results;
    });
  }

  /// Bắt đầu 1 câu mới
  void _startQuestion(int index) {
    if (isFinishedAll) return; // ✅ không start nếu đã submit
    final q = questions[index];
    setState(() {
      currentIndex = index;
      remainingPrepareSeconds = q.prepareTime ?? 0;
      remainingRecordSeconds = q.recordTime ?? 0;
      isRecording = false;
    });

    prepareTimer?.cancel();
    recordTimer?.cancel();

    // Nếu có thời gian chuẩn bị
    if (q.prepareTime! > 0) {
      prepareTimer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (!mounted || isFinishedAll) {
          // ✅ guard
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
      // Không cần chuẩn bị -> ghi âm luôn
      _startRecording(q.id, q.recordTime ?? 0);
    }
  }

  /// Kết thúc test
  void _onTestFinished() {
    setState(() {
      isFinishedAll = true;
    });
    recordTimer?.cancel();
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      return true;
    } else {
      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  /// Dừng tất cả audio players khác ngoại trừ currentQuestionId
  void _stopOtherAudios(String currentQuestionId) {
    for (var entry in playerKeys.entries) {
      if (entry.key != currentQuestionId) {
        final playerState = entry.value.currentState;
        if (playerState != null) {
          playerState.stopAudio();
        }
      }
    }
  }

  Future<void> forceStopAll() async {
    // Hủy mọi timer
    try {
      prepareTimer?.cancel();
    } catch (_) {}
    try {
      recordTimer?.cancel();
    } catch (_) {}

    // Stop recorder immediately if recording
    try {
      if (isRecording) {
        await recorder.stop();
      }
    } catch (_) {}

    setState(() {
      isRecording = false;
      isFinishedAll = true; // lock UI to finished state
    });
  }

  @override
  void dispose() {
    prepareTimer?.cancel();
    recordTimer?.cancel();
    try {
      recorder.stop();
    } catch (_) {}
    try {
      player.dispose();
    } catch (_) {}
    try {
      recorder.dispose();
    } catch (_) {}
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final q = questions[currentIndex];
    final imageUrl = q.imagePath != null
        ? testRepo.getPublicUrl('toeic-assets', q.imagePath!)
        : null;

    if (!isStarted) {
      return AlertDialog(
        title: const Text("Part 1 - Speaking"),
        content: const Text(
          "The test includes 6 questions. You will have some time to prepare before recording your answer for each question. Once you click Start, the timer will count down the preparing time. Good luck!",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onTestStart?.call();
              setState(() {
                isStarted = true;
              });
              _startQuestion(0);
            },
            child: const Text("Start"),
          ),
        ],
      );
    }

    if (!isFinishedAll) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: Text(
                    "Prepare: $remainingPrepareSeconds s  |  Record: $remainingRecordSeconds s",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Question ${currentIndex + 1}/${questions.length}: ${q.type}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              const SizedBox(height: 12),
              Text(q.text ?? "", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              if (isRecording)
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.mic, size: 80, color: Colors.red),
                      Text(
                        "Recording... $remainingRecordSeconds s",
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  ),
                ),

              // Hiện player nếu câu hiện tại đã có record
              if (recordings.containsKey(q.id)) _buildRecordingPlayer(q.id),
            ],
          ),
        ),
      );
    } else {
      // finished: show list with player for each question
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final q = questions[index];
                  final imageUrl = q.imagePath != null
                      ? testRepo.getPublicUrl('toeic-assets', q.imagePath!)
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                          _buildRecordingPlayer(q.id),
                        if (!recordings.containsKey(q.id))
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
                            initiallyExpanded: false, // ✅ mặc định đóng
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            initiallyExpanded: false, // ✅ mặc định đóng
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
                                child: Row(children: [Text(q.sampleAnswer)]),
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

  Widget _buildFeedbackField(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.red[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(value ?? 'Not available'),
      ],
    );
  }
}
