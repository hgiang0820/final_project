import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MaterialRepository {
  final _firestore = FirebaseFirestore.instance;
  final _supabase = Supabase.instance.client;
  final String _bucket = 'study_materials'; // Supabase bucket

  /// Ví dụ: materialId = "LRMaterials" hoặc "SWMaterials"
  /// levelId = "lv300" | "lv600" | "lv800"
  /// Trả về meta của level (nếu bạn có tổng quan level)
  Future<Map<String, dynamic>> getLevelMeta({
    required String materialId,
    required String levelId,
  }) async {
    final doc = await _firestore
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .get();
    return doc.data() ?? {};
  }

  /// Lấy danh sách lesson (5 bài) của 1 part:
  /// partId ví dụ (LR): part1..part7 | (SW): speak1..speak4 / write1..write2 (tuỳ bạn đặt)
  Future<List<Map<String, dynamic>>> getLessons({
    required String materialId,
    required String levelId,
    required String partId,
  }) async {
    final q = await _firestore
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .collection('lessons')
        .orderBy('order', descending: false) // bạn có thể bỏ nếu không dùng
        .get();

    return q.docs.map((d) {
      final data = d.data();
      return {
        'lessonId': d.id,
        'lessonName': data['lessonName'] ?? d.id,
        'pdfPath': data['pdfPath'], // ex: "LR/lv600/part3/lesson1.pdf"
      };
    }).toList();
  }

  /// Public URL của file PDF trong Supabase Storage
  String publicPdfUrl(String storagePath) {
    return _supabase.storage.from(_bucket).getPublicUrl(storagePath);
  }
}
