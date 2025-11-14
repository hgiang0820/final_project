import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/repositories/material_repository.dart';
import 'package:final_project/screens/input_test/selection_page.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final materialRepo = MaterialRepository();

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

  Stream<QuerySnapshot<Map<String, dynamic>>> _recentTestsStream(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc('LR_practice_tests')
        .collection('practice_sets')
        .orderBy('createdAt', descending: true)
        .limit(6)
        .snapshots();
  }

  // Future<Map<String, dynamic>?> getLatestLRTest() async {
  //   final uid = _auth.currentUser?.uid;
  //   if (uid == null) return null;

  //   final db = FirebaseFirestore.instance;

  //   // 1) Lấy latest lesson doc trong practice_results
  //   final latestTestSnap = await db
  //       .collection('users')
  //       .doc(uid)
  //       .collection('practice_test_results')
  //       .doc('LR_practice_test')
  //       .collection('practice_sets')
  //       .orderBy('updatedAt', descending: true)
  //       .limit(1)
  //       .get();

  //   if (latestTestSnap.docs.isEmpty) return null;
  //   final latestTestDoc = latestTestSnap.docs.first;

  //   // 2) Lấy latest attempt trong subcollection attempts (nếu có)
  //   final testSnap = await db
  //       .collection('users')
  //       .doc(uid)
  //       .collection('practice_test_results')
  //       .doc('LR_practice_test')
  //       .collection('practice_sets')
  //       .orderBy('createdAt', descending: true)
  //       .limit(1)
  //       .get();

  //   Map<String, dynamic> data;
  //   String? attemptId;

  //   if (attemptsSnap.docs.isNotEmpty) {
  //     attemptId = attemptsSnap.docs.first.id;
  //     data = attemptsSnap.docs.first.data();
  //   } else {
  //     // không có attempt -> lấy dữ liệu lesson doc chính
  //     attemptId = null;
  //     data = latestLessonDoc.data();
  //   }

  //   // 3) Thử resolve lesson name từ materialRepo nếu dữ liệu có đủ identifiers
  //   String? lessonName;
  //   try {
  //     final materialId = data['materialId'] as String?;
  //     final levelId = data['levelId'] as String?;
  //     final partId = data['partId'] as String?;
  //     final lessonId = data['lessonId'] as String?;

  //     if (materialId != null &&
  //         levelId != null &&
  //         partId != null &&
  //         lessonId != null) {
  //       // materialRepo.getLessonName trả về Future<String>
  //       lessonName = await materialRepo.getLessonName(
  //         materialId: materialId,
  //         levelId: levelId,
  //         partId: partId,
  //         lessonId: lessonId,
  //       );
  //     }
  //   } catch (e) {
  //     // nếu có lỗi khi lấy lessonName -> fallback (không crash)
  //     print('Error resolving lessonName: $e');
  //   }

  //   return {
  //     'lessonDocId': latestLessonDoc.id,
  //     'attemptDocId': attemptId,
  //     'data': data,
  //     'lessonName': lessonName,
  //   };
  // }

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
            ElevatedButton(
              onPressed: () async {
                final lesson = await getLatestLesson();
                print("=== TEST BUTTON ===");

                if (lesson == null) {
                  print("❌ No lesson found");
                } else {
                  print("🔥 Latest lesson: ${lesson}");
                }
              },
              child: Text("Test getLatestLesson"),
            ),

            const Text(
              'Gần đây',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Recent Lessons (use getLatestLesson)
            const Text(
              'Bài đã học gần nhất',
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

                return ListTile(
                  leading: const Icon(Icons.play_circle),
                  title: Text(lessonName),
                  subtitle: Text('$submittedAt$score'),
                  onTap: () {
                    // TODO: điều hướng tới màn lesson/attempt detail theo item['lessonDocId'] / item['attemptDocId']
                    // ex: Navigator.push(..., arguments: {...})
                  },
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
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _recentTestsStream(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 80,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Lỗi load tests: ${snapshot.error}');
                }
                final docs = snapshot.data?.docs ?? [];
                if (docs.isEmpty) {
                  return const Text('Chưa có lịch sử làm bài nào.');
                }
                return Column(
                  children: docs.map((d) {
                    final data = d.data();
                    final score = data['score']?.toString() ?? '-';
                    return ListTile(
                      leading: const Icon(Icons.quiz),
                      title: Text(data['testTitle'] ?? 'Test'),
                      subtitle: Text(
                        'Điểm: $score - ${data['finishedAt'] != null ? ((data['finishedAt'] is Timestamp) ? (data['finishedAt'] as Timestamp).toDate().toString() : data['finishedAt'].toString()) : ''}',
                      ),
                      onTap: () {
                        // điều hướng xem chi tiết test
                      },
                    );
                  }).toList(),
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






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/screens/input_test/selection_page.dart';
// import 'package:final_project/widgets/icon_and_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomeContent extends StatelessWidget {
//   HomeContent({super.key});
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;

//   Stream<QuerySnapshot<Map<String, dynamic>>> _recentLessonsStream(String uid) {
//     return _firestore
//         .collection('users')
//         .doc(uid)
//         .collection('practice_results')
//         // .doc('LRMaterials_lv300_part1_lesson2')
//         // .collection('attempts')
//         .orderBy('createdAt', descending: true)
//         .limit(6)
//         .snapshots();
//   }

//   Future<Map<String, dynamic>?> getLastestLesson() async {
//     final uid = _auth.currentUser!.uid;
//     final db = FirebaseFirestore.instance;

//     final lastestLesson = await db
//         .collection('users')
//         .doc(uid)
//         .collection('practice_results')
//         .orderBy('submittedAt', descending: true)
//         .limit(1)
//         .get();
    
//     final lesson = await db
//         .collection('users')
//         .doc(uid)
//         .collection('practice_results')
//         .doc(lastestLesson.docs.first.id)
//         .collection('attempts')
//         .orderBy('submittedAt', descending: true)
//         .limit(1)
//         .get();

//     if (lesson.docs.isNotEmpty) {
//       final doc = lesson.docs.first;
//       return {'lastestLessonId': doc.id, 'data': doc.data()};
//     } else {
//       return null;
//     }
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> _recentTestsStream(String uid) {
//     // giả sử bạn lưu tests của user trong 'user_tests'
//     return _firestore
//         .collection('users')
//         .doc(uid)
//         .collection('practice_test_results')
//         .doc('LR_practice_tests')
//         .collection('practice_sets')
//         .orderBy('createdAt', descending: true)
//         .limit(6)
//         .snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = _auth.currentUser;
//     if (user == null) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('HOME')),
//         body: const Center(child: Text('Vui lòng đăng nhập để xem nội dung')),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'HOME',
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
//             const Text(
//               'Gần đây',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 12),

//             // Recent Lessons
//             const Text(
//               'Bài đã học gần nhất',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),
//             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               stream: _recentLessonsStream(user.uid),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox(
//                     height: 80,
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Text('Lỗi load lessons: ${snapshot.error}');
//                 }
//                 final docs = snapshot.data?.docs ?? [];
//                 if (docs.isEmpty) return const Text('Chưa có bài học nào.');
//                 return Column(
//                   children: docs.map((d) {
//                     final data = d.data();
//                     return ListTile(
//                       title: Text(data['title'] ?? 'Bài học'),
//                       subtitle: Text(
//                         data['lastAccessed'] != null
//                             ? (data['lastAccessed'] is Timestamp
//                                   ? (data['lastAccessed'] as Timestamp)
//                                         .toDate()
//                                         .toString()
//                                   : data['lastAccessed'].toString())
//                             : '',
//                       ),
//                       onTap: () {
//                         // điều hướng tới màn lesson tương ứng
//                       },
//                     );
//                   }).toList(),
//                 );
//               },
//             ),

//             const SizedBox(height: 20),

//             // Recent Tests
//             const Text(
//               'Bài test đã làm gần nhất',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),
//             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               stream: _recentTestsStream(user.uid),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox(
//                     height: 80,
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Text('Lỗi load tests: ${snapshot.error}');
//                 }
//                 final docs = snapshot.data?.docs ?? [];
//                 if (docs.isEmpty) {
//                   return const Text('Chưa có lịch sử làm bài nào.');
//                 }
//                 return Column(
//                   children: docs.map((d) {
//                     final data = d.data();
//                     final score = data['score']?.toString() ?? '-';
//                     return ListTile(
//                       leading: const Icon(Icons.quiz),
//                       title: Text(data['testTitle'] ?? 'Test'),
//                       subtitle: Text(
//                         'Điểm: $score - ${data['finishedAt'] != null ? ((data['finishedAt'] is Timestamp) ? (data['finishedAt'] as Timestamp).toDate().toString() : data['finishedAt'].toString()) : ''}',
//                       ),
//                       onTap: () {
//                         // điều hướng xem chi tiết test
//                       },
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
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
