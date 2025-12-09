import 'dart:async';

import 'package:final_project/repositories/input_test_repository.dart';
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/screens/input_test/fourSkills/full_lis_page.dart';
import 'package:final_project/screens/input_test/fourSkills/full_read_page.dart';
import 'package:final_project/screens/input_test/fourSkills/full_speak_page.dart';
import 'package:final_project/screens/input_test/fourSkills/full_wri_page.dart';
import 'package:final_project/widgets/small_button.dart';
import 'package:flutter/material.dart';

class FullTestPage extends StatefulWidget {
  final String testId;
  const FullTestPage({super.key, required this.testId});

  @override
  State<FullTestPage> createState() => _FullTestPage();
}

class _FullTestPage extends State<FullTestPage> {
  final resultRepo = ResultRepository();
  final testRepo = InputTestRepository();

  final lisKey = GlobalKey<FullLisPageState>();
  final readKey = GlobalKey<FullReadPageState>();
  final speakKey = GlobalKey<FullSpeakPageState>();
  final wriKey = GlobalKey<FullWriPageState>();

  Map<String, dynamic> partScores = {};
  Map<String, dynamic> answers = {};

  List<String> strongPoints = [];
  List<String> weakPoints = [];

  int remainingSeconds = 2400;
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

  List<Map<String, dynamic>> _normalizeResults(dynamic results) {
    // Trả về list rỗng nếu null
    if (results == null) return <Map<String, dynamic>>[];

    // Nếu đã là List thì bình thường hoá mọi phần tử thành Map
    if (results is List) {
      final out = <Map<String, dynamic>>[];
      for (final e in results) {
        if (e == null) continue;
        if (e is Map) {
          out.add(Map<String, dynamic>.from(e));
        } else {
          // primitive -> đóng gói
          out.add({'value': e});
        }
      }
      return out;
    }

    // Nếu results là Map (ví dụ: { q01: null, q02: {...} })
    if (results is Map) {
      final out = <Map<String, dynamic>>[];
      results.forEach((key, value) {
        final qid = key?.toString();
        if (value == null) {
          // đóng gói object tối thiểu có questionId
          out.add({'questionId': qid});
        } else if (value is Map) {
          final m = Map<String, dynamic>.from(value);
          m.putIfAbsent('questionId', () => qid);
          out.add(m);
        } else {
          // primitive -> đóng gói
          out.add({'questionId': qid, 'value': value});
        }
      });
      return out;
    }

    // Trường hợp type khác lạ -> trả rỗng
    return <Map<String, dynamic>>[];
  }

  Future<void> _submitAll() async {
    // Ngừng đồng hồ tổng
    countdownTimer?.cancel();

    // ✅ Ép dừng mọi thứ ở Speaking trước khi getResult()
    await speakKey.currentState?.forceStopAll();

    final lisResult = lisKey.currentState?.getResult();
    final readResult = readKey.currentState?.getResult();
    final speakResult = await speakKey.currentState?.getResult();
    final wriResult = await wriKey.currentState?.getResult();

    // ===== LISTENING ====
    lisKey.currentState?.showAnswersMode();
    if (lisResult != null) {
      partScores['lisPart'] = {
        'score': lisResult['score'],
        'total': lisResult['total'],
        'correctPercent':
            ((lisResult['score'] as num?) ?? 0) /
            (((lisResult['total'] as num?) ?? 1)),
      };

      // lưu nguyên answers thô để save lên result
      answers['lisPart'] = lisResult['answers'];

      // chuẩn hoá answers thành List<Map<String,dynamic>> an toàn
      final lisAnswers = _normalizeResults(lisResult['answers']);

      for (final q in lisAnswers) {
        // mỗi q là Map<String,dynamic>
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        if (qid == null) continue;

        // Lấy câu trả lời người dùng (hỗ trợ nhiều tên trường)
        final dynamic userAnsRaw = q['value'];
        final String userAnswer = userAnsRaw?.toString().trim() ?? '';

        // Lấy đáp án đúng từ repository (cần implement)
        final String? correctAnswer = await testRepo.getCorrectAnswer(
          widget.testId,
          'lisPart',
          qid,
        );

        if (correctAnswer == null) {
          // không có đáp án đúng => log và bỏ qua
          debugPrint('No correct answer for $qid');
          continue;
        }

        // Chuẩn hoá đáp án đúng (hỗ trợ "A,B" hoặc "A" hoặc danh sách nếu bạn trả về chuỗi)
        final correctNormalized = correctAnswer.toString().trim();
        final List<String> correctList = correctNormalized.contains(',')
            ? correctNormalized
                  .split(',')
                  .map((s) => s.trim())
                  .where((s) => s.isNotEmpty)
                  .toList()
            : [correctNormalized];

        final bool isCorrect =
            userAnswer.isNotEmpty && correctList.contains(userAnswer);

        // Lấy type câu hỏi
        final type = await testRepo.getQuestionType(
          widget.testId,
          'lisPart',
          qid,
        );
        if (type == null || type.trim().isEmpty) {
          // nếu không có type, bỏ qua (hoặc thêm label 'unknown')
          continue;
        }

        if (isCorrect) {
          strongPoints.add(type);
        } else {
          weakPoints.add(type);
        }
      }
    }

    // ==== READING ====
    readKey.currentState?.showAnswersMode();
    if (readResult != null) {
      partScores['readPart'] = {
        'score': readResult['score'],
        'total': readResult['total'],
        'correctPercent':
            ((readResult['score'] as num?) ?? 0) /
            (((readResult['total'] as num?) ?? 1)),
      };

      // lưu nguyên answers thô để save lên result
      answers['readPart'] = readResult['answers'];

      // chuẩn hoá answers thành List<Map<String,dynamic>> an toàn
      final readAnswers = _normalizeResults(readResult['answers']);

      for (final q in readAnswers) {
        // mỗi q là Map<String,dynamic>
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        if (qid == null) continue;

        // Lấy câu trả lời người dùng (hỗ trợ nhiều tên trường)
        final dynamic userAnsRaw = q['value'];
        final String userAnswer = userAnsRaw?.toString().trim() ?? '';

        // Lấy đáp án đúng từ repository (cần implement)
        final String? correctAnswer = await testRepo.getCorrectAnswer(
          widget.testId,
          'readPart',
          qid,
        );

        if (correctAnswer == null) {
          // không có đáp án đúng => log và bỏ qua
          debugPrint('No correct answer for $qid');
          continue;
        }

        // Chuẩn hoá đáp án đúng (hỗ trợ "A,B" hoặc "A" hoặc danh sách nếu bạn trả về chuỗi)
        final correctNormalized = correctAnswer.toString().trim();
        final List<String> correctList = correctNormalized.contains(',')
            ? correctNormalized
                  .split(',')
                  .map((s) => s.trim())
                  .where((s) => s.isNotEmpty)
                  .toList()
            : [correctNormalized];

        final bool isCorrect =
            userAnswer.isNotEmpty && correctList.contains(userAnswer);

        // Lấy type câu hỏi
        final type = await testRepo.getQuestionType(
          widget.testId,
          'readPart',
          qid,
        );
        if (type == null || type.trim().isEmpty) {
          // nếu không có type, bỏ qua (hoặc thêm label 'unknown')
          continue;
        }

        if (isCorrect) {
          strongPoints.add(type);
        } else {
          weakPoints.add(type);
        }
      }
    }

    // === SPEAKING ====
    if (speakResult != null) {
      speakKey.currentState?.showFeedbacksMode(speakResult['results']);
    }
    if (speakResult != null) {
      final fb3 = _normalizeResults(speakResult['results']);

      partScores['speakPart'] = {
        'score': speakResult['score'],
        'total': speakResult['total'],
        'correctPercent':
            ((speakResult['score'] as num?) ?? 0) /
            (((speakResult['total'] as num?) ?? 1)),
      };
      answers['speakPart'] = speakResult['answers'];
      answers['feedbackSpeakPart'] = fb3;

      for (final q in fb3) {
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        final double score = (q['score'] as num?)?.toDouble() ?? 0.0;
        final double maxScore = (q['max_score'] as num?)?.toDouble() ?? 1.0;
        if (qid == null || maxScore <= 0) continue;

        final type = await testRepo.getQuestionType(
          widget.testId,
          'speakPart',
          qid,
        );
        if (type == null || type.trim().isEmpty) continue;

        (score / maxScore >= 0.5 ? strongPoints : weakPoints).add(type);
      }
    }

    //=== WRITING ===
    if (wriResult != null) {
      wriKey.currentState?.showFeedbacksMode(wriResult['results']);
    }
    if (wriResult != null) {
      final fb4 = _normalizeResults(wriResult['results']);

      partScores['wriPart'] = {
        'score': wriResult['score'],
        'total': wriResult['total'],
        'correctPercent':
            ((wriResult['score'] as num?) ?? 0) /
            (((wriResult['total'] as num?) ?? 1)),
      };
      answers['wriPart'] = wriResult['answers'];
      answers['feedbackWriPart'] = fb4;

      for (final q in fb4) {
        final qid = (q['questionId'] ?? q['id'] ?? q['qid'])?.toString();
        final double score = (q['score'] as num?)?.toDouble() ?? 0.0;
        final double maxScore = (q['max_score'] as num?)?.toDouble() ?? 1.0;
        if (qid == null || maxScore <= 0) continue;

        final type = await testRepo.getQuestionType(
          widget.testId,
          'wriPart',
          qid,
        );
        if (type == null || type.trim().isEmpty) continue;

        (score / maxScore >= 0.5 ? strongPoints : weakPoints).add(type);
      }
    }

    setState(() {
      totalScore =
          (partScores['lisPart']?['score'] ?? 0) +
          (partScores['readPart']?['score'] ?? 0) +
          (partScores['speakPart']?['score'] ?? 0) +
          (partScores['wriPart']?['score'] ?? 0);
    });

    if (totalScore <= 20) {
      testLevel = "LR 1-295 & SW 1-99";
    } else if (totalScore <= 40) {
      testLevel = "LR 300-595 & SW 100-199";
    } else {
      testLevel = "LR 600-650 & SW 200-250";
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
            const Text('Quick 4 Skills Test'),
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
                    title: "Listening",
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
                    title: "Reading",
                    isSelected: selectedIndex == 1,
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
                    title: "Speaking",
                    isSelected: selectedIndex == 2,
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
                    title: "Writing",
                    isSelected: selectedIndex == 3,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedPartIndex,
              children: [
                FullLisPage(
                  key: lisKey,
                  testId: widget.testId,
                  onTestStart: _handlePartStarted,
                ),
                FullReadPage(
                  key: readKey,
                  testId: widget.testId,
                  onTestStart: _handlePartStarted,
                ),
                FullSpeakPage(
                  key: speakKey,
                  testId: widget.testId,
                  onTestStart: _handlePartStarted,
                ),
                FullWriPage(
                  key: wriKey,
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
