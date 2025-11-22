// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedInputLR() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testLR';

  // Firestore: Create test document
  await db.collection('input_tests').doc(testId).set({
    'title': 'TOEIC Practice Listening & Reading',
    'parts': ['part1', 'part2', 'part3', 'part4', 'part5', 'part6', 'part7'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // // === PART 1 === LISTENING
  final part1Questions = [
    {
      // Image Description: A woman is standing in front of a whiteboard, pointing at a chart.
      // Transcript:
      // (A) She's drawing a diagram on the board.
      // (B) She's pointing at a presentation screen.
      // (C) She's erasing the whiteboard.
      // (D) She's giving a book to a colleague.
      'question': "",
      'options': ['A', 'B', 'C'],
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
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The setting (table, laptop, professional attire) clearly indicates a business meeting.',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({
        'type': 'Picture description',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 2,
      });

  for (int i = 1; i <= 2; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part1Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part1')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 2 === LISTENING
  final part2Questions = [
    {
      // Transcript:
      // Q: Where can I find the marketing department?
      // (A) It's on the third floor, down the hall.
      // (B) They are marketing a new product.
      // (C) At 9:00 AM tomorrow.
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
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'The question asks "Who", so the correct response should be a person or a department.',
    },
    {
      // Transcript:
      // Q: Would you like me to review the contract?
      // (A) That would be a great help, thank you.
      // (B) I have a new contact number.
      // (C) The view is spectacular.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is an offer of help. Option (A) is a polite acceptance of the offer.',
    },
    {
      // Transcript:
      // Q: Why was the flight to London canceled?
      // (A) Due to severe weather conditions.
      // (B) At gate number twelve.
      // (C) I'll take a flight of stairs.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'The question asks "Why", so the correct response should provide a reason.',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part2')
      .set({
        'type': 'Question & Response',
        'audioPath': 'input_tests/testLR/part2/01%20Test%201_LC_Voca.mp3',
        'questionCount': 5,
      });

  for (int i = 1; i <= 5; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part2Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part2')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 3 === LISTENING
  final transcript8_10 = """
(Woman) Excuse me, my printer isn't working. I'm trying to print out the quarterly report for the 3 P.M. meeting, but nothing is coming out.
(Man) Did you check if there's paper in the tray? That's usually the problem.
(Woman) Yes, I just refilled it this morning. The screen says 'Ready to Print', but it's just not responding.
(Man) Let me see... Ah, it looks like you've selected the wrong printer. You're connected to the one in the marketing department on the 5th floor. You need to choose the 'Acct_HP_LaserJet'. I'll change it for you.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript11_13 = """
(Man) Hi, I'd like to book a room from November 10th to the 12th.
(Woman) Certainly. That would be for two nights. Are you here for the technology conference at the convention center?
(Man) Yes, I am. Does the hotel offer a shuttle service to the center?
(Woman) We do. It runs every 30 minutes from the lobby, and it's complimentary for our guests. I've just reserved a standard queen room for you.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "What is the woman's problem?",
      'options': [
        "The meeting has been canceled.",
        "She cannot find a report.",
        "A piece of equipment is not working.",
        "She is late for a meeting.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript8_10 \n\nThe woman clearly states, 'my printer isn't working'.",
    },
    {
      'question': "What did the woman do this morning?",
      'options': [
        "Attended a meeting",
        "Wrote a report",
        "Fixed the printer",
        "Put paper in a machine",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript8_10 \n\nIn response to the man's question, she says, 'Yes, I just refilled it this morning.'",
    },
    {
      'question': "What does the man say is the cause of the problem?",
      'options': [
        "The printer is out of ink.",
        "An incorrect setting was chosen.",
        "The printer is not turned on.",
        "A cable is disconnected.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript8_10 \n\nThe man explains, 'it looks like you've selected the wrong printer.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What is the man trying to do?",
      'options': [
        "Make a dinner reservation",
        "Book a hotel room",
        "Buy a conference ticket",
        "Arrange a flight",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript11_13 \n\n=> The man starts the conversation with 'Hi, I'd like to book a room...'",
    },
    {
      'question': "Why is the man visiting the city?",
      'options': [
        "For a vacation",
        "To visit family",
        "To attend a conference",
        "For a job interview",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript11_13 \n\n=> He confirms the woman's question by saying 'Yes, I am' when she asks if he's there for the technology conference.",
    },
    {
      'question': "What does the woman say about the shuttle service?",
      'options': [
        "It is unavailable on weekends.",
        "It costs extra.",
        "It needs to be booked in advance.",
        "It is free for guests.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript11_13 \n\n=> The woman states, 'it's complimentary for our guests.'",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part3')
      .set({
        'type': 'Conversations',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 6,
      });

  for (int i = 1; i <= 6; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part3Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 4 === LISTENING
  final transcript14_16 = """
Are you tired of sitting in traffic every morning? Do you want to save money on gas and reduce your carbon footprint? Then come on down to 'Cycle Central' for our annual spring sale! For this week only, all of our 2024 model bicycles are 25% off. We have everything from mountain bikes for the adventurous to comfortable cruisers for a relaxing ride in the park. And with every bike purchase, you will receive a free helmet. Our friendly and knowledgeable staff are here to help you find the perfect bike. Visit us at 15 Oak Street, right across from the city library. Don't miss this chance to ride away with a great deal!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript17_19 = """
May I have your attention, please. This is a final boarding call for flight AZ-788 to Singapore. All remaining passengers should proceed immediately to Gate B24. The gate will be closing in five minutes. Please have your boarding pass and passport ready for inspection. We are not responsible for passengers who arrive at the gate after the doors have closed. We wish you a pleasant flight. Thank you.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What kind of business is being advertised?",
      'options': [
        "A car dealership",
        "A bicycle shop",
        "A sporting goods store",
        "A repair service",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript14_16 \n\n=> The advertisement is for 'Cycle Central' and mentions 'bicycles', 'mountain bikes', and 'cruisers'.",
    },
    {
      'question': "What is offered with a purchase?",
      'options': [
        "A discount coupon",
        "A free water bottle",
        "A free helmet",
        "A one-year warranty",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript14_16 \n\n=> The speaker says, 'And with every bike purchase, you will receive a free helmet.'",
    },
    {
      'question': "Where is the business located?",
      'options': [
        "Next to a park",
        "Inside a shopping mall",
        "On Oak Street",
        "Above the city library",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript14_16 \n\n=> The ad states the location is '15 Oak Street, right across from the city library'.",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What is the purpose of the announcement?",
      'options': [
        "To announce a flight delay",
        "To change a boarding gate",
        "To call remaining passengers to a gate",
        "To report lost luggage",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript17_19 \n\n=> The speaker says, 'This is a final boarding call... All remaining passengers should proceed immediately to Gate B24.'",
    },
    {
      'question': "What is the flight's destination?",
      'options': [
        "AZ-788",
        "Gate B24",
        "Singapore",
        "The announcement does not say",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript17_19 \n\n=> The announcement is for 'flight AZ-788 to Singapore'.",
    },
    {
      'question': "What will happen in five minutes?",
      'options': [
        "The flight will take off.",
        "The gate will close.",
        "The plane will be cleaned.",
        "A new crew will arrive.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript17_19 \n\n=> The speaker states, 'The gate will be closing in five minutes.'",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part4')
      .set({
        'type': 'Talks',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': 6,
      });

  for (int i = 1; i <= 6; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part4Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 5 === READING
  final part5Questions = [
    {
      'question': "The manager ______ the new policy at the meeting yesterday.",
      'options': ['announce', 'announcing', 'announced', 'announces'],
      'correctIndex': 2,
      'explain':
          'The adverb "yesterday" indicates the action happened in the past, so the simple past tense "announced" is required.',
    },
    {
      'question':
          "The company will hire additional staff ______ the workload has increased.",
      'options': ['although', 'because', 'despite', 'unless'],
      'correctIndex': 1,
      'explain':
          '"Because" is a conjunction used to show the reason for something. The increased workload is the reason for hiring more staff.',
    },
    {
      'question':
          "Please make sure that all forms are ______ completed before submission.",
      'options': ['careful', 'caring', 'carefully', 'carefulness'],
      'correctIndex': 2,
      'explain':
          'The adverb "carefully" is needed to modify the verb "completed".',
    },
    {
      'question':
          "Ms. Chen is responsible ______ coordinating all international shipments.",
      'options': ['for', 'with', 'at', 'about'],
      'correctIndex': 0,
      'explain': 'The correct preposition to follow "responsible" is "for".',
    },
    {
      'question':
          "The seminar was ______ more interesting than I had expected.",
      'options': ['much', 'many', 'very', 'so'],
      'correctIndex': 0,
      'explain':
          '"Much" is used to modify comparative adjectives like "more interesting".',
    },
    // ... (Adding more questions to reach 30)
    {
      'question':
          "All employees must wear their identification badges ______ all times.",
      'options': ['at', 'in', 'on', 'by'],
      'correctIndex': 0,
      'explain': 'The correct phrase is "at all times".',
    },
    {
      'question':
          "The new software allows users to ______ their tasks more efficiently.",
      'options': ['manage', 'manager', 'management', 'managerial'],
      'correctIndex': 0,
      'explain': 'The verb "manage" is needed to follow "to".',
    },
    {
      'question':
          "______ to the weather, the outdoor event has been postponed.",
      'options': ['Due', 'Because', 'Since', 'As'],
      'correctIndex': 0,
      'explain':
          'The phrase "Due to" is used to give a reason, followed by a noun phrase ("the weather").',
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part5')
      .set({'type': 'Incomplete sentences', 'questionCount': 8});

  for (int i = 1; i <= 8; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part5Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part5')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 6 === READING
  final passagePart6 = """
To: All Employees
From: Human Resources Department
Subject: Updated Recycling Policy
Date: October 16

Please be advised that we are implementing a new, more comprehensive recycling program, effective next Monday. New recycling bins will be placed in the kitchen and next to the main printers.

It is now ____(131)____ for all employees to separate their waste into three categories: paper, plastics/glass, and general waste. Detailed guidelines have been posted in the kitchen area for your reference. ____(132)____. We trust that everyone will support this important initiative.

Your cooperation will help us ____(133)____ our environmental impact and create a greener workplace. We ____(134)____ your commitment to making our company more sustainable. Thank you.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passagePart6,
      'options': ["optional", "mandatory", "suggested", "advised"],
      'correctIndex': 1,
      'explain':
          "Từ 'mandatory' (bắt buộc) phù hợp nhất với ngữ cảnh của một chính sách mới đang được thực thi, mạnh mẽ hơn các lựa chọn còn lại.",
    },
    {
      'question': "",
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
      'question': "",
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
      'question': "",
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
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part6')
      .set({'type': 'Text completion', 'questionCount': 4});

  for (int i = 1; i <= 4; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part6Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part6')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // // === PART 7 === READING
  final passagePart7_1 = """
**Franklin Green Dry Cleaners – Quality Service You Can Trust**

Get ready for the changing seasons with our special offer! For the entire month of November, bring in any two winter coats and get the second one cleaned for **50% off**. We specialize in handling delicate fabrics, including wool, cashmere, and down.

Our state-of-the-art equipment and eco-friendly cleaning solvents ensure your garments are returned to you fresh, clean, and looking like new. Don't let last year's winter wear stay in storage.

Visit us at our convenient downtown location at 255 Main Street.
Open Monday-Friday 7 A.M. - 7 P.M., Saturday 9 A.M. - 5 P.M.
""";

  // Passage 2: Questions 149-150 (E-mail)
  final passagePart7_2 = """
**To**: All Staff <all.staff@innovatech.com>
**From**: HR Department <hr@innovatech.com>
**Subject**: Annual Performance Reviews
**Date**: October 16

Dear Team Members,

This e-mail is a reminder that the annual performance review process will begin next week. Please schedule a one-hour meeting with your direct supervisor before October 31 to discuss your achievements over the past year and set goals for the upcoming year.

Prior to your meeting, you are required to complete the self-assessment form, which can be found on the company's internal server under the 'HR/Forms' directory. Please submit the completed form to your supervisor at least two days before your scheduled review.

Thank you for your cooperation.
""";

  // Passage 3: Questions 151-152 (Text Message Chain)
  final passagePart7_3 = """
**Maria (3:05 P.M.)**: Hi Kenji. Are you still at the office? I left my laptop charger in the third-floor conference room after our 1 P.M. meeting.

**Kenji (3:06 P.M.)**: Hi Maria. Yes, I'm here. I can go check for you right now.

**Maria (3:07 P.M.)**: Thanks so much! I'd really appreciate it. I'm already halfway home on the train.

**Kenji (3:10 P.M.)**: I found it! It was under the table. I'll leave it on your desk so you can get it in the morning.

**Maria (3:11 P.M.)**: You're a lifesaver! Thank you again.
""";

  // Passage 4: Questions 153-154 (Notice)
  final passagePart7_4 = """
**Attention Residents of Elm Street Apartments**

Please be aware that the water in the building will be shut off for scheduled maintenance on **Thursday, October 19, from 10:00 A.M. to 3:00 P.M.**

This is necessary to allow our maintenance crew to repair a leaky pipe in the basement. We expect all work to be completed by 3:00 P.M., but there may be a slight delay.

We recommend storing some water in advance for your basic needs during this period. We apologize for any inconvenience this may cause and appreciate your understanding.

- Building Management
""";

  final part7Questions = [
    {
      'question': passagePart7_1 + "\n\n147. What is the special offer?",
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
      'question':
          passagePart7_1 +
          "\n\n148. When is Franklin Green Dry Cleaners closed?",
      'options': ["Monday", "Wednesday", "Saturday", "Sunday"],
      'correctIndex': 3,
      'explain':
          "The hours are listed as Monday-Friday and Saturday. Sunday is not mentioned, implying it is closed.",
    },
    // Passage 2 (Q149-150)
    {
      'question':
          passagePart7_2 + "\n\n149. What is the purpose of the e-mail?",
      'options': [
        "To announce a new company policy",
        "To ask employees to set new goals",
        "To inform staff about an upcoming process",
        "To introduce a new supervisor",
      ],
      'correctIndex': 2,
      'explain':
          "The e-mail is a 'reminder that the annual performance review process will begin next week,' which informs staff about this process.",
    },
    {
      'question':
          passagePart7_2 +
          "\n\n150. What must employees do before their meeting?",
      'options': [
        "Schedule a follow-up appointment",
        "Complete a self-assessment form",
        "Review their previous year's goals",
        "Contact the HR department",
      ],
      'correctIndex': 1,
      'explain':
          "The e-mail states, 'Prior to your meeting, you are required to complete the self-assessment form'.",
    },
    // Passage 3 (Q151-152)
    {
      'question':
          passagePart7_3 +
          "\n\n151. What did Maria leave in the conference room?",
      'options': ["Her phone", "Her notes", "Her laptop", "A laptop accessory"],
      'correctIndex': 3,
      'explain':
          "Maria writes, 'I left my laptop charger in the third-floor conference room'.",
    },
    {
      'question':
          passagePart7_3 +
          "\n\n152. At 3:10 P.M., what does Kenji offer to do?",
      'options': [
        "Bring the charger to Maria's home",
        "Wait for Maria at the office",
        "Put the charger on Maria's desk",
        "Call Maria in the morning",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji writes, 'I'll leave it on your desk so you can get it in the morning.'",
    },
    // Passage 4 (Q153-154)
    {
      'question':
          passagePart7_4 + "\n\n153. What is the purpose of the notice?",
      'options': [
        "To advertise an apartment for rent",
        "To announce a rent increase",
        "To warn about a temporary service interruption",
        "To introduce a new maintenance crew",
      ],
      'correctIndex': 2,
      'explain':
          "The notice informs residents that 'the water in the building will be shut off for scheduled maintenance'.",
    },
    {
      'question': passagePart7_4 + "\n\n154. What are residents advised to do?",
      'options': [
        "Avoid using the elevators",
        "Store some water beforehand",
        "Stay out of the basement",
        "Contact building management",
      ],
      'correctIndex': 1,
      'explain':
          "The notice says, 'We recommend storing some water in advance for your basic needs'.",
    },
  ];

  await db
      .collection('input_tests')
      .doc(testId)
      .collection('parts')
      .doc('part7')
      .set({'type': 'Reading comprehension', 'questionCount': 8});

  for (int i = 1; i <= 8; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    // final imagePath = 'input_tests/testLR/part1/$id.jpg';

    final q = part7Questions[i - 1];

    await db
        .collection('input_tests')
        .doc(testId)
        .collection('parts')
        .doc('part7')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }
}
