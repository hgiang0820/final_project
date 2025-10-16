import 'dart:async';
import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/repositories/test_repository.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LRPart1Page extends StatefulWidget {
  final String testId;
  const LRPart1Page({super.key, required this.testId});

  @override
  State<LRPart1Page> createState() => LRPart1PageState();
}

class LRPart1PageState extends State<LRPart1Page> {
  final repo = TestRepository();
  final player = AudioPlayer();

  List<QuestionLR> questions = [];
  List<int?> answers = [];
  String? audioUrl;

  bool isPlaying = false;

  bool showAnswers = false;
  int correctCount = 0;

  StreamSubscription<PlayerState>? _playerSub; // ✅ lưu subscription

  @override
  void initState() {
    super.initState();
    _load();

    _playerSub = player.playerStateStream.listen((state) {
      if (!mounted) return; // ✅ guard
      setState(() {
        isPlaying = state.playing;
      });
    });
  }

  Future<void> _load() async {
    try {
      final partMeta = await repo.getPartMeta('input_tests', widget.testId, 'part1');
      final qs = await repo.getQuestionsLR('input_tests', widget.testId, 'part1');

      final audioPath = partMeta['audioPath'] as String?;
      final url = audioPath != null ? repo.getPublicUrl('toeic-assets', audioPath) : null;

      if (!mounted) return; // ✅ widget có thể đã dispose sau await
      setState(() {
        questions = qs;
        answers = List<int?>.filled(qs.length, null);
        audioUrl = url;
      });

      if (url != null) {
        if (!mounted) return; // ✅ guard trước khi đụng vào player
        await player.setUrl(url);
      }
    } catch (e) {
      // (Tuỳ chọn) hiển thị lỗi nhẹ nhàng
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không tải được dữ liệu Part 1: $e')),
      );
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
    if (!mounted) return; // ✅ an toàn
    setState(() {
      showAnswers = true;
      correctCount = _calculateScore();
    });
  }

  @override
  void dispose() {
    _playerSub?.cancel(); // ✅ HUỶ listener
    player.dispose();
    super.dispose();
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
              itemCount: questions.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    color: Colors.grey[350],
                    child: ListTile(
                      title: const Text(
                        'Audio for Part 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () async {
                          // (Không cần check mounted ở đây vì nút chỉ bấm khi đang hiển thị)
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
                final imageUrl = q.imagePath != null
                    ? repo.getPublicUrl('toeic-assets', q.imagePath!)
                    : null;
                final correctAnswer = q.correctIndex;

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Question $index:",
                          style: const TextStyle(
                            fontSize: 18,
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
                          ),
                        ),
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

                          return RadioListTile<int>(
                            value: i,
                            groupValue: answers[index - 1],
                            onChanged: showAnswers
                                ? null
                                : (val) {
                                    if (!mounted) return; // ✅ an toàn
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
                      if (showAnswers)
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


// import 'dart:async';
// import 'package:final_project/models/question_LR_model.dart';
// import 'package:final_project/repositories/test_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class LRPart1Page extends StatefulWidget {
//   final String testId;
//   const LRPart1Page({super.key, required this.testId});

//   @override
//   State<LRPart1Page> createState() => LRPart1PageState();
// }

// class LRPart1PageState extends State<LRPart1Page> {
//   final repo = TestRepository();
//   final player = AudioPlayer();

//   List<QuestionLR> questions = [];
//   List<int?> answers = [];
//   String? audioUrl;

//   bool isPlaying = false;

//   bool showAnswers = false;
//   int correctCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _load();
//     player.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });
//   }

//   Future<void> _load() async {
//     final partMeta = await repo.getPartMeta(widget.testId, 'part1');
//     final qs = await repo.getQuestionsLR(widget.testId, 'part1');

//     final audioPath = partMeta['audioPath'] as String?;
//     final url = audioPath != null ? repo.getPublicUrl(audioPath) : null;

//     setState(() {
//       questions = qs;
//       answers = List<int?>.filled(qs.length, null);
//       audioUrl = url;
//     });

//     if (url != null) {
//       await player.setUrl(url);
//     }
//   }

//   Map<String, dynamic> getResult() {
//     final score = _calculateScore();
//     return {
//       'score': score,
//       'total': questions.length,
//       'answers': {
//         for (int i = 0; i < questions.length; i++) questions[i].id: answers[i],
//       },
//     };
//   }

//   int _calculateScore() {
//     int score = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (answers[i] != null && answers[i] == questions[i].correctIndex) {
//         score++;
//       }
//     }
//     return score;
//   }

//   void showAnswersMode() {
//     setState(() {
//       showAnswers = true;
//       correctCount = _calculateScore();
//     });
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (questions.isEmpty) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       body: Column(
//         children: [
//           if (showAnswers)
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 'Answered correct $correctCount / ${questions.length} questions',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//             ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: questions.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return Card(
//                     margin: const EdgeInsets.all(8),
//                     color: Colors.grey[350],
//                     child: ListTile(
//                       title: const Text(
//                         'Audio for Part 1',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//                         onPressed: () async {
//                           if (isPlaying) {
//                             await player.pause();
//                           } else {
//                             await player.play();
//                           }
//                         },
//                       ),
//                     ),
//                   );
//                 }

//                 final q = questions[index - 1];
//                 final imageUrl = q.imagePath != null
//                     ? repo.getPublicUrl(q.imagePath!)
//                     : null;
//                 // final userAnswer = answers[index - 1];
//                 final correctAnswer = q.correctIndex;

//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         title: Text(
//                           "Question $index:",
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       if (imageUrl != null)
//                         Center(
//                           child: Image.network(
//                             imageUrl,
//                             height: 200,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       Column(
//                         children: List.generate(q.options.length, (i) {
//                           final isSelected = answers[index - 1] == i;
//                           final isCorrect = correctAnswer == i;

//                           Color? color;
//                           if (showAnswers) {
//                             if (isSelected && isCorrect) {
//                               color = Colors.green;
//                             } else if (isSelected && !isCorrect) {
//                               color = Colors.red;
//                             } else if (!isSelected && isCorrect) {
//                               color = Colors.green;
//                             }
//                           }

//                           return RadioListTile<int>(
//                             value: i,
//                             groupValue: answers[index - 1],
//                             onChanged: showAnswers
//                                 ? null
//                                 : (val) {
//                                     setState(() {
//                                       answers[index - 1] = val;
//                                     });
//                                   },
//                             title: Text(
//                               q.options[i],
//                               style: TextStyle(
//                                 color: color,
//                                 fontWeight:
//                                     showAnswers && (isSelected || isCorrect)
//                                     ? FontWeight.bold
//                                     : FontWeight.normal,
//                               ),
//                             ),
//                           );
//                         }),
//                       ),

//                       if (showAnswers)
//                         Card(
//                           elevation: 2,
//                           color: Colors.blue[100],
//                           child: ExpansionTile(
//                             initiallyExpanded: false, // ✅ mặc định đóng
//                             title: Row(
//                               children: [
//                                 Icon(
//                                   Icons.lightbulb_outline,
//                                   color: Colors.blue[700],
//                                 ),
//                                 const SizedBox(width: 12),
//                                 const Text(
//                                   'Explain',
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(16),
//                                 child: Row(children: [Text(q.explain)]),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }