import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/repositories/material_repository.dart';
import 'package:final_project/repositories/practice_test_repository.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:final_project/screens/input_test/selection_page.dart';
import 'package:final_project/screens/practice_screens/LR/LR_test.dart';
import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:final_project/widgets/card/card_widget.dart';
import 'package:final_project/widgets/card/loading_card.dart';
import 'package:final_project/widgets/card/statistics_card.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({super.key});
  final _auth = FirebaseAuth.instance;
  final materialRepo = MaterialRepository();
  final practiceRepo = PracticeTestRepository();
  final roadmapRepo = RoadmapRepository();

  Future<Map<String, dynamic>?> getLatestLesson() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final db = FirebaseFirestore.instance;

    final latestLessonSnap = await db
        .collection('users')
        .doc(uid)
        .collection('practice_results')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (latestLessonSnap.docs.isEmpty) return null;
    final latestLessonDoc = latestLessonSnap.docs.first;

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
      attemptId = null;
      data = latestLessonDoc.data();
    }

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
        lessonName = await materialRepo.getLessonName(
          materialId: materialId,
          levelId: levelId,
          partId: partId,
          lessonId: lessonId,
        );
      }
    } catch (e) {
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
    final total = await roadmapRepo.getTotalLessonsLearned();
    print('Total done across roadmaps: $total');
    final totalPracticeTests = await practiceRepo.getPracticedTestPerSet(
      'LR_practice_tests',
    );
    print('Total done across roadmaps: $totalPracticeTests');

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
      final testId = data['lastestTest'] as String?;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Tổng kết & Phân tích',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple[700],
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple[400]!, Colors.purple[300]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.analytics_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thống kê học tập',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Xem chi tiết tiến độ của bạn',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Roadmap Progress Section
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
                  '📚 Tiến độ Roadmap',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            FutureBuilder<Map<String, int>>(
              future: roadmapRepo.getTotalLessonsLearned(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final data = snapshot.data ?? {};
                final total = data['total'] ?? 0;
                final theoryDone = data['theoryDone'] ?? 0;
                final practiceDone = data['practiceDone'] ?? 0;

                return StatisticsCard(
                  title: 'Tổng bài đã học',
                  mainValue: '$total',
                  mainLabel: 'Bài học',
                  icon: Icons.school_rounded,
                  iconColor: Colors.blue,
                  gradient: [Colors.blue[400]!, Colors.blue[300]!],
                  onTap: () => _showDetailDialog(context, 'Chi tiết Roadmap', [
                    _StatItem(
                      icon: Icons.book_outlined,
                      label: 'Lý thuyết',
                      value: '$theoryDone bài',
                      color: Colors.green,
                    ),
                    _StatItem(
                      icon: Icons.edit_note,
                      label: 'Thực hành',
                      value: '$practiceDone bài',
                      color: Colors.orange,
                    ),
                    _StatItem(
                      icon: Icons.check_circle_outline,
                      label: 'Tổng cộng',
                      value: '$total bài',
                      color: Colors.blue,
                    ),
                  ]),
                  // stats: [
                  //   _MiniStat('Lý thuyết', '$theoryDone', Colors.green),
                  //   _MiniStat('Thực hành', '$practiceDone', Colors.orange),
                  // ],
                );
              },
            ),

            const SizedBox(height: 24),

            // Practice Tests Section
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
                  '📝 Bài kiểm tra thực hành',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Listening & Reading Test
            FutureBuilder<int>(
              future: practiceRepo.getTotalPracticedTest('LR_practice_tests'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final total = snapshot.data ?? 0;

                return StatisticsCard(
                  title: 'Tổng bài kiểm tra Listening & Reading đã học',
                  mainValue: '$total',
                  mainLabel: 'Bài kiểm tra',
                  icon: Icons.headphones_rounded,
                  iconColor: Colors.orange,
                  gradient: [Colors.orange[400]!, Colors.orange[300]!],
                  onTap: () =>
                      _showDetailDialog(context, 'Chi tiết L&R Tests', [
                        _StatItem(
                          icon: Icons.quiz,
                          label: 'Tổng số bài test',
                          value: '$total bài',
                          color: Colors.orange,
                        ),
                      ]),
                );
              },
            ),

            const SizedBox(height: 12),

            // Speaking & Writing Test
            FutureBuilder<int>(
              future: practiceRepo.getTotalPracticedTest('SW_practice_tests'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingCard();
                }

                final total = snapshot.data ?? 0 as String;

                return StatisticsCard(
                  title: 'Tổng bài kiểm tra Speaking & Writing đã học',
                  mainValue: '$total',
                  mainLabel: 'Bài kiểm tra',
                  icon: Icons.edit_rounded,
                  iconColor: Colors.green,
                  gradient: [Colors.green[400]!, Colors.green[300]!],
                  onTap: () =>
                      _showDetailDialog(context, 'Chi tiết S&W Tests', [
                        _StatItem(
                          icon: Icons.quiz,
                          label: 'Tổng số bài test',
                          value: '$total bài',
                          color: Colors.green,
                        ),
                      ]),
                );
              },
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // Widget _buildStatsCard({
  //   required String title,
  //   required String mainValue,
  //   required String mainLabel,
  //   required IconData icon,
  //   required Color iconColor,
  //   required List<Color> gradient,
  //   required VoidCallback onTap,
  //   required List<_MiniStat> stats,
  // }) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.06),
  //           blurRadius: 15,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         onTap: onTap,
  //         borderRadius: BorderRadius.circular(20),
  //         child: Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.all(14),
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(colors: gradient),
  //                       borderRadius: BorderRadius.circular(14),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: iconColor.withOpacity(0.3),
  //                           blurRadius: 8,
  //                           offset: const Offset(0, 3),
  //                         ),
  //                       ],
  //                     ),
  //                     child: Icon(icon, color: Colors.white, size: 28),
  //                   ),
  //                   const SizedBox(width: 16),
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           title,
  //                           style: TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w600,
  //                             color: Colors.black87,
  //                           ),
  //                         ),
  //                         const SizedBox(height: 4),
  //                         Row(
  //                           children: [
  //                             Text(
  //                               mainValue,
  //                               style: TextStyle(
  //                                 fontSize: 28,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: iconColor,
  //                               ),
  //                             ),
  //                             const SizedBox(width: 8),
  //                             Text(
  //                               mainLabel,
  //                               style: TextStyle(
  //                                 fontSize: 14,
  //                                 color: Colors.grey[600],
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_forward_ios,
  //                     size: 16,
  //                     color: Colors.grey[400],
  //                   ),
  //                 ],
  //               ),
  //               if (stats.isNotEmpty) ...[
  //                 const SizedBox(height: 16),
  //                 Container(
  //                   padding: const EdgeInsets.all(12),
  //                   decoration: BoxDecoration(
  //                     color: Colors.grey[50],
  //                     borderRadius: BorderRadius.circular(12),
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: stats.map((stat) {
  //                       return Column(
  //                         children: [
  //                           Text(
  //                             stat.value,
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                               color: stat.color,
  //                             ),
  //                           ),
  //                           const SizedBox(height: 4),
  //                           Text(
  //                             stat.label,
  //                             style: TextStyle(
  //                               fontSize: 12,
  //                               color: Colors.grey[600],
  //                             ),
  //                           ),
  //                         ],
  //                       );
  //                     }).toList(),
  //                   ),
  //                 ),
  //               ],
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showDetailDialog(
    BuildContext context,
    String title,
    List<_StatItem> items,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.info_outline,
                color: Colors.deepPurple[600],
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: item.color.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(item.icon, color: item.color, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.label,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: item.color,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.deepPurple.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Đóng',
              style: TextStyle(
                color: Colors.deepPurple[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _MiniStat {
//   final String label;
//   final String value;
//   final Color color;

//   _MiniStat(this.label, this.value, this.color);
// }

class _StatItem {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/repositories/material_repository.dart';
// import 'package:final_project/repositories/practice_test_repository.dart';
// import 'package:final_project/repositories/roadmap_repository.dart';
// import 'package:final_project/screens/input_test/selection_page.dart';
// import 'package:final_project/screens/practice_screens/LR/LR_test.dart';
// import 'package:final_project/screens/study_screens/practice_LR_page.dart';
// import 'package:final_project/widgets/icon_and_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SummaryPage extends StatelessWidget {
//   SummaryPage({super.key});
//   final _auth = FirebaseAuth.instance;
//   final materialRepo = MaterialRepository();
//   final practiceRepo = PracticeTestRepository();
//   final roadmapRepo = RoadmapRepository();

//   // final per = await roadmapRepo.getLessonsLearnedPerRoadmap();
//   //   print('Per roadmap: $per');

//   //   final total = await roadmapRepo.getTotalLessonsLearned();
//   //   print('Total done across roadmaps: $total');

//   /// Lấy latest attempt (subcollection 'attempts') của latest lesson (practice_results)
//   /// Trả về Map chứa: { 'lessonDocId': ..., 'attemptDocId': ..., 'data': { ... } }
//   Future<Map<String, dynamic>?> getLatestLesson() async {
//     final uid = _auth.currentUser?.uid;
//     if (uid == null) return null;

//     final db = FirebaseFirestore.instance;

//     // 1) Lấy latest lesson doc trong practice_results
//     final latestLessonSnap = await db
//         .collection('users')
//         .doc(uid)
//         .collection('practice_results')
//         .orderBy('createdAt', descending: true)
//         .limit(1)
//         .get();

//     if (latestLessonSnap.docs.isEmpty) return null;
//     final latestLessonDoc = latestLessonSnap.docs.first;

//     // 2) Lấy latest attempt trong subcollection attempts (nếu có)
//     final attemptsSnap = await db
//         .collection('users')
//         .doc(uid)
//         .collection('practice_results')
//         .doc(latestLessonDoc.id)
//         .collection('attempts')
//         .orderBy('createdAt', descending: true)
//         .limit(1)
//         .get();

//     Map<String, dynamic> data;
//     String? attemptId;

//     if (attemptsSnap.docs.isNotEmpty) {
//       attemptId = attemptsSnap.docs.first.id;
//       data = attemptsSnap.docs.first.data();
//     } else {
//       // không có attempt -> lấy dữ liệu lesson doc chính
//       attemptId = null;
//       data = latestLessonDoc.data();
//     }

//     // 3) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
//     String? lessonName;
//     try {
//       final materialId = data['materialId'] as String?;
//       final levelId = data['levelId'] as String?;
//       final partId = data['partId'] as String?;
//       final lessonId = data['lessonId'] as String?;

//       if (materialId != null &&
//           levelId != null &&
//           partId != null &&
//           lessonId != null) {
//         // materialRepo.getLessonName trả về Future<String>
//         lessonName = await materialRepo.getLessonName(
//           materialId: materialId,
//           levelId: levelId,
//           partId: partId,
//           lessonId: lessonId,
//         );
//       }
//     } catch (e) {
//       // nếu có lỗi khi lấy lessonName -> fallback (không crash)
//       print('Error resolving lessonName: $e');
//     }

//     return {
//       'lessonDocId': latestLessonDoc.id,
//       'attemptDocId': attemptId,
//       'data': data,
//       'lessonName': lessonName,
//     };
//   }

//   Future<Map<String, dynamic>?> getLatestLRTest() async {
//     // final per = await roadmapRepo.getTotalTheoryAndPracticeDone();
//     // print('Per roadmap: $per');

//     final total = await roadmapRepo.getTotalLessonsLearned();
//     print('Total done across roadmaps: $total');
//     final totalPracticeTests = await practiceRepo.getPracticedTestPerSet(
//       'LR_practice_tests',
//     );
//     print('Total done across roadmaps: $totalPracticeTests');

//     final uid = _auth.currentUser?.uid;
//     if (uid == null) return null;

//     final db = FirebaseFirestore.instance;

//     // 1) Lấy latest test doc trong practice_test_results
//     final latestPracticeSet = await db
//         .collection('users')
//         .doc(uid)
//         .collection('practice_test_results')
//         .doc('LR_practice_tests')
//         .collection('practice_sets')
//         .orderBy('updatedAt', descending: true)
//         .limit(1)
//         .get();

//     Map<String, dynamic> data;
//     String? practiceSetId;

//     if (latestPracticeSet.docs.isNotEmpty) {
//       practiceSetId = latestPracticeSet.docs.first.id;
//       data = latestPracticeSet.docs.first.data();
//     } else {
//       // không có attempt -> lấy dữ liệu lesson doc chính
//       practiceSetId = null;
//       data = latestPracticeSet.docs.first.data();
//     }

//     // 2) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
//     String? testName;

//     try {
//       final testId = data['lastestTest'] as String?;

//       if (testId != null) {
//         // materialRepo.getLessonName trả về Future<String>
//         testName = await practiceRepo.getTestName(
//           testType: 'LR_practice_tests',
//           testId: testId,
//         );
//       }
//     } catch (e) {
//       print('Error resolving testName: $e');
//     }

//     return {
//       // 'lessonDocId': latestPracticeTestDoc.id,
//       'practiceSetId': practiceSetId,
//       'data': data,
//       'testName': testName,
//     };
//   }

//   String _formatTimestamp(dynamic ts) {
//     if (ts == null) return '';
//     if (ts is Timestamp) return ts.toDate().toString();
//     return ts.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Summary & Analyze',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.purple[50],
//         elevation: 1,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 8),

//             // ElevatedButton(
//             //   onPressed: () async {
//             //     final lesson = await getLatestLRTest();
//             //     print("=== TEST BUTTON ===");

//             //     if (lesson == null) {
//             //       print("❌ No lesson found");
//             //     } else {
//             //       print("🔥 Latest lesson: ${lesson}");
//             //     }
//             //   },
//             //   child: Text("Test getLatestLRTest"),
//             // ),
//             // const Text(
//             //   'Gần đây',
//             //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             // ),
//             // const SizedBox(height: 12),

//             // Recent Lessons (use getLatestLesson)
//             const Text(
//               'Số bài đã học trong roadmap',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),

//             FutureBuilder<Map<String, int>>(
//               future: roadmapRepo.getTotalLessonsLearned(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox(
//                     height: 80,
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Text(
//                     'Lỗi load getTotalLessonsLearned: ${snapshot.error}',
//                   );
//                 }

//                 final data = snapshot.data ?? {};
//                 final total = data['total'];
//                 final theoryDone = data['theoryDone'];
//                 final practiceDone = data['practiceDone'];

//                 return Card(
//                   elevation: 2,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.purple[100],
//                       child: Icon(
//                         Icons.analytics_outlined,
//                         color: Colors.purple[600],
//                       ),
//                     ),
//                     title: Text('$total bài'),
//                     subtitle: Text('Bấm để xem chi tiết'),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Chi tiết'),
//                           content: Text(
//                             '• Số bài Lý thuyết đã học: $theoryDone \n'
//                             '• Số bài Thực hành đã học: $practiceDone\n',
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.of(context).pop(),
//                               child: const Text('Đóng'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 25),

//             // Recent Tests
//             const Text(
//               'Bài test đã làm gần nhất',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),

//             const Text(
//               'Listening & Reading Practice Test',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),

//             FutureBuilder<int>(
//               future: practiceRepo.getTotalPracticedTest('LR_practice_tests'),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox(
//                     height: 80,
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Text(
//                     'Lỗi load getTotalPracticedTest: ${snapshot.error}',
//                   );
//                 }

//                 final total = snapshot.data ?? {};

//                 return Card(
//                   elevation: 2,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.purple[100],
//                       child: Icon(Icons.mic, color: Colors.purple[600]),
//                     ),
//                     title: Text('$total bài test'),
//                     subtitle: Text('Bấm để xem chi tiết'),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Chi tiết'),
//                           content: Text(
//                             '• Số bài Lý thuyết đã học:  \n'
//                             '• Số bài Thực hành đã học: \n',
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.of(context).pop(),
//                               child: const Text('Đóng'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 8),

//             const Text(
//               'Speaking & Writing Practice Test',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),

//             const SizedBox(height: 25),
//           ],
//         ),
//       ),
//       floatingActionButton: IconAndButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => SelectionPage()),
//           );
//         },
//         title: "Test",
//         icon: const Icon(Icons.scoreboard),
//       ),
//     );
//   }
// }
