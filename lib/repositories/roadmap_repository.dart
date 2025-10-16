import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoadmapRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /// Lưu toàn bộ roadmap của 1 lần tạo (1 document/roadmap)
  Future<String> saveRoadmap({
    required String goal,
    required List<dynamic> weakPoints,
    required int selectedIndex, // 0 LR, 1 SW, 2 Full
    required List<Map<String, dynamic>> items, // từ RoadmapService
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .doc(); // auto id

    await docRef.set({
      'goal': goal,
      'weakPoints': weakPoints,
      'tab': selectedIndex,
      'items': items,             // mảng lesson (materialId, levelId, partId, lessonId, pdfUrl, ...)
      'createdAt': FieldValue.serverTimestamp(),
      'progress': {'done': 0, 'total': items.length},
    }, SetOptions(merge: true));

    return docRef.id;
  }

  /// Lấy roadmap mới nhất (id + data). Trả về null nếu chưa có.
  Future<Map<String, dynamic>?> getLatestRoadmap() async {
    final uid = _auth.currentUser!.uid;
    final q = await _db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (q.docs.isEmpty) return null;
    final d = q.docs.first;
    return {'roadmapId': d.id, 'data': d.data()};
  }

  /// Đánh dấu 1 lesson thành done/todo bằng index trong mảng items.
  Future<void> markLessonStatus({
    required String roadmapId,
    required int itemIndex,
    required String status, // 'done' | 'todo'
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db.collection('users').doc(uid).collection('roadmaps').doc(roadmapId);
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
}
