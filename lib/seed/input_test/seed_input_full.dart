import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputFull() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testFull';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice 4 Skills',
    'parts': ['lisPart', 'readPart', 'speakPart', 'wriPart'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  final transcriptLisPart3 = """
(Woman) Excuse me, my printer isn't working. I'm trying to print out the quarterly report for the 3 P.M. meeting, but nothing is coming out.
(Man) Did you check if there's paper in the tray? That's usually the problem.
(Woman) Yes, I just refilled it this morning. The screen says 'Ready to Print', but it's just not responding.
(Man) Let me see... Ah, it looks like you've selected the wrong printer. You're connected to the one in the marketing department on the 5th floor. You need to choose the 'Acct_HP_LaserJet'. I'll change it for you.
""";
  final transcriptLisPart4 = """
Are you tired of sitting in traffic every morning? Do you want to save money on gas and reduce your carbon footprint? Then come on down to 'Cycle Central' for our annual spring sale! For this week only, all of our 2024 model bicycles are 25% off. We have everything from mountain bikes for the adventurous to comfortable cruisers for a relaxing ride in the park. And with every bike purchase, you will receive a free helmet. Our friendly and knowledgeable staff are here to help you find the perfect bike. Visit us at 15 Oak Street, right across from the city library. Don't miss this chance to ride away with a great deal!
""";
  final passageReadPart6 = """
To: All Employees
From: Human Resources Department
Subject: Updated Recycling Policy
Date: October 16

Please be advised that we are implementing a new, more comprehensive recycling program, effective next Monday. New recycling bins will be placed in the kitchen and next to the main printers.

It is now ____(4)____ for all employees to separate their waste into three categories: paper, plastics/glass, and general waste. Detailed guidelines have been posted in the kitchen area for your reference. ____(5)____. We trust that everyone will support this important initiative.

Your cooperation will help us ____(6)____ our environmental impact and create a greener workplace. We ____(7)____ your commitment to making our company more sustainable. Thank you.
""";
  final passageReadPart7 = """
**Franklin Green Dry Cleaners – Quality Service You Can Trust**

Get ready for the changing seasons with our special offer! For the entire month of November, bring in any two winter coats and get the second one cleaned for **50% off**. We specialize in handling delicate fabrics, including wool, cashmere, and down.

Our state-of-the-art equipment and eco-friendly cleaning solvents ensure your garments are returned to you fresh, clean, and looking like new. Don't let last year's winter wear stay in storage.

Visit us at our convenient downtown location at 255 Main Street.
Open Monday-Friday 7 A.M. - 7 P.M., Saturday 9 A.M. - 5 P.M.
""";

  // === LISTENING PART ===
  final lisQuestions = [
    //=== PART 1 ===
    {
      // Image Description: A woman is standing in front of a whiteboard, pointing at a chart.
      // Transcript:
      // (A) She's drawing a diagram on the board.
      // (B) She's pointing at a presentation screen.
      // (C) She's erasing the whiteboard.
      // (D) She's giving a book to a colleague.
      'type': 'Picture description',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'The woman is using her hand to point at information on a screen, which is the most accurate description among the choices.',
    },
    {
      // Image Description: A group of people are sitting around a table in a meeting room. Some are looking at a laptop.
      // Transcript:
      // (A) They're having a meal together.
      // (B) They're gathered for a business meeting.
      // (C) They're watching a movie in a theater.
      // (D) They're arranging chairs in a row.
      'type': 'Picture description',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'The setting (table, laptop, professional attire) clearly indicates a business meeting.',
    },
    {
      // Image Description: A man is wearing a hard hat and safety vest while looking at blueprints at a construction site.
      // Transcript:
      // (A) The man is painting a wall.
      // (B) The man is reviewing some architectural plans.
      // (C) The man is stacking boxes in a warehouse.
      // (D) The man is repairing a vehicle.
      'type': 'Picture description',
      'question': "",
     'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'The man is at a construction site and holding blueprints, which are architectural plans.',
    },

    //=== PART 2 ===
    {
      // Transcript:
      // Q: Where can I find the marketing department?
      // (A) It's on the third floor, down the hall.
      // (B) They are marketing a new product.
      // (C) At 9:00 AM tomorrow.
      'type': 'Question & Response',
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'The question asks "Where", so the correct response should be a location.',
    },
    {
      // Transcript:
      // Q: When is the deadline for the budget report?
      // (A) Yes, I read it.
      // (B) It's due this Friday.
      // (C) About twenty pages.
      'type': 'Question & Response',
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The question asks "When", so the correct response should be a time or date.',
    },
    {
      // Transcript:
      // Q: Who's in charge of ordering office supplies?
      // (A) I can supply you with the details.
      // (B) The office is on the left.
      // (C) Sarah from accounting handles that.
      'type': 'Question & Response',
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'The question asks "Who", so the correct response should be a person or a department.',
    },

    //=== PART 3 ===
    {
      'type': 'Conversations',
      'question': "What is the woman's problem?",
      'options': [
        "The meeting has been canceled.",
        "She cannot find a report.",
        "A piece of equipment is not working.",
        "She is late for a meeting.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcriptLisPart3 \n\nThe woman clearly states, 'my printer isn't working'.",
    },
    {
      'type': 'Conversations',
      'question': "What did the woman do this morning?",
      'options': [
        "Attended a meeting",
        "Wrote a report",
        "Fixed the printer",
        "Put paper in a machine",
      ],
      'correctIndex': 3,
      'explain':
          "$transcriptLisPart3 \n\nIn response to the man's question, she says, 'Yes, I just refilled it this morning.'",
    },
    {
      'type': 'Conversations',
      'question': "What does the man say is the cause of the problem?",
      'options': [
        "The printer is out of ink.",
        "An incorrect setting was chosen.",
        "The printer is not turned on.",
        "A cable is disconnected.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcriptLisPart3 \n\nThe man explains, 'it looks like you've selected the wrong printer.'",
    },

    //=== PART 4 ===
    {
      'type': 'Talks',
      'question': "What kind of business is being advertised?",
      'options': [
        "A car dealership",
        "A bicycle shop",
        "A sporting goods store",
        "A repair service",
      ],
      'correctIndex': 1,
      'explain':
          "$transcriptLisPart4 \n\n=> The advertisement is for 'Cycle Central' and mentions 'bicycles', 'mountain bikes', and 'cruisers'.",
    },
    {
      'type': 'Talks',
      'question': "What is offered with a purchase?",
      'options': [
        "A discount coupon",
        "A free water bottle",
        "A free helmet",
        "A one-year warranty",
      ],
      'correctIndex': 2,
      'explain':
          "$transcriptLisPart4 \n\n=> The speaker says, 'And with every bike purchase, you will receive a free helmet.'",
    },
    {
      'type': 'Talks',
      'question': "Where is the business located?",
      'options': [
        "Next to a park",
        "Inside a shopping mall",
        "On Oak Street",
        "Above the city library",
      ],
      'correctIndex': 2,
      'explain':
          "$transcriptLisPart4 \n\n=> The ad states the location is '15 Oak Street, right across from the city library'.",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('lisPart')
      .set({
        'type': 'Listening',
        'audioPath': 'input_tests/testFull/lisPart/01%20Test%201_LC_Voca.mp3',
        'questionCount': 12,
      });

  for (int i = 1; i <= 12; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testFull/lisPart/$id.jpg';

    final q = lisQuestions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('lisPart')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // === READING PART ===
  final readQuestions = [
    //=== PART 5 ====
    {
      'type': 'Incomplete Sentences',
      'question': "The manager ______ the new policy at the meeting yesterday.",
      'options': ['announce', 'announcing', 'announced', 'announces'],
      'correctIndex': 2,
      'explain':
          'The adverb "yesterday" indicates the action happened in the past, so the simple past tense "announced" is required.',
    },
    {
      'type': 'Incomplete Sentences',
      'question':
          "The company will hire additional staff ______ the workload has increased.",
      'options': ['although', 'because', 'despite', 'unless'],
      'correctIndex': 1,
      'explain':
          '"Because" is a conjunction used to show the reason for something. The increased workload is the reason for hiring more staff.',
    },
    {
      'type': 'Incomplete Sentences',
      'question':
          "Please make sure that all forms are ______ completed before submission.",
      'options': ['careful', 'caring', 'carefully', 'carefulness'],
      'correctIndex': 2,
      'explain':
          'The adverb "carefully" is needed to modify the verb "completed".',
    },

    //=== PART 6 ===
    {
      'type': 'Text Completion',
      'question': passageReadPart6,
      'options': ["optional", "mandatory", "suggested", "advised"],
      'correctIndex': 1,
      'explain':
          "Từ 'mandatory' (bắt buộc) phù hợp nhất với ngữ cảnh của một chính sách mới đang được thực thi, mạnh mẽ hơn các lựa chọn còn lại.",
    },
    {
      'type': 'Text Completion',
      'question': passageReadPart6,
      'options': [
        "The old bins will be removed on Friday.",
        "Please feel free to ask your manager if you have questions.",
        "This will make our collection process much more efficient.",
        "Further training will be provided next week.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này giải thích kết quả của việc phân loại rác, kết nối một cách hợp lý với câu trước đó mô tả hành động phân loại.",
    },
    {
      'type': 'Text Completion',
      'question': passageReadPart6,
      'options': [
        "significantly reduce",
        "significant reduction",
        "reducing significant",
        "reduction significantly",
      ],
      'correctIndex': 0,
      'explain':
          "Sau 'help us' cần một động từ nguyên mẫu. 'Significantly' là trạng từ bổ nghĩa cho động từ 'reduce'.",
    },
    {
      'type': 'Text Completion',
      'question': passageReadPart6,
      'options': [
        "appreciate",
        "are appreciating",
        "have appreciated",
        "will be appreciated",
      ],
      'correctIndex': 0,
      'explain':
          "Thì hiện tại đơn 'appreciate' được sử dụng ở đây để bày tỏ sự cảm kích một cách trang trọng và trực tiếp.",
    },

    //=== PART 7 ===
    {
      'type': 'Reading Comprehension',
      'question': "$passageReadPart7\n\n147. What is the special offer?",
      'options': [
        "A discount on cleaning two coats",
        "Free cleaning for new customers",
        "Faster service for winter clothing",
        "A discount on all services in November",
      ],
      'correctIndex': 0,
      'explain':
          "The ad states, 'bring in any two winter coats and get the second one cleaned for 50% off'.",
    },
    {
      'type': 'Reading Comprehension',
      'question':
          "$passageReadPart7\n\n148. When is Franklin Green Dry Cleaners closed?",
      'options': ["Monday", "Wednesday", "Saturday", "Sunday"],
      'correctIndex': 3,
      'explain':
          "The hours are listed as Monday-Friday and Saturday. Sunday is not mentioned, implying it is closed.",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('readPart')
      .set({
        'type': 'Reading',
        // 'audioPath': 'input_tests/testFull/readPart/01%20Test%201_LC_Voca.mp3',
        'questionCount': 9,
      });

  for (int i = 1; i <= 9; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testFull/readPart/$id.jpg';

    final q = readQuestions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('readPart')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'question': q['question'],
          // 'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // === SPEAKING PART ===
  final speakQuestions = [
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
    {
      'type': 'Describe a picture',
      'imagePath': 'input_tests/testFull/speakPart/q02.jpg',
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
      'type': 'Respond to questions using information provided',
      'imagePath': 'input_tests/testFull/speakPart/q04.jpg',
      'text':
          "What time does the conference start, and where is the first event held?",
      'prepare_time': 45,
      'record_time': 0, // This is preparation time for the whole group.
      'directions': 'You have 15 seconds to respond.',
      'max_score': 3,
      'sample_answer':
          'The conference starts at 9:00 AM with the Welcome Address, which is held in the Main Hall.',
    },
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
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('speakPart')
      .set({
        'type': 'Speaking',
        // 'audioPath': 'input_tests/testFull/readPart/01%20Test%201_LC_Voca.mp3',
        'questionCount': 5,
      });

  for (int i = 1; i <= 5; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testFull/readPart/$id.jpg';

    final q = speakQuestions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('speakPart')
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
          'order': i,
        });
  }

  // === WRITING PART ===
  final writeQuestions = [
    {
      'type': 'Write a sentence based on a picture',
      'imagePath': 'input_tests/testFull/wriPart/q01.jpg',
      // Image Description: Two people shaking hands across a desk.
      'text': "men, shaking hands",
      // 'record_time': 480, // 8 minutes total for Q1-5
      'sample_answer':
          "The two men are shaking hands to finalize a business deal.",
      'directions':
          'In this part of the test, you will write ONE sentence that is based on a picture. For each picture, you will be given TWO words or phrases that you must use in your sentence. You can change the forms of the words and use them in any order. Your sentence will be scored on grammar and how well it relates to the picture. You will have 8 minutes to complete this part.',
      'max_score': 3,
    },
    {
      'type': 'Respond to a written request',
      'text':
          "From: Mark Peterson\nSubject: Office Lunch Order\n\nHi Team,\n\nI'm ordering lunch for our team meeting tomorrow from 'The Sandwich Shop'. Please e-mail me your order by 4 PM today. The menu is attached.\n\nThanks,\nMark",
      // 'record_time': 600, // 10 minutes
      'sample_answer':
          "Hi Mark,\n\nThanks for organizing lunch for the meeting tomorrow.\n\nMy order is the Turkey Club sandwich on whole wheat bread. For my side, I would like a garden salad, please.\n\nCould you please let me know if they have any vegetarian options? My colleague, Sarah, might need one.\n\nBest regards,\n[Your Name]",
      'directions':
          'In this part of the test, you will show how well you can respond to an e-mail. You will have 10 minutes to read and answer each e-mail.',
      'max_score': 4,
    },
    {
      'type': 'Write an opinion essay',
      'text':
          "Do you agree or disagree with the following statement?\n\n'Learning a new language is more beneficial for a career than learning a new technical skill (like computer programming).'\n\nSupport your opinion with specific reasons and examples.",
      // 'record_time': 1800, // 30 minutes
      'sample_answer':
          "In today's interconnected and technology-driven world, the debate over which skills are more valuable for career advancement is ongoing. While technical skills like computer programming are undeniably important, I strongly believe that learning a new language offers a more versatile and profound benefit for one's career.\n\nFirstly, language skills open doors to global markets and cross-cultural collaboration. In a globalized economy, companies increasingly operate across borders. An employee who can communicate in the language of a client or a foreign partner, such as Mandarin, Spanish, or German, becomes an invaluable asset. For example, a sales manager who can negotiate a deal in the client's native language is likely to build stronger rapport and achieve better results than one who relies solely on translators. This ability fosters trust and a deeper understanding of cultural nuances, which technical skills alone cannot provide.\n\nSecondly, the process of learning a new language develops crucial soft skills that are highly sought after in any profession. It enhances communication abilities, problem-solving skills, and cognitive flexibility. Learning grammar and vocabulary from a different linguistic system forces one's brain to think in new ways and adapt to different structures. This mental exercise translates directly into being a more adaptable and creative problem-solver in the workplace. A programmer might be able to write code, but a bilingual programmer who has honed their communication and adaptive thinking skills through language learning is better equipped to lead a diverse team or explain complex ideas to non-technical stakeholders.\n\nIn conclusion, while technical skills are essential for specific roles, the benefits of learning a new language are broader and more fundamental. It not only provides a practical tool for international communication but also cultivates a range of soft skills that enhance a professional's overall effectiveness and long-term career potential. Therefore, investing time in mastering another language is a more universally beneficial endeavor for career growth.",
      'directions':
          'In this part of the test, you will write an essay in response to a question that asks you to state, explain, and support your opinion on an issue. Typically, an effective essay will contain a minimum of 300 words. You will have 30 minutes to complete this part.',
      'max_score': 5,
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('wriPart')
      .set({
        'type': 'Writing',
        // 'audioPath': 'input_tests/testFull/readPart/01%20Test%201_LC_Voca.mp3',
        'questionCount': 3,
      });

  for (int i = 1; i <= 3; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testFull/readPart/$id.jpg';

    final q = writeQuestions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('wriPart')
        .collection('questions')
        .doc(id)
        .set({
          'type': q['type'],
          'imagePath': q['imagePath'] ?? null,
          'text': q['text'],
          // 'record_time': q['record_time'],
          'sample_answer': q['sample_answer'],
          'directions': q['directions'],
          'max_score': q['max_score'],
          'order': i,
        });
  }
}
