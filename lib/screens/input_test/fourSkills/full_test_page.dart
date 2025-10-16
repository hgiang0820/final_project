// import 'dart:async';

// import 'package:final_project/repositories/result_repository.dart';
// import 'package:final_project/screens/input_test/fourSkills/full_lis_page.dart';
// import 'package:final_project/screens/input_test/fourSkills/full_read_page.dart';
// import 'package:final_project/screens/input_test/fourSkills/full_speak_page.dart';
// import 'package:final_project/screens/input_test/fourSkills/full_wri_page.dart';
// import 'package:final_project/widgets/small_button.dart';
// // import 'package:final_project/services/writing_api_service.dart';
// import 'package:flutter/material.dart';

// class FullTestPage extends StatefulWidget {
//   final String testId;
//   const FullTestPage({super.key, required this.testId});

//   @override
//   State<FullTestPage> createState() => _FullTestPage();
// }

// class _FullTestPage extends State<FullTestPage> {
//   final resultRepo = ResultRepository();

//   final lisKey = GlobalKey<FullLisPageState>();
//   final readKey = GlobalKey<FullReadPageState>();
//   final speakKey = GlobalKey<FullSpeakPageState>();
//   final wriKey = GlobalKey<FullWriPageState>();

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
//     final lisResult = lisKey.currentState?.getResult();
//     final readResult = await readKey.currentState?.getResult();
//     final speakResult = await speakKey.currentState?.getResult();
//     final wriResult = await wriKey.currentState?.getResult();

//     // part1Key.currentState?.showAnswersMode();
//     if (lisResult != null) {
//       lisKey.currentState?.showAnswersMode();
//     }
//     if (readResult != null) {
//       readKey.currentState?.showAnswersMode();
//       // readKey.currentState?.showFeedbacksMode(readResult['results']);
//     }
//     if (speakResult != null) {
//       speakKey.currentState?.showFeedbacksMode(speakResult['results']);
//     }
//     if (wriResult != null) {
//       wriKey.currentState?.showFeedbacksMode(wriResult['results']);
//     }

//     if (lisResult != null) {
//       partScores['lis_part'] = {
//         'score': lisResult['score'],
//         'total': lisResult['total'],
//       };
//       answers['lis_part'] = lisResult['answers'];
//     }

//     if (readResult != null) {
//       partScores['read_part'] = {
//         'score': readResult['score'],
//         'total': readResult['total'],
//       };
//       answers['read_part'] = readResult['answers'];
//     }
//     if (speakResult != null) {
//       partScores['speak_part'] = {
//         'score': speakResult['score'],
//         'total': speakResult['total'],
//       };
//       answers['speak_part'] = speakResult['answers'];
//       // có thêm feedback
//       answers['feedback_speak_part'] = speakResult['results'];
//     }

//     if (wriResult != null) {
//       partScores['wri_part'] = {
//         'score': wriResult['score'],
//         'total': wriResult['total'],
//       };
//       answers['wri_part'] = wriResult['answers'];
//       // có thêm feedback
//       answers['feedback_wri_part'] = wriResult['results'];
//     }

//     setState(() {
//       totalScore =
//           (partScores['lis_part']?['score'] ?? 0) +
//           (partScores['read_part']?['score'] ?? 0) +
//           (partScores['speak_part']?['score'] ?? 0) +
//           (partScores['wri_part']?['score'] ?? 0);
//     });

//     if (totalScore <= 20) {
//       testLevel = "LR 1-295 & SW 1-99";
//     } else if (totalScore <= 40) {
//       testLevel = "LR 300-595 & SW 100-199";
//     } else {
//       testLevel = "LR 600-650 & SW 200-250";
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
//         content: Text("Total score: $totalScore \n Your level: $testLevel"),
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
//             const Text('Quick Test 4 Skills'),
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
//                     title: "Listening",
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
//                     title: "Reading",
//                     isSelected: selectedIndex == 1,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: SmallButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 2;
//                         selectedPartIndex = 2;
//                       });
//                     },
//                     title: "Speaking",
//                     isSelected: selectedIndex == 2,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: SmallButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = 3;
//                         selectedPartIndex = 3;
//                       });
//                     },
//                     title: "Writing",
//                     isSelected: selectedIndex == 3,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: IndexedStack(
//               index: selectedPartIndex,
//               children: [
//                 FullLisPage(
//                   key: lisKey,
//                   testId: widget.testId,
//                   onTestStart: _handlePartStarted,
//                 ),
//                 FullReadPage(
//                   key: readKey,
//                   testId: widget.testId,
//                   onTestStart: _handlePartStarted,
//                 ),
//                 FullSpeakPage(
//                   key: speakKey,
//                   testId: widget.testId,
//                   onTestStart: _handlePartStarted,
//                 ),
//                 FullWriPage(
//                   key: wriKey,
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
