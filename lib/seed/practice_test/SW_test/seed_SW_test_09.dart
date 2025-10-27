// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest09() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_09';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 09',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 9,
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
          "Good evening and welcome to the City Performing Arts Center. Tonight's performance of 'The Symphony of Stars' will begin in approximately fifteen minutes. Please take a moment to locate the nearest emergency exit. The use of cameras and recording devices is strictly prohibited during the performance. Please ensure all mobile phones are turned off or set to silent mode. Thank you, and enjoy the show.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo trước buổi biểu diễn. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Are you planning a home renovation project? Visit 'Pro Builders Supply' for all your needs! We offer a wide selection of high-quality lumber, tools, paint, and hardware at competitive prices. Our knowledgeable staff is ready to assist you with expert advice. We are conveniently located on Highway 5, just past the river bridge. Pro Builders Supply – helping you build better!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo cửa hàng. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đang ngồi trên sàn nhà, sắp xếp lại các tài liệu.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a person sitting cross-legged on a wooden floor, possibly in an office or home setting. They are surrounded by papers and files and appear to be sorting through documents. The person is focused on the task, looking down at the papers in their hands. The area looks a bit cluttered due to the sorting process.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking you about your preferences for news consumption.
    {
      'type': 'Respond to questions',
      'text': "How do you usually get your news?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I usually get my news online through various news websites and apps on my smartphone. It's the most convenient way for me.",
    },
    {
      'type': 'Respond to questions',
      'text': "Do you prefer reading news articles or watching news videos?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I generally prefer reading news articles because I can scan them quickly and focus on the information that interests me the most.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "What are the advantages of getting news from multiple different sources?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Getting news from multiple sources provides a more balanced and comprehensive understanding of events. Different sources might have different perspectives or report on different aspects of a story. Comparing information from various outlets helps to identify potential bias and get a more complete picture. It prevents relying on a single viewpoint and encourages critical thinking about the information presented.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    // {
    //   'type': 'Respond to questions using information provided',
    //   'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
    //   // Image Content for sample: Lịch trình Xe buýt Đưa đón Hội nghị
    //   // Conference Shuttle Bus Schedule - Hotel to Convention Center
    //   // Departs Hotel Lobby:
    //   // - 7:30 AM
    //   // - 8:00 AM (Express)
    //   // - 8:30 AM
    //   // - 9:00 AM (Express)
    //   // Departs Convention Center (Main Entrance):
    //   // - 4:00 PM
    //   // - 4:30 PM (Express)
    //   // - 5:00 PM
    //   // - 5:30 PM (Express)
    //   // Note: Express buses run non-stop. Regular buses make one stop at City Hall. Journey time approx. 20 min (Express), 30 min (Regular).
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
          "What time does the first shuttle bus leave the hotel in the morning?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The first shuttle bus departs from the hotel lobby at 7:30 AM.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text':
          "I need to get back to the hotel after 5 PM. What time is the last express bus from the convention center?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The last express bus departing from the convention center is scheduled for 5:30 PM.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      'text':
          "How long does the 8:30 AM bus from the hotel take to reach the convention center, and does it make any stops?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The 8:30 AM bus from the hotel is a regular bus, not an express one. According to the notes, regular buses take approximately 30 minutes to reach the convention center, and they make one stop at City Hall along the way.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Mark Tanaka calling. I ordered a custom sign for my new business from your company last week, order #SGN-101. The confirmation said it would be ready for pickup today. I just drove all the way across town to your shop, but the person at the counter says it's not ready and might take two more days because of an equipment problem. This is really inconvenient as my grand opening is tomorrow morning, and I need that sign. What can you do to help me get my sign by tomorrow morning?",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hello Mr. Tanaka, this is [Your Name], the manager at [Sign Company Name]. I sincerely apologize for the misinformation and the inconvenience regarding your sign order #SGN-101. I understand you need it for your grand opening tomorrow. I've just checked with production; while our main machine did have an unexpected issue, we have a backup machine. I will personally prioritize your order right now. We can definitely complete the sign today. To make up for your wasted trip, I can offer two solutions: we can either have the sign delivered directly to your business address free of charge by the end of today, or, if you prefer, you can pick it up yourself anytime after 6 PM this evening. Please let me know which option works best for you.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people prefer jobs that involve working alone, while others prefer jobs that require working in a team. Which type of work environment do you prefer and why?",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Personally, I prefer jobs that involve working in a team rather than working alone. While working alone allows for focus and independence, I find teamwork to be more stimulating and ultimately more productive. Firstly, collaborating with others brings diverse perspectives and skills together, which often leads to better ideas and solutions than one person could achieve alone. For example, brainstorming sessions with colleagues can spark creativity and uncover approaches I might not have considered. Secondly, working in a team provides opportunities for learning and mutual support. You can learn from colleagues' expertise, and team members can help each other overcome challenges. While teamwork requires good communication and coordination, I find the shared success and camaraderie make the work environment more enjoyable and effective.",
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
      // Image Description: Một người đang tưới cây trong vườn bằng vòi nước.
      'text': "man, hose",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The man is watering the garden plants with a long green hose.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Hai người đang ngồi đối diện nhau tại bàn và nói chuyện.
      'text': "people, talking",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "Two people are sitting at a table talking to each other.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang chỉ vào màn hình laptop cho đồng nghiệp.
      'text': "woman, screen",
      'record_time': 0,
      'sample_answer':
          "The woman is showing her colleague something important on the computer screen.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một người đang xếp vali vào cốp xe.
      'text': "man, luggage",
      'record_time': 0,
      'sample_answer':
          "A man is putting his luggage into the trunk of the car.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Các nhạc công đang chơi nhạc trong phòng thu.
      'text': "musicians, studio",
      'record_time': 0,
      'sample_answer':
          "The musicians are recording music together in the studio.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Springfield Community Center\nSubject: Update: Yoga Class Schedule Change\n\nDear Yoga Students,\n\nDue to unforeseen circumstances, the Thursday evening yoga class (7 PM) with instructor Jane Smith will be moved to Studio B instead of Studio A for the next four weeks, starting this Thursday.\n\nPlease let us know two things: First, confirm that you have received this notification. Second, tell us if this room change poses any significant problem for you.\n\nWe apologize for the inconvenience.\nSincerely,\nCommunity Center Staff",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Community Center Staff,\n\nThank you for the notification regarding the room change for the Thursday evening yoga class.\n\nI confirm that I have received this information. The change to Studio B for the next four weeks does not pose any problem for me; I am still planning to attend.\n\nCould you please confirm if Studio B has the same capacity as Studio A, or if the class size will be affected?\n\nThank you,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as a student in the yoga class. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: HR Department\nSubject: New Employee Mentorship Program - Volunteers Needed\n\nHi Team,\n\nWe are launching a new mentorship program to help new employees adjust to our company culture and their roles. We are looking for experienced employees to volunteer as mentors.\n\nIf you are interested, please reply with two pieces of information: First, briefly describe your current role and how long you have been with the company. Second, let us know why you believe you would be a good mentor.\n\nMentors will typically meet with their mentee once or twice a month.\nThanks,\nHR Department",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear HR Department,\n\nI am interested in volunteering for the new Employee Mentorship Program.\n\nI currently work as a Senior Marketing Specialist and have been with the company for five years. In my role, I manage several key client accounts and contribute to campaign strategy.\n\nI believe I would be a good mentor because I enjoy helping others learn and grow. I have a good understanding of our company culture and processes, and I remember how helpful it was to have guidance when I first started here. I am patient and a good listener.\n\nCould you please provide more details on the expected time commitment per meeting for mentors?\n\nSincerely,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as an interested employee. Provide the TWO requested pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people think that governments should spend more money on developing public transportation (like buses and trains). Others believe that more money should be spent on building and repairing roads for private cars. Which area do you think deserves more investment and why? Use specific reasons and examples to support your opinion.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The allocation of public funds between public transportation and road infrastructure for private vehicles is a critical issue facing many cities. While maintaining roads is necessary, I firmly believe that governments should prioritize significantly greater investment in developing and improving public transportation systems.\n\nFirstly, robust public transportation is essential for environmental sustainability. Buses and trains can move large numbers of people much more efficiently than individual cars, drastically reducing greenhouse gas emissions and traffic congestion. Investing in electric buses or expanding rail networks, for example, directly combats air pollution and contributes to greener cities. Relying solely on roads encourages more car use, exacerbating environmental problems and consuming vast amounts of land for pavement and parking.\n\nSecondly, accessible and affordable public transportation promotes social equity. Not everyone can afford to own and maintain a private car. Good public transit provides essential mobility for students, low-income workers, the elderly, and people with disabilities, connecting them to jobs, education, healthcare, and community resources. Spending primarily on roads disproportionately benefits car owners, potentially leaving others behind. A comprehensive bus or subway system ensures that all citizens have viable transportation options.\n\nFurthermore, investing in public transit can lead to significant long-term economic benefits. Reduced traffic congestion saves commuters time and reduces fuel consumption. Efficient transit systems also make cities more attractive places to live and work, potentially boosting local economies. While road repairs are needed, continually expanding road capacity often induces more traffic, creating a costly cycle. Investing in high-capacity transit offers a more sustainable solution.\n\nIn conclusion, while roads require maintenance, the environmental, social equity, and long-term economic advantages of investing in public transportation are far more compelling. Prioritizing buses, trains, and other shared transit options is crucial for creating more sustainable, equitable, and livable cities.",
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
