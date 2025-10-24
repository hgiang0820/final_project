// import 'dart.io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWTest10() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testSW_full_10';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('SW_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Speaking & Writing Practice Test 10',
        'parts': ['speaking', 'writing'], // Phân biệt Speaking và Writing parts
        'createdAt': FieldValue.serverTimestamp(),
        'order': 10,
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
          "Attention passengers waiting for Bus Route 22 towards City Hall. Due to unexpected road construction, Route 22 will be detoured via Maple Avenue instead of Oak Street for the rest of today. Please expect minor delays. The next bus is scheduled to arrive in approximately ten minutes. We apologize for any inconvenience this may cause and thank you for your patience.",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một thông báo tại trạm xe buýt. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q2: Read a text aloud ---
    {
      'type': 'Read a text aloud',
      'text':
          "Looking for reliable and affordable internet service? Switch to 'Connect Fast'! We offer high-speed fiber optic internet with various plans to suit your needs. Our installation process is quick and easy, and our customer support team is available twenty-four hours a day. Visit connectfast.com or call us today to learn more about our special introductory offers and sign up!",
      'prepare_time': 45,
      'record_time': 45,
      'directions':
          'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.',
      'max_score': 3,
      'sample_answer':
          'Đọc rõ ràng, trôi chảy, đúng ngữ điệu và phát âm, giống như một quảng cáo dịch vụ internet. Ví dụ: (đọc lại văn bản một cách mượt mà và rõ ràng)',
    },
    // --- Q3: Describe a picture ---
    {
      'type': 'Describe a picture',
      'imagePath': 'SW_practice_tests/$testId/speaking/q03.jpg',
      // Image Description for sample: Một nhóm người đang ăn trưa tại bàn picnic trong công viên.
      'text': "",
      'prepare_time': 45,
      'record_time': 30,
      'directions':
          'In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.',
      'max_score': 3,
      'sample_answer':
          "This picture shows several people enjoying a picnic lunch outdoors in a park. They are sitting around a wooden picnic table that is covered with food containers and drinks. It looks like a sunny day, and there are trees in the background. The people seem relaxed and are chatting while eating. It appears to be a casual gathering, perhaps colleagues on a lunch break or friends enjoying the weather.",
    },
    // --- Q4-6: Respond to questions ---
    // Scenario: Imagine someone is asking about your experience learning something new.
    {
      'type': 'Respond to questions',
      'text': "Think about something new you learned recently. What was it?",
      'prepare_time': 3,
      'record_time': 15,
      'directions':
          'In this part of the test, you will answer three questions. You will have 3 seconds to prepare after you hear each question. You will have 15 seconds to respond to questions 4 and 5 and 30 seconds to respond to question 6.',
      'max_score': 3,
      'sample_answer':
          "Recently, I learned how to use a new video editing software called 'ClipEdit'. I wanted to make better videos for social media.",
    },
    {
      'type': 'Respond to questions',
      'text': "Why did you decide to learn this?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You will have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "I decided to learn it because I wanted to improve the quality of the videos I create for my personal blog and make them more engaging.",
    },
    {
      'type': 'Respond to questions',
      'text':
          "What was the most challenging part about learning it, and how did you overcome that challenge?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You will have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The most challenging part was understanding the complex interface and all the different features, like transitions and effects. At first, it felt overwhelming. I overcame this by watching several online tutorial videos specifically for beginners. I practiced using one new feature at a time on short clips until I felt comfortable with the basics. Patient practice was key.",
    },
    // --- Q7-9: Respond to questions using information provided ---
    {
      'type': 'Respond to questions using information provided',
      'imagePath': 'SW_practice_tests/$testId/speaking/q07-09.jpg',
      // Image Content for sample: Lịch trình Hội thảo Quản lý Thời gian
      // Time Management Workshop - Tuesday, August 13
      // 1:00 PM - 1:15 PM: Welcome & Overview (Room 10)
      // 1:15 PM - 2:15 PM: Identifying Time Wasters (Room 10) - Mark Davis
      // 2:15 PM - 2:30 PM: Break
      // 2:30 PM - 3:30 PM: Prioritization Techniques (Room 12) - Lisa Chen
      // 3:30 PM - 4:15 PM: Using Scheduling Tools (Room 10) - Mark Davis
      // 4:15 PM - 4:30 PM: Q&A / Closing (Room 10)
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
      'text': "What time does the workshop begin and end?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The workshop begins with the Welcome & Overview at 1:00 PM and ends after the Q&A / Closing session at 4:30 PM.",
    },
    {
      // Q8 - Specific detail
      'type': 'Respond to questions using information provided',
      'text': "Which room is the session on Prioritization Techniques held in?",
      'prepare_time': 3,
      'record_time': 15,
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "The session on Prioritization Techniques is scheduled to be held in Room 12.",
    },
    {
      // Q9 - Combining information
      'type': 'Respond to questions using information provided',
      'text':
          "Could you tell me the topics of all the sessions presented by Mark Davis?",
      'prepare_time': 3,
      'record_time': 30,
      'directions': 'You have 30 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          "Yes, Mark Davis is presenting two sessions. The first one is from 1:15 PM to 2:15 PM, and the topic is 'Identifying Time Wasters'. His second session is later in the afternoon, from 3:30 PM to 4:15 PM, on the topic 'Using Scheduling Tools'.",
    },
    // --- Q10: Propose a solution ---
    {
      'type': 'Propose a solution',
      'text':
          "Hi, this is Laura calling from Marketing. I'm calling about the team photos we scheduled for this Friday at 11 AM with 'Pro Photography'. I just realized that our department head, Ms. Evans, will be out of the office at a client meeting all day Friday. She definitely needs to be in the team photo. I tried calling Pro Photography to reschedule, but their line is busy. Can you help figure out what we should do? We need this photo for the company newsletter next week.",
      'prepare_time': 45,
      'record_time': 60,
      'directions':
          'In this part of the test, you will be presented with a problem and asked to propose a solution. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Hi Laura, this is [Your Name]. Thanks for letting me know about the scheduling conflict with the team photos and Ms. Evans' meeting this Friday. Since you can't reach 'Pro Photography' by phone right now, I suggest you send them an urgent e-mail explaining the situation and requesting to reschedule. Ask about their availability on Thursday afternoon or perhaps early next Monday morning. As a backup, I can also try calling them later today from my line. If rescheduling with 'Pro Photography' isn't possible on short notice, we could consider taking an informal team photo ourselves without Ms. Evans for the immediate newsletter deadline, and then schedule a professional reshoot later when everyone is available. Let me know if you manage to reach them via e-mail.",
    },
    // --- Q11: Express an opinion ---
    {
      'type': 'Express an opinion',
      'text':
          "Some people think that it is more effective to learn from experience, while others believe that learning from books or courses is better. Which method of learning do you think is more effective and why?",
      'prepare_time': 30,
      'record_time': 60,
      'directions':
          'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 30 seconds to prepare. Then you will have 60 seconds to speak.',
      'max_score': 5,
      'sample_answer':
          "Both learning from experience and learning from books or courses are valuable, but I believe learning from experience is often more effective for truly internalizing skills and knowledge. While books and courses provide essential foundational theory and structured information, practical experience allows you to apply that knowledge in real-world situations, make mistakes, and learn directly from the consequences. For example, you can read many books about managing a team, but actually leading a project and handling challenges firsthand teaches leadership skills much more deeply. Experience builds intuition and adaptability in ways that theoretical learning cannot. Ideally, the best approach combines both – using books and courses to gain knowledge and then applying and refining it through practical experience.",
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
      // Image Description: Một người đang chỉ vào màn hình máy tính bảng.
      'text': "woman, tablet",
      'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The woman is using her finger to point at the tablet screen.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You may change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q02.jpg',
      // Image Description: Một người đang pha cà phê bằng máy pha cà phê.
      'text': "man, making",
      'record_time': 0, // Time is for the whole group.
      'sample_answer':
          "A man is making coffee using an automatic coffee machine.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q03.jpg',
      // Image Description: Hai người đang đi bộ cùng chó trong công viên.
      'text': "couple, walking",
      'record_time': 0,
      'sample_answer':
          "A couple is walking their dog on a path through the park.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q04.jpg',
      // Image Description: Một người đang lau dọn bàn làm việc.
      'text': "person, desk",
      'record_time': 0,
      'sample_answer': "The person is cleaning their messy desk.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'SW_practice_tests/$testId/writing/q05.jpg',
      // Image Description: Một chiếc thuyền đang neo đậu ở bến tàu.
      'text': "boat, dock",
      'record_time': 0,
      'sample_answer': "A small boat is tied securely to the wooden dock.",
      'directions':
          'Use the given words to write one sentence about the picture.',
      'max_score': 3,
    },
    // --- Q6-7: Respond to a written request ---
    {
      'type': 'Respond to a written request',
      'text':
          "From: Springfield Hotel Reservations\nSubject: Confirm Your Booking #SH-456\n\nDear Guest,\n\nThis is a reminder to confirm your upcoming reservation (#SH-456) for a standard room from October 10th to October 12th.\n\nTo guarantee your booking, we require two pieces of information: First, please confirm the number of guests staying in the room. Second, provide the estimated time of your arrival on October 10th.\n\nPlease reply to this e-mail within 48 hours.\nSincerely,\nReservations Department",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Dear Reservations Department,\n\nThank you for the reminder regarding booking #SH-456.\n\nI confirm that there will be two guests staying in the room (myself and my spouse). Our estimated time of arrival on October 10th is approximately 4:00 PM.\n\nCould you please also confirm if the room includes complimentary Wi-Fi access?\n\nThank you,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. Respond as the guest. In your e-mail, provide the TWO requested pieces of information and ask ONE question.',
      'max_score': 4,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Kenji Tanaka\nSubject: Request for Report Contribution\n\nHi Team,\n\nI am compiling the quarterly marketing report, due next Friday. I need contributions from each of you regarding your main projects and achievements this past quarter.\n\nPlease send me two things by Wednesday: First, a brief summary (2-3 sentences) of your key accomplishments. Second, any relevant data or metrics that support these accomplishments.\n\nYour input is crucial for a comprehensive report.\nThanks,\nKenji",
      'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Kenji,\n\nGot your e-mail about the quarterly marketing report.\n\nMy key accomplishment this quarter was successfully launching the social media campaign for the 'EcoPure' product line. This resulted in a 25% increase in online engagement metrics (likes, shares, comments) compared to the previous quarter.\n\nCould you please clarify if you need the raw data for the engagement metrics, or just the summary percentage?\n\nBest regards,\n[Your Name]",
      'directions':
          'You will have 10 minutes to read and answer the e-mail. Respond as a team member. Provide the TWO requested pieces of information and ask ONE question.',
      'max_score': 4,
    },
    // --- Q8: Write an opinion essay ---
    {
      'type': 'Write an opinion essay',
      'text':
          "Some people believe that children should be required to learn a musical instrument in school. Others think that this should be optional. Which viewpoint do you agree with? Use specific reasons and examples to support your opinion.",
      'record_time': 1800, // 30 minutes
      'sample_answer':
          "The role of music education in schools is often debated, particularly regarding whether learning an instrument should be mandatory or optional. While exposing children to music is undoubtedly beneficial, I believe that requiring every child to learn a musical instrument should be optional rather than compulsory.\n\nFirstly, forcing students to learn an instrument can be counterproductive if they lack genuine interest or aptitude. Learning music requires significant time, effort, and often, a personal connection to the instrument or the music itself. Mandating participation might lead to resentment, frustration, and a negative association with music for those who are not inclined towards it. For example, a student passionate about visual arts or sports might feel their time is wasted in mandatory music lessons they do not enjoy, potentially impacting their motivation in other subjects as well. Choice allows students to pursue activities that genuinely engage them.\n\nSecondly, implementing mandatory instrument instruction poses significant logistical and financial challenges for schools. Providing instruments, qualified teachers, and adequate practice spaces for every student would require substantial resources that many schools lack. This could potentially divert funding from other essential academic programs or arts education initiatives, like choir or general music appreciation, which might appeal to a broader range of students. An optional program allows schools to allocate resources more effectively towards students who actively choose to participate.\n\nWhile learning an instrument offers proven cognitive benefits, such as improved memory and discipline, these benefits can also be gained through other activities that students might prefer. Offering music as an elective, alongside other arts and activities, respects individual interests and talents while still making the opportunity available to those who wish to pursue it.\n\nIn conclusion, although music education is valuable, making instrument learning mandatory for all students may stifle genuine interest and strain school resources. An optional approach fosters a more positive learning environment and allows students to pursue their passions, making music education a rewarding choice rather than a potential burden.",
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
