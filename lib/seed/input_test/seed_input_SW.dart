// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputSW() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testSW';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice Speaking & Writing',
    'parts': ['part1', 'part2'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // // === PART 1 === SPEAKING
  final part1Questions = [
    {
      'type': 'Read a text aloud',
      'text': "Good morning and welcome to our company tour.",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud. ',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 1',
    },
    {
      'type': 'Describe a picture',
      'text': "",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 2',
    },
    {
      'type': 'Respond to questions',
      'text': "Why do you want to join this club?",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question  of the test, you will have 5 seconds to prepare and 30 seconds to respond.',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 3',
    },
    {
      'type': 'Respond to questions',
      'text': "How often do you practice English outside of work?",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question  of the test, you will have 5 seconds to prepare and 30 seconds to respond.',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 4',
    },
    {
      'type': 'Respond to questions using information provided',
      'text': "A colleague asks, “Can I take a yoga class on Sunday morning?”",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question of the test, you will answer a question based on the information provided. You will have 5 seconds to read the information before the questions begin. You will have 5 seconds to respond to question.',
      'max_score': 3,
      'sample_answer': 'Sample Answer of question 5',
    },
    {
      'type': 'Express an opinion',
      'text':
          "Some people prefer working from home, while others like working in the office. Which do you prefer and why?",
      'prepare_time': 5,
      'record_time': 5,
      'directions':
          'In this question of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 5 seconds to prepare. Then you will have 5 seconds to speak. ',
      'max_score': 5,
      'sample_answer': 'Sample Answer of question 6',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({'type': 'part1', 'questionCount': 6});

  for (int i = 1; i <= 6; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testSW/part1/$id.jpg';

    final q = part1Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part1')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
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

  // // === PART 2 === WRITING
  final part2Questions = [
    {
      'type': 'Write a sentence based on a picture',
      'text': "girl, posing",
      'sample_answer': "Sample answer 1",
      'directions':
          'Write ONE sentence that is based on the picture using the TWO words or phrases under it. You may change the forms of the words and you may use them in any order.',
      'max_score': 3,
    },
    {
      'type': 'Respond to a written request ',
      'text':
          "Dear Sir/Madam, \n\nI am interested in joining your English course. Could you please provide me with information about the schedule and the tuition fee? \n\nThank you, \nAnna",
      'sample_answer': "Sample answer 2",
      'directions':
          'Respond to the e-mail as if you are a teacher. In your e-mail, give information about the schedule and the tuition fee and ask one question.',
      'max_score': 4,
    },
    {
      'type': 'Write an opinion essay',
      'text':
          "Do you agree or disagree with the following statement? \n\n“Teamwork is more important than individual work in the workplace.”",
      'sample_answer': "Sample answer 3",
      'directions':
          'Read the question below. Typically, an effective essay will contain a minimum of 300 words.',
      'max_score': 5,
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part2')
      .set({'type': 'part2', 'questionCount': 3});

  for (int i = 1; i <= 3; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'testSW/part2/$id.jpg';
    var imagePath = '';

    final q = part2Questions[i - 1];

    if (q['type'] == 'Write a sentence based on a picture') {
      imagePath = 'input_tests/testSW/part2/$id.jpg';
    }

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part2')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'imagePath': imagePath,
          'text': q['text'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': i,
        });
  }
}
