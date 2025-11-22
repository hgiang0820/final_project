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
      'text':
          "Welcome to the annual City Garden Show! This weekend, you can explore beautiful garden displays, attend workshops with expert gardeners, and purchase a wide variety of plants and tools. Don't forget to visit the main pavilion to see the award-winning floral arrangements. Tickets are available at the entrance. We hope you enjoy your visit and find plenty of inspiration for your own garden.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'A clear, well-paced reading with proper intonation and pronunciation, similar to a professional announcer. Example: (reading the text smoothly and clearly)',
    },
   {
      'type': 'Describe a picture',
      'imagePath': 'input_tests/testSW/part1/q02.jpg',
      // Image Description for sample: A group of colleagues in an office meeting room, looking at a laptop screen. One person is pointing at the screen.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a business meeting taking place in a modern office. There are four people gathered around a table, looking at a laptop. One woman is pointing at the screen, as if she is explaining something important. Everyone is dressed in professional business attire. The room is bright and has a large window in the background. It seems like they are collaborating on a project or reviewing some data together.",
    },
    {
      'type': 'Respond to questions',
      'text': "What do you enjoy doing in your free time?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. For each question, you will have 3 seconds to prepare. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "In my free time, I really enjoy hiking. I love being outdoors in nature and getting some exercise after a long week of work.",
    },
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'input_tests/testSW/part1/q04.jpg',
      'text':
          "What time does the conference start, and where is the first event held?",
      'prepare_time': 45,
      'record_time': 0, // This is preparation time for the whole group.
      'directions':
          'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer': 'The conference starts at 9:00 AM with the Welcome Address, which is held in the Main Hall.',
    },
    {
      'type': 'Express an opinion',
      'text':
          "Do you agree or disagree with the following statement? 'It is more important to have a job that you enjoy than to have a job with a high salary.' Give specific reasons and examples to support your opinion.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "I strongly agree that it's more important to have a job you enjoy than one with a high salary. First, we spend a significant portion of our lives at work, and being happy and fulfilled in our job leads to better overall well-being and lower stress. For example, a passionate teacher might not earn a lot, but they find great satisfaction in helping students learn. Second, when you enjoy your work, you are naturally more motivated and productive, which can lead to career advancement and potentially a higher salary in the long run. A high-paying but unenjoyable job can lead to burnout and unhappiness, which no amount of money can truly compensate for.",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({'type': 'part1', 'questionCount': 5});

  for (int i = 1; i <= 5; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testSW/part1/$id.jpg';

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
          'imagePath': q['imagePath'] ?? null,
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
      'imagePath': 'input_tests/testSW/part2/q01.jpg',
      // Image Description: Two people shaking hands across a desk.
      'text': "men, shaking hands",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The two men are shaking hands to finalize a business deal.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You can change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Mark Peterson\nSubject: Office Lunch Order\n\nHi Team,\n\nI'm ordering lunch for our team meeting tomorrow from 'The Sandwich Shop'. Please e-mail me your order by 4 PM today. The menu is attached.\n\nThanks,\nMark",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Mark,\n\nThanks for organizing lunch for the meeting tomorrow.\n\nMy order is the Turkey Club sandwich on whole wheat bread. For my side, I would like a garden salad, please.\n\nCould you please let me know if they have any vegetarian options? My colleague, Sarah, might need one.\n\nBest regards,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. You will have 10 minutes to read and answer each e-mail.',
      'max_score': 4,
    },
    {
      'type': 'Write an opinion essay',
      'text':
          "Do you agree or disagree with the following statement?\n\n'Learning a new language is more beneficial for a career than learning a new technical skill (like computer programming).'\n\nSupport your opinion with specific reasons and examples.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "In today's interconnected and technology-driven world, the debate over which skills are more valuable for career advancement is ongoing. While technical skills like computer programming are undeniably important, I strongly believe that learning a new language offers a more versatile and profound benefit for one's career.\n\nFirstly, language skills open doors to global markets and cross-cultural collaboration. In a globalized economy, companies increasingly operate across borders. An employee who can communicate in the language of a client or a foreign partner, such as Mandarin, Spanish, or German, becomes an invaluable asset. For example, a sales manager who can negotiate a deal in the client's native language is likely to build stronger rapport and achieve better results than one who relies solely on translators. This ability fosters trust and a deeper understanding of cultural nuances, which technical skills alone cannot provide.\n\nSecondly, the process of learning a new language develops crucial soft skills that are highly sought after in any profession. It enhances communication abilities, problem-solving skills, and cognitive flexibility. Learning grammar and vocabulary from a different linguistic system forces one's brain to think in new ways and adapt to different structures. This mental exercise translates directly into being a more adaptable and creative problem-solver in the workplace. A programmer might be able to write code, but a bilingual programmer who has honed their communication and adaptive thinking skills through language learning is better equipped to lead a diverse team or explain complex ideas to non-technical stakeholders.\n\nIn conclusion, while technical skills are essential for specific roles, the benefits of learning a new language are broader and more fundamental. It not only provides a practical tool for international communication but also cultivates a range of soft skills that enhance a professional's overall effectiveness and long-term career potential. Therefore, investing time in mastering another language is a more universally beneficial endeavor for career growth.",
      'directions':
          'In this part of the test, you will write an essay in response to a question that asks you to state, explain, and support your opinion on an issue. Typically, an effective essay will contain a minimum of 300 words. You will have 30 minutes to complete this part.',
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
    // var imagePath = '';

    final q = part2Questions[i - 1];

    // if (q['type'] == 'Write a sentence based on a picture') {
    //   imagePath = 'input_tests/testSW/part2/$id.jpg';
    // }

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part2')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'imagePath': q['imagePath'] ?? null,
          'text': q['text'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': i,
        });
  }
}
