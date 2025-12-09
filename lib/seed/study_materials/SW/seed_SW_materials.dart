import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWMaterials() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'SWMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc('SWMaterials').set({
    'title': 'Speaking & Writing Materials',
    'levels': ['lv100', 'lv200', 'lv300'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  await db.collection('study_materials').doc('FullMaterials').set({
    'title': 'Four Skills Materials',
    'levels': ['lv1', 'lv2', 'lv3'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> pushPdfSW({
    required String levelId,
    required String partId,
  }) async {
    // Push to SWMaterials
    await db
        .collection('study_materials')
        .doc('SWMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .set({'lessonCount': 3}, SetOptions(merge: true));

    for (int i = 1; i <= 3; i++) {
      // final id = 'q${i.toString().padLeft(2, '0')}';
      // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
      final pdfPath = 'SW/$levelId/$partId/lesson$i/theory.pdf';

      await db
          .collection('study_materials')
          .doc('SWMaterials')
          .collection('levels')
          .doc(levelId)
          .collection('parts')
          .doc(partId)
          .collection('lessons')
          .doc('lesson$i')
          .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
    }
  }

  Future<void> pushPdfFull({
    required String levelId,
    required String partId,
  }) async {
    // Push to SWMaterials
    await db
        .collection('study_materials')
        .doc('FullMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .set({'lessonCount': 3}, SetOptions(merge: true));

    for (int i = 1; i <= 3; i++) {
      // final id = 'q${i.toString().padLeft(2, '0')}';
      // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
      final pdfPath = 'Full/$levelId/$partId/lesson$i/theory.pdf';

      await db
          .collection('study_materials')
          .doc('FullMaterials')
          .collection('levels')
          .doc(levelId)
          .collection('parts')
          .doc(partId)
          .collection('lessons')
          .doc('lesson$i')
          .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
    }
  }

  // ====== SWMaterials =======
  // ====== LEVEL 100+ =======
  await pushPdfSW(levelId: "lv100", partId: "part1");
  await pushPdfSW(levelId: "lv100", partId: "part2");
  await pushPdfSW(levelId: "lv100", partId: "part3");
  await pushPdfSW(levelId: "lv100", partId: "part4");
  await pushPdfSW(levelId: "lv100", partId: "part5");
  await pushPdfSW(levelId: "lv100", partId: "part6");
  await pushPdfSW(levelId: "lv100", partId: "part7");
  await pushPdfSW(levelId: "lv100", partId: "part8");

  // ====== LEVEL 200+ =======
  await pushPdfSW(levelId: "lv200", partId: "part1");
  await pushPdfSW(levelId: "lv200", partId: "part2");
  await pushPdfSW(levelId: "lv200", partId: "part3");
  await pushPdfSW(levelId: "lv200", partId: "part4");
  await pushPdfSW(levelId: "lv200", partId: "part5");
  await pushPdfSW(levelId: "lv200", partId: "part6");
  await pushPdfSW(levelId: "lv200", partId: "part7");
  await pushPdfSW(levelId: "lv200", partId: "part8");

  // ====== LEVEL 300+ =======
  await pushPdfSW(levelId: "lv300", partId: "part1");
  await pushPdfSW(levelId: "lv300", partId: "part2");
  await pushPdfSW(levelId: "lv300", partId: "part3");
  await pushPdfSW(levelId: "lv300", partId: "part4");
  await pushPdfSW(levelId: "lv300", partId: "part5");
  await pushPdfSW(levelId: "lv300", partId: "part6");
  await pushPdfSW(levelId: "lv300", partId: "part7");
  await pushPdfSW(levelId: "lv300", partId: "part8");

  //===== FullMaterials =====
  //===== Level 1 =======
  await pushPdfFull(levelId: "lv1", partId: "speak1");
  await pushPdfFull(levelId: "lv1", partId: "speak2");
  await pushPdfFull(levelId: "lv1", partId: "speak3");
  await pushPdfFull(levelId: "lv1", partId: "speak4");
  await pushPdfFull(levelId: "lv1", partId: "speak5");
  await pushPdfFull(levelId: "lv1", partId: "write1");
  await pushPdfFull(levelId: "lv1", partId: "write2");
  await pushPdfFull(levelId: "lv1", partId: "write3");

  //===== Level 2 =======
  await pushPdfFull(levelId: "lv2", partId: "speak1");
  await pushPdfFull(levelId: "lv2", partId: "speak2");
  await pushPdfFull(levelId: "lv2", partId: "speak3");
  await pushPdfFull(levelId: "lv2", partId: "speak4");
  await pushPdfFull(levelId: "lv2", partId: "speak5");
  await pushPdfFull(levelId: "lv2", partId: "write1");
  await pushPdfFull(levelId: "lv2", partId: "write2");
  await pushPdfFull(levelId: "lv2", partId: "write3");

  //===== Level 3 =======
  await pushPdfFull(levelId: "lv3", partId: "speak1");
  await pushPdfFull(levelId: "lv3", partId: "speak2");
  await pushPdfFull(levelId: "lv3", partId: "speak3");
  await pushPdfFull(levelId: "lv3", partId: "speak4");
  await pushPdfFull(levelId: "lv3", partId: "speak5");
  await pushPdfFull(levelId: "lv3", partId: "write1");
  await pushPdfFull(levelId: "lv3", partId: "write2");
  await pushPdfFull(levelId: "lv3", partId: "write3");
}
