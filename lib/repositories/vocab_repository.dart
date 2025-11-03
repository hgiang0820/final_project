import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/vocab_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VocabRepository {
  final _db = FirebaseFirestore.instance;
  final _supabase = Supabase.instance.client;
  final _auth = FirebaseAuth.instance;
  final String _bucket = 'vocab_practice';

  // Future<List<VocabTopic>> getVocabTopics({required String levelId}) async {
  //   final q = await _db
  //       .collection('vocab_practice')
  //       .doc(levelId)
  //       .collection('vocab_topics')
  //       .orderBy('order', descending: false) // bạn có thể bỏ nếu không dùng
  //       .get();

  //   return q.docs
  //       .map(
  //         (d) => _topicFromData(levelId: levelId, docId: d.id, data: d.data()),
  //       )
  //       .toList();
  // }

  // Future<VocabTopic?> getVocabTopic({
  //   required String levelId,
  //   required String topicId,
  // }) async {
  //   final doc = await _db
  //       .collection('vocab_practice')
  //       .doc(levelId)
  //       .collection('vocab_topics')
  //       .doc(topicId)
  //       .get();
  //   final data = doc.data();
  //   if (!doc.exists || data == null) return null;
  //   return _topicFromData(levelId: levelId, docId: doc.id, data: data);
  // }

  Future<List<VocabQuestion>> getVocabQuestions({
    required String levelId,
    required String topicId,
  }) async {
    final snap = await _db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc(topicId)
        .collection('questions')
        .orderBy('order', descending: false)
        .get();

    print(snap.docs.length);

    return snap.docs.map((doc) {
      final data = doc.data();
      return VocabQuestion(
        id: doc.id,
        question: (data['question'] ?? '') as String,
        options: List<String>.from(data['options'] ?? const []),
        correctIndex: (data['correctIndex'] is num)
            ? (data['correctIndex'] as num).toInt()
            : 0,
        order: (data['order'] is num) ? (data['order'] as num).toInt() : 0,
        explanation: data['explain'] as String?,
        imageUrl: _publicUrlOrNull(data['imagePath']),
        audioUrl: _publicUrlOrNull(data['audioPath']),
      );
    }).toList();
  }

  String publicPdfUrl(String storagePath) {
    return _publicUrlOrNull(storagePath) ?? '';
  }

  // VocabTopic _topicFromData({
  //   required String levelId,
  //   required String docId,
  //   required Map<String, dynamic> data,
  // }) {
  //   final rawPdfPath = data['pdfPath'] as String? ?? '';
  //   final pdfPath = rawPdfPath.isEmpty ? null : rawPdfPath;
  //   return VocabTopic(
  //     id: docId,
  //     levelId: levelId,
  //     topicName: (data['topicName'] ?? docId).toString(),
  //     order: (data['order'] is num) ? (data['order'] as num).toInt() : 0,
  //     questionCount: (data['questionCount'] is num)
  //         ? (data['questionCount'] as num).toInt()
  //         : 0,
  //     pdfPath: pdfPath,
  //     pdfUrl: _publicUrlOrNull(pdfPath),
  //   );
  // }

  String? _publicUrlOrNull(dynamic path) {
    if (path == null) return null;
    if (path is! String) return null;
    if (path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    return _supabase.storage.from(_bucket).getPublicUrl(path);
  }

  Future<String> createNewVocabPracticeSetId({
    required List<Map<String, dynamic>> items,
    required String levelId, // 'easy' | 'medium' | 'hard'
  }) async {
    final uid = _auth.currentUser!.uid;
    final vocabPracticeSetId = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(); // auto id

    await vocabPracticeSetId.set({
      'items': items, // mảng câu / đề
      'createdAt': FieldValue.serverTimestamp(),
      'progress': {'done': 0, 'total': items.length},
    }, SetOptions(merge: true));

    return vocabPracticeSetId.id;
  }

  Future<Map<String, dynamic>> createFreshVocabPracticeSet(
    String levelId,
  ) async {
    final items = await _fetchVocabPracticeItems(levelId);
    final newId = await createNewVocabPracticeSetId(
      items: items,
      levelId: levelId,
    );

    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(newId);

    final snap = await docRef.get();
    return {
      'vocabPracticeSetId': newId,
      'data': snap.data() ?? <String, dynamic>{},
    };
  }

  Future<void> saveVocabPracticeResult({
    required String levelId,
    required String testId,
    required int totalScore,
    required int itemIndex,
    // required Map<String, dynamic> parts,
    required Map<String, dynamic> answers,
  }) async {
    final uid = _auth.currentUser!.uid;
    final vocabPracticeSetId = await getLatestOrCreateVocabPracticeSet(
      levelId,
    ).then((v) => v['vocabPracticeSetId'] as String);

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(vocabPracticeSetId);

    final snap = await docRef.get();
    if (!snap.exists) return;

    final data = snap.data() ?? <String, dynamic>{};
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return;

    items[itemIndex]['totalScore'] = totalScore;
    items[itemIndex]['answers'] = answers;

    await docRef.set({
      'items': items,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getLatestVocabPracticeSet(
    String levelId,
  ) async {
    final uid = _auth.currentUser!.uid;
    final q = await _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (q.docs.isEmpty) return null;
    final d = q.docs.first;
    return {'vocabPracticeSetId': d.id, 'data': d.data()};
  }

  /// Đánh dấu 1 đề thành done/todo bằng index trong mảng items.
  Future<void> markStatus({
    required String levelId,
    required String vocabPracticeSetId,
    required int itemIndex,
    required String status, // 'done' | 'todo'
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(vocabPracticeSetId);
    final snap = await docRef.get();
    if (!snap.exists) return;

    final data = snap.data() ?? <String, dynamic>{};
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

  Future<String?> getStatus({
    required int itemIndex,
    required String levelId,
  }) async {
    final uid = _auth.currentUser!.uid;
    final vocabPracticeSet = await getLatestOrCreateVocabPracticeSet(levelId);
    final vocabPracticeSetId = vocabPracticeSet['vocabPracticeSetId'] as String;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(vocabPracticeSetId);

    final snap = await docRef.get();
    if (!snap.exists) return null;

    final data = snap.data() ?? <String, dynamic>{};
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return null;

    return (items[itemIndex]['status'] as String?) ?? 'todo';
  }

  Future<Map<String, dynamic>?> getSavedResult({
    required int itemIndex,
    required String levelId,
  }) async {
    final uid = _auth.currentUser!.uid;
    final vocabPracticeSet = await getLatestOrCreateVocabPracticeSet(levelId);
    final vocabPracticeSetId = vocabPracticeSet['vocabPracticeSetId'] as String;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(vocabPracticeSetId);

    final snap = await docRef.get();
    if (!snap.exists) return null;

    final data = snap.data() ?? <String, dynamic>{};
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return null;

    final it = items[itemIndex];
    return {
      'totalScore': it['totalScore'],
      'answers': Map<String, dynamic>.from(it['answers'] ?? const {}),
    };
  }

  // === NEW 1: lấy danh sách đề LR từ Firestore và build items chuẩn ===
  Future<List<Map<String, dynamic>>> _fetchVocabPracticeItems(
    String levelId,
  ) async {
    final snap = await _db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .orderBy('order', descending: false)
        .get();

    final List<Map<String, dynamic>> items = [];
    for (int i = 0; i < snap.docs.length; i++) {
      final d = snap.docs[i];
      final data = d.data();
      items.add({
        'topicId': d.id,
        'levelId': levelId,
        'topicName': (data['topicName'] ?? d.id).toString(),
        'order': data['order'] ?? i, // đảm bảo thứ tự ổn định
        'questionCount': (data['questionCount'] is num)
            ? (data['questionCount'] as num).toInt()
            : 0,
        'pdfPath': (data['pdfPath'] ?? '').toString(),
        'pdfUrl': _publicUrlOrNull(data['pdfPath']),
        'status': 'todo', // mặc định
      });
    }
    return items;
  }

  // === NEW 2: Lấy practice set mới nhất; nếu không có thì tạo mới và trả về ===
  Future<Map<String, dynamic>> getLatestOrCreateVocabPracticeSet(
    String levelId,
  ) async {
    final latest = await getLatestVocabPracticeSet(levelId);
    if (latest != null) return latest;

    // Chưa có → tạo mới từ bộ LR
    final items = await _fetchVocabPracticeItems(levelId);
    final newId = await createNewVocabPracticeSetId(
      items: items,
      levelId: levelId,
    );

    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('vocab_practice_results')
        .doc(levelId)
        .collection('vocab_practice_sets')
        .doc(newId);

    final newSnap = await docRef.get();
    return {
      'vocabPracticeSetId': newId,
      'data': newSnap.data() ?? <String, dynamic>{},
    };
  }
}
