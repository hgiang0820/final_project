import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/repositories/input_test_repository.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class FullReadPage extends StatefulWidget {
  final String testId;
  final VoidCallback? onTestStart;
  const FullReadPage({super.key, required this.testId, this.onTestStart});

  @override
  State<FullReadPage> createState() => FullReadPageState();
}

class FullReadPageState extends State<FullReadPage> {
  final repo = InputTestRepository();
  final player = AudioPlayer();

  List<QuestionLR> questions = [];
  List<int?> answers = [];
  String? audioUrl;

  bool isPlaying = false;
  bool isStarted = false;

  bool showAnswers = false;
  int correctCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
    player.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state.playing;
      });
    });
  }

  Future<void> _load() async {
    final partMeta = await repo.getPartMeta(
      'input_tests',
      widget.testId,
      'read_part',
    );
    final qs = await repo.getQuestionsLR(
      'input_tests',
      widget.testId,
      'read_part',
    );
    final url = partMeta['audioPath'] != null
        ? repo.getPublicUrl('toeic-assets', partMeta['audioPath'])
        : null;
    setState(() {
      questions = qs;
      answers = List<int?>.filled(qs.length, null);
      audioUrl = url;
    });
    if (url != null) {
      await player.setUrl(url);
    }
  }

  Map<String, dynamic> getResult() {
    final score = _calculateScore();
    return {
      'score': score,
      'total': questions.length,
      'answers': {
        for (int i = 0; i < questions.length; i++) questions[i].id: answers[i],
      },
    };
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] != null && answers[i] == questions[i].correctIndex) {
        score++;
      }
    }
    return score;
  }

  void showAnswersMode() {
    setState(() {
      showAnswers = true;
      correctCount = _calculateScore();
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!isStarted) {
      return AlertDialog(
        title: const Text("Part 2 - Reading"),
        content: const Text(
          "The part includes 20 questions. You need to mark A/B/C/D to choose best answer for each question. Good luck!",
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
              // _startQuestion(0);
            },
            child: const Text("Start"),
          ),
        ],
      );
    }

    return Scaffold(
      body: Column(
        children: [
          if (showAnswers)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Answered correct $correctCount / ${questions.length} questions',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    color: Colors.grey[350],
                    child: ListTile(
                      title: const Text(
                        'Audio for Part 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () async {
                          if (isPlaying) {
                            await player.pause();
                          } else {
                            await player.play();
                          }
                        },
                      ),
                    ),
                  );
                }

                final q = questions[index - 1];
                // final imageUrl = q.imagePath != null
                //     ? repo.getPublicUrl(q.imagePath!)
                //     : null;
                // final userAnswer = answers[index - 1];
                final correctAnswer = q.correctIndex;

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(title: Text("Question $index:")),
                      Column(
                        children: List.generate(q.options.length, (i) {
                          final isSelected = answers[index - 1] == i;
                          final isCorrect = correctAnswer == i;

                          Color? color;
                          if (showAnswers) {
                            if (isSelected && isCorrect) {
                              color = Colors.green;
                            } else if (isSelected && !isCorrect) {
                              color = Colors.red;
                            } else if (!isSelected && isCorrect) {
                              color = Colors.green;
                            }
                          }

                          if (showAnswers) {
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
                                    child: Row(
                                      children: [Text("q.sampleAnswer")],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return RadioListTile<int>(
                            value: i,
                            groupValue: answers[index - 1],
                            onChanged: showAnswers
                                ? null
                                : (val) {
                                    setState(() {
                                      answers[index - 1] = val;
                                    });
                                  },
                            title: Text(
                              q.options[i],
                              style: TextStyle(
                                color: color,
                                fontWeight:
                                    showAnswers && (isSelected || isCorrect)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          );
                        }),
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
