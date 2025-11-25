// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest06() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_06';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 06',
        'parts': [
          'part1',
          'part2',
          'part3',
          'part4',
          'part5',
          'part6',
          'part7',
        ],
        'createdAt': FieldValue.serverTimestamp(),
        'order': 6,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang trình bày trước một nhóm người trong phòng họp.
      // Transcript:
      // (A) A man is giving a presentation.
      // (B) A man is cleaning a whiteboard.
      // (C) People are leaving a meeting room.
      // (D) A man is setting up a projector.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người đàn ông đang đứng trước phòng và nói chuyện với những người khác đang ngồi, giống như đang thuyết trình (giving a presentation).',
    },
    {
      // Image Description: Một kệ sách đầy ắp sách trong thư viện hoặc cửa hàng sách.
      // Transcript:
      // (A) Books are stacked on the floor.
      // (B) A bookshelf is filled with books.
      // (C) A librarian is helping a customer.
      // (D) Books are being packed into boxes.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy rõ một kệ sách (bookshelf) có rất nhiều sách (filled with books) trên đó.',
    },
    {
      // Image Description: Một người phụ nữ đang cầm điện thoại và nhìn vào màn hình.
      // Transcript:
      // (A) She's making a phone call.
      // (B) She's reading a document.
      // (C) She's looking at her mobile phone.
      // (D) She's putting a phone in her bag.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Người phụ nữ đang cầm điện thoại di động (mobile phone) và hướng mắt nhìn vào màn hình.',
    },
    {
      // Image Description: Nhiều người đang đi bộ trên vỉa hè đông đúc ở thành phố.
      // Transcript:
      // (A) People are crossing a street at an intersection.
      // (B) Pedestrians are walking along a sidewalk.
      // (C) Cars are stopped at a traffic light.
      // (D) A vendor is selling goods on the street.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy nhiều người đi bộ (pedestrians) đang di chuyển trên vỉa hè (sidewalk).',
    },
    {
      // Image Description: Một đầu bếp đang trang trí món tráng miệng trong bếp nhà hàng.
      // Transcript:
      // (A) A chef is washing vegetables.
      // (B) A chef is adding garnish to a dessert.
      // (C) A chef is taking food out of an oven.
      // (D) A chef is talking to a customer.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người đầu bếp đang cẩn thận thêm các chi tiết trang trí (garnish) lên một món tráng miệng (dessert).',
    },
    {
      // Image Description: Một chiếc phà đang di chuyển trên mặt nước, có thể thấy bờ biển hoặc thành phố ở phía xa.
      // Transcript:
      // (A) A boat is tied to a pier.
      // (B) A ferry is transporting passengers across water.
      // (C) People are swimming near a boat.
      // (D) A cruise ship is docked in a harbor.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy một chiếc phà (ferry) đang di chuyển trên mặt nước, loại phương tiện thường dùng để chở khách (transporting passengers).',
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part1')
      .set({
        'type': 'Picture Description',
        'audioPath': 'LR_practice_tests/$testId/part1/LR_test6_part1.wav',
        'questionCount': 6,
      });

  for (int i = 0; i < part1Questions.length; i++) {
    final id = 'q${(i + 1).toString().padLeft(3, '0')}';
    final imagePath = 'LR_practice_tests/$testId/part1/$id.jpg';
    final q = part1Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
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
          'order': i + 1,
        });
  }

  // // === PART 2: Question & Response === (25 Questions)
  final part2Questions = [
    {
      // Q7: Where can I buy stamps?
      // (A) At the post office next door.
      // (B) I bought some yesterday.
      // (C) They cost one dollar each.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi "Where" (Ở đâu). (A) chỉ địa điểm.',
    },
    {
      // Q8: When will the renovation be completed?
      // (A) The construction company is local.
      // (B) It was very expensive.
      // (C) Sometime next month, hopefully.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "When" (Khi nào). (C) đưa ra một khoảng thời gian trong tương lai.',
    },
    {
      // Q9: Who should I give this report to?
      // (A) It's about the quarterly sales.
      // (B) Please give it to Ms. Evans.
      // (C) I reported it this morning.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Who" (Ai). (B) chỉ định một người.',
    },
    {
      // Q10: Why didn't you attend the workshop?
      // (A) It was very informative.
      // (B) I had a prior commitment.
      // (C) The workshop is on Friday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Why" (Tại sao). (B) đưa ra lý do.',
    },
    {
      // Q11: How do I get to the train station from here?
      // (A) Take the number 5 bus across the street.
      // (B) The train leaves at noon.
      // (C) Yes, I'm going there too.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi "How" (Như thế nào). (A) chỉ dẫn đường đi.',
    },
    {
      // Q12: Is Mr. Tanaka available for a meeting?
      // (A) He's out of the office today.
      // (B) The meeting was successful.
      // (C) Yes, it's available now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi Yes/No. (A) trả lời "No" (gián tiếp) và giải thích.',
    },
    {
      // Q13: Would you like me to proofread that document?
      // (A) The document is confidential.
      // (B) Yes, please read it carefully.
      // (C) That would be a great help, thanks.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'Đây là một lời đề nghị giúp đỡ. (C) là cách đồng ý lịch sự.',
    },
    {
      // Q14: What is the topic of your presentation?
      // (A) It's about our new marketing strategy.
      // (B) I'll present it next week.
      // (C) The topic is on the board.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What is the topic" (Chủ đề là gì). (A) đưa ra chủ đề.',
    },
    {
      // Q15: You booked the flight, didn't you?
      // (A) The book is on the shelf.
      // (B) No, I'm planning to do it this afternoon.
      // (C) It was a very long flight.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi đuôi (tag question). (B) trả lời "No" và nêu kế hoạch.',
    },
    {
      // Q16: How many branches does your company have?
      // (A) We have offices in five countries.
      // (B) The branch manager is new.
      // (C) It's a large company.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "How many" (Bao nhiêu). (A) đưa ra thông tin liên quan đến số lượng chi nhánh/văn phòng.',
    },
    {
      // Q17: Why don't we finalize the contract details now?
      // (A) The details are very complex.
      // (B) Okay, let's go over section three again.
      // (C) I contacted them yesterday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why don\'t we..." là một lời đề nghị. (B) đồng ý ("Okay") và đề xuất bước tiếp theo.',
    },
    {
      // Q18: Has the budget been approved yet?
      // (A) No, the committee is still discussing it.
      // (B) The budget meeting is tomorrow.
      // (C) I proved my point.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi Yes/No. (A) trả lời "No" và giải thích tình trạng hiện tại.',
    },
    {
      // Q19: Could you tell me where the restroom is?
      // (A) I rested for an hour.
      // (B) It's down the hall, second door on the right.
      // (C) Yes, you told me already.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Đây là một câu hỏi về địa điểm. (B) cung cấp chỉ dẫn.',
    },
    {
      // Q20: The traffic was terrible this morning.
      // (A) Yes, it took me an hour to get here.
      // (B) The morning meeting was canceled.
      // (C) I prefer public transportation.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu nhận xét. (A) đồng ý ("Yes") và chia sẻ kinh nghiệm tương tự.',
    },
    {
      // Q21: What time does the performance begin?
      // (A) It received great reviews.
      // (B) The performers are very talented.
      // (C) Promptly at 7:30 PM.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'Câu hỏi "What time" (Mấy giờ). (C) đưa ra thời gian cụ thể.',
    },
    {
      // Q22: Didn't you meet the new director yesterday?
      // (A) I'll direct you to his office.
      // (B) The meeting is tomorrow.
      // (C) No, I was out of the office all day.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi Yes/No dạng phủ định. (C) trả lời "No" và giải thích lý do.',
    },
    {
      // Q23: Whose signature is required on this form?
      // (A) Sign your name here.
      // (B) The department manager's.
      // (C) It's a required course.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Whose" (Của ai). (B) chỉ định người cần ký.',
    },
    {
      // Q24: How far in advance should I book the tickets?
      // (A) I'd recommend at least a month.
      // (B) The book is very advanced.
      // (C) They are first-class tickets.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "How far in advance" (Trước bao lâu). (A) đưa ra một khoảng thời gian khuyến nghị.',
    },
    {
      // Q25: Should we discuss this now or later?
      // (A) I discussed it with him.
      // (B) Yes, we should.
      // (C) Let's talk after lunch.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi lựa chọn (or). (C) chọn một trong hai phương án ("later").',
    },
    {
      // Q26: When is the new product expected to launch?
      // (A) It's a very popular product.
      // (B) We're aiming for early next quarter.
      // (C) The launch party was fun.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "When" (Khi nào). (B) đưa ra một khoảng thời gian dự kiến trong tương lai.',
    },
    {
      // Q27: I'm looking for the accounting department.
      // (A) It's on the third floor.
      // (B) He's an accountant.
      // (C) The account is overdue.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu thông báo mục đích (tìm phòng). (A) cung cấp thông tin về địa điểm.',
    },
    {
      // Q28: How often is the office cleaned?
      // (A) It's a very clean office.
      // (B) Every evening after 6 PM.
      // (C) I cleaned my desk yesterday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How often" (Bao lâu một lần). (B) đưa ra tần suất (mỗi tối).',
    },
    {
      // Q29: Would you mind if I borrow your pen?
      // (A) I opened the window.
      // (B) Please return it when you're done.
      // (C) My mind is made up.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Would you mind if I...?" là một lời xin phép. (B) là cách đồng ý và đưa ra điều kiện.',
    },
    {
      // Q30: What kind of music do you like?
      // (A) I usually listen in the car.
      // (B) The concert was fantastic.
      // (C) Mostly jazz and classical.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "What kind" (Loại gì). (C) liệt kê các thể loại nhạc.',
    },
    {
      // Q31: Have you confirmed your attendance for the banquet?
      // (A) I attended the meeting.
      // (B) Yes, I RSVP'd yesterday.
      // (C) The bank is closed today.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi Yes/No. (B) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part2')
      .set({
        'type': 'Question & Response',
        'audioPath': 'LR_practice_tests/$testId/part2/LR_test6_part2.wav',
        'questionCount': 25,
      });

  for (int i = 0; i < part2Questions.length; i++) {
    final id = 'q${(i + 7).toString().padLeft(3, '0')}';
    final q = part2Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
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
          'order': i + 7,
        });
  }

  // // === PART 3 === LISTENING (Conversations)
  // Total 39 Questions (13 Conversations x 3 Questions)

  // --- Conversation 1: Questions 32-34 ---
  final transcript32_34 = """
(Woman) Hello, I'd like to rent a car for the weekend.
(Man) Okay. Do you have a reservation?
(Woman) No, I don't. I was hoping you'd have something available. I just need a small, economy car.
(Man) Let me check... Yes, we have one compact car left. It's \$50 per day, plus insurance. I'll need to see your driver's license and credit card.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Man) Hi Sarah, do you know if the report on the Q3 sales figures is finished?
(Woman) I just completed it this morning. I was about to e-mail it to the director.
(Man) Great. Could you copy me on that e-mail? I need those numbers for my presentation on Friday.
(Woman) Sure, no problem. I'll send it right now.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Woman) Excuse me, is this seat taken?
(Man) No, it's free. Please, have a seat. Are you also waiting for the train to Chicago?
(Woman) Yes, I am. It seems to be running a little late today.
(Man) I know. I checked the board, and it's delayed by about 15 minutes due to track work.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Man) Hi, I bought this printer here last month, and it's stopped working.
(Woman) Oh, I'm sorry to hear that. Do you have your receipt?
(Man) Yes, right here. It's still under warranty, right?
(Woman) Yes, it has a one-year warranty. We can either send it for repair, which takes about two weeks, or you can exchange it for a new one today.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Woman) We need to order more office supplies. We're almost out of pens and printer paper.
(Man) Okay. Should I use the usual supplier, 'OfficeMart'?
(Woman) Actually, I saw an ad for 'SupplySource'. They're offering a 20% discount for new customers. Maybe we should try them?
(Man) Good idea. Can you forward me their website address? I'll compare their prices with OfficeMart before placing the order.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Man) Hello, reservations. How can I help you?
(Woman) Hi, I'd like to book a table for two for this Saturday evening, around 7:30.
(Man) Let me check our availability for Saturday... I'm sorry, we're fully booked between 7 and 9 PM. I do have a table available at 6:30 or one at 9:15.
(Woman) Hmm, 6:30 is a bit early. Let's take the 9:15 table, please.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Woman) Mr. Kim, do you have a moment to discuss the marketing budget for next quarter?
(Man) Sure, Anna. Come in. I was just reviewing the preliminary numbers.
(Woman) I'm concerned that the allocation for online advertising is too low, especially with the new product launch.
(Man) I see your point. Let's look at the numbers again. Maybe we can shift some funds from the print advertising budget.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Man) I just finished setting up the projector and laptop for your presentation.
(Woman) Thanks, David. Did you check the audio? We'll need sound for the video clips.
(Man) Yes, I tested it with the speakers in the room. It seems to be working fine.
(Woman) Great. The clients should be here any minute. Can you make sure there's water on the table for them?
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Woman) Hi, I'm attending the conference and need to print my presentation slides.
(Man) Okay, you can use the computers here in the business center. Printing costs 10 cents per page for black and white.
(Woman) What about color? My slides have several charts.
(Man) Color printing is more expensive. Let's see... according to the price list, it's 50 cents per page. How many pages do you have?
---
**Business Center Price List**
- Computer Use: \$5 / hour
- Printing (B&W): \$0.10 / page
- Printing (Color): \$0.50 / page
- Copying (B&W): \$0.15 / page
- Faxing (Domestic): \$1.00 / page
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Man) This elevator seems really slow today.
(Woman) I know. I heard they're doing some maintenance work on one of the other elevators, so everyone is using this one.
(Man) That explains why it's so crowded too. I hope they finish soon.
(Woman) Me too. The sign said the work should be completed by tomorrow afternoon.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Woman) Hi, I'm calling about an order I placed online. Order number 78C. It was supposed to arrive yesterday, but I haven't received it.
(Man) Let me check the tracking information for you, madam. Can you confirm the shipping address?
(Woman) It's 15 Maple Drive.
(Man) Thank you... Ah, it looks like the courier attempted delivery yesterday afternoon, but no one was home. They will try again today.
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Man) We need to finalize the schedule for the new employee orientation next week.
(Woman) Okay. I've booked the conference room from 9 AM to 4 PM. We have HR scheduled for the morning and IT for the afternoon.
(Man) What about lunch? We need to order catering.
(Woman) Right, I forgot about that. I'll call the usual place now and order sandwiches and salads for 15 people.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Woman) I'm trying to update my contact information on the company directory, but I can't find where to do it.
(Man) Oh, you can't update it yourself. You need to fill out a 'Change of Information' form.
(Woman) Where can I get that form?
(Man) They're available on the HR section of the intranet, or you can just ask the receptionist for a copy.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "What does the woman want to do?",
      'options': [
        "Buy insurance",
        "Rent a car",
        "Make a reservation",
        "Pay with cash",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I'd like to rent a car for the weekend.'",
    },
    {
      'question': "What kind of car does the woman need?",
      'options': [
        "A large car",
        "A luxury car",
        "A small car",
        "A specific model",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> She says, 'I just need a small, economy car.'",
    },
    {
      'question': "What does the man need from the woman?",
      'options': [
        "Her address",
        "Her flight information",
        "Her license and credit card",
        "Her insurance details",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'I'll need to see your driver's license and credit card.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What is Maria calling about?",
      'options': [
        "A sales presentation",
        "A client quote",
        "A project deadline",
        "An invoice",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript35_37 \n\n=> Maria asks, 'I'm calling about the invoice for Apex Corp...'",
    },
    {
      'question': "What problem did Kenji find?",
      'options': [
        "The client hasn't paid.",
        "The sales tax was incorrect.",
        "The total amount was wrong.",
        "He cannot find the quote.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> Kenji says, 'there's a discrepancy in the total amount compared to the quote... The quote didn't include the sales tax.'",
    },
    {
      'question': "What does Maria ask Kenji to do?",
      'options': [
        "Call the director",
        "Include her on an e-mail",
        "Finish the presentation",
        "Check the sales figures",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> Maria asks, 'Could you copy me on that e-mail?'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "What is the man doing?",
      'options': [
        "Checking in",
        "Making a reservation",
        "Asking for directions",
        "Checking out",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'Good morning. I'd like to check out, please. Room 405.'",
    },
    {
      'question': "What does the man request?",
      'options': [
        "A late check-out",
        "A copy of his bill",
        "Help with his luggage",
        "A taxi",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man asks, 'Could you print a copy of my bill?'",
    },
    {
      'question': "Why does the man need the document?",
      'options': [
        "To check for errors",
        "For his expense report",
        "To pay the total",
        "To confirm his stay",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> He says, 'I need it for my expense report.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What problem are the speakers discussing?",
      'options': [
        "A high price",
        "Poor advertising",
        "Low sales figures",
        "Competitors' products",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The woman starts, 'Our sales numbers for the new tablet are lower than expected.'",
    },
    {
      'question': "What does the woman think is a contributing factor?",
      'options': [
        "The price is too high.",
        "The advertising is ineffective.",
        "The product is not good.",
        "The launch was delayed.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'I also think our advertising hasn't reached the right audience.'",
    },
    {
      'question': "What will the speakers do next?",
      'options': [
        "Lower the tablet's price",
        "Create online ads",
        "Talk to the marketing team",
        "Analyze competitors",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man suggests, 'Let's schedule a meeting with the marketing team to discuss revising our strategy.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What is the man ordering?",
      'options': [
        "Lunch for colleagues",
        "Birthday flowers",
        "Catering for an event",
        "Gardening supplies",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man wants to order a 'flower arrangement' for his 'colleague's birthday'.",
    },
    {
      'question': "What kind of flowers does the man mention?",
      'options': ["Roses", "Sunflowers", "Lilies", "Orchids"],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man suggests 'sunflowers or tulips'.",
    },
    {
      'question': "What information does the woman ask for?",
      'options': [
        "The man's budget",
        "The delivery address",
        "The colleague's name",
        "The payment method",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> After suggesting sunflowers, the woman asks, 'Where does it need to be delivered?'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What problem does the woman report?",
      'options': [
        "A slow internet connection",
        "A broken printer",
        "No power in the room",
        "A missing router",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'The internet connection... is really slow today.'",
    },
    {
      'question': "What does the man suggest doing first?",
      'options': [
        "Call IT support",
        "Check the cabinet",
        "Restart the router",
        "Complain to the manager",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man asks, 'Did you try restarting the router?' and tells her how.",
    },
    {
      'question': "Where can the woman find the reset button?",
      'options': [
        "Under the screen",
        "On top of the router",
        "On the back of the router",
        "In the IT support manual",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'There's a small reset button on the back.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What feedback was received about the training?",
      'options': [
        "It was not useful.",
        "It was too long.",
        "It needed more breaks.",
        "It should be split.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man says, 'several mentioned it was too long.'",
    },
    {
      'question': "What solution does the woman initially suggest?",
      'options': [
        "Make it shorter",
        "Add a break",
        "Split it into two sessions",
        "Offer it online",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman asks, 'Maybe next time we should split it into two sessions?'",
    },
    {
      'question': "What action will the speakers take?",
      'options': [
        "Redesign the training",
        "Cancel the training",
        "Suggest adding a break",
        "Split the session",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> After discussing, the woman says, 'I think the break is a better option. Let's suggest that to the training department.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What is the woman looking for?",
      'options': [
        "A specific book",
        "The front entrance",
        "The 'New Fiction' section",
        "Author Jane Anderson",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript53_55 \n\n=> The woman asks for 'the latest novel by author Jane Anderson.'",
    },
    {
      'question': "Where does the man initially suggest looking?",
      'options': [
        "In the computer system",
        "Near the front entrance",
        "In the back",
        "On the new releases table",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'her new releases are usually in the 'New Fiction' section, right near the front entrance.'",
    },
    {
      'question': "When will the store likely have the book again?",
      'options': [
        "This afternoon",
        "Tomorrow afternoon",
        "Next week",
        "They need to order it",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> After checking the system, the man says, 'We should be getting another shipment tomorrow afternoon.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "What service does the man need?",
      'options': [
        "Standard shipping",
        "Document printing",
        "Express international shipping",
        "Package tracking",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The man needs the package 'to London by Friday'. The woman recommends 'Express International' to meet this deadline.",
    },
    {
      'question': "Look at the graphic. What zone is London likely in?",
      'options': ["Zone 1", "Zone 2", "Zone 3", "Not specified"],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The woman quotes the price for 'Zone 3' (\$65) after the man confirms London is the destination.",
    },
    {
      'question':
          "Look at the graphic. What is the weight of the man's package?",
      'options': [
        "Exactly 1 kg",
        "Less than 1 kg",
        "More than 1 kg",
        "Not mentioned",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man says it's 'about half a kilogram'. The woman quotes the price for '< 1 kg'.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What problem are the speakers discussing?",
      'options': [
        "A broken dishwasher",
        "A shortage of dishes",
        "A messy kitchen",
        "A missing sign",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'The office kitchen is a mess again. There are dirty dishes piled up...'",
    },
    {
      'question': "What does the woman suggest?",
      'options': [
        "Buying a new dishwasher",
        "Hiring a cleaner",
        "Putting up a reminder sign",
        "Washing the dishes",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'Maybe we need to put up a sign reminding everyone...'",
    },
    {
      'question': "What will the man do?",
      'options': [
        "Load the dishwasher",
        "Talk to the manager",
        "Draft and post a sign",
        "Clean the sink",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The man agrees and says, 'I'll draft a short, friendly reminder and post it...'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the woman calling Tech Support?",
      'options': [
        "She needs help with VPN.",
        "She got an error message.",
        "She cannot access the shared drive.",
        "She forgot her password.",
      ],
      'correctIndex':
          2, // Technically C implies B and D. Let's stick with the main issue stated first.
      'explain':
          "$transcript62_64 \n\n=> The woman states her problem as 'having trouble accessing the company's shared drive from home.'",
    },
    {
      'question': "What does the man ask the woman about?",
      'options': [
        "Her error message",
        "Her home address",
        "Her computer model",
        "Her VPN connection",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript62_64 \n\n=> The man asks, 'Are you connected to the company's VPN?'",
    },
    {
      'question': "What will the woman likely do next?",
      'options': [
        "Describe the error message",
        "Restart her computer",
        "Connect to the VPN",
        "Call back later",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman realizes she forgot the VPN and says, 'Let me try connecting now.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What event are the speakers planning?",
      'options': [
        "A budget meeting",
        "A catering proposal",
        "An awards dinner",
        "A dessert tasting",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The woman mentions the 'catering proposal for the annual awards dinner.'",
    },
    {
      'question': "What is the problem with the proposal?",
      'options': [
        "It is \$1,000 over budget.",
        "The menu is not good.",
        "The dessert is missing.",
        "It arrived late.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'the cost is higher than we budgeted... It's about \$1,000 over budget.'",
    },
    {
      'question': "What is one possible solution mentioned?",
      'options': [
        "Finding a new caterer",
        "Asking for a discount",
        "Removing the dessert",
        "Increasing the budget",
      ],
      'correctIndex':
          1, // Also C is mentioned, but B is suggested first by the man.
      'explain':
          "$transcript65_67 \n\n=> The man suggests, 'Let's ask them if they can offer a discount first.' The woman also mentioned changing dessert or cutting appetizers.",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "How long will the man be away?",
      'options': ["One week", "Two weeks", "One month", "Indefinitely"],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'I'm going to be out of the office for the next two weeks...'",
    },
    {
      'question': "Where is the man going?",
      'options': ["On a business trip", "To the office", "To Hawaii", "Home"],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman asks where he is going, and he replies, 'To Hawaii.'",
    },
    {
      'question': "What does the man ask the woman to do?",
      'options': [
        "Check his e-mail daily",
        "Handle urgent e-mails",
        "Set up his auto-reply",
        "Forward all his e-mails",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man asks, 'could you handle my urgent e-mails?'",
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part3')
      .set({
        'type': 'Conversations',
        'audioPath': 'LR_practice_tests/$testId/part3/LR_test6_part3.wav',
        'questionCount': 39,
      });

  for (int i = 0; i < part3Questions.length; i++) {
    final questionNumber = i + 32;
    final id = 'q${questionNumber.toString().padLeft(3, '0')}';
    final q = part3Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc('part3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null, // Can add imagePath for graphic questions
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'], // Explain field now contains the transcript
          'order': questionNumber,
        });
  }

  // // === PART 4 === LISTENING (Talks)
  // Total 30 Questions (10 Talks x 3 Questions)

  // --- Talk 1: Questions 71-73 (Advertisement) ---
  final transcript71_73 = """
Do you need help managing your finances? 'Secure Future Financial Advisors' can help. Our team of certified experts offers personalized financial planning, investment advice, and retirement planning. We work with individuals and small businesses. For a limited time, we are offering a free one-hour consultation to all new clients. Call us today at 555-PLAN or visit securefuture.com to schedule your appointment and take control of your financial future.
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
Good afternoon, passengers. Flight 890 to Dallas is now ready for boarding at Gate C5. We will begin boarding with passengers in Zone 1 and passengers needing special assistance. Please have your boarding pass and photo identification ready. All carry-on bags must fit in the overhead bin or under the seat in front of you. Thank you for flying with us.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
The next item I want to discuss is the feedback from the recent employee survey. While overall job satisfaction remains high, many employees expressed concern about the lack of professional development opportunities. This is something we need to address seriously. I've asked Human Resources to research potential training programs and online courses that we could offer. We'll discuss their findings at our next meeting.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling 'Tech Gadget Repair'. Our business hours are Monday through Saturday, 10 AM to 7 PM. We are closed on Sundays. If you would like to check the status of an existing repair, please press one and have your repair ticket number ready. To inquire about our repair services for smartphones, tablets, or computers, please press two. To speak with a technician, please stay on the line.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome, everyone, to the Franklin Art Museum's sculpture garden. My name is Maria, and I'll be your guide. This garden features over 50 sculptures by renowned international artists. Our tour will last approximately one hour. Please feel free to take photographs, but do not climb on or touch any of the sculptures. After the tour, I encourage you to visit the museum's indoor galleries as well. Let's begin over here.
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
As you can see on this graph, our website traffic has increased significantly since we launched the redesigned site three months ago. We've seen a 30% jump in unique visitors and a 20% increase in the average time spent on the site. This indicates that the new layout and content are engaging users more effectively. Our next step is to optimize the mobile version of the site, as over half our traffic now comes from smartphones.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
This just in: The Central City bridge will be closed to all traffic this weekend for emergency repairs. The closure will begin at 10 PM on Friday and last until 5 AM on Monday morning. City officials discovered a structural problem during a routine inspection yesterday. All traffic will be rerouted via the North bypass. Expect major delays if traveling through the area this weekend.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
I'm delighted to introduce our guest speaker for today's luncheon, Ms. Sarah Chen. Ms. Chen is the award-winning founder of 'GreenLeaf Organics', a company she started just five years ago. Today, she's going to share her journey as an entrepreneur and offer advice on building a successful, sustainable business. Please give a warm welcome to Ms. Sarah Chen.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Before we break for coffee, I want to remind you about the optional training sessions this afternoon. Please look at the schedule on the screen. The 'Advanced Excel' session is particularly relevant for those in the finance department. Please note that this session requires pre-registration as space is limited. If you haven't registered, you can check with the staff at the registration desk to see if any spots have opened up.
---
**Optional Training Sessions**
- 1:30 PM: Effective Communication (Room A) - Open
- 1:30 PM: Project Management Basics (Room B) - Open
- 1:30 PM: **Advanced Excel** (Room C) - Pre-registration required
- 3:00 PM: Presentation Skills (Room A) - Open
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention shoppers! Our deli department is offering free samples of our new imported cheese selection. Stop by the deli counter near the back of the store to try some delicious Italian Parmesan and French Brie. Our deli staff is also available to answer any questions and offer pairing suggestions. Don't miss this tasty opportunity! Samples are available until 3 PM today.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What service is being advertised?",
      'options': [
        "Financial planning",
        "Home cleaning",
        "Retirement homes",
        "Small business loans",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Secure Future Financial Advisors' và đề cập đến 'financial planning, investment advice, and retirement planning'.",
    },
    {
      'question': "Who does the company work with?",
      'options': [
        "Large corporations only",
        "Individuals and small businesses",
        "Retirees only",
        "Investment banks",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'We work with individuals and small businesses.'",
    },
    {
      'question': "What is offered for free?",
      'options': [
        "Investment advice",
        "Retirement planning",
        "A one-hour consultation",
        "A financial plan",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'we are offering a free one-hour consultation to all new clients.'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "Where is this announcement taking place?",
      'options': [
        "On an airplane",
        "At a train station",
        "At an airport gate",
        "In Dallas",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Thông báo đề cập đến 'Flight 890', 'Gate C5', 'boarding', 'boarding pass', 'carry-on bags', tất cả đều liên quan đến cổng sân bay.",
    },
    {
      'question': "Who will board the plane first?",
      'options': [
        "All passengers",
        "Passengers with large bags",
        "Passengers in Zone 1",
        "Passengers going to Dallas",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói nói, 'We will begin boarding with passengers in Zone 1 and passengers needing special assistance.'",
    },
    {
      'question': "What must passengers have ready?",
      'options': [
        "Their luggage",
        "Their passport",
        "Their boarding pass and ID",
        "Their carry-on bags",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói yêu cầu, 'Please have your boarding pass and photo identification ready.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of the meeting excerpt?",
      'options': [
        "Job satisfaction",
        "The employee survey",
        "Professional development",
        "Human Resources",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Mặc dù khảo sát được đề cập, nhưng vấn đề chính được nêu ra là 'lack of professional development opportunities' và cách giải quyết nó.",
    },
    {
      'question': "What concern did employees express in the survey?",
      'options': [
        "Low job satisfaction",
        "High energy costs",
        "Lack of training opportunities",
        "Poor communication",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'many employees expressed concern about the lack of professional development opportunities.'",
    },
    {
      'question': "What has Human Resources been asked to do?",
      'options': [
        "Conduct a new survey",
        "Research training programs",
        "Address employee concerns",
        "Schedule the next meeting",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'I've asked Human Resources to research potential training programs and online courses...'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is 'Tech Gadget Repair'?",
      'options': [
        "A software company",
        "An electronics store",
        "A repair shop",
        "A phone carrier",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tên và các tùy chọn ('check the status of an existing repair', 'inquire about our repair services') cho thấy đây là cửa hàng sửa chữa.",
    },
    {
      'question': "When is the business closed?",
      'options': ["Mondays", "Saturdays", "Sundays", "Evenings"],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'We are closed on Sundays.'",
    },
    {
      'question': "What information is needed to check a repair status?",
      'options': [
        "The type of gadget",
        "The date of drop-off",
        "The repair ticket number",
        "The technician's name",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn hướng dẫn, 'press one and have your repair ticket number ready.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': [
        "Inside a museum",
        "In a sculpture garden",
        "In an artist's studio",
        "In an indoor gallery",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> Người nói chào mừng mọi người đến 'the Franklin Art Museum's sculpture garden.'",
    },
    {
      'question': "How long will the tour last?",
      'options': ["30 minutes", "45 minutes", "One hour", "90 minutes"],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'Our tour will last approximately one hour.'",
    },
    {
      'question': "What are listeners asked NOT to do?",
      'options': [
        "Take photographs",
        "Ask questions",
        "Touch the sculptures",
        "Visit the indoor galleries",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói yêu cầu, 'please do not climb on or touch any of the sculptures.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the topic of this part of the presentation?",
      'options': [
        "A website redesign",
        "Website traffic analysis",
        "Mobile site optimization",
        "User engagement strategy",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> Người nói đang trình bày về 'website traffic' và cách nó thay đổi sau khi thiết kế lại.",
    },
    {
      'question': "What happened after the website was redesigned?",
      'options': [
        "Traffic decreased.",
        "Average time on site decreased.",
        "Mobile traffic increased.",
        "The number of unique visitors increased.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'We've seen a 30% jump in unique visitors...'",
    },
    {
      'question': "What is the next step mentioned?",
      'options': [
        "Redesigning the site again",
        "Improving the mobile version",
        "Increasing website content",
        "Launching a new app",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'Our next step is to optimize the mobile version of the site...'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What is the news report about?",
      'options': [
        "A bridge closure",
        "A routine inspection",
        "The North bypass",
        "Weekend travel tips",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> Tin tức thông báo 'The Central City bridge will be closed to all traffic this weekend...'",
    },
    {
      'question': "Why is the bridge being closed?",
      'options': [
        "For routine maintenance",
        "For a special event",
        "For emergency repairs",
        "For inspection",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Nó sẽ đóng cửa 'for emergency repairs' sau khi 'City officials discovered a structural problem'.",
    },
    {
      'question': "How long will the closure last?",
      'options': [
        "All morning",
        "Until Friday",
        "For the weekend",
        "Until Monday night",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Việc đóng cửa bắt đầu '10 PM on Friday' và kéo dài 'until 5 AM on Monday morning', tức là cả cuối tuần.",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Ms. Chen's company called?",
      'options': [
        "GreenLeaf Organics",
        "Sustainable Business Inc.",
        "Award-Winning Ventures",
        "Không được đề cập",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu cô ấy là 'the award-winning founder of 'GreenLeaf Organics''.",
    },
    {
      'question': "What will Ms. Chen talk about?",
      'options': [
        "Her company's products",
        "Organic farming",
        "Her journey as an entrepreneur",
        "Winning awards",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'she's going to share her journey as an entrepreneur...'",
    },
    {
      'question': "What is implied about Ms. Chen?",
      'options': [
        "She recently started her company.",
        "She works in sustainability.",
        "She has written a book.",
        "She is speaking at a luncheon.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu cô ấy là 'guest speaker for today's luncheon'.",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. What is the topic of the session in Room C?",
      'options': [
        "Effective Communication",
        "Project Management Basics",
        "Advanced Excel",
        "Presentation Skills",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Lịch trình hiển thị 'Advanced Excel (Room C)'.",
    },
    {
      'question':
          "Look at the graphic. Which session requires pre-registration?",
      'options': [
        "Effective Communication",
        "Project Management Basics",
        "Advanced Excel",
        "Presentation Skills",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói đề cập đến 'Advanced Excel' và nói 'this session requires pre-registration'. Lịch trình cũng ghi chú điều này.",
    },
    {
      'question':
          "What should people interested in 'Advanced Excel' do if they haven't registered?",
      'options': [
        "Attend a different session",
        "Register online now",
        "Go to Room C anyway",
        "Check at the registration desk",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'If you haven't registered, you can check with the staff at the registration desk to see if any spots have opened up.'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What is being offered?",
      'options': [
        "Free cheese samples",
        "Discounted deli meats",
        "Imported wine pairings",
        "Cooking demonstrations",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript98_100 \n\n=> Thông báo nói, 'Our deli department is offering free samples of our new imported cheese selection.'",
    },
    {
      'question': "Where in the store is the offer available?",
      'options': [
        "At the entrance",
        "Near the checkout",
        "At the deli counter",
        "On the second floor",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'Stop by the deli counter near the back of the store...'",
    },
    {
      'question': "When does the offer end?",
      'options': ["In one hour", "At 3 PM", "At 7 PM", "Khi hết hàng"],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Thông báo nói, 'Samples are available until 3 PM today.'",
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part4')
      .set({
        'type': 'Talks',
        'audioPath': 'LR_practice_tests/$testId/part4/LR_test6_part4.wav',
        'questionCount': 30,
      });

  for (int i = 0; i < part4Questions.length; i++) {
    final questionNumber = i + 71;
    final id = 'q${questionNumber.toString().padLeft(3, '0')}';
    final q = part4Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc('part4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': null, // Can add imagePath for graphic questions
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'], // Explain field now contains the transcript
          'order': questionNumber,
        });
  }

  // =====================================================================
  // ========================== READING SECTION ==========================
  // =====================================================================

  // // === PART 5: Incomplete Sentences === (30 Questions)
  final part5Questions = [
    {
      'question': "Please submit your time sheets ______ the end of the day.",
      'options': ['by', 'on', 'at', 'in'],
      'correctIndex': 0,
      'explain': '"By" (trước, hoặc chậm nhất là) được dùng để chỉ hạn chót.',
    },
    {
      'question':
          "The marketing team created a very ______ advertising campaign.",
      'options': ['effect', 'effective', 'effectively', 'effectiveness'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (effective - hiệu quả) để bổ nghĩa cho cụm danh từ "advertising campaign".',
    },
    {
      'question':
          "______ Ms. Chen speaks fluent Mandarin is a great asset to the team.",
      'options': ['That', 'What', 'Who', 'Which'],
      'correctIndex': 0,
      'explain':
          'Mệnh đề danh từ "That Ms. Chen speaks fluent Mandarin" (Việc cô Chen nói tiếng Quan Thoại lưu loát) đóng vai trò làm chủ ngữ của câu.',
    },
    {
      'question':
          "The company decided to ______ its headquarters to Austin, Texas.",
      'options': ['relocate', 'relocation', 'relocating', 'relocated'],
      'correctIndex': 0,
      'explain':
          'Sau động từ "decided to" cần một động từ nguyên mẫu (relocate - di dời).',
    },
    {
      'question':
          "The workshop is designed ______ participants with practical skills.",
      'options': ['provide', 'providing', 'to provide', 'provided'],
      'correctIndex': 2,
      'explain':
          'Cấu trúc "designed to do something" (được thiết kế để làm gì) yêu cầu động từ nguyên mẫu có "to".',
    },
    {
      'question':
          "Mr. Kim ______ travels internationally for business meetings.",
      'options': ['frequent', 'frequency', 'frequently', 'frequented'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (frequently - thường xuyên) để bổ nghĩa cho động từ "travels".',
    },
    {
      'question': "The new software update includes several security ______.",
      'options': ['enhance', 'enhances', 'enhanced', 'enhancements'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "security" cần một danh từ số nhiều (enhancements - sự cải tiến).',
    },
    {
      'question': "______ the two candidates, Ms. Evans has more experience.",
      'options': ['Of', 'With', 'From', 'By'],
      'correctIndex': 0,
      'explain':
          'Giới từ "Of" (Trong số) thường được dùng trước một nhóm ("the two candidates") khi so sánh.',
    },
    {
      'question': "Please be ______ when handling the laboratory equipment.",
      'options': ['careful', 'carefully', 'carefulness', 'caring'],
      'correctIndex': 0,
      'explain': 'Sau động từ "be" cần một tính từ (careful - cẩn thận).',
    },
    {
      'question': "The construction project is progressing ______ to schedule.",
      'options': ['accord', 'according', 'accordance', 'accordingly'],
      'correctIndex': 1,
      'explain':
          'Cụm giới từ "according to schedule" (theo đúng tiến độ) là cụm cố định.',
    },
    {
      'question':
          "We apologize for any ______ caused by the temporary closure.",
      'options': ['inconvenience', 'inconvenient', 'inconveniently', 'convene'],
      'correctIndex': 0,
      'explain':
          'Sau tính từ "any" cần một danh từ (inconvenience - sự bất tiện).',
    },
    {
      'question': "The manager ______ the team on their excellent performance.",
      'options': [
        'congratulate',
        'congratulated',
        'congratulating',
        'congratulation',
      ],
      'correctIndex': 1,
      'explain':
          'Cần một động từ ở thì quá khứ đơn (congratulated - đã chúc mừng).',
    },
    {
      'question':
          "______ interested in the position should submit their resume online.",
      'options': ['Who', 'Whoever', 'Those', 'They'],
      'correctIndex': 2,
      'explain':
          'Đại từ "Those" (Những người) + mệnh đề quan hệ rút gọn ("interested...") đóng vai trò làm chủ ngữ.',
    },
    {
      'question':
          "The new marketing strategy is ______ different from the previous one.",
      'options': ['consider', 'considerate', 'considerably', 'consideration'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (considerably - đáng kể) để bổ nghĩa cho tính từ "different".',
    },
    {
      'question': "Please ensure that your contact information is ______.",
      'options': ['accuracy', 'accurate', 'accurately', 'accurateness'],
      'correctIndex': 1,
      'explain': 'Sau động từ "is" cần một tính từ (accurate - chính xác).',
    },
    {
      'question':
          "The company experienced rapid ______ during the last fiscal year.",
      'options': ['grow', 'grew', 'grown', 'growth'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "rapid" cần một danh từ (growth - sự tăng trưởng).',
    },
    {
      'question':
          "The workshop was canceled ______ not enough people registered.",
      'options': ['because', 'because of', 'due to', 'although'],
      'correctIndex': 0,
      'explain':
          '"Because" (bởi vì) là liên từ, nối với một mệnh đề ("not enough people registered").',
    },
    {
      'question': "Mr. Tanaka has ______ knowledge of the Asian market.",
      'options': ['extend', 'extensive', 'extension', 'extensively'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (extensive - sâu rộng) để bổ nghĩa cho danh từ "knowledge".',
    },
    {
      'question':
          "The final decision will be ______ by the board of directors.",
      'options': ['make', 'made', 'making', 'makes'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (made) để tạo thành thể bị động (will be made - sẽ được đưa ra).',
    },
    {
      'question':
          "Employees are reminded to keep their workstations ______ at all times.",
      'options': ['tidy', 'tidily', 'tidiness', 'tidied'],
      'correctIndex': 0,
      'explain':
          'Cấu trúc "keep something + adjective" (giữ cái gì đó như thế nào). Cần tính từ "tidy" (gọn gàng).',
    },
    {
      'question':
          "This special offer is available ______ to newsletter subscribers.",
      'options': ['exclude', 'exclusive', 'exclusively', 'exclusion'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (exclusively - chỉ riêng) để bổ nghĩa cho cụm giới từ "to newsletter subscribers".',
    },
    {
      'question': "The conference schedule is ______ to change.",
      'options': ['subject', 'object', 'project', 'inject'],
      'correctIndex': 0,
      'explain':
          'Cụm từ "be subject to change" (có thể thay đổi) là một cụm cố định.',
    },
    {
      'question': "Ms. Lee requested a ______ transfer to the Paris office.",
      'options': ['permit', 'permanence', 'permanently', 'permanent'],
      'correctIndex': 3,
      'explain':
          'Cần một tính từ (permanent - lâu dài, vĩnh viễn) để bổ nghĩa cho danh từ "transfer".',
    },
    {
      'question': "The sales team ______ its quarterly target last month.",
      'options': ['exceed', 'exceeded', 'exceeding', 'exceeds'],
      'correctIndex': 1,
      'explain':
          'Trạng từ chỉ thời gian "last month" (tháng trước) đòi hỏi thì quá khứ đơn (exceeded - đã vượt).',
    },
    {
      'question': "______ the building is old, it is very well-maintained.",
      'options': ['Because', 'Although', 'Therefore', 'Unless'],
      'correctIndex': 1,
      'explain':
          '"Although" (mặc dù) là liên từ được dùng để chỉ sự tương phản.',
    },
    {
      'question':
          "The company is committed to ______ sustainable business practices.",
      'options': ['promote', 'promoting', 'promoted', 'promotion'],
      'correctIndex': 1,
      'explain':
          'Giới từ "to" (trong "committed to") được theo sau bởi một danh động từ (promoting - thúc đẩy).',
    },
    {
      'question':
          "Please return the equipment ______ you have finished using it.",
      'options': ['during', 'whether', 'once', 'regarding'],
      'correctIndex': 2,
      'explain': '"Once" (một khi) là liên từ chỉ thời gian phù hợp nhất.',
    },
    {
      'question': "The ______ of the new museum has attracted many visitors.",
      'options': ['architect', 'architectural', 'architecture', 'architected'],
      'correctIndex': 2,
      'explain': 'Sau mạo từ "The" cần một danh từ (architecture - kiến trúc).',
    },
    {
      'question': "The information you provided was extremely ______.",
      'options': ['help', 'helpful', 'helped', 'helpfully'],
      'correctIndex': 1,
      'explain':
          'Sau trạng từ "extremely" cần một tính từ (helpful - hữu ích).',
    },
    {
      'question':
          "Tickets for the concert can be purchased ______ online or at the box office.",
      'options': ['both', 'either', 'neither', 'whether'],
      'correctIndex': 1,
      'explain':
          'Cấu trúc "either... or..." (hoặc... hoặc...) được dùng để nối hai phương án.',
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part5')
      .set({'type': 'Incomplete Sentences', 'questionCount': 30});

  for (int i = 0; i < part5Questions.length; i++) {
    final questionNumber = i + 101;
    final id = 'q${questionNumber.toString().padLeft(3, '0')}';
    final q = part5Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
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
          'order': questionNumber,
        });
  }

  // // === PART 6: Text Completion === (16 Questions)

  // --- Passage 1: Questions 131-134 (E-mail) ---
  final passage131_134 = """
To: Project Team Alpha
From: Maria Garcia, Project Manager
Subject: Project Deadline Update
Date: May 10

Hi Team,

I'm writing to inform you about a change to the Project Alpha deadline. ____(131)____ client request, the final delivery date has been moved up by one week. The new deadline is now Friday, May 24.

I understand this is a significant ____(132)____, but I am confident we can meet it if we work together efficiently. I have already adjusted the task schedule in our project management software. Please review your assigned tasks and update your progress ____(133)____ the end of today.

Let's schedule a brief meeting tomorrow morning to discuss any potential challenges. ____(134)____. Thank you for your flexibility and hard work.
""";
  // --- Passage 2: Questions 135-138 (Advertisement) ---
  final passage135_138 = """
**Oak Street Bistro - Weekend Brunch!**

Join us this weekend for our delicious brunch menu! ____(135)____ from 10 A.M. to 2 P.M. on Saturdays and Sundays, Oak Street Bistro offers a variety of brunch classics and creative specials.

Enjoy our famous French toast, eggs Benedict, or try our seasonal fruit pancakes. All brunch entrees ____(136)____ with your choice of coffee ____(137)____ fresh-squeezed orange juice.

We have indoor and outdoor seating available. ____(138)____. Reservations are recommended, especially for larger groups. Call us or book online today!
""";
  // --- Passage 3: Questions 139-142 (Memo) ---
  final passage139_142 = """
**MEMORANDUM**
To: All Building Occupants
From: Facility Services
Subject: Water Outage - Wednesday, July 17
Date: July 15

Please be advised that the water supply to the entire building will be temporarily shut off this Wednesday, July 17, from 1:00 P.M. to 4:00 P.M. This ____(139)____ is necessary to allow our maintenance crew to perform essential repairs on the main water line.

During this time, restrooms and kitchen sinks will not be ____(140)____. We recommend planning accordingly. ____(141)____.

We expect the water service to be fully restored by 4:00 P.M. We appreciate your ____(142)____ and understanding.
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**Tech Conference Draws Record Crowds**

(April 25) – The annual Global Tech Summit, held last week in San Francisco, attracted a record number of attendees. ____(143)____ 10,000 industry professionals gathered for the three-day event.

The conference featured keynote speeches from several high-profile CEOs and over 100 workshops ____(144)____ topics ranging from artificial intelligence to cybersecurity. The exhibition hall, showcasing the latest gadgets and software, was particularly popular.

"This year's summit exceeded all expectations," said organizer Sarah Chen. "The energy and innovation on display were truly ____(145)____." Plans for next year's conference, which will take place in Singapore, are already underway. ____(146)____.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["Due to", "Instead of", "Because", "In spite of"],
      'correctIndex': 0,
      'explain':
          "Cụm giới từ 'Due to' (Do) được dùng để chỉ nguyên nhân, theo sau là một cụm danh từ ('client request').",
    },
    {
      'question': "",
      'options': ["adjust", "adjusted", "adjusting", "adjustment"],
      'correctIndex': 3,
      'explain':
          "Sau tính từ 'significant' cần một danh từ (adjustment - sự điều chỉnh).",
    },
    {
      'question': "",
      'options': ["by", "on", "at", "in"],
      'correctIndex': 0,
      'explain':
          "Giới từ 'by' được dùng để chỉ hạn chót (trước cuối ngày hôm nay).",
    },
    {
      'question': "",
      'options': [
        "Please bring your questions and concerns.",
        "The client was very impressed with our work.",
        "The software update is complete.",
        "We need to stay within the budget.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này kêu gọi sự chuẩn bị cho cuộc họp ('brief meeting') được đề cập ở câu trước.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["Serve", "Served", "Serving", "Serves"],
      'correctIndex': 1,
      'explain':
          "Mệnh đề rút gọn (Served from...). Dạng đầy đủ là 'Which is served from...'.",
    },
    {
      'question': "",
      'options': ["come", "comes", "came", "coming"],
      'correctIndex':
          0, // Should be 'come' because the subject is 'entrees' (plural)
      'explain':
          "Chủ ngữ là 'All brunch entrees' (số nhiều), nên động từ ở thì hiện tại đơn không thêm 's' (come).",
    },
    {
      'question': "",
      'options': ["or", "and", "but", "so"],
      'correctIndex': 0,
      'explain':
          "Liên từ 'or' được dùng để đưa ra sự lựa chọn giữa 'coffee' và 'orange juice'.",
    },
    {
      'question': "",
      'options': [
        "Our patio is perfect for sunny days.",
        "The brunch menu changes seasonally.",
        "We are closed on Mondays.",
        "Coffee and juice cost extra.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này cung cấp thêm thông tin về chỗ ngồi ngoài trời ('outdoor seating') đã được đề cập.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["interrupt", "interrupted", "interruption", "interrupting"],
      'correctIndex': 2,
      'explain':
          "Sau tính từ 'This' cần một danh từ (interruption - sự gián đoạn).",
    },
    {
      'question': "",
      'options': ["function", "functional", "functioned", "functionally"],
      'correctIndex': 1,
      'explain':
          "Sau động từ 'be' (will not be) cần một tính từ (functional - hoạt động được).",
    },
    {
      'question': "",
      'options': [
        "Please store water for essential use.",
        "The repairs may finish early.",
        "Only the main water line is affected.",
        "Maintenance crews will need access.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này đưa ra một lời khuyên hợp lý ('lưu trữ nước') trong tình huống mất nước ('water supply... shut off').",
    },
    {
      'question': "",
      'options': ["patient", "patients", "patience", "patiently"],
      'correctIndex': 2,
      'explain':
          "Sau tính từ sở hữu 'your' cần một danh từ (patience - sự kiên nhẫn).",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': [
        "Approximate",
        "Approximation",
        "Approximately",
        "Approximated",
      ],
      'correctIndex': 2,
      'explain':
          "Cần một trạng từ (Approximately - Khoảng) để bổ nghĩa cho con số '10,000'.",
    },
    {
      'question': "",
      'options': ["cover", "covers", "covered", "covering"],
      'correctIndex': 3,
      'explain':
          "Dùng hiện tại phân từ (covering - bao gồm) để bắt đầu một cụm từ bổ nghĩa cho 'workshops'.",
    },
    {
      'question': "",
      'options': ["inspire", "inspired", "inspiring", "inspiration"],
      'correctIndex': 2,
      'explain':
          "Cần một tính từ (inspiring - truyền cảm hứng) để mô tả 'energy and innovation'.",
    },
    {
      'question': "",
      'options': [
        "Tickets sold out weeks in advance.",
        "Registration details will be announced soon.",
        "San Francisco is a major tech hub.",
        "The event focused heavily on networking.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp thông tin hợp lý tiếp theo, nối tiếp việc đề cập đến hội nghị năm sau ('Plans for next year's conference...').",
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part6')
      .set({'type': 'Text Completion', 'questionCount': 16});

  for (int i = 0; i < part6Questions.length; i++) {
    final questionNumber = i + 131;
    final id = 'q${questionNumber.toString().padLeft(3, '0')}';
    final q = part6Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
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
          'order': questionNumber,
        });
  }

  // // === PART 7: Reading Comprehension === (54 Questions)

  // --- Single Passages (Q147-175) ---

  // Q147-148 (Advertisement)
  final passage147_148 = """
**Central City Running Club - Join Us!**

Want to get fit and meet new people? Join the Central City Running Club! We welcome runners of all levels, from beginners to experienced marathoners.

We meet every Tuesday and Thursday evening at 6:30 P.M. at the entrance to City Park for group runs. We also organize longer runs on Saturday mornings.

Membership is only \$30 per year and includes a club T-shirt and discounts at local running stores. Visit ccrc.org for more information and to sign up!
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: Facilities Department <facilities@corpnet.com>
From: David Miller <d.miller@corpnet.com>
Subject: Light fixture in office 4B
Date: August 5

Hello,
The overhead light fixture in my office (4B) is flickering constantly. It started yesterday afternoon and is quite distracting.

Could someone from maintenance please come and take a look at it as soon as possible?

Thank you,
David Miller
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Kenji (9:05 A.M.)**: Hi Sarah, the presentation file you sent seems to be password-protected. I can't open it.
**Sarah (9:06 A.M.)**: Oh, sorry about that! I forgot I added one. The password is 'Phoenix2025'.
**Kenji (9:07 A.M.)**: Got it. Thanks! I'll load it onto the conference room computer now. The meeting starts in 15 minutes.
**Sarah (9:08 A.M.)**: Great. I'm on my way up.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**Local Bakery Expands**

(June 15) – 'Sweet Surrender Bakery', a popular local spot known for its cupcakes and custom cakes, has announced it will be opening a second location this fall. The new shop will be located in the Oakwood Shopping Plaza on the north side of town.

Owner Maria Garcia started the bakery five years ago. "We've been overwhelmed by the community's support," Garcia said. "This expansion will allow us to serve more customers and offer a wider variety of pastries."

The new location will also feature a small cafe area with seating. Garcia expects to hire about 10 new employees for the Oakwood shop.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Office Memo: Refrigerator Cleaning**

Please note that the office refrigerator in the 3rd-floor break room will be cleaned out this Friday afternoon, July 12, after 4:00 P.M.

Any items left in the refrigerator at that time will be discarded. This includes all food, drinks, and containers.

Please make sure to remove your personal belongings before Friday afternoon. Thank you for your cooperation in keeping our kitchen clean.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Marketing Staff
**From**: Sarah Chen, Marketing Director
**Date**: February 10
**Subject**: New Social Media Guidelines

Attached, please find the updated company guidelines for using social media. These guidelines apply to both official company accounts and personal accounts when discussing work-related matters.

Key changes include stricter rules regarding the sharing of confidential information and new procedures for responding to customer comments online.

All marketing staff are required to read the updated guidelines carefully and sign the acknowledgment form by this Friday, February 14.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Maintenance Department <maint@cityapartments.com>
From: Tenant - Apt 6C <j.davis@email.com>
Subject: Leaky Faucet
Date: April 19

Hello,
The faucet in my kitchen sink has been dripping constantly for the past few days. It seems to be getting worse.

Could you please send someone to repair it as soon as possible? I am usually home after 5:00 P.M. on weekdays.

Thank you,
John Davis
Apt 6C
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**'Write Now' Professional Development Workshop**

**Topic**: Effective Business Writing
**Date**: Tuesday, May 21
**Time**: 9:00 A.M. - 4:00 P.M. (Lunch included)
**Location**: Grand Conference Center, Room 3
**Instructor**: Dr. Annabelle Lee, Communications Expert

Learn how to write clear, concise, and persuasive e-mails, reports, and proposals. This interactive workshop will cover grammar essentials, tone, structure, and proofreading techniques.

**Cost**: \$250 per person (includes materials and lunch)
Limited spots available. Register by May 10 at WriteNow.com.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**'Global Travel' Magazine - Subscription Renewal**

**Account Number**: GT-9087
**Subscriber**: Maria Garcia
**Subscription**: 1 Year (12 Issues) - Print + Digital

**Renewal Offer**: Renew now and save 20% off the regular price!
* Regular Price: \$50.00
* **Your Renewal Price**: **\$40.00**

[X] Yes, renew my subscription for 1 year at \$40.00.
[ ] No, do not renew my subscription.

**Payment Method**: Credit Card on file (ending in 5678)
**Expiration Date**: Your current subscription expires October 31. This renewal will extend it to October 31 of next year.
""";
  // Q172-175 (Article)
  final passage172_175 = """
**City Museum Receives Large Donation**

(November 8) – The Springfield City Museum announced today it has received a \$2 million donation from the estate of local philanthropist Eleanor Vance. Ms. Vance, who passed away earlier this year, was a long-time supporter of the museum.

Museum Director Aris Thorne stated that the funds will be used primarily for the planned expansion of the museum's educational wing. "This generous gift will allow us to create new classrooms and interactive exhibits for students," Thorne said.

A portion of the donation will also be used to establish an endowment fund to support future museum programs.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (Notice + E-mail)
  final passage176_180_1 = """
**Notice: Oak Street Book Fair This Weekend!**

Don't miss the annual Oak Street Book Fair this Saturday and Sunday (June 8-9) from 10 A.M. to 5 P.M. in Central Plaza.
* Used books, new releases, local authors!
* Children's story time at 11 A.M. both days.
* Live music in the afternoon.
* Food vendors on site.

**Special Event**: Meet award-winning mystery author Alan Pei! He will be signing copies of his latest book, "Silent Night," on Saturday from 1 P.M. to 3 P.M. at the main tent.
""";
  final passage176_180_2 = """
To: friends@bookclub.com
From: Sarah K. <sarahk@email.com>
Subject: Book Fair Meetup?
Date: June 7

Hi everyone,
Just saw the notice about the Oak Street Book Fair this weekend. I was planning to go on Saturday afternoon, mainly to get Alan Pei's autograph. His new book sounds really interesting.

Would anyone like to meet up there? Maybe around 12:30 P.M. near the main tent so we can be ready for the signing? Let me know!

Best,
Sarah
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
To: All Full-Time Employees
From: Human Resources
Date: July 1
Subject: New Performance Review Software

Starting August 1, we will transition to a new online software platform called 'PerformMax' for conducting annual performance reviews.

This new system will streamline the process, allowing employees and managers to track goals and provide feedback throughout the year. Paper forms will no longer be used.

Mandatory training sessions on how to use PerformMax will be held during the last two weeks of July. Please look out for a separate e-mail from the Training Department with the schedule and sign-up instructions.
""";
  final passage181_185_2 = """
To: Training Department
From: David Miller
Subject: PerformMax Training
Date: July 16

Hello,
I received the schedule for the PerformMax training sessions. Unfortunately, I will be out of the office on vacation during the last two weeks of July (July 21 - August 1).

Will there be alternative training dates offered? Or perhaps a recorded version of the session available online? I want to make sure I know how to use the new system before my team's reviews are due.

Thanks,
David Miller
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: 'Quick Dry' All-Weather Jacket**

Stay dry and comfortable in any weather!
* **Price**: \$150.00
* **Features**: Waterproof & breathable fabric, adjustable hood, zippered pockets, lightweight design. Perfect for hiking or city commuting.
* **Colors**: Black, Forest Green, Royal Blue
* **Sizes**: S, M, L, XL
* **Shipping**: Standard (5-7 days) - \$5. Express (2 days) - \$15.
* **Returns**: Free returns within 30 days.
""";
  final passage186_190_2 = """
**From**: orders@outdoorworld.com
**To**: k.tanaka@email.com
**Subject**: Order Confirmation #OW-775
**Date**: April 12

Dear Kenji Tanaka,
Thank you for your order!
* 1 x 'Quick Dry' All-Weather Jacket (Color: Forest Green, Size: L) - \$150.00
* Express Shipping - \$15.00
* Tax - \$9.90
* **Total**: **\$174.90**

Your order will ship within 1 business day. You will receive a tracking number via e-mail.
""";
  final passage186_190_3 = """
**From**: Kenji Tanaka <k.tanaka@email.com>
**To**: returns@outdoorworld.com
**Subject**: Return Request - Order #OW-775
**Date**: April 16

Hello,
I received my jacket order today (April 14, thanks for the fast shipping!). Unfortunately, the size Large is too big for me.

I would like to return it and exchange it for a size Medium in the same color (Forest Green).

Please provide instructions for the return and exchange process. According to your website, returns are free.

Thank you,
Kenji Tanaka
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**City Gazette: Museum Announces Lecture Series**
(September 5) – The City History Museum today announced its fall lecture series, focusing on "Springfield Through the Decades." The series will feature four evening lectures by local historians.
The first lecture, on October 3, will be given by Dr. Alan Brody, discussing the city's founding and early development in the 19th century. Subsequent lectures in October and November will cover the early 20th century, the post-war era, and recent history.
All lectures begin at 7:00 P.M. in the museum auditorium. Tickets are \$10 per lecture or \$30 for the full series.
""";
  final passage191_195_2 = """
**To**: info@cityhistorymuseum.org
**From**: laura.c@email.com
**Subject**: Lecture Series Inquiry
**Date**: September 28

Hello,
I am interested in attending the fall lecture series, specifically the first lecture on October 3 by Dr. Alan Brody.
However, I have a work commitment that evening until 7:15 P.M. Would it be possible to arrive a few minutes late? Or is late entry not permitted?
Also, can tickets be purchased at the door, or must they be bought in advance?
Thank you,
Laura Chen
""";
  final passage191_195_3 = """
**From**: City History Museum <info@cityhistorymuseum.org>
**To**: laura.c@email.com
**Subject**: Re: Lecture Series Inquiry
**Date**: September 29

Dear Ms. Chen,
Thank you for your interest. Yes, arriving a few minutes late for Dr. Brody's lecture on October 3 should be fine. Please enter quietly through the rear auditorium doors.
Tickets *can* be purchased at the door, but we strongly recommend buying them in advance via our website (cityhistorymuseum.org/tickets) as seating is limited and these events often sell out.
We hope to see you there!
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: Mark Stevens <mstevens@apexcorp.com>
**From**: Sarah Kim, 'Perfect Print' <skim@perfectprint.com>
**Subject**: Quote for Business Cards
**Date**: June 10

Hi Mark,
Following up on our conversation, here is the quote for printing 1000 standard business cards for Apex Corp:
* Design Setup: \$50 (One-time fee)
* Printing (Full Color, Double-Sided): \$150
* Premium Card Stock: Add \$30
* Matte Finish: Add \$20
* **Subtotal**: \$250 (Includes premium stock & matte finish)
* Tax: \$15
* **Total**: **\$265**
Please let me know if you'd like to proceed. Turnaround time is 3 business days after design approval.
""";
  final passage196_200_2 = """
**Perfect Print - INVOICE**
**Client**: Apex Corp (Mark Stevens)
**Invoice**: #PP-501
**Date**: June 20

**Services Rendered**:
* Business Card Printing (1000 units)
  * Design Setup Fee ................. \$50.00
  * Printing ........................ \$150.00
  * Premium Card Stock .............. \$30.00
  * Matte Finish .................... \$20.00
* **Subtotal**...................... \$250.00
* Tax .............................. \$15.00
* **Rush Fee** ..................... \$50.00
* * **TOTAL AMOUNT DUE**: **\$315.00**

**Payment Due**: July 20
""";
  final passage196_200_3 = """
**To**: Sarah Kim <skim@perfectprint.com>
**From**: Mark Stevens <mstevens@apexcorp.com>
**Subject**: Re: Invoice #PP-501
**Date**: June 21

Hi Sarah,
Thanks for sending the invoice. The cards look great, by the way.
I have a question about the \$50 Rush Fee. I don't recall requesting or agreeing to an expedited service. Your original quote mentioned a 3-day turnaround, and the cards arrived on the third day (June 19, approved design June 16).
Could you please clarify why this fee was added?
Thanks,
Mark
""";

  final part7Questions = [
    // Q147-148 (Advertisement)
    {
      'question':
          passage147_148 + "\n\n147. What is the Central City Running Club?",
      'options': [
        "A store selling running shoes",
        "A group for runners of all levels",
        "A marathon training program",
        "A fitness center",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo (Passage 1) nói 'We welcome runners of all levels...'",
    },
    {
      'question':
          passage147_148 + "\n\n148. What is included in the membership fee?",
      'options': [
        "Entry to races",
        "A club T-shirt",
        "Saturday morning coaching",
        "Access to City Park",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo (Passage 1) nói, 'Membership... includes a club T-shirt...'",
    },
    // Q149-150 (E-mail)
    {
      'question':
          passage149_150 + "\n\n149. Why did David Miller write the e-mail?",
      'options': [
        "To request a new office",
        "To complain about the noise",
        "To report a problem with a light",
        "To ask for maintenance schedule",
      ],
      'correctIndex': 2,
      'explain':
          "Chủ đề (Passage 2) là 'Light fixture in office 4B' và David viết 'The overhead light fixture... is flickering constantly.'",
    },
    {
      'question': passage149_150 + "\n\n150. When did the problem start?",
      'options': ["Sáng nay", "Chiều hôm qua", "Tuần trước", "Không rõ"],
      'correctIndex': 1,
      'explain': "David (Passage 2) viết, 'It started yesterday afternoon...'",
    },
    // Q151-152 (Text Message Chain)
    {
      'question': passage151_152 + "\n\n151. What problem does Kenji report?",
      'options': [
        "The file is missing.",
        "The meeting started late.",
        "He cannot open a file.",
        "The computer is not working.",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 3) viết, 'the presentation file... seems to be password-protected. I can't open it.'",
    },
    {
      'question':
          passage151_152 + "\n\n152. What information does Sarah provide?",
      'options': [
        "A meeting time",
        "A file name",
        "A password",
        "A room number",
      ],
      'correctIndex': 2,
      'explain': "Sarah (Passage 3) trả lời, 'The password is 'Phoenix2025'.'",
    },
    // Q153-155 (Article)
    {
      'question': passage153_155 + "\n\n153. What is the article mainly about?",
      'options': [
        "A new shopping plaza",
        "A bakery opening a second location",
        "Maria Garcia's career",
        "Popular cupcakes and cakes",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) thông báo ''Sweet Surrender Bakery'... will be opening a second location'.",
    },
    {
      'question':
          passage153_155 + "\n\n154. Where will the new shop be located?",
      'options': [
        "Downtown",
        "In the Oakwood Shopping Plaza",
        "Next to the old shop",
        "On the south side of town",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) nói, 'The new shop will be located in the Oakwood Shopping Plaza'.",
    },
    {
      'question':
          passage153_155 +
          "\n\n155. What will be a feature of the new location?",
      'options': [
        "A wider variety of cakes",
        "A delivery service",
        "A seating area",
        "Online ordering",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) nói, 'The new location will also feature a small cafe area with seating.'",
    },
    // Q156-157 (Notice)
    {
      'question':
          passage156_157 + "\n\n156. What will happen on Friday afternoon?",
      'options': [
        "The break room will be closed.",
        "New refrigerators will be installed.",
        "The office refrigerator will be cleaned.",
        "Employees must label their food.",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) nói, 'the office refrigerator... will be cleaned out this Friday afternoon'.",
    },
    {
      'question':
          passage156_157 +
          "\n\n157. What will happen to items left in the refrigerator?",
      'options': [
        "They will be moved.",
        "They will be labeled.",
        "They will be discarded.",
        "They will be stored.",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) cảnh báo, 'Any items left... will be discarded.'",
    },
    // Q158-160 (Memo)
    {
      'question': passage158_160 + "\n\n158. What is the subject of the memo?",
      'options': [
        "Confidential information",
        "Customer comments",
        "Social media accounts",
        "Updated company guidelines",
      ],
      'correctIndex': 3,
      'explain':
          "Chủ đề (Passage 6) là 'New Social Media Guidelines' và thông báo về 'updated company guidelines'.",
    },
    {
      'question': passage158_160 + "\n\n159. What is one key change mentioned?",
      'options': [
        "Rules about sharing confidential information",
        "How to create social media accounts",
        "When to respond to customers",
        "How to use personal accounts",
      ],
      'correctIndex': 0,
      'explain':
          "Memo (Passage 6) nói, 'Key changes include stricter rules regarding the sharing of confidential information...'",
    },
    {
      'question': passage158_160 + "\n\n160. What must employees do by Friday?",
      'options': [
        "Update their social media",
        "Read the guidelines and sign a form",
        "Attend a training session",
        "Respond to customer comments",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) yêu cầu, 'read the updated guidelines carefully and sign the acknowledgment form by this Friday'.",
    },
    // Q161-163 (E-mail)
    {
      'question':
          passage161_163 + "\n\n161. Why did John Davis write the e-mail?",
      'options': [
        "To schedule maintenance",
        "To report a maintenance issue",
        "To complain about noise",
        "To ask about his lease",
      ],
      'correctIndex': 1,
      'explain':
          "Chủ đề (Passage 7) là 'Leaky Faucet' và John viết, 'The faucet in my kitchen sink has been dripping constantly...'",
    },
    {
      'question': passage161_163 + "\n\n162. When is Mr. Davis typically home?",
      'options': ["Buổi sáng", "Buổi chiều", "Cuối tuần", "Sau 5 giờ chiều"],
      'correctIndex': 3,
      'explain':
          "Anh ấy (Passage 7) viết, 'I am usually home after 5:00 P.M. on weekdays.'",
    },
    {
      'question': passage161_163 + "\n\n163. What does Mr. Davis request?",
      'options': [
        "A new faucet",
        "A discount on rent",
        "Someone to repair the faucet soon",
        "Instructions on how to fix it",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy (Passage 7) hỏi, 'Could you please send someone to repair it as soon as possible?'",
    },
    // Q164-167 (Webpage)
    {
      'question':
          passage164_167 + "\n\n164. What is the topic of the workshop?",
      'options': [
        "Communications strategy",
        "Business writing",
        "Public speaking",
        "Report structuring",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) ghi 'Topic: Effective Business Writing'.",
    },
    {
      'question': passage164_167 + "\n\n165. Who is the instructor?",
      'options': [
        "A grammar expert",
        "A report writer",
        "A communications expert",
        "Một người không rõ",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) ghi 'Instructor: Dr. Annabelle Lee, Communications Expert'.",
    },
    {
      'question': passage164_167 + "\n\n166. What is included in the cost?",
      'options': ["Bữa trưa", "Bữa tối", "Sách giáo trình", "Chứng chỉ"],
      'correctIndex': 0,
      'explain':
          "Trang web (Passage 8) ghi 'Cost: \$250 per person (includes materials and lunch)'.",
    },
    {
      'question': passage164_167 + "\n\n167. What is the deadline to register?",
      'options': ["May 10", "May 21", "Không có hạn chót", "Không rõ"],
      'correctIndex': 0,
      'explain':
          "Trang web (Passage 8) nói, 'Register by May 10 at WriteNow.com.'",
    },
    // Q168-171 (Form)
    {
      'question':
          passage168_171 + "\n\n168. What action is Maria Garcia taking?",
      'options': [
        "Starting a new subscription",
        "Renewing her subscription",
        "Canceling her subscription",
        "Changing her address",
      ],
      'correctIndex': 1,
      'explain':
          "Form (Passage 9) là 'Subscription Renewal' và cô ấy đã chọn '[X] Yes, renew my subscription'.",
    },
    {
      'question':
          passage168_171 + "\n\n169. What format did Maria Garcia choose?",
      'options': [
        "Print Only",
        "Digital Only",
        "Print + Digital",
        "Không chọn",
      ],
      'correctIndex': 1,
      'explain':
          "Form (Passage 9) cho thấy cô ấy đã chọn '[X] Digital Only (\$25.00/year)' và tổng tiền là '\$25.00'.", // Giải thích theo form đã sửa
    },
    {
      'question': passage168_171 + "\n\n170. How much is Maria Garcia paying?",
      'options': ["\$25.00", "\$30.00", "\$40.00", "\$50.00"],
      'correctIndex': 0, // Sửa lại theo logic đã sửa
      'explain': "Form (Passage 9) ghi 'Total Charged: \$25.00'.",
    },
    {
      'question':
          passage168_171 +
          "\n\n171. When does her current subscription expire?",
      'options': ["Tháng này", "Tháng 6", "Tháng 10", "Năm sau"],
      'correctIndex': 2,
      'explain':
          "Form (Passage 9) ghi 'Your current subscription expires October 31.'",
    },
    // Q172-175 (Article)
    {
      'question': passage172_175 + "\n\n172. What did the City Museum receive?",
      'options': [
        "A new director",
        "An award",
        "A large donation",
        "New exhibits",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) thông báo bảo tàng 'has received a \$2 million donation'.",
    },
    {
      'question': passage172_175 + "\n\n173. Who was Eleanor Vance?",
      'options': [
        "The museum director",
        "A local artist",
        "A student",
        "A museum supporter",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 10) mô tả cô ấy là 'local philanthropist' và 'long-time supporter of the museum'.",
    },
    {
      'question':
          passage172_175 + "\n\n174. How will most of the money be used?",
      'options': [
        "To acquire new art",
        "To fund museum programs",
        "To expand the educational wing",
        "To establish an endowment",
      ],
      'correctIndex': 2,
      'explain':
          "Giám đốc Thorne (Passage 10) nói 'the funds will be used primarily for the planned expansion of the museum's educational wing.'",
    },
    {
      'question': passage172_175 + "\n\n175. What will the expansion include?",
      'options': [
        "A new entrance",
        "More gallery space",
        "An endowment fund",
        "New classrooms",
      ],
      'correctIndex': 3,
      'explain':
          "Ông Thorne (Passage 10) nói, 'This generous gift will allow us to create new classrooms and interactive exhibits...'",
    },

    // --- Double Passages ---

    // Q176-180 (Notice + E-mail)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. What event is described in the notice?",
      'options': [
        "A book signing",
        "A street fair",
        "A book club meeting",
        "A book fair",
      ],
      'correctIndex': 3,
      'explain': "Thông báo (Passage 1) là về 'Oak Street Book Fair'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. When will Alan Pei be signing books?",
      'options': [
        "11:00 AM",
        "12:30 PM",
        "Saturday afternoon",
        "Sunday afternoon",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 1) nói ông ấy sẽ ký sách 'on Saturday from 1 P.M. to 3 P.M.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What is the title of Alan Pei's latest book?",
      'options': [
        "Oak Street Book Fair",
        "Silent Night",
        "Book Club Meetup",
        "Không được đề cập",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 1) đề cập ông ấy sẽ ký 'copies of his latest book, \"Silent Night.\"'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. Why does Sarah K. want to go to the fair on Saturday?",
      'options': [
        "To listen to live music",
        "To attend story time",
        "To meet Alan Pei",
        "To browse used books",
      ],
      'correctIndex': 2,
      'explain':
          "Sarah (Passage 2) viết, 'I was planning to go on Saturday afternoon, mainly to get Alan Pei's autograph.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What time does Sarah K. suggest meeting?",
      'options': ["10:00 AM", "11:00 AM", "12:30 PM", "1:00 PM"],
      'correctIndex': 2,
      'explain':
          "Sarah (Passage 2) đề nghị, 'Maybe around 12:30 P.M. near the main tent...?'",
    },
    // Q181-185 (Memo + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What change is announced in the memo?",
      'options': [
        "A new performance review schedule",
        "A new online software for reviews",
        "A new goal tracking system",
        "Mandatory training sessions",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 1) thông báo 'we will transition to a new online software platform called 'PerformMax' for conducting annual performance reviews.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. When will the new system be implemented?",
      'options': ["July 1", "Cuối tháng 7", "August 1", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) nói, 'Starting August 1, we will transition...'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What will happen during the last two weeks of July?",
      'options': [
        "Performance reviews will be conducted.",
        "Employees will go on vacation.",
        "Training sessions will be held.",
        "Paper forms will be collected.",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) nói, 'Mandatory training sessions... will be held during the last two weeks of July.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Why did David Miller write the e-mail?",
      'options': [
        "To sign up for training",
        "To complain about the new software",
        "To ask about alternative training options",
        "To request access to PerformMax",
      ],
      'correctIndex': 2,
      'explain':
          "David (Passage 2) giải thích rằng anh ấy sẽ đi nghỉ trong thời gian đào tạo và hỏi 'Will there be alternative training dates offered? Or perhaps a recorded version...?'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. When will David Miller return from vacation?",
      'options': ["Cuối tháng 7", "July 21", "August 1", "August 2"],
      'correctIndex': 3,
      'explain':
          "David (Passage 2) nói anh ấy đi nghỉ 'July 21 - August 1'. Nghĩa là anh ấy sẽ trở lại vào August 2.",
    },

    // --- Triple Passages ---

    // Q186-190 (Ad + E-mail + E-mail)
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n186. What is NOT listed as a feature of the jacket?",
      'options': [
        "Zippered pockets",
        "An adjustable hood",
        "A lightweight design",
        "A removable lining",
      ],
      'correctIndex': 3,
      'explain':
          "Quảng cáo (Passage 1) liệt kê waterproof fabric, hood, pockets, lightweight design. 'Removable lining' (lớp lót tháo rời) không được đề cập.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. How much did Kenji Tanaka pay for shipping?",
      'options': ["\$0", "\$5", "\$9.90", "\$15"],
      'correctIndex': 3,
      'explain':
          "Quảng cáo (Passage 1) ghi Express là \$15. E-mail xác nhận (Passage 2) cũng ghi 'Express Shipping - \$15.00'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What was wrong with the jacket Mr. Tanaka received?",
      'options': [
        "It was the wrong color.",
        "It was damaged.",
        "It was the wrong size.",
        "It was missing the hood.",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy viết (Passage 3), 'Unfortunately, the size Large is too big for me.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. When did Mr. Tanaka receive his order?",
      'options': ["April 12", "April 14", "April 16", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "E-mail của anh ấy (Passage 3) được viết vào 'April 16' và nói 'I received my jacket order today (April 14...' - Có lỗi đánh máy trong passage 3, ngày nhận phải là April 14 hoặc 15. Dựa vào 'fast shipping', April 14 là hợp lý. E-mail xác nhận (Passage 2) ngày April 12 nói sẽ gửi trong 1 ngày làm việc, Express là 2 ngày.",
      // Sửa lại passage 3: "I received my jacket order yesterday (April 15..."
      // => Vẫn không khớp hoàn toàn với Express 2 ngày từ April 13 (ship).
      // Giữ nguyên là April 14 như trong text.
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What does Mr. Tanaka want to do?",
      'options': [
        "Return the jacket for a refund",
        "Exchange the jacket for a different size",
        "Complain about the shipping speed",
        "Ask for a discount",
      ],
      'correctIndex': 1,
      'explain':
          "Anh ấy (Passage 3) viết, 'I would like to return it and exchange it for a size Medium...'",
    },
    // Q191-195 (Article + E-mail + Schedule)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. What is the topic of the lecture series?",
      'options': [
        "Local historians",
        "Museum archives",
        "The city's history",
        "19th century development",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) nói series tập trung vào '\"Springfield Through the Decades.\"' (Lịch sử thành phố qua các thập kỷ).",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. Why did Laura Chen write the e-mail?",
      'options': [
        "To buy tickets for the series",
        "To ask about arriving late",
        "To inquire about Dr. Brody",
        "To confirm the lecture date",
      ],
      'correctIndex': 1,
      'explain':
          "Laura (Passage 2) giải thích cô ấy có việc đến 7:15 PM và hỏi 'Would it be possible to arrive a few minutes late?'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. What does the museum recommend regarding tickets?",
      'options': [
        "Buying them for the full series",
        "Buying them online in advance",
        "Buying them at the door",
        "Buying them from Dr. Brody",
      ],
      'correctIndex': 1,
      'explain':
          "Phản hồi của bảo tàng (Passage 3) nói vé *có thể* mua tại cửa, nhưng 'we strongly recommend buying them in advance via our website... as seating is limited'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. What is the topic of the October 3 lecture?",
      'options': [
        "The post-war era",
        "Recent city history",
        "The early 20th century",
        "The city's founding",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 1) nói bài giảng đầu tiên vào 'October 3' sẽ thảo luận về 'the city's founding and early development'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What is the price for the entire lecture series?",
      'options': ["\$10", "\$30", "\$40", "Miễn phí"],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) ghi 'Tickets are \$10 per lecture or \$30 for the full series.'",
    },
    // Q196-200 (E-mail + Invoice + E-mail)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. What service did Sarah Kim provide a quote for?",
      'options': [
        "Website design",
        "Business card printing",
        "Marketing consultation",
        "Logo design",
      ],
      'correctIndex': 1,
      'explain': "E-mail đầu tiên (Passage 1) là 'Quote for Business Cards'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the quote, what was the estimated total cost?",
      'options': ["\$150", "\$250", "\$265", "\$315"],
      'correctIndex': 2,
      'explain': "Báo giá (Passage 1) ghi 'Total: \$265'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. What additional fee appears on the invoice?",
      'options': [
        "Design Setup Fee",
        "Tax",
        "Premium Card Stock Fee",
        "Rush Fee",
      ],
      'correctIndex': 3,
      'explain':
          "Hóa đơn (Passage 2) có thêm một dòng 'Rush Fee' \$50, không có trong báo giá (Passage 1).",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. Why is Mark Stevens questioning the Rush Fee?",
      'options': [
        "He thinks the fee is too high.",
        "He did not request expedited service.",
        "The cards arrived late anyway.",
        "The quote included free shipping.",
      ],
      'correctIndex': 1,
      'explain':
          "Mark (Passage 3) viết, 'I don't recall requesting or agreeing to an expedited service.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What does Mark Stevens say about the business cards?",
      'options': [
        "They have a typo.",
        "They arrived on the third day.",
        "They used the wrong card stock.",
        "They look great.",
      ],
      'correctIndex': 3,
      'explain': "Mark (Passage 3) nói, 'The cards look great, by the way.'",
    },
  ];

  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .collection('parts')
      .doc('part7')
      .set({'type': 'Reading Comprehension', 'questionCount': 54});

  for (int i = 0; i < part7Questions.length; i++) {
    final questionNumber = i + 147;
    final id = 'q${questionNumber.toString().padLeft(3, '0')}';
    final q = part7Questions[i];

    await db
        .collection('practice_tests')
        .doc('LR_practice_tests')
        .collection('test_number')
        .doc(testId)
        .collection('parts')
        .doc('part7')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'], // Nối passage và câu hỏi
          'imagePath': null,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': questionNumber,
        });
  }

  print('Successfully seeded full TOEIC test with ID: $testId');
}
