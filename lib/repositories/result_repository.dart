import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> saveResult({
    required String testId,
    required int totalScore,
    required String testLevel,
    required Map<String, dynamic> parts,
    required Map<String, dynamic> answers,
    required List<String> strongPoints,
    required List<String> weakPoints,
  }) async {
    final uid = _auth.currentUser!.uid;
    final resultId = _db
        .collection('users')
        .doc(uid)
        .collection('input_test_results')
        .doc()
        .id;

    await _db
        .collection('users')
        .doc(uid)
        .collection('input_test_results')
        .doc(testId)
        .collection('results')
        .doc(resultId)
        .set({
          'totalScore': totalScore,
          'testLevel': testLevel,
          'parts': parts,
          'answers': answers,
          'strongPoints': strongPoints,
          'weakPoints': weakPoints,
          'submittedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }

  Future<void> saveLRPracticeTestResult({
    required String testId,
    required int totalScore,
    required String testLevel,
    required Map<String, dynamic> parts,
    required Map<String, dynamic> answers,
    required List<String> strongPoints,
    required List<String> weakPoints,
  }) async {
    final uid = _auth.currentUser!.uid;
    final resultId = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc()
        .id;

    await _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testId)
        .collection('results')
        .doc(resultId)
        .set({
          'totalScore': totalScore,
          'testLevel': testLevel,
          'parts': parts,
          'answers': answers,
          'strongPoints': strongPoints,
          'weakPoints': weakPoints,
          'submittedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getLatestResult({
    required String testId,
  }) async {
    final uid = _auth.currentUser!.uid;

    final querySnapshot = await _db
        .collection('users')
        .doc(uid)
        .collection('input_test_results')
        .doc(testId)
        .collection('results')
        .orderBy('submittedAt', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      return {'resultId': doc.id, 'data': doc.data()};
    } else {
      return null;
    }
  }

  // result_repository.dart (thêm vào trong class ResultRepository)
String _practiceAttemptsPath({
  required String materialId,
  required String levelId,
  required String partId,
  required String lessonId,
}) {
  final uid = _auth.currentUser!.uid;
  final key = '${materialId}_${levelId}_${partId}_$lessonId';
  return 'users/$uid/practice_results/$key/attempts';
}

Future<void> savePracticeAttempt({
  required String materialId,
  required String levelId,
  required String partId,
  required String lessonId,
  required int score,
  required int total,
  required Map<String, int?> answersByQuestionId,
}) async {
  final path = _practiceAttemptsPath(
    materialId: materialId,
    levelId: levelId,
    partId: partId,
    lessonId: lessonId,
  );
  await _db.collection(path).add({
    'score': score,
    'total': total,
    'answers': answersByQuestionId,
    'createdAt': FieldValue.serverTimestamp(),
  });
}

Future<Map<String, dynamic>?> getLatestPracticeAttempt({
  required String materialId,
  required String levelId,
  required String partId,
  required String lessonId,
}) async {
  final path = _practiceAttemptsPath(
    materialId: materialId,
    levelId: levelId,
    partId: partId,
    lessonId: lessonId,
  );
  final snap = await _db.collection(path)
      .orderBy('createdAt', descending: true)
      .limit(1)
      .get();
  if (snap.docs.isEmpty) return null;
  return snap.docs.first.data();
}


  // Future<void> saveSWResult({
  //   required String testId,
  //   required int totalScore,
  //   required Map<String, dynamic> parts,
  //   required Map<String, dynamic> answers,
  // }) async {
  //   final uid = _auth.currentUser!.uid;
  //   final resultId = _db
  //       .collection('users')
  //       .doc(uid)
  //       .collection('input_test_results')
  //       .doc()
  //       .id;

  //   await _db
  //       .collection('users')
  //       .doc(uid)
  //       .collection('input_test_results')
  //       .doc(testId)
  //       .collection('results')
  //       .doc(resultId)
  //       .set({
  //         'totalScore': totalScore,
  //         'parts': parts,
  //         'answers': answers,
  //         "status": "pending", // báo cho backend là chưa chấm
  //         'submittedAt': FieldValue.serverTimestamp(),
  //       }, SetOptions(merge: true));
  // }
}
