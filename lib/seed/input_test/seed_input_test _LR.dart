import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputTestLR() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testLR';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice Listening & Reading',
    'parts': ['part1', 'part2', 'part3'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // === PART 1 ===
  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({
        'type': 'part1',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 6,
      });

  for (int i = 1; i <= 6; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part1')
        .collection('questions')
        .doc(id)
        .set({
          'text': null,
          'imagePath': imagePath,
          'options': ['A', 'B', 'C', 'D'],
          'correctIndex': (i - 1) % 4,
          'explain': "Explain of question $i",
          'order': i,
        });
  }

  // === PART 2 ===
  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part2')
      .set({
        'type': 'part2',
        'audioPath': 'input_tests/testLR/part2/01%20Test%201_LC_Voca.mp3',
        'questionCount': 25,
      });

  for (int i = 1; i <= 25; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part2')
        .collection('questions')
        .doc(id)
        .set({
          'text': null,
          'imagePath': null,
          'options': ['A', 'B', 'C'],
          'correctIndex': (i - 1) % 3,
          'explain': "Explain of question $i",
          'order': i,
          'audioStart': (i - 1) * 2.5,
          'audioEnd': (i - 1) * 2.5 + 2.5,
        });
  }

  // // === PART 3 ===
  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part3')
      .set({'type': 'part3', 'questionCount': 25});

  for (int i = 1; i <= 25; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part3')
        .collection('questions')
        .doc(id)
        .set({
          'text': 'Value of question $i',
          // 'imagePath': null,
          'options': ['Option A', 'Option B', 'Option C', 'Option D'],
          'correctIndex': (i - 1) % 4,
          'explain': "Explain of question $i",
          'order': i,
        });
  }

  // print('🎉 Seed completed!');
}
