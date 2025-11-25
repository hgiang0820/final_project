import 'dart:async';
import 'package:final_project/repositories/input_test_repository.dart';
import 'package:flutter/material.dart';
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/widgets/small_button.dart';
import 'LR_part1_page.dart';
import 'LR_part2_page.dart';
import 'LR_part3_page.dart';
import 'LR_part4_page.dart';
import 'LR_part5_page.dart';
import 'LR_part6_page.dart';
import 'LR_part7_page.dart';

class LRTestPage extends StatefulWidget {
  final String testId;
  const LRTestPage({super.key, required this.testId});

  @override
  State<LRTestPage> createState() => _LRTestPage();
}

class _LRTestPage extends State<LRTestPage> {
  final resultRepo = ResultRepository();
  final testRepo = InputTestRepository();

  final part1Key = GlobalKey<LRPart1PageState>();
  final part2Key = GlobalKey<LRPart2PageState>();
  final part3Key = GlobalKey<LRPart3PageState>();
  final part4Key = GlobalKey<LRPart4PageState>();
  final part5Key = GlobalKey<LRPart5PageState>();
  final part6Key = GlobalKey<LRPart6PageState>();
  final part7Key = GlobalKey<LRPart7PageState>();

  Map<String, dynamic> partScores = {};
  Map<String, dynamic> answers = {};

  List<String> strongPoints = [];
  List<String> weakPoints = [];

  int remainingSeconds = 1200;
  Timer? countdownTimer;

  int selectedPartIndex = 0;
  int selectedIndex = 0;

  bool showAnswers = false;
  int totalScore = 0;

  String testLevel = "";

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        _submitAll();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _submitAll() async {
    final result1 = part1Key.currentState?.getResult();
    final result2 = part2Key.currentState?.getResult();
    final result3 = part3Key.currentState?.getResult();
    final result4 = part4Key.currentState?.getResult();
    final result5 = part5Key.currentState?.getResult();
    final result6 = part6Key.currentState?.getResult();
    final result7 = part7Key.currentState?.getResult();

    part1Key.currentState?.showAnswersMode();
    part2Key.currentState?.showAnswersMode();
    part3Key.currentState?.showAnswersMode();
    part4Key.currentState?.showAnswersMode();
    part5Key.currentState?.showAnswersMode();
    part6Key.currentState?.showAnswersMode();
    part7Key.currentState?.showAnswersMode();

    if (result1 != null) {
      partScores['part1'] = {
        'score': result1['score'],
        'total': result1['total'],
        'correctPercent': result1['score'] / result1['total'],
      };
      answers['part1'] = result1['answers'];
      final partType = await testRepo.getPartType("testLR", 'part1');
      if (partScores['part1']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result2 != null) {
      partScores['part2'] = {
        'score': result2['score'],
        'total': result2['total'],
        'correctPercent': result2['score'] / result2['total'],
      };
      answers['part2'] = result2['answers'];
      final partType = await testRepo.getPartType("testLR", 'part2');
      if (partScores['part2']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result3 != null) {
      partScores['part3'] = {
        'score': result3['score'],
        'total': result3['total'],
        'correctPercent': result3['score'] / result3['total'],
      };
      answers['part3'] = result3['answers'];
      final partType = await testRepo.getPartType("testLR", 'part3');
      if (partScores['part3']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result4 != null) {
      partScores['part4'] = {
        'score': result4['score'],
        'total': result4['total'],
        'correctPercent': result4['score'] / result4['total'],
      };
      answers['part4'] = result4['answers'];
      final partType = await testRepo.getPartType("testLR", 'part4');
      if (partScores['part4']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result5 != null) {
      partScores['part5'] = {
        'score': result5['score'],
        'total': result5['total'],
        'correctPercent': result5['score'] / result5['total'],
      };
      answers['part5'] = result5['answers'];
      final partType = await testRepo.getPartType("testLR", 'part5');
      if (partScores['part5']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result6 != null) {
      partScores['part6'] = {
        'score': result6['score'],
        'total': result6['total'],
        'correctPercent': result6['score'] / result6['total'],
      };
      answers['part6'] = result6['answers'];
      final partType = await testRepo.getPartType("testLR", 'part6');
      if (partScores['part6']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    if (result7 != null) {
      partScores['part7'] = {
        'score': result7['score'],
        'total': result7['total'],
        'correctPercent': result7['score'] / result7['total'],
      };
      answers['part7'] = result7['answers'];
      final partType = await testRepo.getPartType("testLR", 'part7');
      if (partScores['part7']?['correctPercent'] <= 0.5) {
        if (partType != null) weakPoints.add(partType);
      } else {
        if (partType != null) strongPoints.add(partType);
      }
    }

    setState(() {
      totalScore =
          (partScores['part1']?['score'] ?? 0) +
          (partScores['part2']?['score'] ?? 0) +
          (partScores['part3']?['score'] ?? 0) +
          (partScores['part4']?['score'] ?? 0) +
          (partScores['part5']?['score'] ?? 0) +
          (partScores['part6']?['score'] ?? 0) +
          (partScores['part7']?['score'] ?? 0);
    });

    if (totalScore <= 20) {
      testLevel = "TOEIC LR 1-295";
    } else if (totalScore <= 40) {
      testLevel = "TOEIC LR 300-595";
    } else {
      testLevel = "TOEIC LR 600-650";
    }

    await resultRepo.saveResult(
      testId: widget.testId,
      totalScore: totalScore,
      testLevel: testLevel,
      parts: partScores,
      answers: answers,
      strongPoints: strongPoints,
      weakPoints: weakPoints,
    );

    countdownTimer?.cancel(); // stop the clock

    final weakPointsStr = weakPoints
        .where((e) => e.trim().isNotEmpty)
        .toSet() // loại trùng
        .join(', ');

    final strongPointsStr = strongPoints
        .where((e) => e.trim().isNotEmpty)
        .toSet()
        .join(', ');

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Your Result"),
        content: Text(
          "Total score: $totalScore\n"
          "Your level: $testLevel\n"
          "You did quite well on the following types of questions: "
          "${strongPointsStr.isEmpty ? '—' : strongPointsStr}"
          "But you need to improve the following types of questions: "
          "${weakPointsStr.isEmpty ? '—' : weakPointsStr}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                showAnswers = true;
              });
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Quick L&R Test'),
            if (!showAnswers)
              Text(
                formatTime(remainingSeconds),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: remainingSeconds < 30 ? Colors.red : Colors.black,
                ),
              )
            else
              Text(
                'Score: $totalScore',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                        selectedPartIndex = 0;
                      });
                    },
                    title: "Part 1",
                    isSelected: selectedIndex == 0,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                        selectedPartIndex = 1;
                      });
                    },
                    title: "Part 2",
                    isSelected: selectedIndex == 1,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                        selectedPartIndex = 2;
                      });
                    },
                    title: "Part 3",
                    isSelected: selectedIndex == 2,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                        selectedPartIndex = 3;
                      });
                    },
                    title: "Part 4",
                    isSelected: selectedIndex == 3,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 4;
                        selectedPartIndex = 4;
                      });
                    },
                    title: "Part 5",
                    isSelected: selectedIndex == 4,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 5;
                        selectedPartIndex = 5;
                      });
                    },
                    title: "Part 6",
                    isSelected: selectedIndex == 5,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 6;
                        selectedPartIndex = 6;
                      });
                    },
                    title: "Part 7",
                    isSelected: selectedIndex == 6,
                    height: 35,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedPartIndex,
              children: [
                LRPart1Page(key: part1Key, testId: widget.testId),
                LRPart2Page(key: part2Key, testId: widget.testId),
                LRPart3Page(key: part3Key, testId: widget.testId),
                LRPart4Page(key: part4Key, testId: widget.testId),
                LRPart5Page(key: part5Key, testId: widget.testId),
                LRPart6Page(key: part6Key, testId: widget.testId),
                LRPart7Page(key: part7Key, testId: widget.testId),
              ],
            ),
          ),
          if (!showAnswers)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Submit All'),
                onPressed: _submitAll,
              ),
            ),
        ],
      ),
    );
  }
}
