import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRMaterials() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc("LRMaterials").set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  await db.collection('study_materials').doc('FullMaterials').set({
    'title': 'Four Skills Materials',
    'levels': ['lv1', 'lv2', 'lv3'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> pushPdfLR({
    required String levelId,
    required String partId,
  }) async {
    // Push to SWMaterials
    await db
        .collection('study_materials')
        .doc('LRMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .set({'lessonCount': 5}, SetOptions(merge: true));

    for (int i = 1; i <= 5; i++) {
      // final id = 'q${i.toString().padLeft(2, '0')}';
      // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
      final pdfPath = 'LR/$levelId/$partId/lesson$i/theory.pdf';

      await db
          .collection('study_materials')
          .doc('LRMaterials')
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
        .set({'lessonCount': 5}, SetOptions(merge: true));

    for (int i = 1; i <= 5; i++) {
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

  // ====== LRMaterials =======
  // ====== LEVEL 300+ =======
  await pushPdfLR(levelId: "lv300", partId: "part1");
  await pushPdfLR(levelId: "lv300", partId: "part2");
  await pushPdfLR(levelId: "lv300", partId: "part3");
  await pushPdfLR(levelId: "lv300", partId: "part4");
  await pushPdfLR(levelId: "lv300", partId: "part5");
  await pushPdfLR(levelId: "lv300", partId: "part6");
  await pushPdfLR(levelId: "lv300", partId: "part7");

  // ====== LEVEL 600+ =======
  await pushPdfLR(levelId: "lv600", partId: "part1");
  await pushPdfLR(levelId: "lv600", partId: "part2");
  await pushPdfLR(levelId: "lv600", partId: "part3");
  await pushPdfLR(levelId: "lv600", partId: "part4");
  await pushPdfLR(levelId: "lv600", partId: "part5");
  await pushPdfLR(levelId: "lv600", partId: "part6");
  await pushPdfLR(levelId: "lv600", partId: "part7");

  // ====== LEVEL 800+ =======
  await pushPdfLR(levelId: "lv800", partId: "part1");
  await pushPdfLR(levelId: "lv800", partId: "part2");
  await pushPdfLR(levelId: "lv800", partId: "part3");
  await pushPdfLR(levelId: "lv800", partId: "part4");
  await pushPdfLR(levelId: "lv800", partId: "part5");
  await pushPdfLR(levelId: "lv800", partId: "part6");
  await pushPdfLR(levelId: "lv800", partId: "part7");

  //===== FullMaterials =====
  //===== Level 1 =======
  await pushPdfFull(levelId: "lv1", partId: "lis1");
  await pushPdfFull(levelId: "lv1", partId: "lis2");
  await pushPdfFull(levelId: "lv1", partId: "lis3");
  await pushPdfFull(levelId: "lv1", partId: "lis4");
  await pushPdfFull(levelId: "lv1", partId: "read1");
  await pushPdfFull(levelId: "lv1", partId: "read2");
  await pushPdfFull(levelId: "lv1", partId: "read3");

  //===== Level 2 =======
  await pushPdfFull(levelId: "lv2", partId: "lis1");
  await pushPdfFull(levelId: "lv2", partId: "lis2");
  await pushPdfFull(levelId: "lv2", partId: "lis3");
  await pushPdfFull(levelId: "lv2", partId: "lis4");
  await pushPdfFull(levelId: "lv2", partId: "read1");
  await pushPdfFull(levelId: "lv2", partId: "read2");
  await pushPdfFull(levelId: "lv2", partId: "read3");

  //===== Level 3 =======
  await pushPdfFull(levelId: "lv3", partId: "lis1");
  await pushPdfFull(levelId: "lv3", partId: "lis2");
  await pushPdfFull(levelId: "lv3", partId: "lis3");
  await pushPdfFull(levelId: "lv3", partId: "lis4");
  await pushPdfFull(levelId: "lv3", partId: "read1");
  await pushPdfFull(levelId: "lv3", partId: "read2");
  await pushPdfFull(levelId: "lv3", partId: "read3");
}
