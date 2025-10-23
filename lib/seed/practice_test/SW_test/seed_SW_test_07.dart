// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest07() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_07';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 07',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 7,
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
          "This weekend, the City Art Museum proudly presents a special exhibition of landscape paintings. Explore stunning depictions of nature from various artists around the world. The exhibition is located in the West Wing gallery and runs through the end of the month. Admission is included with your regular museum ticket. Audio guides are available at the entrance for a small additional fee.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo viên bảo tàng. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Welcome to the Franklin Hotel. Check-in time is 3 PM, and check-out time is 11 AM. Our fitness center is located on the second floor and is open 24 hours a day for your convenience. The hotel restaurant serves breakfast from 7 AM to 10 AM. If you require any assistance during your stay, please dial zero to reach the front desk. Enjoy your stay with us!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một lời chào mừng tại khách sạn. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một nhóm người đang ngồi quanh bàn tròn, uống cà phê và nói chuyện trong quán cà phê.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture depicts a small group of people, perhaps friends or colleagues, sitting around a circular table inside a coffee shop. They each have drinks, likely coffee or tea, in front of them. They appear relaxed and engaged in conversation, smiling and looking at each other. The cafe has a warm atmosphere with comfortable seating. It looks like a casual social gathering.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking you about using public transportation.
    {
      'type': 'Respond to questions',
      'text': "How often do you use public transportation?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I use public transportation quite often, probably about four or five times a week, mainly for commuting to work.",
    },
    {
      'type': 'Respond to questions',
      'text': "What type of public transportation is most common in your city?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "In my city, buses are the most common form of public transportation. We also have a subway system, but the bus network is more extensive.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "What are some advantages of using public transportation compared to driving a car?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "One major advantage is cost; using public transport is usually much cheaper than owning, insuring, and fueling a car. It's also better for the environment as it reduces the number of cars on the road. Another benefit is avoiding the stress of driving in traffic and finding parking. You can use the commute time to read or relax instead of focusing on driving.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Kỹ năng Lãnh đạo
      // Leadership Skills Seminar - Wednesday, May 22
      // 9:00 AM - 9:15 AM: Registration
      // 9:15 AM - 10:30 AM: Session 1: Effective Communication (Room 201) - David Miller
      // 10:30 AM - 10:45 AM: Coffee Break
      // 10:45 AM - 12:00 PM: Session 2: Team Motivation Strategies (Room 201) - Anna Petrova
      // 12:00 PM - 1:00 PM: Lunch (Cafeteria)
      // 1:00 PM - 2:30 PM: Session 3: Conflict Resolution (Room 202) - David Miller
      // 2:30 PM: Seminar Concludes
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
      'text': "What is the topic of the session presented by Anna Petrova?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Anna Petrova is presenting Session 2, and the topic is 'Team Motivation Strategies'.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Where will the Conflict Resolution session be held?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The Conflict Resolution session, which is Session 3, will be held in Room 202.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Could you tell me the start and end times for all the sessions presented by David Miller?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, David Miller is presenting two sessions. The first one, 'Effective Communication', runs from 9:15 AM to 10:30 AM. His second session, 'Conflict Resolution', is scheduled for the afternoon, starting at 1:00 PM and ending at 2:30 PM.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Sarah Chen calling from Room 305 at the Franklin Hotel. I'm here for the Innovate Conference. I just checked into my room, and the air conditioning doesn't seem to be working at all. It's quite warm in here, and I need to prepare for my presentation this afternoon. Could someone please come and fix it as soon as possible? Or perhaps move me to a different room? Please let me know what can be done. You can reach me on my room phone.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hello Ms. Chen, this is [Your Name] from the front desk at the Franklin Hotel. I'm very sorry to hear the air conditioning in Room 305 isn't working. I understand you need the room to be comfortable for your presentation preparation. I have two immediate solutions for you. First, I will send our maintenance engineer up right away to inspect the unit; sometimes it's a quick fix. While he is on his way, I can also offer to move you to a different room immediately. We have another standard room available on the same floor, Room 310, where the AC is working correctly. Please let me know if you'd prefer to wait briefly for maintenance or move to Room 310 right away.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people think that universities should focus only on academic subjects, while others believe they should also offer practical skills training (like job interviewing or financial management). Which approach do you think is better for students? Give specific reasons to support your opinion.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "I believe it's crucial for universities to offer both academic subjects and practical skills training. While a strong academic foundation is essential for critical thinking and specialized knowledge, practical skills are necessary for navigating life after graduation and succeeding in the workplace. For instance, knowing academic theories is important, but practical skills like effective communication, job interviewing, and personal financial management directly impact a graduate's ability to secure a job and manage their life responsibly. Offering workshops on resume writing or budgeting complements academic learning by preparing students for real-world challenges. Therefore, a balanced approach that integrates both rigorous academics and practical life skills provides the most comprehensive and beneficial education for students' future success.",
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
      // Image Description: Một người đang đẩy xe cắt cỏ trên bãi cỏ.
      'text': "man, mowing",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer': "The man is mowing the lawn in his front yard.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Hai người đang đi bộ và nói chuyện trên vỉa hè.
      'text': "people, sidewalk",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "Two people are walking and talking together on the city sidewalk.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một chiếc xe buýt đang dừng lại ở trạm chờ.
      'text': "bus, waiting",
      'record_time': 0,
      'sample_answer':
          "The bus is waiting at the bus stop for passengers to board.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một người đang xem hàng hóa trên kệ trong cửa hàng.
      'text': "customer, looking",
      'record_time': 0,
      'sample_answer':
          "A customer is looking carefully at products displayed on a store shelf.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang câu cá bên bờ sông.
      'text': "man, fishing",
      'record_time': 0,
      'sample_answer': "A man is fishing peacefully by the riverbank.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Mark Johnson\nSubject: Office Supply Order Request\n\nHi [Your Name],\n\nCould you please order some supplies for the marketing department? We are running low on printer paper (standard letter size) and blue ballpoint pens.\n\nPlease order about 10 reams of paper and 5 boxes of pens. Also, could you find out if our usual supplier offers recycled paper options?\n\nThanks,\nMark",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Mark,\n\nSure, I can place that supply order for the marketing department.\n\nI will order 10 reams of standard letter paper and 5 boxes of blue ballpoint pens as requested. I will also check with our usual supplier about their recycled paper options and let you know what I find out regarding availability and price.\n\nDo you need these supplies delivered by a specific date?\n\nBest regards,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as the person responsible for ordering supplies. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Conference Registration\nSubject: Incomplete Registration Information\n\nDear Registrant,\n\nThank you for registering for the upcoming Global Tech Summit. However, our records indicate that your registration is incomplete. We are missing two pieces of information: your company affiliation and your dietary restrictions (for the provided lunch).\n\nPlease reply to this e-mail with the missing details as soon as possible to finalize your registration.\n\nSincerely,\nConference Registration Team",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Conference Registration Team,\n\nThank you for your e-mail regarding my registration for the Global Tech Summit.\n\nMy apologies for the incomplete information. My company affiliation is Apex Solutions. Regarding dietary restrictions, I am vegetarian (no meat or fish, please).\n\nCould you please confirm once my registration is fully finalized with this information?\n\nThank you,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as the registrant. Provide the TWO missing pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people believe that failure is essential for learning and success. Others think that failure should be avoided at all costs. What is your opinion? Use specific reasons and examples to support your view.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The role of failure in achieving success is a topic often debated. While the immediate experience of failure can be discouraging, I strongly agree with the view that it is an essential component of learning and ultimate success, rather than something to be avoided entirely.\n\nFirstly, failure provides invaluable learning opportunities that success often cannot. When we fail, we are forced to analyze what went wrong, identify weaknesses in our approach, and adapt our strategies. This process of reflection and adjustment is crucial for growth. For example, a scientist whose experiment fails may learn more about the underlying principles from understanding the failure than if it had succeeded immediately. Thomas Edison famously viewed his many failed attempts at inventing the lightbulb not as failures, but as steps that eliminated unworkable solutions, bringing him closer to success.\n\nSecondly, experiencing and overcoming failure builds resilience and perseverance, qualities vital for long-term achievement. Success often requires persistence through setbacks. Individuals who are afraid to fail may avoid taking necessary risks or give up too easily when faced with challenges. In contrast, those who view failure as a temporary setback and a chance to learn are more likely to persevere and eventually reach their goals. Consider an entrepreneur whose first business venture fails; the lessons learned about the market, management, or finance can be directly applied to make their next venture more successful.\n\nOf course, this does not mean one should seek out failure. The goal is always success. However, the *fear* of failure should not paralyze action. Avoiding failure at all costs often leads to playing it too safe, hindering innovation and significant progress.\n\nIn conclusion, while failure is never the desired outcome, embracing it as a natural part of the learning process is essential for growth, resilience, and eventual success. The lessons derived from setbacks are often more profound than those learned from easy victories.",
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
