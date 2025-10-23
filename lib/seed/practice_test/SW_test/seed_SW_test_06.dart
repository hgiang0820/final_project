// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest06() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_06';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 06',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 6,
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
          "Attention shoppers! Don't miss our special sale event happening this weekend in the home goods department. All kitchen appliances, including blenders, coffee makers, and toasters, are now twenty percent off their original price. Plus, spend over one hundred dollars and receive a free cookbook. This offer is valid Saturday and Sunday only. Visit the third floor for these amazing deals!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo trong cửa hàng. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Thank you for calling City Transit Customer Service. Our automated system can provide schedule and fare information. Please listen carefully to the following options. To check bus schedules, press one. For subway information, press two. To report a lost item, press three. To speak with a representative, please stay on the line. Our representatives are available from 7 AM to 7 PM daily.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một tin nhắn thoại tự động. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Hai người đang đi bộ đường dài trong rừng, đeo ba lô.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows two people hiking on a trail in a forest. They are both wearing backpacks and appear to be dressed for outdoor activity. The trail is unpaved and surrounded by tall trees and green foliage. Sunlight seems to be filtering through the leaves. It looks like a peaceful day for a hike in nature. One person is slightly ahead of the other on the path.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking about your experience with online shopping.
    {
      'type': 'Respond to questions',
      'text': "How often do you shop online?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "I shop online quite frequently, maybe two or three times a month. I find it very convenient for buying books and electronics.",
    },
    {
      'type': 'Respond to questions',
      'text': "What do you like most about shopping online?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "What I like most is the convenience. I can shop anytime, anywhere, and compare prices easily without leaving my home.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "What are some disadvantages of online shopping compared to shopping in physical stores?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "One disadvantage is that you can't see or touch the product before buying, so sometimes the quality or fit might not be what you expect, especially with clothes. Another disadvantage is waiting for delivery; you don't get the item immediately like you do in a store. Also, returning items bought online can sometimes be more complicated than returning them to a physical store.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Quản lý Dự án
      // Project Management Workshop - Friday, March 29
      // 9:00 AM - 9:30 AM: Registration & Coffee
      // 9:30 AM - 10:45 AM: Session 1: Project Planning Tools (Room A) - Kenji Tanaka
      // 10:45 AM - 11:00 AM: Break
      // 11:00 AM - 12:15 PM: Session 2: Risk Assessment (Room B) - Sarah Chen
      // 12:15 PM - 1:15 PM: Lunch (Provided)
      // 1:15 PM - 2:30 PM: Session 3: Team Communication (Room A) - Kenji Tanaka
      // 2:30 PM - 3:00 PM: Closing Remarks & Networking
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
          "The workshop ends at 3:00 PM, following the Closing Remarks & Networking session.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Which session is being held in Room B?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The session on 'Risk Assessment', presented by Sarah Chen, is being held in Room B.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Could you tell me all the sessions that Kenji Tanaka is presenting?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, Kenji Tanaka is presenting two sessions. He's leading Session 1, 'Project Planning Tools', from 9:30 AM to 10:45 AM in Room A. He is also presenting Session 3, 'Team Communication', from 1:15 PM to 2:30 PM, also in Room A.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Maria from the Sales team. I'm calling because I need to schedule a training session for our new client, Apex Industries, sometime next week. The problem is, our main training room is already booked every afternoon next week, and the client specifically requested an afternoon time slot because their team is in a different time zone. We really need to get this training done next week. Do you have any ideas on how we can make this work?",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hi Maria, this is [Your Name]. I understand you need an afternoon training slot for Apex Industries next week, but the main training room is booked. Here are a couple of solutions we could try. First, have you checked the availability of the smaller conference rooms, like Room 4B or 4C? While smaller, they do have projectors and might work if the Apex team isn't too large. Second, we could potentially ask the group currently booked in the main training room if they have any flexibility. Perhaps they could shift their time slightly or finish early on one of the afternoons? Alternatively, we could explore conducting the training via video conference if the client is open to that. Let me know which of these you'd like me to investigate further.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some companies offer employees unlimited vacation time, relying on them to manage their own time off responsibly. Do you think this is a good policy or a bad policy? Give specific reasons to support your opinion.",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "I think offering unlimited vacation time can be a good policy in theory, but it has potential drawbacks. On the positive side, it shows a high level of trust in employees and can boost morale and attract talent. It treats employees like responsible adults who can manage their workload and time off effectively. However, a potential negative is that employees might actually take *less* vacation time due to peer pressure or fear of appearing less committed than colleagues. Without a defined number of days, the expectation might implicitly become 'take as little as possible.' Also, it can create scheduling challenges for managers if not managed carefully. Overall, I think it *can* be a good policy, but only if the company culture genuinely encourages taking time off and provides clear guidelines on coordinating schedules.",
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
      // Image Description: Hai người đang xem bản đồ cùng nhau.
      'text': "people, map",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "Two people are looking at a map together, planning their route.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Một người đang sắp xếp hàng hóa trên kệ siêu thị.
      'text': "worker, shelf",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "A store worker is stocking products onto a shelf in the aisle.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Một người đang cầm điện thoại và tai nghe.
      'text': "woman, holding",
      'record_time': 0,
      'sample_answer':
          "The woman is holding her smartphone and a pair of headphones.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một con tàu đang rời bến cảng.
      'text': "ship, leaving",
      'record_time': 0,
      'sample_answer':
          "A large ship is leaving the harbor and heading out to sea.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một người đang viết trên bảng trắng.
      'text': "man, whiteboard",
      'record_time': 0,
      'sample_answer': "The man is writing equations on the whiteboard.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: City Library Events\nSubject: Volunteer Needed - Annual Book Sale\n\nHi Library Volunteers,\n\nOur annual used book sale fundraiser is coming up on Saturday, August 17th. We need volunteers to help sort donations beforehand and to assist customers during the sale.\n\nCould you please let us know two things? First, are you available to volunteer on August 17th? Second, would you prefer helping with setup/sorting before the sale or working during the sale itself?\n\nThanks for your support!\nLibrary Events Team",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Library Events Team,\n\nThank you for the e-mail about volunteering for the annual book sale.\n\nYes, I am available to volunteer on Saturday, August 17th.\n\nI would prefer to help during the sale itself, assisting customers or working at the checkout if needed. I enjoy interacting with people.\n\nCould you please provide more details about the specific shift times during the sale?\n\nSincerely,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as a library volunteer. In your e-mail, provide TWO pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Tech Support\nSubject: Follow-up: Laptop Repair Ticket #998\n\nDear Customer,\n\nOur technician has diagnosed the issue with your laptop (repair ticket #998). The problem requires replacing the main logic board. The cost for this repair, including parts and labor, will be approximately \$350.\n\nBefore we proceed, we need your approval for this charge. Please reply to this e-mail confirming if you authorize the repair. Also, please let us know if you need the data from your old hard drive backed up before the repair (additional \$50 fee).\n\nThank you,\nTech Support Team",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Tech Support Team,\n\nThank you for the update regarding my laptop repair (ticket #998).\n\nYes, I authorize the repair of the main logic board for the estimated cost of \$350.\n\nRegarding the data backup, yes, please back up the data from the old hard drive before proceeding with the repair. I understand there is an additional \$50 fee for this service.\n\nCould you please provide an estimated timeframe for when the repair will be completed once approved?\n\nSincerely,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as the customer. Provide TWO pieces of information (confirmations/decisions) and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people believe that it is essential for success to have a competitive personality. Others think that cooperation is more important than competition. Which quality do you think is more important for success in work or studies? Use specific reasons and examples to support your opinion.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The debate between competition and cooperation as drivers of success is long-standing. While a competitive spirit can certainly fuel ambition and push individuals to achieve more, I firmly believe that cooperation is ultimately a more crucial quality for sustained success, particularly in modern work and academic environments.\n\nFirstly, most significant achievements today are the result of teamwork, not individual effort. Complex projects, whether in business, science, or academics, require diverse skills and perspectives. Cooperation allows individuals to pool their strengths, share knowledge, and overcome challenges more effectively than they could alone. For instance, developing a new software product requires collaboration between designers, programmers, testers, and marketers. A highly competitive individual might excel personally but could hinder the team's overall progress by hoarding information or refusing to help others. A cooperative team member, however, contributes to a positive dynamic where everyone works towards a shared goal, leading to a better final outcome.\n\nSecondly, cooperation fosters a more positive and sustainable environment for growth. While competition can create pressure and motivation, it can also lead to stress, burnout, and unethical behavior if taken to an extreme. A cooperative environment, characterized by mutual support and open communication, encourages learning from mistakes and collective problem-solving. Students who study together, explaining concepts to one another, often achieve a deeper understanding than those who solely compete for the top grade. Similarly, in the workplace, teams that cooperate effectively tend to be more innovative and resilient.\n\nWhile a degree of healthy competition can be motivating, an overemphasis on it can be detrimental. Success is rarely achieved in isolation. The ability to work well with others, share credit, and contribute to a collective effort are hallmarks of true leadership and long-term achievement.\n\nIn conclusion, although competitiveness has its place, the ability to cooperate effectively is far more essential for navigating the complexities of modern work and study. It enables collective achievement, fosters a supportive environment, and ultimately leads to more sustainable and meaningful success.",
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
