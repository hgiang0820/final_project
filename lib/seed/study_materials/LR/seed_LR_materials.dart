import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRMaterials() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc(materialId).set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // === LEVEL 300 ===
  // === PART 1 PICTURE DESCRIPTION ===
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part1/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 2
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part2')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part2/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part2')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 3
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part3')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part3/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part3')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 4
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part4')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part4/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part4')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 5
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part5')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part5/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part5')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 6
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part6')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part6/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part6')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath,'order': i});
  }

  // part 7
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part7')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv300/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv300/part7/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part7')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // === LEVEL 600 ===
  // === PART 1 PICTURE DESCRIPTION ===
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part1/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath,'order': i});
  }

  // part 2
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part2')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part2/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part2')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 3
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part3')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part3/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part3')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath,'order': i});
  }

  // part 4
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part4')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part4/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part4')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath,'order': i});
  }

  // part 5
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part5')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part5/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part5')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 6
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part6')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part6/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part6')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 7
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part7')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv600/part7/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part7')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // === LEVEL 800 ===
  // === PART 1 PICTURE DESCRIPTION ===
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part1/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 2
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part2')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part2/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part2')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 3
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part3')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part3/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part3')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 4
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part4')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part4/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part4')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 5
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part5')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part5/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part5')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  //part 6
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part6')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part6/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part6')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }

  // part 7
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part7')
      .set({'lessonCount': 5});

  for (int i = 1; i <= 5; i++) {
    // final id = 'q${i.toString().padLeft(2, '0')}';
    // final pdfPath = 'part1/lv600/lesson$i/theory.pdf';
    final pdfPath = 'LR/lv800/part7/lesson$i/theory.pdf';

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part7')
        .collection('lessons')
        .doc('lesson$i')
        .set({'pdfPath': pdfPath, 'order': i});
  }
}
