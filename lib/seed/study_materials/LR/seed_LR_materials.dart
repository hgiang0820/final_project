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
  pushPdfLR(levelId: "lv300", partId: "part1");
  pushPdfLR(levelId: "lv300", partId: "part2");
  pushPdfLR(levelId: "lv300", partId: "part3");
  pushPdfLR(levelId: "lv300", partId: "part4");
  pushPdfLR(levelId: "lv300", partId: "part5");
  pushPdfLR(levelId: "lv300", partId: "part6");
  pushPdfLR(levelId: "lv300", partId: "part7");

  // ====== LEVEL 600+ =======
  pushPdfLR(levelId: "lv600", partId: "part1");
  pushPdfLR(levelId: "lv600", partId: "part2");
  pushPdfLR(levelId: "lv600", partId: "part3");
  pushPdfLR(levelId: "lv600", partId: "part4");
  pushPdfLR(levelId: "lv600", partId: "part5");
  pushPdfLR(levelId: "lv600", partId: "part6");
  pushPdfLR(levelId: "lv600", partId: "part7");

  // ====== LEVEL 800+ =======
  pushPdfLR(levelId: "lv800", partId: "part1");
  pushPdfLR(levelId: "lv800", partId: "part2");
  pushPdfLR(levelId: "lv800", partId: "part3");
  pushPdfLR(levelId: "lv800", partId: "part4");
  pushPdfLR(levelId: "lv800", partId: "part5");
  pushPdfLR(levelId: "lv800", partId: "part6");
  pushPdfLR(levelId: "lv800", partId: "part7");

  //===== FullMaterials =====
  //===== Level 1 =======
  pushPdfFull(levelId: "lv1", partId: "lis1");
  pushPdfFull(levelId: "lv1", partId: "lis2");
  pushPdfFull(levelId: "lv1", partId: "lis3");
  pushPdfFull(levelId: "lv1", partId: "lis4");
  pushPdfFull(levelId: "lv1", partId: "read1");
  pushPdfFull(levelId: "lv1", partId: "read2");
  pushPdfFull(levelId: "lv1", partId: "read3");

  //===== Level 2 =======
  pushPdfFull(levelId: "lv2", partId: "lis1");
  pushPdfFull(levelId: "lv2", partId: "lis2");
  pushPdfFull(levelId: "lv2", partId: "lis3");
  pushPdfFull(levelId: "lv2", partId: "lis4");
  pushPdfFull(levelId: "lv2", partId: "read1");
  pushPdfFull(levelId: "lv2", partId: "read2");
  pushPdfFull(levelId: "lv2", partId: "read3");

  //===== Level 3 =======
  pushPdfFull(levelId: "lv3", partId: "lis1");
  pushPdfFull(levelId: "lv3", partId: "lis2");
  pushPdfFull(levelId: "lv3", partId: "lis3");
  pushPdfFull(levelId: "lv3", partId: "lis4");
  pushPdfFull(levelId: "lv3", partId: "read1");
  pushPdfFull(levelId: "lv3", partId: "read2");
  pushPdfFull(levelId: "lv3", partId: "read3");

  // // === LEVEL 300 ===
  // // === PART 1 PICTURE DESCRIPTION ===
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part1')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part1/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part1')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part2/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part2')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part3/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part3')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part4/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part4')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part5/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part5')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part6/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part6')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv300/part7/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv300')
  //       .collection('parts')
  //       .doc('part7')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // === LEVEL 600 ===
  // // === PART 1 PICTURE DESCRIPTION ===
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part1')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part1/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part1')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part2/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part2')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part3/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part3')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part4/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part4')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part5/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part5')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part6/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part6')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv600/part7/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv600')
  //       .collection('parts')
  //       .doc('part7')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // === LEVEL 800 ===
  // // === PART 1 PICTURE DESCRIPTION ===
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part1')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part1/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part1')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part2/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part2')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part3/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part3')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part4/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part4')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part5/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part5')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // //part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part6/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part6')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5}, SetOptions(merge: true));

  // for (int i = 1; i <= 5; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
  //   final pdfPath = 'LR/lv800/part7/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv800')
  //       .collection('parts')
  //       .doc('part7')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  // }
}
