// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest02() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_02';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 02',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 2,
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
          "Thank you for calling City Electric. Our customer service center is currently closed. Our business hours are Monday through Friday, 8 AM to 6 PM. If you are experiencing a power outage or other emergency, please press one. For billing inquiries, press two. Otherwise, please call back during our regular business hours. You can also manage your account online at cityelectric.com.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo viên chuyên nghiệp. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Looking for a great place to eat downtown? Come visit 'The Corner Bistro'! We offer delicious sandwiches, fresh salads, and homemade soups, perfect for a quick lunch or a relaxing dinner. We are located at the corner of Oak Street and Maple Avenue, just steps from the City Library. We're open daily from 11 AM to 9 PM. We look forward to serving you soon!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo trên radio. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đang đi xe đạp trên con đường quê, hai bên là cánh đồng.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a person riding a bicycle on a paved country road. On both sides of the road, there are green fields stretching into the distance. The sky is partly cloudy, and it looks like a pleasant day for cycling. The cyclist is wearing casual clothes and appears to be enjoying the ride in the peaceful countryside setting. There are no other people or vehicles visible in the picture.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine a marketing firm is doing research about transportation. You have agreed to participate in a telephone interview.
    {
      'type': 'Respond to questions',
      'text': "How do you usually travel to work or school?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I usually travel to work by public transportation. I take the subway because it's convenient and avoids traffic.",
    },
    {
      'type': 'Respond to questions',
      'text': "How long does your typical commute take?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "My typical commute takes about 45 minutes each way, including walking to and from the subway station.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "What do you like most about your way of commuting, and what do you dislike most?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "What I like most about taking the subway is that I can read or listen to music during my commute, which helps me relax. What I dislike most is probably how crowded it can get during rush hour; sometimes it's difficult to find a seat, and it can feel quite uncomfortable standing so close to many people.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Workshop Kỹ năng Viết Báo cáo
      // Report Writing Skills Workshop - Friday, Nov 8
      // 9:00 AM - 9:30 AM: Registration & Coffee
      // 9:30 AM - 11:00 AM: Session 1: Structuring Your Report (Dr. Allen)
      // 11:00 AM - 11:15 AM: Break
      // 11:15 AM - 12:30 PM: Session 2: Writing Clearly & Concisely (Ms. Baker)
      // 12:30 PM - 1:30 PM: Lunch (Provided)
      // 1:30 PM - 3:00 PM: Session 3: Editing & Proofreading (Dr. Allen)
      // 3:00 PM - 3:30 PM: Q&A and Wrap-up
      'text':
          "You will answer three questions based on the information provided. You will have 45 seconds to read the information before the questions begin.",
      'prepare_time': 45, // Time to read the schedule
      'record_time': 0,
      'directions':
          'You will have 3 seconds of preparation time before each question. You will have 15 seconds to respond to questions 7 and 8 and 30 seconds to respond to question 9.',
      'max_score': 3, // Each question Q7, Q8, Q9 is scored out of 3.
      'sample_answer': '', // No sample answer for the setup question itself.
    },
    {
      // Q7 - Specific detail
      'type': 'Respond to questions using information provided',
      'text':
          "What time does the first session start, and who is the presenter?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The first session, 'Structuring Your Report', starts at 9:30 AM, and the presenter is Dr. Allen.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text':
          "I'm particularly interested in the session about writing clearly. Could you tell me when that is?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Certainly. The session 'Writing Clearly & Concisely' is Session 2, scheduled from 11:15 AM to 12:30 PM.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Will Dr. Allen be presenting anything in the afternoon? I missed his morning session.",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, according to the schedule, Dr. Allen will be presenting again in the afternoon. He is leading Session 3, which is about 'Editing & Proofreading', from 1:30 PM to 3:00 PM. So you will still have a chance to hear him speak.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Sarah from Accounting. I'm calling because I received the catering invoice for the department lunch we had last Friday, and it seems incorrect. They charged us for 25 meals, but I only ordered for 20 people. I tried calling the catering company, 'Delicious Bites', but I keep getting their voicemail. I need to get this resolved quickly so I can submit the payment. Could you help me figure out what to do?",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hi Sarah, this is [Your Name]. I understand the catering invoice from 'Delicious Bites' shows a charge for 25 meals instead of the 20 you ordered, and you can't reach them. Here’s what I suggest: First, double-check your original order confirmation e-mail or document to verify you definitely ordered for 20. Then, try e-mailing 'Delicious Bites' with a copy of your order confirmation and explain the discrepancy on the invoice, requesting a corrected version. If you don't hear back via e-mail by tomorrow afternoon, let me know, and I can try calling their main office number or see if we have an alternative contact person for them. We definitely shouldn't pay the incorrect amount.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people believe that companies should focus primarily on maximizing profits, while others argue that companies also have a social responsibility (e.g., protecting the environment, treating employees fairly). Which view do you agree with more, and why?",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "I strongly believe that companies have a significant social responsibility that goes beyond simply maximizing profits. While profitability is essential for a company's survival and growth, focusing solely on it can lead to negative consequences for employees, the environment, and society as a whole. Companies rely on societal resources and infrastructure, so they have an obligation to act ethically. For example, a company that pollutes the environment might save costs initially but harms the community's health. Treating employees fairly not only is the right thing to do but also leads to higher morale and productivity. In the long run, businesses that demonstrate strong social responsibility often build better reputations and customer loyalty, which can ultimately contribute to sustainable profitability.",
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
      // Image Description: Một người đàn ông đang chỉ vào biểu đồ trong cuộc họp.
      'text': "man, pointing",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The man is pointing at a chart during the business meeting.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and you may use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Mọi người đang ăn tại nhà hàng ngoài trời.
      'text': "people, outdoor",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "Several people are enjoying their meal at an outdoor restaurant.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang trả tiền tại quầy thu ngân.
      'text': "customer, paying",
      'record_time': 0,
      'sample_answer': "The customer is paying the cashier for her purchases.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một con đường quanh co lên núi.
      'text': "road, mountain",
      'record_time': 0,
      'sample_answer':
          "A winding road leads up the side of the green mountain.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang chơi guitar một mình trên bãi biển.
      'text': "man, playing",
      'record_time': 0,
      'sample_answer':
          "A man is sitting alone on the beach playing his guitar.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Laura Chen\nSubject: Question about Gym Membership\n\nHi,\n\nI'm thinking about joining your gym. Could you please tell me what types of group fitness classes you offer? Also, I'd like to know if you have personal trainers available.\n\nThanks,\nLaura",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Laura,\n\nThank you for your interest in City Fitness!\n\nWe offer a wide variety of group fitness classes, including yoga, spinning, Zumba, and strength training. You can find the full class schedule on our website.\n\nYes, we do have certified personal trainers available. They can help you create a personalized workout plan to meet your fitness goals. Would you like me to send you more information about our trainers and their rates?\n\nSincerely,\n[Your Name]\nCity Fitness Staff",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Your response will be scored on quality and variety of sentences, vocabulary, organization, and grammar. You will have 10 minutes to read and answer the e-mail.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Project Manager\nSubject: Request for Project Update\n\nHi Team,\n\nCould someone please provide a brief update on the status of the 'BlueSky' project? Specifically, I need to know if the software testing phase is complete and if we are still on track to meet the final deadline of July 31st.\n\nPlease reply by the end of today.\nThanks,\nProject Manager",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Project Manager,\n\nRegarding the 'BlueSky' project status:\n\nThe software testing phase is nearly complete. The team has identified a few minor bugs, which are currently being fixed. We expect testing to be fully concluded by the end of tomorrow.\n\nYes, despite the minor bugs found, we are still on track to meet the final project deadline of July 31st. The remaining tasks are proceeding as scheduled. Could you clarify if the client presentation date is still firm for July 25th?\n\nBest regards,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as if you are a member of the project team.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people believe that technology has made people more isolated from each other, while others think it has brought people closer together. What is your opinion? Use specific reasons and examples to support your view.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "Technology's impact on social connection is a complex and often debated topic. While some argue that smartphones and social media have led to increased isolation, I believe that, on balance, technology has ultimately brought people closer together, albeit in different ways than in the past.\n\nOne major way technology fosters connection is by overcoming geographical barriers. Through video calls, instant messaging, and social media platforms, individuals can maintain close relationships with friends and family living far away. For instance, grandparents can witness their grandchildren's milestones in real-time via video chat, something impossible just a few decades ago. Similarly, professional teams can collaborate effectively across continents using shared documents and virtual meeting software, fostering a sense of global community that was previously unattainable.\n\nFurthermore, technology enables the formation of communities based on shared interests, regardless of physical location. Online forums, gaming communities, and special interest groups allow people to connect with like-minded individuals they might never have met otherwise. Someone with a niche hobby, like collecting rare stamps or practicing a specific craft, can find a vibrant online community that offers support, knowledge sharing, and a sense of belonging. This ability to connect over shared passions can combat feelings of isolation, especially for those who may feel different within their immediate physical environment.\n\nOf course, it is important to acknowledge the potential downsides. Excessive screen time and curated online personas can sometimes detract from face-to-face interaction and genuine connection. However, these are issues of usage patterns rather than inherent flaws in the technology itself. When used mindfully, technology serves as a powerful tool to supplement, rather than replace, traditional forms of social interaction.\n\nIn conclusion, while concerns about isolation are valid, the ability of technology to bridge distances and connect people with shared interests represents a significant net positive for human connection. It has expanded our social circles and redefined community, ultimately bringing us closer together in a globally interconnected world.",
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
