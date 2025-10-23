import 'dart:async';
import 'package:final_project/services/writing_api_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/question_SW_model.dart';
import 'package:final_project/repositories/test_repository.dart';

class FullWriPage extends StatefulWidget {
  final String testId;
  final VoidCallback? onTestStart;
  const FullWriPage({super.key, required this.testId, this.onTestStart});

  @override
  State<FullWriPage> createState() => FullWriPageState();
}

class FullWriPageState extends State<FullWriPage> {
  final repo = TestRepository();

  List<QuestionSW> questions = [];
  int currentIndex = 0;

  bool isFinishedAll = false;
  bool isStarted = false;
  bool showAnswers = false;

  // Text controllers and answers storage
  Map<String, TextEditingController> textControllers = {};
  Map<String, String> answers = {};
  Map<String, String> requirements = {};
  // Map<String, String> results = {};
  Map<String, dynamic> evaluationResults = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final qs = await repo.getQuestionsSW(widget.testId, 'wri_part');
    if (qs.isNotEmpty) {
      setState(() {
        questions = qs;
        // Create controller and empty answer for each question
        for (var q in qs) {
          textControllers[q.id] = TextEditingController();
          answers[q.id] = '';

          // Lắng nghe thay đổi text để lưu tạm thời
          textControllers[q.id]!.addListener(() {
            answers[q.id] = textControllers[q.id]!.text;
          });
        }
      });
    }
  }

  // Future<void> loadRequirements() async {
  //   final qs = await repo.getQuestionsSW(widget.testId, 'part2');
  //   setState(() {
  //     for (var q in qs) {
  //       requirements[q.id] = "${q.requirement} \n ${q.text}";
  //     }
  //     // requirement = doc.exists ? (doc.data()?['requirement'] ?? '') : 'Requirement not found';
  //   });
  // }

  Future<Map<String, dynamic>> getResult() async {
    final api = WritingApiService(baseUrl: 'http://192.168.1.14:8000');

    Map<String, dynamic> results = {};
    var imageUrl = '';

    for (var q in questions) {
      final answer = answers[q.id] ?? '';
      if (q.type == 'Write a Sentence based on a Picture') {
        imageUrl =
            // "${q.imagePath}";
            "https://ewycqwtiuttrvpubkwgm.supabase.co/storage/v1/object/public/toeic-assets/${q.imagePath}";
      } else {
        imageUrl = '';
      }
      try {
        final resp = await api.submitWriting(
          // requirement: "${q.requirement} ${q.directions}  ${q.text} ",
          requirement: "${q.type} ${q.text} ${q.directions} $imageUrl",
          answer: answer,
          max_score: q.maxScore,
        );

        // Lưu đủ data cho từng câu
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
      'results': results, // chứa thông tin chi tiết từng câu
    };
  }

  void showFeedbacksMode(Map<String, dynamic> results) {
    setState(() {
      isFinishedAll = true;
      evaluationResults = results;
    });
  }

  /// Bắt đầu 1 câu mới
  void _startQuestion(int index) {
    // Ẩn keyboard trước khi chuyển câu hỏi
    FocusScope.of(context).unfocus();

    // Lưu text hiện tại trước khi chuyển
    if (questions.isNotEmpty && currentIndex < questions.length) {
      final currentQuestionId = questions[currentIndex].id;
      answers[currentQuestionId] =
          textControllers[currentQuestionId]?.text ?? '';
    }

    setState(() {
      currentIndex = index;
    });

    // Load text đã lưu cho câu hỏi mới
    if (index < questions.length) {
      final newQuestionId = questions[index].id;
      final savedAnswer = answers[newQuestionId] ?? '';
      textControllers[newQuestionId]?.text = savedAnswer;
    }
  }

  /// Ẩn keyboard khi click bên ngoài
  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    // Dispose tất cả controllers
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final q = questions[currentIndex];
    final imageUrl = q.imagePath != null
        ? repo.getPublicUrl('toeic-assets', q.imagePath!)
        : null;

    // while running: show current question and if it already has a recorded file show player
    if (!isStarted) {
      return AlertDialog(
        title: const Text("Part 4 - Writing"),
        content: const Text("The test includes 2 questions. Good luck!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // thoát về màn trước nếu muốn
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

    // if (!isFinishedAll) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(questions.length, (index) {
                      final isCurrentQuestion = index == currentIndex;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              _startQuestion(index);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isCurrentQuestion
                                  ? Colors.green[300]
                                  : Colors.grey[300],
                              foregroundColor: isCurrentQuestion
                                  ? Colors.white
                                  : Colors.black87,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: isCurrentQuestion ? 4 : 1,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isCurrentQuestion
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Text(
                "Question ${currentIndex + 1}/${questions.length}: ${q.type}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Directions: ${q.directions}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              if (imageUrl != null)
                Center(
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox();
                    },
                  ),
                ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  q.text ?? "",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Answer: ",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Text input area
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
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  onChanged: (text) {
                    setState(() {}); // Để update word count
                  },
                  enabled: !isFinishedAll,
                ),
              ),
              SizedBox(height: 20),

              // Show feedback & answer
              if (isFinishedAll && evaluationResults.containsKey(q.id))
                // Feedback Card
                Card(
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
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _buildFeedbackField(
                          "Score",
                          "${evaluationResults[q.id]['score']?.toString()}/${q.maxScore}",
                        ),
                        const SizedBox(height: 15),
                        _buildFeedbackField(
                          "Grammar",
                          (evaluationResults[q.id]['grammar_feedback']
                                      is List &&
                                  (evaluationResults[q.id]['grammar_feedback']
                                          as List)
                                      .isEmpty)
                              ? "No grammar error."
                              : evaluationResults[q.id]['grammar_feedback']
                                    is List
                              ? (evaluationResults[q.id]['grammar_feedback']
                                        as List)
                                    .join(", ")
                              : evaluationResults[q.id]['grammar_feedback']
                                    ?.toString(),
                        ),
                        const SizedBox(height: 15),
                        _buildFeedbackField(
                          "Comment",
                          evaluationResults[q.id]['feedback']?.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Sample Answer Card
              if (isFinishedAll && evaluationResults.containsKey(q.id))
                Card(
                  elevation: 2,
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                        const SizedBox(height: 15),
                        Text(q.sampleAnswer),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
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
