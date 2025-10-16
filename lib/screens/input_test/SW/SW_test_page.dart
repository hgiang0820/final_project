// import 'dart:async';

// import 'package:final_project/repositories/result_repository.dart';
// import 'package:final_project/screens/input_test/SW/SW_part1_page.dart';
// import 'package:final_project/screens/input_test/SW/SW_part2_page.dart';
// import 'package:final_project/widgets/small_button.dart';
// // import 'package:final_project/services/writing_api_service.dart';
// import 'package:flutter/material.dart';

// class SWTestPage extends StatefulWidget {
//   final String testId;
//   const SWTestPage({super.key, required this.testId});

//   @override
//   State<SWTestPage> createState() => _SWTestPage();
// }

// class _SWTestPage extends State<SWTestPage> {
//   final resultRepo = ResultRepository();

//   final part1Key = GlobalKey<SWPart1PageState>();
//   final part2Key = GlobalKey<SWPart2PageState>();

//   Map<String, dynamic> partScores = {};
//   Map<String, dynamic> answers = {};

//   int remainingSeconds = 1000;
//   Timer? countdownTimer;
//   bool _countdownStarted = false;
//   int selectedPartIndex = 0;
//   int selectedIndex = 0;

//   bool showAnswers = false;
//   int totalScore = 0;

//   String testLevel = "";

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     super.dispose();
//   }

//   void _startCountdownIfNeeded() {
//     if (_countdownStarted) return;
//     _countdownStarted = true;
//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (!mounted) {
//         timer.cancel();
//         return;
//       }
//       if (remainingSeconds == 0) {
//         timer.cancel();
//         _submitAll();
//       } else {
//         setState(() {
//           remainingSeconds--;
//         });
//       }
//     });
//   }

//   void _handlePartStarted() {
//     _startCountdownIfNeeded();
//   }

//   Future<void> _submitAll() async {
//     // await ở đây
//     final result1 = await part1Key.currentState?.getResult();
//     final result2 = await part2Key.currentState?.getResult();

//     // part1Key.currentState?.showAnswersMode();
//     if (result1 != null) {
//       part1Key.currentState?.showFeedbacksMode(result1['results']);
//     }
//     if (result2 != null) {
//       part2Key.currentState?.showFeedbacksMode(result2['results']);
//     }

//     if (result1 != null) {
//       partScores['part1'] = {
//         'score': result1['score'],
//         'total': result1['total'],
//       };
//       answers['part1'] = result1['answers'];
//       // có thêm feedback
//       answers['feedback_part1'] = result1['results'];
//     }

//     if (result2 != null) {
//       partScores['part2'] = {
//         'score': result2['score'],
//         'total': result2['total'],
//       };
//       answers['part2'] = result2['answers'];
//       // có thêm feedback
//       answers['feedback_part2'] = result2['results'];
//     }

//     setState(() {
//       totalScore =
//           (partScores['part1']?['score'] ?? 0) +
//           (partScores['part2']?['score'] ?? 0);
//     });

//     if (totalScore <= 15) {
//       testLevel = "TOEIC SW 1-99";
//     } else if (totalScore <= 30) {
//       testLevel = "TOEIC SW 100-199";
//     } else {
//       testLevel = "TOEIC SW 200-250";
//     }

//     await resultRepo.saveResult(
//       testId: widget.testId,
//       totalScore: totalScore,
//       testLevel: testLevel,
//       parts: partScores,
//       answers: answers,
//     );

//     countdownTimer?.cancel(); // stop the clock

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Your Result"),
//         content: Text("Total score: $totalScore \n You level: $testLevel"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               setState(() {
//                 showAnswers = true;
//               });
//             },
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   String formatTime(int seconds) {
//     final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
//     final secs = (seconds % 60).toString().padLeft(2, '0');
//     return '$minutes:$secs';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text('Quick Test S&W'),
//             if (!showAnswers)
//               Text(
//                 formatTime(remainingSeconds),
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: remainingSeconds < 30 ? Colors.red : Colors.black,
//                 ),
//               )
//             else
//               Text(
//                 'Score: $totalScore',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.green,
//                 ),
//               ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SmallButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 0;
//                         selectedPartIndex = 0;
//                       });
//                     },
//                     title: "Part 1 - Speaking",
//                     isSelected: selectedIndex == 0,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: SmallButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 1;
//                         selectedPartIndex = 1;
//                       });
//                     },
//                     title: "Part 2 - Writing",
//                     isSelected: selectedIndex == 1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: IndexedStack(
//               index: selectedPartIndex,
//               children: [
//                 SWPart1Page(
//                   key: part1Key,
//                   testId: widget.testId,
//                   onTestStart: _handlePartStarted,
//                 ),
//                 SWPart2Page(
//                   key: part2Key,
//                   testId: widget.testId,
//                   onTestStart: _handlePartStarted,
//                 ),
//               ],
//             ),
//           ),
//           //   if (!showAnswers)
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.check),
//               label: const Text('Submit All'),
//               onPressed: _submitAll,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
