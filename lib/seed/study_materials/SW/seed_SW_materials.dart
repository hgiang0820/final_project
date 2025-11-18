import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWMaterials() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'SWMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc(materialId).set({
    'title': 'Speaking & Writing Materials',
    'levels': ['lv100', 'lv200', 'lv300'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  Future<void> pushPdf({
    required String levelId,
    required String partId,
  }) async {
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc(partId)
        .set({'lessonCount': 3});

    for (int i = 1; i <= 3; i++) {
      // final id = 'q${i.toString().padLeft(2, '0')}';
      // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
      final pdfPath = 'SW/lv100/part1/lesson$i/theory.pdf';

      await db
          .collection('questions')
          .doc(materialId)
          .collection('levels')
          .doc(levelId)
          .collection('parts')
          .doc(partId)
          .collection('lessons')
          .doc('lesson$i')
          .set({'pdfPath': pdfPath, 'order': i});
    }
  }

  // ====== LEVEL 100+ =======
  pushPdf(levelId: "lv100", partId: "part1");
  pushPdf(levelId: "lv100", partId: "part2");
  pushPdf(levelId: "lv100", partId: "part3");
  pushPdf(levelId: "lv100", partId: "part4");
  pushPdf(levelId: "lv100", partId: "part5");
  pushPdf(levelId: "lv100", partId: "part6");
  pushPdf(levelId: "lv100", partId: "part7");
  pushPdf(levelId: "lv100", partId: "part8");

  // ====== LEVEL 200+ =======
  pushPdf(levelId: "lv200", partId: "part1");
  pushPdf(levelId: "lv200", partId: "part2");
  pushPdf(levelId: "lv200", partId: "part3");
  pushPdf(levelId: "lv200", partId: "part4");
  pushPdf(levelId: "lv200", partId: "part5");
  pushPdf(levelId: "lv200", partId: "part6");
  pushPdf(levelId: "lv200", partId: "part7");
  pushPdf(levelId: "lv200", partId: "part8");

  // ====== LEVEL 300+ =======
  pushPdf(levelId: "lv300", partId: "part1");
  pushPdf(levelId: "lv300", partId: "part2");
  pushPdf(levelId: "lv300", partId: "part3");
  pushPdf(levelId: "lv300", partId: "part4");
  pushPdf(levelId: "lv300", partId: "part5");
  pushPdf(levelId: "lv300", partId: "part6");
  pushPdf(levelId: "lv300", partId: "part7");
  pushPdf(levelId: "lv300", partId: "part8");

  // === LEVEL 100 ===
  // === PART 1 READ A TEXT ALOUD ===
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv100')
  //     .collection('parts')
  //     .doc('part1')
  //     .set({'lessonCount': 3});

  // for (int i = 1; i <= 3; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'SW/lv100/part1/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv100')
  //       .collection('parts')
  //       .doc('part1')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv100')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 3});

  // for (int i = 1; i <= 3; i++) {
  //   // final id = 'q${i.toString().padLeft(2, '0')}';
  //   // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
  //   final pdfPath = 'SW/lv100/part2/lesson$i/theory.pdf';

  //   await db
  //       .collection('study_materials')
  //       .doc(materialId)
  //       .collection('levels')
  //       .doc('lv100')
  //       .collection('parts')
  //       .doc('part2')
  //       .collection('lessons')
  //       .doc('lesson$i')
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv100')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv300')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
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
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv600')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
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
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 2
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part2')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 3
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part3')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 4
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part4')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 5
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part5')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // //part 6
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part6')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }

  // // part 7
  // await db
  //     .collection('study_materials')
  //     .doc(materialId)
  //     .collection('levels')
  //     .doc('lv800')
  //     .collection('parts')
  //     .doc('part7')
  //     .set({'lessonCount': 5});

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
  //       .set({'pdfPath': pdfPath, 'order': i});
  // }
}
