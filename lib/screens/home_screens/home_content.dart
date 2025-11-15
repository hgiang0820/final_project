import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/repositories/material_repository.dart';
import 'package:final_project/repositories/practice_test_repository.dart';
import 'package:final_project/screens/input_test/selection_page.dart';
import 'package:final_project/screens/practice_screens/LR/LR_test.dart';
import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  final _auth = FirebaseAuth.instance;
  final materialRepo = MaterialRepository();
  final practiceRepo = PracticeTestRepository();

  /// Lấy latest attempt (subcollection 'attempts') của latest lesson (practice_results)
  /// Trả về Map chứa: { 'lessonDocId': ..., 'attemptDocId': ..., 'data': { ... } }
  Future<Map<String, dynamic>?> getLatestLesson() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

    // 1) Lấy latest lesson doc trong practice_results
    final latestLessonSnap = await db
        .collection('users')
        .doc(uid)
        .collection('practice_results')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (latestLessonSnap.docs.isEmpty) return null;
    final latestLessonDoc = latestLessonSnap.docs.first;

    // 2) Lấy latest attempt trong subcollection attempts (nếu có)
    final attemptsSnap = await db
        .collection('users')
        .doc(uid)
        .collection('practice_results')
        .doc(latestLessonDoc.id)
        .collection('attempts')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    Map<String, dynamic> data;
    String? attemptId;

    if (attemptsSnap.docs.isNotEmpty) {
      attemptId = attemptsSnap.docs.first.id;
      data = attemptsSnap.docs.first.data();
    } else {
      // không có attempt -> lấy dữ liệu lesson doc chính
      attemptId = null;
      data = latestLessonDoc.data();
    }

    // 3) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
    String? lessonName;
    try {
      final materialId = data['materialId'] as String?;
      final levelId = data['levelId'] as String?;
      final partId = data['partId'] as String?;
      final lessonId = data['lessonId'] as String?;

      if (materialId != null &&
          levelId != null &&
          partId != null &&
          lessonId != null) {
        // materialRepo.getLessonName trả về Future<String>
        lessonName = await materialRepo.getLessonName(
          materialId: materialId,
          levelId: levelId,
          partId: partId,
          lessonId: lessonId,
        );
      }
    } catch (e) {
      // nếu có lỗi khi lấy lessonName -> fallback (không crash)
      print('Error resolving lessonName: $e');
    }

    return {
      'lessonDocId': latestLessonDoc.id,
      'attemptDocId': attemptId,
      'data': data,
      'lessonName': lessonName,
    };
  }

  Future<Map<String, dynamic>?> getLatestLRTest() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

    // 1) Lấy latest test doc trong practice_test_results
    final latestPracticeSet = await db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc('LR_practice_tests')
        .collection('practice_sets')
        .orderBy('updatedAt', descending: true)
        .limit(1)
        .get();

    Map<String, dynamic> data;
    String? practiceSetId;

    if (latestPracticeSet.docs.isNotEmpty) {
      practiceSetId = latestPracticeSet.docs.first.id;
      data = latestPracticeSet.docs.first.data();
    } else {
      // không có attempt -> lấy dữ liệu lesson doc chính
      practiceSetId = null;
      data = latestPracticeSet.docs.first.data();
    }

    // 2) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
    String? testName;

    try {
      final testId = data['lastestTest'] as String?;

      if (testId != null) {
        // materialRepo.getLessonName trả về Future<String>
        testName = await practiceRepo.getTestName(
          testType: 'LR_practice_tests',
          testId: testId,
        );
      }
    } catch (e) {
      print('Error resolving testName: $e');
    }

    return {
      // 'lessonDocId': latestPracticeTestDoc.id,
      'practiceSetId': practiceSetId,
      'data': data,
      'testName': testName,
    };
  }

  Future<Map<String, dynamic>?> getLatestSWTest() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

    // 1) Lấy latest test doc trong practice_test_results
    final latestPracticeSet = await db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc('SW_practice_tests')
        .collection('practice_sets')
        .orderBy('updatedAt', descending: true)
        .limit(1)
        .get();

    Map<String, dynamic> data;
    String? practiceSetId;

    if (latestPracticeSet.docs.isNotEmpty) {
      practiceSetId = latestPracticeSet.docs.first.id;
      data = latestPracticeSet.docs.first.data();
    } else {
      // không có attempt -> lấy dữ liệu lesson doc chính
      practiceSetId = null;
      data = latestPracticeSet.docs.first.data();
    }

    // 2) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
    String? testName;

    try {
      final testId = data['lastestTest'] as String?;

      if (testId != null) {
        // materialRepo.getLessonName trả về Future<String>
        testName = await practiceRepo.getTestName(
          testType: 'SW_practice_tests',
          testId: testId,
        );
      }
    } catch (e) {
      print('Error resolving testName: $e');
    }

    return {
      // 'lessonDocId': latestPracticeTestDoc.id,
      'practiceSetId': practiceSetId,
      'data': data,
      'testName': testName,
    };
  }

  String _formatTimestamp(dynamic ts) {
    if (ts == null) return '';
    if (ts is Timestamp) return ts.toDate().toString();
    return ts.toString();
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('HOME')),
        body: const Center(child: Text('Vui lòng đăng nhập để xem nội dung')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // ElevatedButton(
            //   onPressed: () async {
            //     final lesson = await getLatestLRTest();
            //     print("=== TEST BUTTON ===");

            //     if (lesson == null) {
            //       print("❌ No lesson found");
            //     } else {
            //       print("🔥 Latest lesson: ${lesson}");
            //     }
            //   },
            //   child: Text("Test getLatestLRTest"),
            // ),
            const Text(
              'Gần đây',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Recent Lessons (use getLatestLesson)
            const Text(
              'Bài luyện tập kĩ năng đã học gần nhất',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestLesson(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Lỗi load latest lesson: ${snapshot.error}');
                }

                final item = snapshot.data;
                if (item == null) {
                  return const Text('Chưa có bài học nào.');
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final lessonName =
                    item['lessonName'] as String? ?? 'Bài học gần nhất';
                // final title = lessonName ?? data['title'] ?? data['lessonId'] ?? 'Bài học gần nhất';

                final submittedAt = _formatTimestamp(data['createdAt']);
                final score = data['score'] != null
                    ? ' - Điểm: ${data['score']}/${data['total']}'
                    : '';

                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[100],
                      child: Icon(Icons.school, color: Colors.purple[600]),
                    ),
                    title: Text(lessonName),
                    subtitle: Text('$submittedAt$score'),
                    onTap: () {
                      final materialId = data['materialId'];
                      final levelId = data['levelId'];
                      final partId = data['partId'];
                      final lessonId = data['lessonId'];

                      if ([
                        materialId,
                        levelId,
                        partId,
                        lessonId,
                      ].any((e) => e.isEmpty)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Thiếu khóa Practice (material/level/part/lesson).',
                            ),
                          ),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PracticeLRPage(
                            practiceId:
                                '$materialId|$levelId|$partId|$lessonId',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Recent Tests
            const Text(
              'Bài test đã làm gần nhất',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            const Text(
              'Listening & Reading Practice Test',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestLRTest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Lỗi load latest LR test: ${snapshot.error}');
                }

                final item = snapshot.data;
                if (item == null) {
                  return const Text('Chưa có lịch sử làm bài nào.');
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final testName =
                    item['testName'] as String? ?? 'Bài học gần nhất';
                // item['lessonName'] as String? ?? 'Bài học gần nhất';
                // final title = lessonName ?? data['title'] ?? data['lessonId'] ?? 'Bài học gần nhất';

                final submittedAt = _formatTimestamp(data['updatedAt']);

                // final score = data['items'] != null
                //     ? ' - Điểm: ${data['items']}'
                //     : '';
                String? score;
                int index = -1;

                final items = data['items'];
                for (var i = 0; i < items.length; i++) {
                  final picked = items[i];
                  if (picked['title'] == testName) {
                    score = ' - Điểm: ${picked['totalScore']}/990';
                    index = i;
                  }
                }

                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[100],
                      child: Icon(Icons.mic, color: Colors.purple[600]),
                    ),
                    title: Text(testName),
                    subtitle: Text('$submittedAt$score'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LRTestPage(
                            testId: data['lastestTest'],
                            itemIndex: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            const Text(
              'Speaking & Writing Practice Test',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestSWTest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Lỗi load latest SW test: ${snapshot.error}');
                }

                final item = snapshot.data;
                if (item == null) {
                  return const Text('Chưa có lịch sử làm bài nào.');
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final testName =
                    item['testName'] as String? ?? 'Bài học gần nhất';
                // item['lessonName'] as String? ?? 'Bài học gần nhất';
                // final title = lessonName ?? data['title'] ?? data['lessonId'] ?? 'Bài học gần nhất';

                final submittedAt = _formatTimestamp(data['updatedAt']);

                // final score = data['items'] != null
                //     ? ' - Điểm: ${data['items']}'
                //     : '';
                String? score;

                final items = data['items'];
                for (var i = 0; i < items.length; i++) {
                  final picked = items[i];
                  if (picked['title'] == testName) {
                    score = ' - Điểm: ${picked['totalScore']}/990';
                  }
                }

                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[100],
                      child: Icon(Icons.edit, color: Colors.purple[600]),
                    ),
                    title: Text(testName),
                    subtitle: Text('$submittedAt$score'),
                    onTap: () {
                      // TODO: điều hướng tới màn lesson/attempt detail theo item['lessonDocId'] / item['attemptDocId']
                      // ex: Navigator.push(..., arguments: {...})
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: IconAndButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SelectionPage()),
          );
        },
        title: "Test",
        icon: const Icon(Icons.scoreboard),
      ),
    );
  }
}
