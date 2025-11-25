import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/repositories/material_repository.dart';
import 'package:final_project/repositories/practice_test_repository.dart';
import 'package:final_project/screens/input_test/selection_page.dart';
import 'package:final_project/screens/practice_screens/LR/LR_test.dart';
import 'package:final_project/screens/practice_screens/SW/SW_test.dart';
import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:final_project/screens/study_screens/practice_SW_page.dart';
import 'package:final_project/screens/study_screens/practice_full_page.dart';
import 'package:final_project/widgets/card/card_widget.dart';
import 'package:final_project/widgets/card/empty_card.dart';
import 'package:final_project/widgets/card/loading_card.dart';
import 'package:final_project/widgets/card/summary_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  final _auth = FirebaseAuth.instance;
  final materialRepo = MaterialRepository();
  final practiceRepo = PracticeTestRepository();

  Future<Map<String, dynamic>?> getLatestLesson() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

    final latestRoadmapSet = await db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .orderBy('updatedAt', descending: true)
        .limit(1)
        .get();

    Map<String, dynamic> data;
    String? roadmapSetId;

    if (latestRoadmapSet.docs.isNotEmpty) {
      roadmapSetId = latestRoadmapSet.docs.first.id;
      data = latestRoadmapSet.docs.first.data();
    } else {
      roadmapSetId = null;
      data = latestRoadmapSet.docs.first.data();
    }

    String? lessonName;
    try {
      final lessonId = data['latestLesson'] as String?;
      if (lessonId != null) {
        lessonName = await materialRepo.getLessonName(
          materialId: data['latestMaterial'] as String,
          levelId: data['latestLevel'] as String,
          partId: data['latestPart'] as String,
          lessonId: lessonId,
        );
      }
    } catch (e) {
      print('Error resolving lessonName: $e');
    }

    return {
      'roadmapSetId': roadmapSetId,
      'data': data,
      'lessonName': lessonName,
    };
  }

  Future<Map<String, dynamic>?> getLatestLRTest() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

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
      practiceSetId = null;
      data = latestPracticeSet.docs.first.data();
    }

    String? testName;
    try {
      final testId = data['latestTest'] as String?;
      if (testId != null) {
        testName = await practiceRepo.getTestName(
          testType: 'LR_practice_tests',
          testId: testId,
        );
      }
    } catch (e) {
      print('Error resolving testName: $e');
    }

    return {'practiceSetId': practiceSetId, 'data': data, 'testName': testName};
  }

  Future<Map<String, dynamic>?> getLatestSWTest() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

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
      practiceSetId = null;
      data = latestPracticeSet.docs.first.data();
    }

    String? testName;
    try {
      final testId = data['latestTest'] as String?;
      if (testId != null) {
        testName = await practiceRepo.getTestName(
          testType: 'SW_practice_tests',
          testId: testId,
        );
      }
    } catch (e) {
      print('Error resolving testName: $e');
    }

    return {'practiceSetId': practiceSetId, 'data': data, 'testName': testName};
  }

  String _formatTimestamp(dynamic ts) {
    if (ts == null) return '';
    if (ts is Timestamp) {
      final date = ts.toDate();
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Hoạt động gần đây',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Latest Lesson
            _buildSectionTitle('Bài luyện tập kĩ năng'),
            const SizedBox(height: 12),
            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestLesson(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final item = snapshot.data;
                if (item == null) {
                  return EmptyCard(
                    message: 'Chưa có bài học nào',
                    icon: Icons.school,
                  );
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final lessonName =
                    item['lessonName'] as String? ?? 'Bài học gần nhất';
                final submittedAt = _formatTimestamp(data['updatedAt']);

                String? score;
                final items = data['items'];
                for (var i = 1; i < items.length; i++) {
                  final picked = items[i];
                  if (picked['lessonName'].contains(lessonName)) {
                    score = '${picked['score']}/${picked['total']}';
                    break;
                  }
                }

                return CardWidget(
                  icon: Icons.school,
                  iconColor: Colors.blue,
                  title: lessonName,
                  subtitle: submittedAt,
                  score: score,
                  onTap: () {
                    final materialId = data['latestMaterial'];
                    final levelId = data['latestLevel'];
                    final partId = data['latestPart'];
                    final lessonId = data['latestLesson'];
                    final latestIndex = data['latestIndex'] ?? 0;

                    if (materialId == 'LRMaterials') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PracticeLRPage(
                            practiceId:
                                '$materialId|$levelId|$partId|$lessonId',
                            itemIndex: latestIndex,
                          ),
                        ),
                      );
                      return;
                    } else if (materialId == 'SWMaterials') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PracticeSWPage(
                            practiceId:
                                '$materialId|$levelId|$partId|$lessonId',
                            itemIndex: latestIndex,
                          ),
                        ),
                      );
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PracticeFullPage(
                            practiceId:
                                '$materialId|$levelId|$partId|$lessonId',
                            itemIndex: latestIndex,
                          ),
                        ),
                      );
                      return;
                    }
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // Practice Tests
            _buildSectionTitle('Bài kiểm tra thực hành'),
            const SizedBox(height: 12),

            // LR Test
            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestLRTest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final item = snapshot.data;
                if (item == null) {
                  return EmptyCard(
                    message: 'Chưa có lịch sử làm bài',
                    icon: Icons.headphones,
                  );
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final testName =
                    item['testName'] as String? ?? 'Listening & Reading Test';
                final submittedAt = _formatTimestamp(data['updatedAt']);

                String? score;
                int index = -1;
                final items = data['items'];
                for (var i = 0; i < items.length; i++) {
                  final picked = items[i];
                  if (picked['title'] == testName) {
                    score = '${picked['totalScore']}/990';
                    index = i;
                    break;
                  }
                }

                return CardWidget(
                  icon: Icons.headphones,
                  iconColor: Colors.orange,
                  title: testName,
                  subtitle: submittedAt,
                  score: score,
                  badgeText: 'L&R',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LRTestPage(
                          testId: data['latestTest'],
                          itemIndex: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 12),

            // SW Test
            FutureBuilder<Map<String, dynamic>?>(
              future: getLatestSWTest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final item = snapshot.data;
                if (item == null) {
                  return EmptyCard(
                    message: 'Chưa có lịch sử làm bài',
                    icon: Icons.edit,
                  );
                }

                final data = item['data'] as Map<String, dynamic>? ?? {};
                final testName =
                    item['testName'] as String? ?? 'Speaking & Writing Test';
                final submittedAt = _formatTimestamp(data['updatedAt']);

                String? score;
                int index = -1;
                final items = data['items'];
                for (var i = 0; i < items.length; i++) {
                  final picked = items[i];
                  if (picked['title'] == testName) {
                    score = '${picked['totalScore']}/400';
                    index = i;
                    break;
                  }
                }

                return CardWidget(
                  icon: Icons.edit,
                  iconColor: Colors.green,
                  title: testName,
                  subtitle: submittedAt,
                  score: score,
                  badgeText: 'S&W',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SWTestPage(
                          testId: data['latestTest'],
                          itemIndex: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // Summary Section
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Thống kê',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SummaryCard(),

            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.deepPurple[400]!, Colors.purple[300]!],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SelectionPage()),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: const Icon(Icons.add_circle_outline, size: 28),
          label: const Text(
            'Làm bài test',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
        letterSpacing: 0.5,
      ),
    );
  }
}
