// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest08() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_08';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 08',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 8,
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
          "Good morning, passengers. Welcome aboard Flight 580 with service to Toronto. Our flight time today will be approximately two hours. Please ensure your carry-on luggage is stowed securely in the overhead compartments or under the seat in front of you. Once the cabin door is closed, all electronic devices must be set to airplane mode. We wish you a pleasant flight.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo viên hàng không. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Join us for the grand opening of 'Tech World', the city's newest electronics store! Discover the latest smartphones, laptops, TVs, and gadgets at incredible introductory prices. Doors open this Saturday at 10 AM. The first 100 customers will receive a special gift. Find us in the Westgate Shopping Center, next to the food court. Don't miss out on the excitement!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo khai trương. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đang ngồi tại bàn làm việc và viết gì đó vào sổ tay, có máy tính và cốc nước bên cạnh.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a person sitting at a desk and writing in a notebook. There is an open laptop on the desk to their left, and a glass of water to their right. The person seems focused on their writing. The desk appears organized, and the setting looks like an office or a study area. It appears to be daytime.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking you about watching sports.
    {
      'type': 'Respond to questions',
      'text': "Do you enjoy watching sports?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "Yes, I really enjoy watching sports, especially soccer and basketball. I find them very exciting and entertaining.",
    },
    {
      'type': 'Respond to questions',
      'text': "Where do you usually watch sports games?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I usually watch sports games at home on television. Sometimes, I go to a sports bar with friends to watch important matches.",
    },
    {
      'type': 'Respond to questions',
      'text': "Describe a memorable sports game you watched.",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "A memorable game I watched was the final match of the last World Cup. My favorite team was playing, and the game was incredibly tense, going into extra time. When my team scored the winning goal in the last few minutes, the atmosphere was electric, even just watching from home with my family. It was such an exciting and unforgettable moment.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Nhiếp ảnh (Khác đề 04)
      // Photography Workshop Schedule - Saturday, April 6
      // 10:00 AM - 10:15 AM: Welcome & Introduction (Studio 1)
      // 10:15 AM - 11:30 AM: Session 1: Mastering Exposure (Studio 1) - Lisa Ray
      // 11:30 AM - 11:45 AM: Break
      // 11:45 AM - 1:00 PM: Session 2: Lighting Techniques (Studio 2) - Mark Chen
      // 1:00 PM - 2:00 PM: Lunch (Provided)
      // 2:00 PM - 3:30 PM: Session 3: Portrait Photography (Studio 1) - Lisa Ray
      // 3:30 PM - 4:00 PM: Q&A and Closing
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
      'text': "What time does the workshop end?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The workshop ends at 4:00 PM, after the Q&A and Closing session.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Who is presenting the session on Lighting Techniques?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The session on Lighting Techniques is being presented by Mark Chen.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Could you tell me the topic and location of Lisa Ray's afternoon session?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, Lisa Ray's afternoon session is Session 3, focusing on 'Portrait Photography'. According to the schedule, it will take place from 2:00 PM to 3:30 PM in Studio 1.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is David Miller calling. I'm a guest in Room 502 at your hotel. I just tried to use the Wi-Fi, but I can't seem to connect. The network name appears, but when I enter the password provided at check-in, it says 'incorrect password'. I need to send some urgent work e-mails. Can someone help me get connected or provide the correct password? Please call me back in Room 502 as soon as possible.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hello Mr. Miller, this is [Your Name] from the hotel's front desk. I'm sorry you're having trouble connecting to the Wi-Fi in Room 502. Let's get this fixed for you. First, please double-check the password card you received; sometimes the letters and numbers can be easily confused. If you're sure you're entering it correctly, it's possible the password was recently updated. I can give you the current, verified password over the phone right now. Alternatively, I can send someone from our IT support team up to your room immediately to troubleshoot the connection directly on your device. Which option would you prefer?",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people believe that advertising encourages people to buy things they do not need. Others think that advertising provides useful information about products and services. What is your opinion? Give specific reasons to support your view.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "While advertising certainly aims to persuade, I believe its primary role is providing useful information, though it can sometimes encourage unnecessary purchases. Advertising informs consumers about new products, features, prices, and where to buy them. For example, ads for new energy-efficient appliances provide valuable information for homeowners looking to save money and help the environment. However, advertising also uses emotional appeals and creates desires, which can lead people to buy things they don't truly need, like the latest fashion trend or gadget. Ultimately, I think advertising serves both functions. It's a source of information, but consumers need to be mindful and critical to distinguish between genuine needs and advertised wants. Therefore, while informative, it does have the potential to promote unnecessary consumption.",
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
      // Image Description: Một người đang trả tiền cho tài xế taxi.
      'text': "passenger, paying",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The passenger is paying the taxi driver at the end of the ride.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Một nhóm người đang thảo luận quanh bàn họp.
      'text': "colleagues, discussing",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "Several colleagues are discussing business matters around a conference table.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang kiểm tra động cơ ô tô.
      'text': "mechanic, checking",
      'record_time': 0,
      'sample_answer':
          "The mechanic is checking the engine of the car in the garage.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Khán giả đang xem phim trong rạp.
      'text': "audience, watching",
      'record_time': 0,
      'sample_answer':
          "The audience is watching a movie intently in the dark theater.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang chạy bộ trong công viên vào ngày nắng.
      'text': "woman, park",
      'record_time': 0,
      'sample_answer': "A woman is jogging through the park on a sunny day.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Mark Davis\nSubject: Question about Invoice #INV-101\n\nHi Accounting Team,\n\nI received invoice #INV-101 for the recent software purchase. There seems to be a charge for 'Technical Support' that I don't recall agreeing to.\n\nCould you please provide two pieces of information? First, clarify what this technical support charge covers. Second, let me know if it's an optional service that can be removed.\n\nThanks,\nMark Davis",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Mark,\n\nThanks for reaching out about invoice #INV-101.\n\nThe 'Technical Support' charge covers one year of premium phone and e-mail support for the software you purchased. Yes, this is an optional add-on service; it wasn't automatically included with the software license.\n\nWould you like me to remove this charge from the invoice and issue a revised version reflecting only the software cost?\n\nBest regards,\n[Your Name]\nAccounting Department",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as someone from the Accounting Team. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Springfield Community Center\nSubject: Class Cancellation - Pottery\n\nDear Pottery Class Students,\n\nWe regret to inform you that the pottery class scheduled for this Thursday evening, July 11th, has been canceled due to instructor illness. We apologize for the short notice and any inconvenience.\n\nWe would like to offer two options: you can receive a full refund for this session, or you can attend a make-up class scheduled for next Tuesday evening, July 16th, at the same time.\n\nPlease reply to this e-mail by tomorrow to let us know your preference.\nSincerely,\nCommunity Center Staff",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Community Center Staff,\n\nThank you for informing us about the cancellation of the pottery class this Thursday due to the instructor's illness.\n\nI understand these things happen. Regarding the options, I would like to attend the make-up class scheduled for next Tuesday evening, July 16th.\n\nCould you please confirm if the make-up class will be held in the usual pottery studio?\n\nThank you,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as a student in the class. Provide ONE piece of information (your choice) and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people believe that companies should invest more money in developing new products. Others think that companies should focus more on improving the quality of their existing products. Which approach do you think is more important for a company's long-term success? Use specific reasons and examples to support your opinion.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The allocation of resources between developing new products and improving existing ones is a critical strategic decision for any company. While innovation through new product development is often seen as the primary driver of growth, I believe that focusing on improving the quality of existing products is ultimately more important for long-term, sustainable success.\n\nFirstly, enhancing existing products builds customer loyalty and trust. Customers who are satisfied with the quality, reliability, and continuous improvement of a product they already own are more likely to remain loyal to the brand and make repeat purchases. For example, smartphone companies that consistently provide software updates to improve performance and fix bugs on older models retain customers better than those who quickly abandon support for previous generations in favor of launching entirely new devices. This loyalty forms a stable revenue base and generates positive word-of-mouth marketing.\n\nSecondly, focusing on quality improvement can be a more efficient path to profitability. Developing entirely new products often involves significant research and development costs, marketing expenses, and the inherent risk of market failure. Improving existing products, on the other hand, leverages the company's established market position and customer base. Incremental improvements, better materials, or enhanced features based on customer feedback can lead to increased sales and market share with potentially lower risk and investment compared to launching something completely novel.\n\nWhile neglecting new product development entirely would lead to stagnation, a primary focus on refining and perfecting the current offerings ensures customer satisfaction, strengthens brand reputation, and provides a solid foundation from which to launch truly innovative products when the time is right. A company known for quality is more likely to succeed when it eventually does introduce something new.\n\nIn conclusion, although the allure of new product creation is strong, prioritizing the continuous improvement and quality enhancement of existing products is a more prudent and ultimately more vital strategy for ensuring a company's long-term success and customer loyalty.",
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
