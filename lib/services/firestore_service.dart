import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> attemptRef(
    String userId,
    String testId,
  ) {
    return _db.collection('sw_attempts').doc('${userId}_$testId');
  }

  Future<String?> getLatestResultId(String userId, String testId) async {
    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('input_test_results')
        .doc(testId)
        .collection('results')
        .orderBy('submittedAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id;
    }
    return null;
  }

  Future<void> savePart1Overall({
    required String userId,
    required String testId,
    required Map<String, dynamic> overall,
  }) async {
    await attemptRef(userId, testId).set({
      'userId': userId,
      'testId': testId,
      'createdAt': FieldValue.serverTimestamp(),
      'part1': {'completed': true, 'overall': overall},
    }, SetOptions(merge: true));
  }

  Future<void> savePart1Questions({
    required String userId,
    required String testId,
    required List<Map<String, dynamic>> items,
  }) async {
    final ref = attemptRef(userId, testId);
    final batch = _db.batch();
    for (final item in items) {
      final qid = item['questionId'] as String;
      batch.set(
        ref.collection('part1_questions').doc(qid),
        item,
        SetOptions(merge: true),
      );
    }
    await batch.commit();
  }
}
