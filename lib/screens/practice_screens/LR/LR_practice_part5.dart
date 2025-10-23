import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/repositories/test_repository.dart';
import 'package:flutter/material.dart';

class LRPracticePart5 extends StatefulWidget {
  final String testId;
  const LRPracticePart5({super.key, required this.testId});

  @override
  State<LRPracticePart5> createState() => LRPracticePart5State();
}

class LRPracticePart5State extends State<LRPracticePart5> {
  final repo = TestRepository();
  List<QuestionLR> questions = [];
  List<int?> answers = [];

  bool showAnswers = false;
  int correctCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final qs = await repo.getPracticeQuestionsLR(
      'practice_tests',
      'LR_practice_tests',
      widget.testId,
      'part5',
    );
    setState(() {
      questions = qs;
      answers = List<int?>.filled(qs.length, null);
    });
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
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
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
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                final correctAnswer = q.correctIndex;

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question ${index + 1}:",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(q.question ?? ''),
                          ],
                        ),
                      ),
                      Column(
                        children: List.generate(q.options.length, (i) {
                          final isSelected = answers[index] == i;
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

                          return RadioListTile<int>(
                            value: i,
                            groupValue: answers[index],
                            onChanged: showAnswers
                                ? null
                                : (val) {
                                    setState(() {
                                      answers[index] = val;
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

                      if (showAnswers)
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
                                  'Explain',
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
                                child: Row(children: [Text(q.explain)]),
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
