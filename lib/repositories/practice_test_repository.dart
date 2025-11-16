import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PracticeTestRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> createNewPracticeSetId({
    required List<Map<String, dynamic>> items,
    required String testType, // 'LR_practice_tests' | 'SW_practice_tests'
  }) async {
    final uid = _auth.currentUser!.uid;
    final practiceSetId = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(); // auto id

    await practiceSetId.set({
      'items': items, // mảng câu / đề
      'createdAt': FieldValue.serverTimestamp(),
      'progress': {'done': 0, 'total': items.length},
    }, SetOptions(merge: true));

    return practiceSetId.id;
  }

  Future<Map<String, dynamic>> createFreshPracticeSet(String testType) async {
    final items = await _fetchPracticeTestItems(testType);
    final newId = await createNewPracticeSetId(
      items: items,
      testType: testType,
    );

    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(newId);

    final snap = await docRef.get();
    return {'practiceSetId': newId, 'data': snap.data()};
  }

  Future<void> savePracticeTestResult({
    required String testType,
    required String testId,
    required int totalScore,
    required int itemIndex,
    required Map<String, dynamic> parts,
    required Map<String, dynamic> answers,
  }) async {
    final uid = _auth.currentUser!.uid;
    final practiceSetId = await getLatestOrCreatePracticeSet(
      testType,
    ).then((v) => v['practiceSetId'] as String);

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(practiceSetId);

    final snap = await docRef.get();
    if (!snap.exists) return;

    final data = snap.data() as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return;

    items[itemIndex]['totalScore'] = totalScore;
    items[itemIndex]['answers'] = answers;
    // items[itemIndex]['submittedAt'] = FieldValue.serverTimestamp();

    await docRef.set({
      'items': items,
      'updatedAt': FieldValue.serverTimestamp(),
      'lastestTest': testId, // lưu ý check testId là gì
    }, SetOptions(merge: true));
  }

  // Lấy roadmap mới nhất (id + data). Trả về null nếu chưa có.
  Future<Map<String, dynamic>?> getLatestPracticeSet(String testType) async {
    final uid = _auth.currentUser!.uid;
    final q = await _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (q.docs.isEmpty) return null;
    final d = q.docs.first;
    return {'practiceSetId': d.id, 'data': d.data()};
  }

  /// Đánh dấu 1 đề thành done/todo bằng index trong mảng items.
  Future<void> markTestStatus({
    required String testType,
    required String practiceSetId,
    required int itemIndex,
    required String status, // 'done' | 'todo'
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(practiceSetId);
    final snap = await docRef.get();
    if (!snap.exists) return;

    final data = snap.data() as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return;

    items[itemIndex]['status'] = status;

    // cập nhật progress
    final done = items.where((e) => e['status'] == 'done').length;
    final total = items.length;

    await docRef.set({
      'items': items,
      'progress': {'done': done, 'total': total},
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<String?> getTestStatus({
    required int itemIndex,
    required String testType,
  }) async {
    final uid = _auth.currentUser!.uid;
    final practiceSet = await getLatestOrCreatePracticeSet(testType);
    final practiceSetId = practiceSet['practiceSetId'] as String;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(practiceSetId);

    final snap = await docRef.get();
    if (!snap.exists) return null;

    final data = snap.data() as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return null;

    return (items[itemIndex]['status'] as String?) ?? 'todo';
  }

  Future<Map<String, dynamic>?> getSavedResult({
    required int itemIndex,
    required String testType,
  }) async {
    final uid = _auth.currentUser!.uid;
    final practiceSet = await getLatestOrCreatePracticeSet(testType);
    final practiceSetId = practiceSet['practiceSetId'] as String;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(practiceSetId);

    final snap = await docRef.get();
    if (!snap.exists) return null;

    final data = snap.data() as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return null;

    final it = items[itemIndex];
    return {
      'totalScore': it['totalScore'],
      'answers': Map<String, dynamic>.from(it['answers'] ?? const {}),
    };
  }

  // === NEW 1: lấy danh sách đề LR từ Firestore và build items chuẩn ===
  Future<List<Map<String, dynamic>>> _fetchPracticeTestItems(
    String testType,
  ) async {
    final snap = await _db
        .collection('practice_tests')
        .doc(testType)
        .collection('test_number')
        .orderBy('order', descending: false)
        .get();

    final List<Map<String, dynamic>> items = [];
    for (int i = 0; i < snap.docs.length; i++) {
      final d = snap.docs[i];
      final data = d.data();
      items.add({
        'testId': d.id,
        'title': (data['title'] ?? d.id).toString(),
        'parts': List<String>.from(data['parts'] ?? const []),
        'timeLimitMinutes': (data['timeLimitMinutes'] is num)
            ? (data['timeLimitMinutes'] as num).toInt()
            : 120,
        'order': data['order'] ?? i, // đảm bảo thứ tự ổn định
        'status': 'todo', // mặc định
      });
    }
    return items;
  }

  // === NEW 2: Lấy practice set mới nhất; nếu không có thì tạo mới và trả về ===
  Future<Map<String, dynamic>> getLatestOrCreatePracticeSet(
    String testType,
  ) async {
    final latest = await getLatestPracticeSet(testType);
    if (latest != null) return latest;

    // Chưa có → tạo mới từ bộ LR
    final items = await _fetchPracticeTestItems(testType);
    final newId = await createNewPracticeSetId(
      items: items,
      testType: testType,
    );

    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .doc(newId);

    final newSnap = await docRef.get();
    return {'practiceSetId': newId, 'data': newSnap.data()};
  }

  Future<String> getTestName({
    required String testType,
    required String testId,
  }) async {
    final q = await _db
        .collection('practice_tests')
        .doc(testType)
        .collection('test_number')
        .doc(testId)
        .get();

    return q['title'];
  }

  Future<Map<String, int>> getPracticedTestPerSet(String testType) async {
    final user = _auth.currentUser;
    if (user == null) return {};

    final snap = await _db
        .collection('users')
        .doc(user.uid)
        .collection('practice_test_results')
        .doc(testType)
        .collection('practice_sets')
        .get();

    final Map<String, int> result = {};

    for (final doc in snap.docs) {
      final practiceSetId = doc.id;
      final data = doc.data();

      final progress = data['progress'];
      if (progress is Map) {
        final doneVal = progress['done'];

        int done = 0;
        if (doneVal is int) {
          done = doneVal;
        } else if (doneVal is num)
          // ignore: curly_braces_in_flow_control_structures
          done = doneVal.toInt();

        result[practiceSetId] = done;
      } else {
        result[practiceSetId] = 0;
      }
    }

    return result;
  }

  /// Tính tổng 'done' trên tất cả practiceSet
  Future<int> getTotalPracticedTest(String testType) async {
    final perPracticeSet = await getPracticedTestPerSet(testType);
    var total = 0;
    for (final v in perPracticeSet.values) {
      total += v;
    }
    return total;
  }
}
