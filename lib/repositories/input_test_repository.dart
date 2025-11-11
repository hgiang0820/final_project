import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/question_LR_model.dart';
import 'package:final_project/models/question_SW_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InputTestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _supabase = Supabase.instance.client;
  // final String _bucket = 'toeic-assets'; // bucket bạn tạo

  Future<Map<String, dynamic>> getTestMeta(String testId) async {
    final doc = await _firestore.collection('input_tests').doc(testId).get();
    return doc.data()!;
  }

  Future<Map<String, dynamic>> getPartMeta(
    String collectionId,
    String testId,
    String partId,
  ) async {
    final doc = await _firestore
        .collection(collectionId)
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .get();
    return doc.data()!;
  }

  Future<List<QuestionLR>> getQuestionsLR(
    String collectionId,
    String testId,
    String partId,
  ) async {
    final qs = await _firestore
        .collection(collectionId)
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .collection('questions')
        .orderBy('order')
        .get();
    return qs.docs.map((d) => QuestionLR.fromMap(d.id, d.data())).toList();
  }

  Future<List<QuestionSW>> getQuestionsSW(String testId, String partId) async {
    final qs = await _firestore
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .collection('questions')
        .orderBy('order')
        .get();
    return qs.docs.map((d) => QuestionSW.fromMap(d.id, d.data())).toList();
  }

  /// Get public URL. If SDK returns map, adapt accordingly.
  String getPublicUrl(String bucket, String storagePath) {
    return _supabase.storage.from(bucket).getPublicUrl(storagePath);
  }

  Future<String?> getPartType(String testId, String partId) async {
    final doc = await _firestore
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .get();

    if (doc.exists) {
      final data = doc.data();
      return data?['type'] as String?;
    } else {
      return null;
    }
  }

  Future<String?> getQuestionType(
    String testId,
    String partId,
    String quesId,
  ) async {
    final doc = await _firestore
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .collection('questions')
        .doc(quesId)
        .get();

    if (doc.exists) {
      final data = doc.data();
      return data?['type'] as String?;
      // return data?['requirement'] as String?;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> getPartMetaByLesson({
    required String materialId,
    required String levelId,
    required String partId,
    required String lessonId,
  }) async {
    final ref = _firestore
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .collection('lessons')
        .doc(lessonId);
    final snap = await ref.get();
    if (!snap.exists)
      throw 'Không tìm thấy metadata cho $levelId/$partId/$lessonId';
    return snap.data()!;
  }

  Future<List<QuestionLR>> getQuestionsLRByLesson({
    required String materialId,
    required String levelId,
    required String partId,
    required String lessonId,
  }) async {
    final qsRef = _firestore
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .collection('lessons')
        .doc(lessonId)
        .collection('questions')
        .orderBy('order');
    final snap = await qsRef.get();
    // return snap.docs.map((d) => QuestionLR.fromFirestore(d)).toList();
    return snap.docs.map((d) => QuestionLR.fromMap(d.id, d.data())).toList();
  }

  Future<Map<String, dynamic>> getPracticePart(
    String collectionId,
    String practiceTestId,
    String testId,
    String partId,
  ) async {
    final doc = await _firestore
        .collection(collectionId)
        .doc(practiceTestId)
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .get();
    return doc.data()!;
  }

  Future<List<QuestionLR>> getPracticeQuestionsLR(
    String collectionId,
    String practiceTestId,
    String testId,
    String partId,
  ) async {
    final qs = await _firestore
        .collection(collectionId)
        .doc(practiceTestId)
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .collection('questions')
        .orderBy('order')
        .get();
    return qs.docs.map((d) => QuestionLR.fromMap(d.id, d.data())).toList();
  }

  Future<List<QuestionSW>> getPracticeQuestionsSW(
    String collectionId,
    String practiceTestId,
    String testId,
    String partId,
  ) async {
    final qs = await _firestore
        .collection(collectionId)
        .doc(practiceTestId)
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc(partId)
        .collection('questions')
        .orderBy('order')
        .get();
    return qs.docs.map((d) => QuestionSW.fromMap(d.id, d.data())).toList();
  }
}
