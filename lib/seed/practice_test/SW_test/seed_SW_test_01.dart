// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest01() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testSW_full_01'; // Using a new ID for the full test

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 01',
        'parts': ['speaking', 'writing'],
        'createdAt': FieldValue.serverTimestamp(),
        'order': 1,
      });

  // =======================================================================
  // ========================== SPEAKING SECTION ===========================
  // =======================================================================
  // NOTE: The TOEIC Speaking test has 11 questions.

  final speakingQuestions = [
    // --- Q1: Read a text aloud ---
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
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Attention, all employees. The fire alarm system will be tested tomorrow morning at 10:00 A.M. The alarm will sound for approximately one minute. You do not need to evacuate the building during this test. This is a routine check to ensure our safety systems are functioning correctly. Thank you for your cooperation.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'A clear, well-paced reading with proper intonation and pronunciation, similar to a professional announcer. Example: (reading the text smoothly and clearly)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
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
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine you are talking about hobbies.
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
      'type': 'Respond to questions',
      'text': "How often do you get to do this activity?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I try to go hiking almost every weekend, especially in the spring and fall when the weather is nice. I usually go to a nearby national park.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "Describe a memorable experience you had while enjoying your hobby.",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "A memorable experience was when I hiked to the top of a small mountain just before sunrise. It was challenging to hike in the dark, but watching the sun come up over the valley was absolutely breathtaking. The colors were incredible, and it was so peaceful. It made the early morning and the difficult climb completely worth it.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text':
          "You will answer three questions based on the information provided. You will have 45 seconds to read the information before the questions begin.",
      'prepare_time': 45,
      'record_time': 0, // This is preparation time for the whole group.
      'directions':
          'You will have 3 seconds of preparation time before each question. You will have 15 seconds to respond to questions 7 and 8 and 30 seconds to respond to question 9.',
      'max_score': 3,
      'sample_answer': '',
    },
    {
      'type': 'Respond to questions using information provided',
      'text':
          "What time does the conference start, and where is the first event held?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The conference starts at 9:00 AM with the Welcome Address, which is held in the Main Hall.",
    },
    {
      'type': 'Respond to questions using information provided',
      'text':
          "I'm interested in the Social Media Marketing session. Could you tell me what time that is?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Certainly. The Social Media Marketing session is scheduled for 1:30 PM, and it will be in Room B.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Mark. I'm calling about the team meeting scheduled for 2 PM tomorrow. I've just realized I have a conflicting appointment with an important client at the same time that I can't reschedule. I really need to be at the team meeting to discuss the project budget. I'm not sure what to do. Please call me back and let me know your thoughts.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hi Mark, this is [Your Name] returning your call. I understand you have a scheduling conflict with the team meeting and an important client appointment. I think the best solution would be to reschedule our team meeting. Since the budget discussion is important, how about we move the meeting to 3 PM tomorrow instead? That should give you enough time to finish with your client. Alternatively, you could join the first part of our meeting remotely via phone to discuss the budget, and then leave for your client appointment. Please let me know which option works best for you.",
    },
    // --- Q11: Express an opinion ---
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
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('speaking')
      .set({'type': 'Speaking', 'questionCount': 11});

  for (int i = 0; i < speakingQuestions.length; i++) {
    final questionNumber = i + 1;
    final id = 'q${questionNumber.toString().padLeft(2, '0')}';
    final q = speakingQuestions[i];

    await db
        .collection('practice_tests')
        .doc('SW_practice_tests')
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc('speaking')
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
          'order': questionNumber,
        });
  }

  // =======================================================================
  // ========================== WRITING SECTION ============================
  // =======================================================================
  // NOTE: The TOEIC Writing test has 8 questions.

  final writingQuestions = [
    // --- Q1-5: Write a sentence based on a picture ---
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q01.jpg',
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
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: A person is typing on a laptop in a cafe.
      'text': "woman, laptop",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "The woman is working on her laptop while enjoying a coffee at the cafe.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: A group of people are listening to a presentation.
      'text': "audience, listening",
      'record_time': 0,
      'sample_answer':
          "The audience is listening intently to the speaker's presentation.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: A person is shopping for vegetables at a market.
      'text': "customer, choosing",
      'record_time': 0,
      'sample_answer':
          "A customer is carefully choosing fresh vegetables at an outdoor market.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: A plane is taking off from a runway.
      'text': "plane, taking off",
      'record_time': 0,
      'sample_answer':
          "The plane is taking off from the runway under a clear blue sky.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
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
      'type': 'Respond to a written request',
      'text':
          "From: Customer Service\nSubject: Inquiry about your recent complaint\n\nDear Valued Customer,\n\nWe received your e-mail about the issue with your recent order (#5501). You mentioned the item arrived damaged. To help us resolve this, could you please provide two pieces of information? First, describe the damage in more detail. Second, please tell us whether you would prefer a replacement or a full refund.\n\nWe apologize for the inconvenience.\nSincerely,\nCustomer Service",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Customer Service,\n\nThank you for your prompt reply regarding my complaint about order #5501.\n\nThe item, a ceramic vase, arrived with a large crack running down one side, making it unusable. The shipping box itself did not appear damaged, so the item may have been packed poorly.\n\nI would prefer to receive a replacement rather than a refund. Could you please confirm when a new item will be shipped?\n\nThank you for your assistance.\nSincerely,\n[Your Name]",
      'directions': 'You will have 10 minutes to read and answer the e-mail.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
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
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('writing')
      .set({'type': 'Writing', 'questionCount': 8});

  for (int i = 0; i < writingQuestions.length; i++) {
    final questionNumber = i + 1;
    final id = 'q${questionNumber.toString().padLeft(2, '0')}';
    final q = writingQuestions[i];

    await db
        .collection('practice_tests')
        .doc('SW_practice_tests')
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc('writing')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'imagePath': q['imagePath'] ?? null,
          'text': q['text'],
          'record_time': q['record_time'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': questionNumber,
        });
  }

  print('Successfully seeded full TOEIC S&W test with ID: $testId');
}
