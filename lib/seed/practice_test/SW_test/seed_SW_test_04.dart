// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest04() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_04';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 04',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 4,
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
          "Join us this Saturday for the annual City Park Cleanup event! We'll meet at the main entrance at 9 AM and work together to pick up litter and beautify our park. Gloves and trash bags will be provided, but please bring your own water bottle. Afterwards, enjoy complimentary refreshments and socialize with fellow volunteers. Let's make our park shine! Sign up on the city's website.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo kêu gọi tình nguyện. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Before operating this machinery, please ensure you have read the safety manual thoroughly. Always wear the required protective gear, including safety glasses and gloves. Keep the work area clear of obstructions. If you encounter any problems or malfunctions, do not attempt to fix them yourself. Report the issue immediately to your supervisor.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một hướng dẫn an toàn. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đang đứng thuyết trình trước biểu đồ cột trên màn hình lớn.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a person giving a presentation in what looks like an office or conference room. The presenter, possibly a man in a business suit, is standing and facing away from the camera, gesturing towards a large screen. On the screen, there is a bar chart displaying some data, perhaps sales figures or project progress. The room appears modern, and the focus is clearly on the presentation being delivered.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine you are talking about your favorite type of movie.
    {
      'type': 'Respond to questions',
      'text': "What kind of movies do you enjoy watching the most?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I enjoy watching science fiction movies the most. I love the imaginative concepts and futuristic settings they often explore.",
    },
    {
      'type': 'Respond to questions',
      'text': "Why do you like this type of movie?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I like them because they make me think about possibilities beyond our current reality and often raise interesting questions about technology and society.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "Describe a favorite science fiction movie you have seen recently.",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "A favorite science fiction movie I saw recently is called 'Dune'. It's based on a famous novel and has incredible world-building and stunning visuals. The story is complex, dealing with politics, ecology, and destiny on a desert planet. I really enjoyed the grand scale of the film and the intricate plot. The special effects were also amazing.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    // {
    //   'type': 'Respond to questions using information provided',
    //   'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
    //   // Image Content for sample: Lịch trình Hội thảo Nhiếp ảnh Kỹ thuật số
    //   // Digital Photography Workshop - Saturday, Dec 14
    //   // 9:00 AM - 9:30 AM: Check-in & Coffee
    //   // 9:30 AM - 11:00 AM: Understanding Your Camera Settings (John Smith)
    //   // 11:00 AM - 11:15 AM: Break
    //   // 11:15 AM - 12:45 PM: Composition Techniques (Laura Chen)
    //   // 12:45 PM - 1:45 PM: Lunch (On your own)
    //   // 1:45 PM - 3:15 PM: Introduction to Photo Editing Software (John Smith)
    //   // 3:15 PM - 4:00 PM: Q&A / Practice Session
    //   'text':
    //       "You will answer three questions based on the information provided. You will have 45 seconds to read the information before the questions begin.",
    //   'prepare_time': 45, // Time to read the schedule
    //   'record_time': 0,
    //   'directions':
    //       'You will have 3 seconds of preparation time before each question. You will have 15 seconds to respond to questions 7 and 8 and 30 seconds to respond to question 9.',
    //   'max_score': 3,
    //   'sample_answer': '',
    // },
    {
      // Q7 - Specific detail
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text':
          "What is the topic of the first session, and what time does it start?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The first session is 'Understanding Your Camera Settings', and it starts at 9:30 AM.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text': "Is lunch provided at the workshop?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "No, according to the schedule, the lunch break from 12:45 PM to 1:45 PM is 'On your own'.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text':
          "Will John Smith be presenting anything besides the session on camera settings?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, John Smith is presenting another session. In addition to the morning session on camera settings, he will also be leading the afternoon session from 1:45 PM to 3:15 PM, which is an 'Introduction to Photo Editing Software'.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is David from the Marketing Department. I'm calling because the color printer on our floor isn't working – it keeps showing a 'paper jam' error, but I've checked everywhere and there's no paper stuck inside. I really need to print some color brochures for a client meeting this afternoon. The black and white printer is working, but these need to be in color. What should I do? Please call me back soon.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hi David, this is [Your Name] from IT Support returning your call about the color printer issue. I understand you've checked for a paper jam and need the brochures printed in color this afternoon. Since restarting the printer hasn't worked, I suggest two options. First, you could try using the color printer located on the floor above yours, the 5th floor, near the break room. It's the same model. Second, if you e-mail me the brochure file, I can print it for you here at the IT help desk on our high-quality color printer and have it ready for you to pick up within the hour. Please let me know which option you prefer.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people think that online shopping will eventually replace traditional physical stores completely. Do you agree or disagree with this view? Give specific reasons and examples to support your opinion.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "While online shopping offers undeniable convenience, I disagree that it will completely replace traditional physical stores. I believe physical stores offer unique advantages that online shopping cannot replicate. Firstly, many shoppers value the ability to see, touch, and try products before buying, especially for items like clothing, furniture, or electronics. For example, trying on shoes ensures a proper fit, which is difficult to guarantee online. Secondly, physical stores provide immediate gratification – you can take the product home right away, unlike waiting for shipping. Lastly, shopping in stores can be a social experience, an outing with friends or family, which online shopping lacks. Therefore, while online shopping will continue to grow, I think physical stores will always have a place by offering tangible experiences and immediate availability.",
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
      // Image Description: Một người đang trả tiền cà phê bằng điện thoại.
      'text': "customer, paying",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The customer is paying for his coffee using his mobile phone.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Xe đạp đậu cạnh hàng rào công viên.
      'text': "bicycle, parked",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "A bicycle is parked next to a fence bordering the park.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang phát biểu tại bục giảng.
      'text': "woman, speaking",
      'record_time': 0,
      'sample_answer':
          "The woman is speaking confidently at a podium during a conference.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Thợ sửa ống nước đang làm việc dưới bồn rửa.
      'text': "plumber, fixing",
      'record_time': 0,
      'sample_answer': "The plumber is fixing a leak under the kitchen sink.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang chạy bộ dọc bờ biển vào buổi sáng.
      'text': "man, running",
      'record_time': 0,
      'sample_answer': "A man is running along the beach early in the morning.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Anna Petrova\nSubject: Information Request - Photography Club\n\nHello,\n\nI'm a new employee and I heard about the company photography club. I'm interested in joining.\n\nCould you please provide two pieces of information? First, how often does the club meet? Second, are there any membership fees?\n\nThank you,\nAnna Petrova",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Anna,\n\nWelcome to the company! We're happy to hear you're interested in the photography club.\n\nTo answer your questions: The club usually meets twice a month, typically on the first and third Wednesday evenings, for photo walks or sharing sessions. There are no formal membership fees to join the club; activities are usually free unless we organize a special workshop or outing that has costs involved.\n\nAre you interested in any specific type of photography, like portraits or landscapes?\n\nBest regards,\n[Your Name]\nPhotography Club Organizer",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as if you are the organizer of the photography club. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Client Services\nSubject: Follow-up on recent service call\n\nDear Valued Client,\n\nOur records show that a technician visited your office yesterday to repair your internet connection (Ticket #SVC-500). We hope the issue was resolved to your satisfaction.\n\nTo help us improve our service, could you please reply with two pieces of information? First, was the technician professional and courteous? Second, is your internet connection now working correctly?\n\nThank you for your feedback.\nSincerely,\nClient Services",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Client Services,\n\nThank you for following up on the service call (Ticket #SVC-500) yesterday.\n\nYes, the technician who visited was very professional and courteous. He explained the problem clearly and worked efficiently.\n\nRegarding the connection, yes, my internet is now working correctly again. The issue seems to be completely resolved.\n\nCould you please confirm if there will be any charge for this service call?\n\nSincerely,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as the client. Provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people think that it is important for coworkers to socialize together outside of work hours (e.g., have dinner, attend events). Others believe that work relationships should remain strictly professional and separate from personal life. What is your opinion? Use specific reasons and examples to support your view.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The extent to which coworkers should socialize outside of work is a common point of discussion in modern workplaces. While maintaining professional boundaries is important, I believe that occasional, voluntary socializing among coworkers outside of work hours can be beneficial for building stronger teams and a more positive work environment.\n\nFirstly, informal social interactions can foster better communication and collaboration within a team. When colleagues get to know each other on a more personal level, it can break down barriers and build trust. This improved rapport often translates into smoother teamwork and more open communication back in the office. For example, sharing a casual dinner might reveal common interests or perspectives that colleagues were unaware of, making them more comfortable approaching each other with work-related questions or ideas later on.\n\nSecondly, company-sponsored or informal social events can significantly boost employee morale and create a sense of belonging. Feeling connected to one's colleagues as people, not just as roles, can make the workplace feel more supportive and enjoyable. Attending a company picnic or joining a team for after-work drinks, for instance, allows employees to relax together and celebrate successes, strengthening team cohesion and loyalty to the company. This can be particularly important for retaining employees in the long term.\n\nHowever, it is crucial that such socializing remains optional and respects personal boundaries. Forcing interaction or creating an environment where employees feel obligated to participate can be counterproductive. The key is to provide opportunities for connection without pressure. Furthermore, discussions should remain appropriate, avoiding excessive gossip or work complaints that could negatively impact professional relationships.\n\nIn conclusion, while work relationships must maintain professionalism, encouraging voluntary social interaction outside of work can yield significant benefits in terms of teamwork, communication, and morale. Finding a healthy balance, where socializing is an option rather than an obligation, creates a more positive and collaborative workplace culture.",
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
