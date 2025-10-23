// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package.file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest03() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_03';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 03',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 3,
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
          "Good afternoon, shoppers, and thank you for visiting Central Mall. We'd like to remind you that the mall will be closing in one hour, at 9 PM. Please make your final purchases and proceed to the nearest exit. Several of our restaurants located near the main entrance will remain open until 10 PM for dinner service. Thank you for shopping at Central Mall, and have a pleasant evening.",
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
          "Are you interested in improving your public speaking skills? Join our workshop next Saturday! Led by communication expert Dr. Annabelle Lee, this session will cover techniques for structuring a speech, managing nervousness, and engaging your audience. The workshop runs from 9 AM to 1 PM and includes practical exercises. Space is limited, so register online today at our website.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo hoặc thông báo sự kiện. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một người đàn ông đang ngồi trên ghế dài và sử dụng laptop, bên cạnh là một tách cà phê.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows a man sitting comfortably on a sofa or bench, possibly in a cafe or lounge area. He is focused on using a laptop computer placed on his lap. Next to him on the seat, there is a white coffee cup. The man is wearing casual clothing, including jeans and a sweater. The background is slightly blurred but appears to be an indoor setting with some ambient light.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine you are being interviewed about your job or studies.
    {
      'type': 'Respond to questions',
      'text': "What kind of work or studies are you currently doing?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I currently work as a software engineer for a technology company. My main focus is on developing mobile applications.", // Hoặc: "I am currently studying Marketing at City University."
    },
    {
      'type': 'Respond to questions',
      'text': "What is the most interesting part of your job or studies?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The most interesting part is problem-solving. I enjoy figuring out technical challenges and creating solutions that make the app work smoothly for users.", // Hoặc: "I find learning about consumer behavior the most interesting part of my marketing studies."
    },
    {
      'type': 'Respond to questions',
      'text':
          "What skills do you think are most important for success in your field?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "In software engineering, strong technical skills like coding and understanding algorithms are crucial. But equally important are problem-solving abilities, attention to detail, and good communication skills, especially when working in a team. Being able to adapt and learn new technologies quickly is also vital because the field is constantly changing.", // Hoặc tương tự cho Marketing.
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Sức khỏe & Sống khỏe
      // Wellness Workshop Schedule - Saturday, Oct 26
      // 10:00 AM - 10:45 AM: Morning Yoga (Studio A) - Jane Smith
      // 11:00 AM - 12:00 PM: Healthy Cooking Demo (Kitchen Lab) - Chef David Lee
      // 12:00 PM - 1:00 PM: Lunch Break
      // 1:00 PM - 2:00 PM: Stress Management Techniques (Room 101) - Dr. Evans
      // 2:15 PM - 3:00 PM: Introduction to Meditation (Studio A) - Jane Smith
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
      'text':
          "What time does the Healthy Cooking demonstration start, and where is it?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The Healthy Cooking demonstration starts at 11:00 AM, and it's located in the Kitchen Lab.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Who is leading the session on Stress Management Techniques?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The session on Stress Management Techniques is being led by Dr. Evans.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Are there any activities scheduled in Studio A during the afternoon?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, there is an activity in Studio A in the afternoon. After the lunch break, the 'Introduction to Meditation' session, presented by Jane Smith, is scheduled in Studio A from 2:15 PM to 3:00 PM.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Laura Chen calling from Apex Corporation. I'm supposed to have a video conference call with your sales manager, Mr. Tanaka, at 3 PM today. However, the meeting link he sent me doesn't seem to be working. I keep getting an error message. I've tried calling his direct line, but it went to voicemail. The call is quite important as we need to discuss the contract renewal. Can someone help me get the correct link or connect with Mr. Tanaka? Please call me back at 555-1234.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hello Ms. Chen, this is [Your Name] from [Mr. Tanaka's Company] returning your call. I'm sorry to hear you're having trouble with the meeting link for your 3 PM call with Mr. Tanaka. I see he is currently in another meeting, which might be why you couldn't reach him. Let me help you. First, I will check Mr. Tanaka's calendar for the correct video conference link for your meeting and e-mail it to you immediately at [Assume you can find her e-mail]. I'll also send a message to Mr. Tanaka alerting him to the link issue, just in case he needs to resend it or join via a different method. If you still have trouble connecting at 3 PM, please call me back directly at [Your Number], and I will try to connect you manually or get Mr. Tanaka on the line.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people prefer to take vacations in cities, while others prefer to spend their vacations in nature (like mountains or beaches). Which type of vacation do you prefer and why?",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Personally, I definitely prefer spending my vacations in nature, like at the beach or in the mountains, rather than in cities. While cities offer excitement and culture, I find nature vacations much more relaxing and rejuvenating. Firstly, being surrounded by natural beauty, like the ocean or forests, helps me disconnect from the stress of daily work life. The peace and quiet are very calming. For example, hiking in the mountains allows me to clear my head and get physical exercise. Secondly, I enjoy outdoor activities like swimming, hiking, or simply sitting by a lake, which aren't typically available in urban settings. These activities help me feel refreshed and energized. Although cities have museums and restaurants, I find the tranquility and beauty of nature to be a more effective way to recharge during a vacation.",
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
      // Image Description: Một người đang tưới cây bằng bình tưới.
      'text': "woman, watering",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The woman is watering the plants in her garden with a watering can.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Hai người đang đi bộ đường dài trên núi.
      'text': "people, hiking",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "Two people are hiking together on a scenic mountain trail.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đàn ông đang đọc báo trên tàu.
      'text': "man, reading",
      'record_time': 0,
      'sample_answer':
          "A man is reading a newspaper while commuting on the train.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một người đang chơi guitar trên đường phố.
      'text': "musician, street",
      'record_time': 0,
      'sample_answer':
          "The street musician is playing his guitar for passersby.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một công trường xây dựng với cần cẩu và tòa nhà đang xây dở.
      'text': "building, construction",
      'record_time': 0,
      'sample_answer':
          "A tall building is under construction at the busy site.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Kenji Tanaka\nSubject: Meeting Room Booking\n\nHi Facilities Team,\n\nCould you please book a meeting room for my team next Wednesday morning? We need a room for about 8 people from 10 AM to 12 PM. We will need a projector.\n\nPlease let me know which room is available.\nThanks,\nKenji",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Kenji,\n\nThanks for your request. I have checked the schedule for next Wednesday morning.\n\nConference Room B is available from 10 AM to 12 PM and seats up to 10 people. It is equipped with a projector as you requested. I have tentatively booked Room B for you.\n\nCould you please confirm if this booking works for your team?\n\nBest regards,\n[Your Name]\nFacilities Department",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as if you are part of the Facilities Team. In your e-mail, respond to the request, provide ONE piece of information, and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Event Coordinator\nSubject: Volunteer Request - City Marathon\n\nDear Community Members,\n\nWe are looking for volunteers for the annual City Marathon on Saturday, June 15th. We need help at the water stations along the race route and at the finish line. Shifts are typically 4 hours long, either morning or afternoon.\n\nIf you are interested in volunteering, please reply to this e-mail with two pieces of information: your preferred shift (morning or afternoon) and whether you have a preference for working at a water station or the finish line.\n\nThank you for supporting this great community event!\nSincerely,\nEvent Coordinator",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Event Coordinator,\n\nThank you for the opportunity to volunteer for the City Marathon on June 15th. I would be happy to help.\n\nI would prefer the morning shift. Regarding the location, I am flexible but would slightly prefer working at one of the water stations along the route.\n\nCould you please let me know what time the morning shift typically starts and ends?\n\nThank you,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as someone interested in volunteering. Provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people think that it is better to live in a big city, while others believe that living in a small town is preferable. Which do you think is better and why? Use specific reasons and examples to support your opinion.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "Choosing between life in a big city and a small town involves weighing distinct advantages and disadvantages. While the tranquility and close-knit community of a small town hold appeal for some, I believe that living in a big city offers superior opportunities and a more enriching experience overall.\n\nFirstly, big cities provide unparalleled career and educational opportunities. Major corporations, diverse industries, and leading universities are typically concentrated in urban centers. This translates into a wider range of job prospects, higher potential salaries, and access to specialized educational programs. For example, someone pursuing a career in finance or technology would likely find far more opportunities in a metropolis like New York or San Francisco than in a small rural town. The sheer density of businesses and institutions creates a dynamic environment for professional growth and networking that small towns cannot match.\n\nSecondly, large cities offer a wealth of cultural and entertainment options. Museums, theaters, concert halls, diverse restaurants, and vibrant nightlife are readily accessible. This constant exposure to different arts, cuisines, and cultures broadens one's perspectives and provides endless opportunities for enjoyment and learning. Living in a city means having the chance to see a world-class exhibition one day and try authentic cuisine from another continent the next, experiences that are far less common in smaller communities. This cultural richness significantly enhances quality of life.\n\nWhile small towns often boast lower crime rates and a slower pace of life, which are valid advantages, these can sometimes come at the cost of limited opportunities and a lack of diversity. Big cities, despite potential drawbacks like traffic and higher living costs, offer a dynamism, diversity, and range of possibilities that are essential for personal and professional development in today's world.\n\nIn conclusion, although the ideal living situation varies per individual, the superior career prospects, educational access, and rich cultural tapestry available in large urban centers make living in a big city, in my opinion, the better choice for a fulfilling and dynamic life.",
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
