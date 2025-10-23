// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest05() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_05';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 05',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 5,
      });

  // =======================================================================
  // ========================== SPEAKING SECTION ===========================
  // =======================================================================
  // TOEIC Speaking có 11 câu hỏi.

  final speakingQuestions = [
    // --- Q1: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Looking for delicious, authentic Italian food? Come visit 'Pasta Bella'! We offer a wide variety of pasta dishes, pizzas, and classic entrees, all made with fresh ingredients. Enjoy our cozy atmosphere and friendly service. We are located at 35 Park Avenue, and we're open for lunch and dinner seven days a week. Reservations are recommended for weekend evenings. We hope to see you soon at Pasta Bella!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo nhà hàng. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Thank you for attending today's workshop on effective time management. We hope you found the strategies and techniques discussed to be helpful. Please remember to complete the feedback form before you leave; your input is valuable to us. Handouts from today's sessions are available at the front desk. Have a productive afternoon!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo kết thúc hội thảo. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đàn ông đang đổ xăng cho ô tô tại trạm xăng.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a man refueling his car at a gas station. He is standing next to a red car and holding the gas pump nozzle, inserting it into the car's fuel tank. The gas station looks modern, with the pump displaying digital numbers. The man is wearing casual clothes. It appears to be daytime, possibly during a routine stop to get gas.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking you about your reading habits.
    {
      'type': 'Respond to questions',
      'text': "Do you enjoy reading books?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "Yes, I really enjoy reading books. It's one of my favorite ways to relax and learn new things in my spare time.",
    },
    {
      'type': 'Respond to questions',
      'text': "What kinds of books do you usually read?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I mostly read non-fiction books, especially history and science. I find learning about the past and how things work very fascinating.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "Describe a book you read recently that you found particularly interesting.",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I recently read a book called 'Sapiens' by Yuval Noah Harari. It was incredibly interesting because it covered the entire history of humankind, from our earliest ancestors to the present day. It made me think about history and society in a completely new way. The author presented complex ideas very clearly, and I learned so much about why our world is the way it is.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Làm vườn Cộng đồng
      // Community Gardening Workshop - Saturday, July 13
      // 9:00 AM - 9:30 AM: Welcome & Introduction (Garden Shed)
      // 9:30 AM - 10:30 AM: Soil Preparation Basics (Plot A) - David Miller
      // 10:30 AM - 10:45 AM: Break
      // 10:45 AM - 11:45 AM: Planting Techniques (Plot B) - Sarah Chen
      // 11:45 AM - 12:30 PM: Pest Control Methods (Garden Shed) - David Miller
      // 12:30 PM: Workshop Ends
      'text':
          "You will answer three questions based on the information provided. You will have 45 seconds to read the information before the questions begin.",
      'prepare_time': 45, // Time to read the schedule
      'record_time': 0,
      'directions':
          'You will have 3 seconds of preparation time before each question. You will have 15 seconds to respond to questions 7 and 8 and 30 seconds to respond to question 9.',
      'max_score': 3,
      'sample_answer': '',
    },
    {
      // Q7 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Where will the session on planting techniques be held?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The session on Planting Techniques will be held at Plot B.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "What time does the workshop end?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "According to the schedule, the workshop ends at 12:30 PM.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Could you tell me all the sessions that David Miller is presenting?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, David Miller is presenting two sessions. First, he's leading the session on 'Soil Preparation Basics' from 9:30 AM to 10:30 AM at Plot A. Then, later in the morning, he's presenting 'Pest Control Methods' from 11:45 AM to 12:30 PM in the Garden Shed.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Kenji Tanaka. I'm calling from conference room B. We're supposed to start a video conference call with our client in Tokyo in 10 minutes, but the video conferencing equipment doesn't seem to be working. The screen is blank, and I can't get it to turn on. I've checked the power cords. The client is waiting, and this is an important call. Can someone from IT come help immediately? Please call me back on my mobile, 555-9876.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hello Mr. Tanaka, this is [Your Name] from IT Support. I understand the video conferencing equipment in Room B isn't working, and your important call starts soon. I'm dispatching a technician to Room B right now; they should arrive within 5 minutes to troubleshoot the equipment directly. As a backup plan, if the technician cannot fix the main system quickly, there is a portable video conferencing unit available. The technician can help you set that up using the room's projector as an alternative. Another option, if needed, is to quickly move your meeting to Conference Room C down the hall, which I've confirmed is free and has identical equipment. The technician will assist with whichever solution works best to get your call started on time.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Do you think it is better for students to study alone or to study in groups? Give specific reasons and examples to support your opinion.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "In my opinion, while studying alone is necessary for focused learning, studying in groups offers unique benefits that make it a better overall approach for many students. Group study encourages collaboration and discussion, which can lead to a deeper understanding of the material. For example, when students explain concepts to each other, it reinforces their own learning, and hearing different perspectives can clarify complex topics. I remember struggling with a math concept, but a classmate explained it in a way that finally made sense. Furthermore, group study helps develop important teamwork and communication skills, which are valuable in academic and professional life. While individual study time is crucial for concentration and memorization, the interactive nature of group study often leads to more robust learning and skill development.",
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
  // TOEIC Writing có 8 câu hỏi.

  final writingQuestions = [
    // --- Q1-5: Write a sentence based on a picture ---
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q01.jpg',
      // Image Description: Một người đang chỉ vào màn hình laptop cho người khác xem.
      'text': "man, showing",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The man is showing his colleague something on the laptop screen.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Một ban nhạc đang biểu diễn trên sân khấu ngoài trời.
      'text': "band, performing",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "A band is performing energetically on an outdoor stage.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang tưới cây trong nhà bằng bình xịt.
      'text': "woman, spraying",
      'record_time': 0,
      'sample_answer':
          "The woman is spraying water onto the leaves of her indoor plant.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Nhiều người đang đi bộ qua đường tại vạch kẻ đường.
      'text': "pedestrians, crossing",
      'record_time': 0,
      'sample_answer':
          "Several pedestrians are crossing the street at the crosswalk.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang xếp đồ vào thùng xe ô tô.
      'text': "man, loading",
      'record_time': 0,
      'sample_answer': "A man is loading boxes into the trunk of his car.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Springfield Library\nSubject: Overdue Book Reminder\n\nDear Library Patron,\n\nOur records indicate that the book 'The History of Art' (borrowed on May 1st) is now overdue. Please return it as soon as possible to avoid further fines.\n\nCould you please let us know when you expect to return the book? Also, please confirm if your contact information in our system is still correct.\n\nThank you,\nSpringfield Library Staff",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Springfield Library Staff,\n\nThank you for the reminder regarding the overdue book, 'The History of Art'.\n\nI apologize for the delay; I finished reading it but completely forgot to return it. I plan to bring it back to the library tomorrow afternoon, October 27th.\n\nYes, my contact information currently in your system should still be correct. Could you please tell me the amount of the overdue fine I will need to pay when I return the book?\n\nSincerely,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as the library patron. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Conference Organizer\nSubject: Speaker Confirmation Needed\n\nDear [Your Name],\n\nWe are finalizing the schedule for the upcoming Marketing Trends Conference. We have you scheduled to speak on 'Social Media Strategies' at 11:00 AM on Friday, September 20th.\n\nTo confirm your participation, could you please provide two pieces of information? First, confirm that this time slot still works for you. Second, please let us know if you will require any specific audio/visual equipment (e.g., projector, microphone).\n\nWe need this confirmation by the end of this week.\nThanks,\nConference Organizer",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Conference Organizer,\n\nThank you for the confirmation regarding my speaking engagement at the Marketing Trends Conference.\n\nYes, the 11:00 AM time slot on Friday, September 20th, still works perfectly for my presentation on 'Social Media Strategies'.\n\nRegarding equipment, I will require a standard projector compatible with a laptop (HDMI connection preferred) and a lavalier microphone.\n\nCould you please let me know approximately how long the presentation slot is, including time for Q&A?\n\nBest regards,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as the speaker. Provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Do you agree or disagree with the following statement?\n\n'Traveling to other countries is more valuable for education than reading books about them.'\n\nSupport your opinion with specific reasons and examples.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "Both traveling to foreign countries and reading books about them offer valuable educational experiences, but they engage different aspects of learning. While reading provides in-depth knowledge and context, I agree with the statement that actually traveling to other countries is ultimately a more valuable educational experience due to its immersive and multi-sensory nature.\n\nFirstly, travel provides firsthand experiences that books cannot fully replicate. Being physically present in a different culture allows for direct interaction with its people, customs, food, and environment. For example, reading about the bustling markets of Marrakech can provide facts, but actually navigating the crowded alleys, smelling the spices, hearing the vendors, and tasting the local cuisine creates a much deeper and more memorable understanding. This sensory immersion engages learners on an emotional and practical level, solidifying knowledge in a way that purely academic study cannot.\n\nSecondly, traveling often forces individuals out of their comfort zones, fostering personal growth, adaptability, and problem-solving skills. Navigating unfamiliar transportation systems, communicating across language barriers, and adapting to different social norms are powerful learning experiences. Reading about a culture might explain its customs, but experiencing a misunderstanding and successfully navigating it teaches practical communication and cultural sensitivity far more effectively. These challenges build resilience and a broader worldview that are invaluable aspects of education.\n\nWhile books offer structured knowledge, historical context, and diverse perspectives that are essential for a comprehensive understanding, they lack the immediacy and transformative potential of direct experience. Travel complements reading by bringing abstract concepts to life.\n\nIn conclusion, although reading is a vital educational tool, the immersive, multi-sensory, and personally challenging nature of international travel provides a more profound and valuable form of education. It fosters not only knowledge but also empathy, adaptability, and a tangible connection to the global community.",
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

    // Chỉ gán imagePath cho câu hỏi Writing Q1-5
    String? imagePathValue = null;
    if (questionNumber >= 1 && questionNumber <= 5) {
      imagePathValue = 'SW_practice_tests/$testId/writing/$id.jpg';
    }

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
          'imagePath': imagePathValue,
          'text': q['text'],
          'record_time':
              q['record_time'], // Using record_time for writing time limit
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': questionNumber,
        });
  }

  print('Successfully seeded full TOEIC S&W test with ID: $testId');
}
