import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/repositories/input_test_repository.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PracticeLRPage extends StatefulWidget {
  /// format: materialId|levelId|partId|lessonId
  final String practiceId;
  final Future<void> Function()? onDone;
  final int? itemIndex;

  const PracticeLRPage({
    super.key,
    required this.practiceId,
    this.onDone,
    this.itemIndex,
  });

  @override
  State<PracticeLRPage> createState() => PracticeLRPageState();
}

class PracticeLRPageState extends State<PracticeLRPage> {
  final testRepo = InputTestRepository();
  final resultRepo = ResultRepository();
  final roadmapRepo = RoadmapRepository();
  final player = AudioPlayer();

  late final String materialId, levelId, partId, lessonId;

  List<QuestionLR> questions = [];
  List<int?> answers = [];
  String? audioUrl;

  bool isPlaying = false;
  bool showAnswers = false;
  int correctCount = 0;
  DateTime? latestAttemptTime;

  int remainingSeconds = 100;
  int totalScore = 0;

  StreamSubscription<PlayerState>? _sub;

  static const _partName = {
    'part1': 'Picture Description',
    'part2': 'Question & Response',
    'part3': 'Conversations',
    'part4': 'Talks',
    'part5': 'Incomplete Sentences',
    'part6': 'Text Completion',
    'part7': 'Reading Comprehension',
  };

  @override
  void initState() {
    // checkShowAnswersMode();
    super.initState();
    final seg = widget.practiceId.split('|');
    if (seg.length != 4) {
      throw ArgumentError('practiceId phải là material|level|part|lesson');
    }
    materialId = seg[0];
    levelId = seg[1];
    partId = seg[2];
    lessonId = seg[3];

    _load();

    _sub = player.playerStateStream.listen((s) {
      if (!mounted) return;
      setState(() => isPlaying = s.playing);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    player.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
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

      // print(latest?['items']);
      print(latest?['data']['items'][widget.itemIndex ?? -1]);

      final item = latest != null
          ? (latest['data']['items'] as List<dynamic>? ?? [])
                    .asMap()
                    .containsKey(widget.itemIndex ?? -1)
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
        questions = qs;
        answers = initAns;
        audioUrl = url;
        showAnswers = review;
        correctCount = review ? restoredScore : 0;
        latestAttemptTime = ts;
      });

      if (url != null) await player.setUrl(url);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không tải được dữ liệu: $e')));
    }
  }

  int _calcScore() {
    var s = 0;
    for (int i = 0; i < questions.length; i++) {
      final a = answers[i];
      if (a != null && a == questions[i].correctIndex) s++;
    }
    return s;
  }

  Future<void> _submit() async {
    if (!mounted) return;

    final score = _calcScore();
    setState(() {
      showAnswers = true;
      correctCount = score;
      latestAttemptTime = DateTime.now();
    });

    final byId = <String, int?>{
      for (int i = 0; i < questions.length; i++) questions[i].id: answers[i],
    };

    try {
      await roadmapRepo.savePracticeLessonResult(
        materialId: materialId,
        levelId: levelId,
        partId: partId,
        lessonId: lessonId,
        itemIndex: widget.itemIndex ?? -1,
        score: score,
        total: questions.length,
        answersByQuestionId: byId,
      );
    } catch (_) {}

    try {
      await widget.onDone?.call();
    } catch (_) {}
  }

  void _retake() {
    if (!mounted) return;
    setState(() {
      answers = List<int?>.filled(questions.length, null);
      showAnswers = false;
      correctCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titlePart = _partName[partId] ?? partId.toUpperCase();

    if (questions.isEmpty) {
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
              onPressed: _submit,
              icon: const Icon(Icons.check, color: Colors.white),
              label: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
            )
          else ...[
            TextButton.icon(
              onPressed: _retake,
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
              label: const Text('Close', style: TextStyle(color: Colors.white)),
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
                    'Score: $correctCount / ${questions.length}',
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
          if (audioUrl != null)
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
              itemCount: questions.length,
              itemBuilder: (context, i) {
                final q = questions[i];
                final imageUrl =
                    (q.imagePath != null && q.imagePath!.isNotEmpty)
                    ? testRepo.getPublicUrl('study_materials', q.imagePath!)
                    : null;

                Color? colorOf(int idx) {
                  if (!showAnswers) return null;
                  final isSel = answers[i] == idx;
                  final isCor = q.correctIndex == idx;
                  if (isCor) return Colors.green;
                  if (isSel && !isCor) return Colors.red;
                  return null;
                }

                FontWeight fwOf(int idx) =>
                    showAnswers && (answers[i] == idx || q.correctIndex == idx)
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
                        subtitle: (q.question != null && q.question!.isNotEmpty)
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
                              groupValue: answers[i],
                              onChanged: showAnswers
                                  ? null
                                  : (v) => setState(() => answers[i] = v),
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
}
