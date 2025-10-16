import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputTestFull() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testFull';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice 4 Skills',
    'parts': ['lis_part', 'read_part', 'speak_part', 'wri_part'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // === LISTENING PART ===
  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('lis_part')
      .set({
        'type': 'lis_part',
        'audioPath': 'input_tests/testFull/lisPart/01%20Test%201_LC_Voca.mp3',
        'questionCount': 25,
      });

  for (int i = 1; i <= 25; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('lis_part')
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

  // === READING PART ===
  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('read_part')
      .set({'type': 'read_part', 'questionCount': 20});

  for (int i = 1; i <= 20; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('read_part')
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

  // === SPEAKING PART === 
  final speakingQuestions = [
    {
      'requirement': 'Read Aloud',
      'text': "Good morning and welcome to our company tour.",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud. ',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 1',
    },
    {
      'requirement': 'Respond to Questions',
      'text': "Why do you want to join this club?",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question  of the test, you will have 5 seconds to prepare and 30 seconds to respond.',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 3',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('speak_part')
      .set({'type': 'speak_part', 'questionCount': 2});

  for (int i = 1; i <= 2; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testFull/speakPart/$id.jpg';
    var imagePath = '';

    final q = speakingQuestions[i - 1];

    if (q['requirement'] == 'Describe a Picture' || q['requirement'] == "Respond to Questions using Information Provided") {
      imagePath = 'input_tests/testFull/speakPart/$id.jpg';
    }

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('speak_part')
        .collection('questions')
        .doc(id)
        .set({
          'requirement': q['requirement'],
          'imagePath': imagePath,
          'text': q['text'],
          'prepare_time': q['prepare_time'],
          'record_time': q['record_time'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': i,
        });
  }

  // === WRITING PART === 
  final wriQuestions = [
    {
      'requirement': 'Write a Sentence based on a Picture',
      'text': "girl, posing",
      'sample_answer': "Sample answer 1",
      'directions':
          'Write ONE sentence that is based on the picture using the TWO words or phrases under it. You may change the forms of the words and you may use them in any order.',
      'max_score': 3,
    },
    {
      'requirement': 'Respond to a Written Request',
      'text':
          "Dear Sir/Madam, \n\nI am interested in joining your English course. Could you please provide me with information about the schedule and the tuition fee? \n\nThank you, \nAnna",
      'sample_answer': "Sample answer 2",
      'directions':
          'Respond to the e-mail as if you are a teacher. In your e-mail, give information about the schedule and the tuition fee and ask one question.',
      'max_score': 4,
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('wri_part')
      .set({'type': 'wri_part', 'questionCount': 2});

  for (int i = 1; i <= 2; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'testSW/part2/$id.jpg';
    var imagePath = '';

    final q = wriQuestions[i - 1];

    if (q['requirement'] == 'Write a Sentence based on a Picture') {
      imagePath = 'input_tests/testFull/wriPart/$id.jpg';
    }

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('wri_part')
        .collection('questions')
        .doc(id)
        .set({
          'requirement': q['requirement'],
          'imagePath': imagePath,
          'text': q['text'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': i,
        });
  }
}
