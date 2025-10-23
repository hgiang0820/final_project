import 'dart:async';

import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/repositories/test_repository.dart';
import 'package:final_project/screens/practice_screens/SW/SW_practice_part1.dart';
import 'package:final_project/screens/practice_screens/SW/SW_practice_part2.dart';
import 'package:final_project/widgets/small_button.dart';
// import 'package:final_project/services/writing_api_service.dart';
import 'package:flutter/material.dart';

class SWTestPage extends StatefulWidget {
  final String testId;
  const SWTestPage({super.key, required this.testId});

  @override
  State<SWTestPage> createState() => _SWTestPage();
}

class _SWTestPage extends State<SWTestPage> {
  final resultRepo = ResultRepository();
  final testRepo = TestRepository();

  final part1Key = GlobalKey<SWPracticePart1State>();
  final part2Key = GlobalKey<SWPracticePart2State>();

  Map<String, dynamic> partScores = {};
  Map<String, dynamic> answers = {};

  List<String> strongPoints = [];
  List<String> weakPoints = [];

  int remainingSeconds = 1000;
  Timer? countdownTimer;
  bool _countdownStarted = false;

  int selectedPartIndex = 0;
  int selectedIndex = 0;

  bool showAnswers = false;
  int totalScore = 0;

  String testLevel = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void _startCountdownIfNeeded() {
    if (_countdownStarted) return;
    _countdownStarted = true;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
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

  void _handlePartStarted() {
    _startCountdownIfNeeded();
  }

  // Đặt trong class _SWTestPage (ví dụ ngay dưới dispose)
  List<Map<String, dynamic>> _normalizeResults(dynamic results) {
    if (results == null) return const <Map<String, dynamic>>[];

    if (results is List) {
      return results
          .whereType<Map>() // lọc phần tử không phải Map
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }

    if (results is Map) {
      return (results).entries.map<Map<String, dynamic>>((entry) {
        final m = Map<String, dynamic>.from(entry.value as Map);
        // nếu object chưa có questionId thì thêm từ key
        m.putIfAbsent('questionId', () => entry.key);
        return m;
      }).toList();
    }

    // Trường hợp type lạ
    return const <Map<String, dynamic>>[];
  }

  Future<void> _submitAll() async {
    // await ở đây
    final result1 = await part1Key.currentState?.getResult();
    final result2 = await part2Key.currentState?.getResult();

    // part1Key.currentState?.showAnswersMode();
    if (result1 != null) {
      part1Key.currentState?.showFeedbacksMode(result1['results']);
    }
    if (result2 != null) {
      part2Key.currentState?.showFeedbacksMode(result2['results']);
    }

    // if (result1 != null) {
    //   partScores['part1'] = {
    //     'score': result1['score'],
    //     'total': result1['total'],
    //   };
    //   answers['part1'] = result1['answers'];
    //   // có thêm feedback
    //   answers['feedback_part1'] = result1['results'];
    //   // get weak and strong points
    //   for (var q in answers['feedback_part1']) {
    //     if (q['score'] / q['max_score'] >= 0.5) {
    //       final questionType = await testRepo.getQuestionType(
    //         "testSW",
    //         'part1',
    //         q['questionId'],
    //       );
    //       if (questionType != null) strongPoints.add(questionType);
    //     } else {
    //       final questionType = await testRepo.getQuestionType(
    //         "testSW",
    //         'part1',
    //         q['questionId'],
    //       );
    //       if (questionType != null) weakPoints.add(questionType);
    //     }
    //   }
    //   // final partType = await testRepo.getQuestionType("testSW", 'part1');
    //   // if (partScores['part1']?['correctPercent'] <= 0.6) {
    //   //   if (partType != null) weakPoints.add(partType);
    //   // } else {
    //   //   if (partType != null) strongPoints.add(partType);
    //   // }
    // }

    // if (result2 != null) {
    //   partScores['part2'] = {
    //     'score': result2['score'],
    //     'total': result2['total'],
    //     'correctPercent': result2['score'] / result2['total'],
    //   };
    //   answers['part2'] = result2['answers'];
    //   // có thêm feedback
    //   answers['feedback_part2'] = result2['results'];
    //   // get weak and strong points
    //   for (var q in answers['feedback_part2']) {
    //     if (q['score'] / q['max_score'] >= 0.5) {
    //       final questionType = await testRepo.getQuestionType(
    //         "testSW",
    //         'part2',
    //         q['questionId'],
    //       );
    //       if (questionType != null) strongPoints.add(questionType);
    //     } else {
    //       final questionType = await testRepo.getQuestionType(
    //         "testSW",
    //         'part2',
    //         q['questionId'],
    //       );
    //       if (questionType != null) weakPoints.add(questionType);
    //     }
    //     // final partType = await testRepo.getPartType("testSW", 'part2');
    //     // if (partScores['part2']?['correctPercent'] <= 0.6) {
    //     //   if (partType != null) weakPoints.add(partType);
    //     // } else {
    //     //   if (partType != null) strongPoints.add(partType);
    //     // }
    //   }
    // }

    // ----- PART 1 -----
    if (result1 != null) {
      final fb1 = _normalizeResults(result1['results']);

      partScores['part1'] = {
        'score': result1['score'],
        'total': result1['total'],
      };
      answers['part1'] = result1['answers'];
      answers['feedback_part1'] = fb1;

      for (final q in fb1) {
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        final double score = (q['score'] as num?)?.toDouble() ?? 0.0;
        final double maxScore = (q['max_score'] as num?)?.toDouble() ?? 1.0;
        if (qid == null || maxScore <= 0) continue;

        final type = await testRepo.getQuestionType(
          widget.testId,
          'part1',
          qid,
        );
        if (type == null || type.trim().isEmpty) continue;

        (score / maxScore >= 0.5 ? strongPoints : weakPoints).add(type);
      }
    }

    // ----- PART 2 -----
    if (result2 != null) {
      final fb2 = _normalizeResults(result2['results']);

      partScores['part2'] = {
        'score': result2['score'],
        'total': result2['total'],
        'correctPercent':
            ((result2['score'] as num?) ?? 0) /
            (((result2['total'] as num?) ?? 1)),
      };
      answers['part2'] = result2['answers'];
      answers['feedback_part2'] = fb2;

      for (final q in fb2) {
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        final double score = (q['score'] as num?)?.toDouble() ?? 0.0;
        final double maxScore = (q['max_score'] as num?)?.toDouble() ?? 1.0;
        if (qid == null || maxScore <= 0) continue;

        final type = await testRepo.getQuestionType(
          widget.testId,
          'part2',
          qid,
        );
        if (type == null || type.trim().isEmpty) continue;

        (score / maxScore >= 0.5 ? strongPoints : weakPoints).add(type);
      }
    }

    setState(() {
      totalScore =
          (partScores['part1']?['score'] ?? 0) +
          (partScores['part2']?['score'] ?? 0);
    });

    if (totalScore <= 15) {
      testLevel = "TOEIC SW 1-99";
    } else if (totalScore <= 30) {
      testLevel = "TOEIC SW 100-199";
    } else {
      testLevel = "TOEIC SW 200-250";
    }

    await resultRepo.savePracticeTestResult(
      testId: widget.testId,
      totalScore: totalScore,
      testLevel: testLevel,
      parts: partScores,
      answers: answers,
      strongPoints: strongPoints,
      weakPoints: weakPoints,
    );

    countdownTimer?.cancel(); // stop the clock

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Your Result"),
        content: Text(
          "Total score: $totalScore\n"
          "Your level: $testLevel\n",
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
            const Text('TOEIC Speaking & Writing Test'),
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
                    title: "Part 1 - Speaking",
                    isSelected: selectedIndex == 0,
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
                    title: "Part 2 - Writing",
                    isSelected: selectedIndex == 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedPartIndex,
              children: [
                SWPracticePart1(
                  key: part1Key,
                  testId: widget.testId,
                  onTestStart: _handlePartStarted,
                ),
                SWPracticePart2(
                  key: part2Key,
                  testId: widget.testId,
                  onTestStart: _handlePartStarted,
                ),
              ],
            ),
          ),
          //   if (!showAnswers)
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
