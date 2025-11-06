import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/vocab_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VocabRepository {
  final _db = FirebaseFirestore.instance;
  final _supabase = Supabase.instance.client;
  final _auth = FirebaseAuth.instance;
  final String _bucket = 'vocab_practice';

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

    // print(snap.docs.length);

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

  Future<List<VocabCard>> getVocabCards({
    required String levelId,
    required String topicId,
  }) async {
    final snap = await _db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc(topicId)
        .collection('cards')
        .orderBy(FieldPath.documentId)
        .get();
    return snap.docs.map((doc) {
      final data = doc.data();
      return VocabCard(
        id: doc.id,
        word: (data['word'] ?? '').toString(),
        phonetic: (data['phonetic'] ?? '').toString(),
        meaningVi: (data['meaningVi'] ?? '').toString(),
        exampleEn: (data['exampleEn'] ?? '').toString(),
        exampleVi: (data['exampleVi'] ?? '').toString(),
      );
    }).toList();
  }

  String publicPdfUrl(String storagePath) {
    return _publicUrlOrNull(storagePath) ?? '';
  }

  String? _publicUrlOrNull(dynamic path) {
    if (path == null) return null;
    if (path is! String) return null;
    if (path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    return _supabase.storage.from(_bucket).getPublicUrl(path);
  }

  Future<String> createNewVocabPracticeSetId({
    required List<Map<String, dynamic>> items,
    required List<Map<String, dynamic>> cards,
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
      'cards': cards,
      'createdAt': FieldValue.serverTimestamp(),
      'progress_items': {'done': 0, 'total': items.length},
      'progress_cards': {'done': 0, 'total': cards.length},
    }, SetOptions(merge: true));

    return vocabPracticeSetId.id;
  }

  Future<Map<String, dynamic>> createFreshVocabPracticeSet(
    String levelId,
  ) async {
    final items = await _fetchVocabPracticeItems(levelId);
    final cards = await _fetchVocabCards(levelId);
    final newId = await createNewVocabPracticeSetId(
      items: items,
      cards: cards,
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
  Future<void> markVocabPracticeStatus({
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
      'progress_items': {'done': done, 'total': total},
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<String?> getVocabPracticeStatus({
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

  Future<void> markVocabCardStatus({
    required String levelId,
    required String vocabPracticeSetId,
    required int cardIndex,
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
    final cards = List<Map<String, dynamic>>.from(data['cards'] ?? []);
    if (cardIndex < 0 || cardIndex >= cards.length) return;

    cards[cardIndex]['status'] = status;

    // cập nhật progress
    final done = cards.where((e) => e['status'] == 'done').length;
    final total = cards.length;

    await docRef.set({
      'cards': cards,
      'progress_cards': {'done': done, 'total': total},
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> markVocabCardStatusLatest({
    required String levelId,
    required int cardIndex,
    required String status, // 'done' | 'todo'
  }) async {
    final latest = await getLatestOrCreateVocabPracticeSet(levelId);
    final vocabPracticeSetId = latest['vocabPracticeSetId'] as String;
    await markVocabCardStatus(
      levelId: levelId,
      vocabPracticeSetId: vocabPracticeSetId,
      cardIndex: cardIndex,
      status: status,
    );
  }

  Future<String?> getVocabCardStatus({
    required int cardIndex,
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
    final cards = List<Map<String, dynamic>>.from(data['cards'] ?? []);
    if (cardIndex < 0 || cardIndex >= cards.length) return null;

    return (cards[cardIndex]['status'] as String?) ?? 'todo';
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

  Future<List<Map<String, dynamic>>> _fetchVocabCards(String levelId) async {
    final snap = await _db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .orderBy('order', descending: false)
        .get();

    final List<Map<String, dynamic>> cards = [];
    for (int i = 0; i < snap.docs.length; i++) {
      final d = snap.docs[i];
      final data = d.data();
      cards.add({
        'topicId': d.id,
        'levelId': levelId,
        'topicName': (data['topicName'] ?? d.id).toString(),
        'order': data['order'] ?? i, // đảm bảo thứ tự ổn định
        // 'questionCount': (data['questionCount'] is num)
        //     ? (data['questionCount'] as num).toInt()
        //     : 0,
        // 'pdfPath': (data['pdfPath'] ?? '').toString(),
        // 'pdfUrl': _publicUrlOrNull(data['pdfPath']),
        'status': 'todo', // mặc định
      });
    }
    return cards;
  }

  // === NEW 2: Lấy practice set mới nhất; nếu không có thì tạo mới và trả về ===
  Future<Map<String, dynamic>> getLatestOrCreateVocabPracticeSet(
    String levelId,
  ) async {
    final latest = await getLatestVocabPracticeSet(levelId);
    if (latest != null) return latest;

    // Chưa có → tạo mới từ bộ LR
    final items = await _fetchVocabPracticeItems(levelId);
    final cards = await _fetchVocabCards(levelId);
    final newId = await createNewVocabPracticeSetId(
      items: items,
      cards: cards,
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
