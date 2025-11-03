import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedVocabPracticePdf() async {
  final db = FirebaseFirestore.instance;
  // final levelId = 'easy';

  // Firestore: Create test document
  /// ==== LEVEL EASY =====
  await db.collection('vocab_practice').doc('easy').set({
    'title': 'Practice Vocabulary Level Easy',
    'vocabTopicId': [
      'vocab1',
      'vocab2',
      'vocab3',
      'vocab4',
      'vocab5',
      'vocab6',
      'vocab7',
      'vocab8',
      'vocab9',
      'vocab10',
    ],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  await db.collection('vocab_practice').doc('easy').set({
    'vocabTopicCount': 10,
  }, SetOptions(merge: true));

  for (int i = 1; i <= 10; i++) {
    final pdfPath = 'easy/vocab$i.pdf';

    await db
        .collection('vocab_practice')
        .doc('easy')
        .collection('vocab_topics')
        .doc('vocab$i')
        .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  }

  /// ==== LEVEL MEDIUM =====
  await db.collection('vocab_practice').doc('medium').set({
    'title': 'Practice Vocabulary Level Medium',
    'vocabSetId': [
      'vocab1',
      'vocab2',
      'vocab3',
      'vocab4',
      'vocab5',
      'vocab6',
      'vocab7',
      'vocab8',
      'vocab9',
      'vocab10',
    ],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  await db.collection('vocab_practice').doc('medium').set({
    'vocabTopicCount': 10,
  }, SetOptions(merge: true));

  for (int i = 1; i <= 10; i++) {
    final pdfPath = 'medium/vocab$i.pdf';

    await db
        .collection('vocab_practice')
        .doc('medium')
        .collection('vocab_topics')
        .doc('vocab$i')
        .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  }

  /// ==== LEVEL HARD =====
  await db.collection('vocab_practice').doc('hard').set({
    'title': 'Practice Vocabulary Level Hard',
    'vocabSetId': [
      'vocab1',
      'vocab2',
      'vocab3',
      'vocab4',
      'vocab5',
      'vocab6',
      'vocab7',
      'vocab8',
      'vocab9',
      'vocab10',
    ],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  await db.collection('vocab_practice').doc('hard').set({
    'vocabTopicCount': 10,
  }, SetOptions(merge: true));

  for (int i = 1; i <= 10; i++) {
    final pdfPath = 'hard/vocab$i.pdf';

    await db
        .collection('vocab_practice')
        .doc('hard')
        .collection('vocab_topics')
        .doc('vocab$i')
        .set({'pdfPath': pdfPath, 'order': i}, SetOptions(merge: true));
  }
}
