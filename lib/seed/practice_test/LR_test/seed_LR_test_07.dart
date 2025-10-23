// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest07() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_07';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 07',
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
        'order': 7,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang điều chỉnh kính hiển vi trong phòng thí nghiệm.
      // Transcript:
      // (A) He's putting on a lab coat.
      // (B) He's adjusting a microscope.
      // (C) He's mixing chemicals in a beaker.
      // (D) He's writing notes in a notebook.
      'question': "",
      'options': [
        "He's putting on a lab coat.",
        "He's adjusting a microscope.",
        "He's mixing chemicals in a beaker.",
        "He's writing notes in a notebook.",
      ],
      'correctIndex': 1,
      'explain':
          'Người đàn ông đang dùng tay điều chỉnh (adjusting) một chiếc kính hiển vi (microscope).',
    },
    {
      // Image Description: Nhiều người đang ngồi trên ghế trong phòng chờ sân bay.
      // Transcript:
      // (A) Passengers are boarding an airplane.
      // (B) People are waiting in a departure lounge.
      // (C) Luggage is being claimed at baggage claim.
      // (D) Travelers are going through security check.
      'question': "",
      'options': [
        "Passengers are boarding an airplane.",
        "People are waiting in a departure lounge.",
        "Luggage is being claimed at baggage claim.",
        "Travelers are going through security check.",
      ],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy nhiều người đang ngồi trên ghế trong một khu vực giống phòng chờ (lounge) ở sân bay.',
    },
    {
      // Image Description: Một người phụ nữ đang cầm điện thoại và mỉm cười.
      // Transcript:
      // (A) She's hanging up the phone.
      // (B) She's sending a text message.
      // (C) She's smiling while holding a phone.
      // (D) She's plugging in her phone charger.
      'question': "",
      'options': [
        "She's hanging up the phone.",
        "She's sending a text message.",
        "She's smiling while holding a phone.",
        "She's plugging in her phone charger.",
      ],
      'correctIndex': 2,
      'explain':
          'Người phụ nữ đang mỉm cười (smiling) và tay đang cầm (holding) một chiếc điện thoại.',
    },
    {
      // Image Description: Xe cộ đang di chuyển trên cầu bắc qua sông.
      // Transcript:
      // (A) Cars are parked along the riverbank.
      // (B) Traffic is crossing a bridge over water.
      // (C) A ferry is transporting vehicles.
      // (D) Construction workers are repairing the bridge.
      'question': "",
      'options': [
        "Cars are parked along the riverbank.",
        "Traffic is crossing a bridge over water.",
        "A ferry is transporting vehicles.",
        "Construction workers are repairing the bridge.",
      ],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy xe cộ (traffic) đang đi qua (crossing) một cây cầu (bridge) bắc qua mặt nước (water).',
    },
    {
      // Image Description: Một người thợ mộc đang đo một tấm gỗ.
      // Transcript:
      // (A) A carpenter is measuring a piece of wood.
      // (B) A worker is painting a wooden fence.
      // (C) A man is stacking lumber.
      // (D) A customer is buying wood at a store.
      'question': "",
      'options': [
        "A carpenter is measuring a piece of wood.",
        "A worker is painting a wooden fence.",
        "A man is stacking lumber.",
        "A customer is buying wood at a store.",
      ],
      'correctIndex': 0,
      'explain':
          'Người thợ mộc (carpenter) đang dùng thước để đo (measuring) một tấm gỗ (piece of wood).',
    },
    {
      // Image Description: Một phòng ăn sang trọng với bàn ghế được sắp xếp ngăn nắp.
      // Transcript:
      // (A) Diners are eating a meal in a restaurant.
      // (B) Tables and chairs are arranged in a dining room.
      // (C) Food is being served from a buffet.
      // (D) A room is being set up for a banquet.
      'question': "",
      'options': [
        "Diners are eating a meal in a restaurant.",
        "Tables and chairs are arranged in a dining room.",
        "Food is being served from a buffet.",
        "A room is being set up for a banquet.",
      ],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy bàn (tables) và ghế (chairs) đã được sắp xếp (arranged) trong một phòng ăn (dining room). Không có người đang ăn.',
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
        'audioPath': 'LR_practice_tests/$testId/part1/audio.mp3',
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
      // Q7: Where is the manager's office?
      // (A) He's managing the team.
      // (B) It's the first door on the left.
      // (C) Yes, he's in his office.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Where" (Ở đâu). (B) chỉ vị trí.',
    },
    {
      // Q8: When should I expect the delivery?
      // (A) Sometime this afternoon.
      // (B) Please sign here.
      // (C) It's a heavy package.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "When" (Khi nào). (A) đưa ra khoảng thời gian dự kiến.',
    },
    {
      // Q9: Who borrowed the projector?
      // (A) I think someone from accounting did.
      // (B) It projects onto the screen.
      // (C) Can I borrow it later?
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi "Who" (Ai). (A) chỉ một nhóm người.',
    },
    {
      // Q10: Why is the store closed today?
      // (A) It opens at 9 AM.
      // (B) I bought it yesterday.
      // (C) It's a public holiday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'Câu hỏi "Why" (Tại sao). (C) đưa ra lý do.',
    },
    {
      // Q11: How often do you travel for work?
      // (A) I went to Singapore last month.
      // (B) Two or three times a year.
      // (C) By train, usually.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "How often" (Bao lâu một lần). (B) đưa ra tần suất.',
    },
    {
      // Q12: Is the Wi-Fi password posted somewhere?
      // (A) It's on the notice board.
      // (B) I'll pass it to you.
      // (C) The connection is strong.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi Yes/No. (A) trả lời "Yes" (gián tiếp) và chỉ vị trí.',
    },
    {
      // Q13: Should we take the stairs or the elevator?
      // (A) The elevator might be faster.
      // (B) Yes, we should take it.
      // (C) I'll meet you downstairs.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi lựa chọn (or). (A) chọn một phương án và đưa ra lý do.',
    },
    {
      // Q14: What do you think about the new office chairs?
      // (A) The office is on the second floor.
      // (B) They're much more comfortable.
      // (C) I chaired the committee.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "What do you think" (Bạn nghĩ gì). (B) đưa ra ý kiến.',
    },
    {
      // Q15: You didn't leave the door unlocked, did you?
      // (A) I locked it before I left.
      // (B) The key is on the table.
      // (C) No, I haven't left yet.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi đuôi (tag question) dạng phủ định. (A) trả lời "No" (gián tiếp) bằng cách khẳng định hành động ngược lại.',
    },
    {
      // Q16: How many applicants responded to the ad?
      // (A) The ad was in the newspaper.
      // (B) We received about 30 applications.
      // (C) They need to respond quickly.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "How many" (Bao nhiêu). (B) đưa ra số lượng.',
    },
    {
      // Q17: Why don't we review the presentation slides together?
      // (A) It was a great presentation.
      // (B) Sure, I'm free now.
      // (C) I already reviewed them.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why don\'t we..." là một lời đề nghị. (B) đồng ý ("Sure") và xác nhận sự sẵn sàng.',
    },
    {
      // Q18: Has the budget proposal been submitted?
      // (A) Yes, I sent it this morning.
      // (B) The proposal is well-written.
      // (C) We need to cut the budget.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi Yes/No. (A) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
    {
      // Q19: Could you turn the air conditioning up?
      // (A) Yes, it's quite warm in here.
      // (B) The condition is improving.
      // (C) I'll turn it off later.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một lời yêu cầu. (A) đồng ý với lý do ngầm của yêu cầu (nóng) và ngụ ý sẽ thực hiện.',
    },
    {
      // Q20: This is the best Italian restaurant in the city.
      // (A) I prefer Chinese food.
      // (B) Yes, the food is amazing.
      // (C) Let's make a reservation.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là một câu nhận xét, bày tỏ ý kiến. (B) đồng ý ("Yes") và thêm lời khen.',
    },
    {
      // Q21: What time does the museum close today?
      // (A) The exhibit was very interesting.
      // (B) It's usually 5 PM, but check their website.
      // (C) No, it's open now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "What time" (Mấy giờ). (B) đưa ra thời gian thông thường và lời khuyên kiểm tra lại.',
    },
    {
      // Q22: Didn't you already book the conference room?
      // (A) Yes, it's booked for 3 PM.
      // (B) The conference was canceled.
      // (C) I'll read the book later.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi Yes/No dạng phủ định. (A) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
    {
      // Q23: Whose umbrella is this?
      // (A) It looks like rain.
      // (B) It's not mine.
      // (C) I'll bring one tomorrow.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Whose" (Của ai). (B) là câu trả lời phủ định.',
    },
    {
      // Q24: How far is it to the nearest pharmacy?
      // (A) It's open 24 hours.
      // (B) Just around the block.
      // (C) I need some medicine.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "How far" (Bao xa). (B) đưa ra khoảng cách ước tính.',
    },
    {
      // Q25: Should I wear formal or casual clothes?
      // (A) The weather is casual today.
      // (B) I'll wear a tie.
      // (C) The invitation said business casual.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi lựa chọn (or). (C) đưa ra thông tin giúp người hỏi quyết định.',
    },
    {
      // Q26: When is the final decision expected?
      // (A) It was a difficult decision.
      // (B) We should know by the end of the week.
      // (C) I expect it to pass.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "When" (Khi nào). (B) đưa ra khung thời gian dự kiến.',
    },
    {
      // Q27: I can't connect to the internet.
      // (A) Let me check the router connection.
      // (B) The website is down for maintenance.
      // (C) I'll connect you now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu thông báo về vấn đề (không kết nối được). (A) đề xuất một bước kiểm tra.',
    },
    {
      // Q28: How often are the safety inspections conducted?
      // (A) They inspect every machine.
      // (B) It's very safe here.
      // (C) Annually, in January.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "How often" (Bao lâu một lần). (C) đưa ra tần suất và thời gian cụ thể.',
    },
    {
      // Q29: Would you mind taking notes during the meeting?
      // (A) The meeting was very long.
      // (B) I don't have a notepad.
      // (C) Sure, I can do that.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "Would you mind...?" là một yêu cầu. (C) là cách đồng ý.',
    },
    {
      // Q30: What kind of work does your company do?
      // (A) We develop software solutions.
      // (B) I work in the sales department.
      // (C) The company is growing quickly.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What kind" (Loại gì). (A) mô tả lĩnh vực hoạt động của công ty.',
    },
    {
      // Q31: Have you had a chance to look at my proposal?
      // (A) Yes, I read it last night. It looks good.
      // (B) I'll propose it at the next meeting.
      // (C) The proposal is due tomorrow.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'Câu hỏi Yes/No. (A) trả lời "Yes" và đưa ra nhận xét.',
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
        'audioPath': 'LR_practice_tests/$testId/part2/audio.mp3',
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
(Man) Hi, I'm calling about the advertisement for the apartment for rent on Oak Street. Is it still available?
(Woman) Yes, the two-bedroom apartment is still available. Were you interested in seeing it?
(Man) I am. I'm free this afternoon around 4 PM. Would that work?
(Woman) Let me check... Yes, 4 PM is fine. The address is 125 Oak Street, apartment 3B. I'll meet you there.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Woman) David, could you help me move this box of printer paper? It's too heavy for me.
(Man) Sure, Sarah. Where does it need to go?
(Woman) To the supply closet down the hall, next to the marketing department.
(Man) No problem. Let's lift it together on the count of three. One, two, three.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Man) I just got an e-mail saying the client meeting tomorrow has been moved to 10 AM instead of 9 AM.
(Woman) Oh really? That's actually better for me. I had another call scheduled at 9.
(Man) Good. Did you finish preparing the presentation slides?
(Woman) Yes, I finalized them last night. I'll e-mail them to you now so you can review them before the meeting.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Woman) Welcome to 'The Clothes Horse'. How can I help you?
(Man) Hi, I'm looking for a gift for my wife. Maybe a scarf?
(Woman) We have some beautiful new silk scarves over here. We have them in several colors and patterns. What style does she usually like?
(Man) She prefers solid colors, maybe blue or green.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Man) The deadline for the Henderson project is next Friday, and we're falling behind schedule.
(Woman) I know. The main delay is waiting for the design mockups from the external agency.
(Man) Have you contacted them?
(Woman) Yes, I e-mailed them this morning asking for an update. They haven't replied yet. I'll call them this afternoon if I don't hear back.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Woman) Good morning. I'd like to make a reservation for the airport shuttle tomorrow morning.
(Man) Okay. What time is your flight?
(Woman) It departs at 8:30 AM.
(Man) In that case, I recommend taking the 6:00 AM shuttle to be safe. It takes about an hour to get to the airport, and you should be there two hours before your flight. I'll book you for 6 AM.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Man) I think we should upgrade our office coffee machine. This one is old and keeps breaking down.
(Woman) I agree. It was out of order twice last month. What kind of machine are you thinking of?
(Man) Maybe one of those single-cup brewers? They seem convenient and less messy.
(Woman) That's a possibility. Let's research some models online and compare the costs. I can look into it this week.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Woman) Hi, Mr. Tanaka. I've finished drafting the minutes from yesterday's board meeting.
(Man) Excellent, Laura. Could you please proofread them carefully for any errors before you distribute them?
(Woman) Of course. I'll do that right now. Should I e-mail them to all board members once I'm done?
(Man) Yes, please. And copy me on the e-mail as well.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Man) Excuse me, I'm trying to find the session on 'Digital Marketing Trends'.
(Woman) Okay, let's look at the conference schedule. There are two sessions on that topic. One is at 10:00 AM in Room C, and the other is at 2:00 PM in Room A.
(Man) It's almost 10:00 now, so I missed the first one. Is Room A far from here?
(Woman) No, it's just down this corridor, the second door on your left. You have plenty of time before the 2:00 PM session.
---
**Conference Schedule - Morning**
- 9:00 AM: Keynote (Main Hall)
- 10:00 AM: AI in Business (Room A)
- 10:00 AM: Social Media Strategy (Room B)
- 10:00 AM: **Digital Marketing Trends** (Room C)

**Conference Schedule - Afternoon**
- 2:00 PM: **Digital Marketing Trends** (Room A)
- 2:00 PM: Cloud Computing (Room B)
- 3:30 PM: Networking Break (Lobby)
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Woman) I heard the company is planning to renovate the employee cafeteria.
(Man) Yes, finally! It really needs updating. The furniture is old, and the equipment often breaks.
(Woman) I agree. Do you know when the renovation will start?
(Man) The memo said it will begin next month and should take about six weeks. We'll have to use the temporary break room on the first floor during that time.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Man) Hi, I'd like to check the status of a book I ordered, 'The Global Market'.
(Woman) Okay, can I have your name, please?
(Man) David Miller.
(Woman) Let me check... Yes, Mr. Miller, the book arrived this morning. You can pick it up at the customer service desk anytime. We hold items for seven days.
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Woman) We need to choose a venue for the annual awards banquet. Any suggestions?
(Man) Well, we used the Grand Oak Hotel last year, and everyone seemed to like it.
(Woman) That's true, but I was hoping for something different this year. How about the City Art Museum? They rent out their main hall for events.
(Man) That could be interesting and elegant. Do you know how much it costs and how many people it holds? I'll look it up online.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Man) My computer mouse isn't working properly. The cursor keeps jumping around the screen.
(Woman) That's annoying. Did you try changing the batteries?
(Man) Yes, I put new batteries in this morning, but it didn't help.
(Woman) Hmm, maybe it's just old. You can request a new one from IT. Just fill out the equipment request form on the intranet.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "Why is the man calling?",
      'options': [
        "To check apartment availability",
        "To schedule a viewing",
        "To ask about the rent price",
        "To give his address",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript32_34 \n\n=> The man asks about the 'apartment for rent... Is it still available?'",
    },
    {
      'question': "When does the man want to see the apartment?",
      'options': ["This morning", "This afternoon", "Tomorrow", "Next weekend"],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> He says, 'I'm free this afternoon around 4 PM.'",
    },
    {
      'question': "What will happen at 4 PM?",
      'options': [
        "The man will call back.",
        "The woman will show the apartment.",
        "The apartment will be rented.",
        "The woman will leave.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The woman agrees to the time and says, 'I'll meet you there [at the apartment].'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What does the woman ask the man for help with?",
      'options': [
        "Printing paper",
        "Moving a box",
        "Finding the supply closet",
        "Contacting marketing",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The woman asks, 'could you help me move this box of printer paper?'",
    },
    {
      'question': "Why does the woman need help?",
      'options': [
        "The box is heavy.",
        "She doesn't know where to go.",
        "The closet is locked.",
        "She is busy.",
      ],
      'correctIndex': 0,
      'explain': "$transcript35_37 \n\n=> She says, 'It's too heavy for me.'",
    },
    {
      'question': "Where is the supply closet located?",
      'options': [
        "In Sarah's office",
        "Down the hall",
        "Inside the marketing department",
        "On a different floor",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The woman says it's 'To the supply closet down the hall...'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "What has changed about the client meeting?",
      'options': ["The location", "The attendees", "The time", "The agenda"],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man says the meeting 'has been moved to 10 AM instead of 9 AM.'",
    },
    {
      'question': "How does the woman feel about the change?",
      'options': ["Annoyed", "Relieved", "Confused", "Indifferent"],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The woman says, 'That's actually better for me. I had another call scheduled at 9.'",
    },
    {
      'question': "What will the woman do next?",
      'options': [
        "Call the client",
        "Finalize the slides",
        "Send an e-mail",
        "Review the slides",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The woman says, 'I'll e-mail them [the slides] to you now...'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What is the man looking for?",
      'options': ["A scarf", "A gift card", "A shirt", "A new store"],
      'correctIndex': 0,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I'm looking for a gift for my wife. Maybe a scarf?'",
    },
    {
      'question': "What kind of scarves are mentioned?",
      'options': [
        "Wool scarves",
        "Silk scarves",
        "Cashmere scarves",
        "Cotton scarves",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'We have some beautiful new silk scarves over here.'",
    },
    {
      'question': "What style does the man's wife prefer?",
      'options': ["Patterns", "Bright colors", "Solid colors", "Dark colors"],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'She prefers solid colors...'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What project are the speakers discussing?",
      'options': [
        "The Henderson project",
        "A design mockup",
        "An external agency contract",
        "A client update",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript44_46 \n\n=> The man starts by mentioning 'The deadline for the Henderson project...'",
    },
    {
      'question': "What is causing the project delay?",
      'options': [
        "The deadline is too soon.",
        "The schedule is wrong.",
        "They are waiting for designs.",
        "The man hasn't contacted the agency.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'The main delay is waiting for the design mockups from the external agency.'",
    },
    {
      'question': "What will the woman do if she doesn't get a reply?",
      'options': [
        "E-mail again",
        "Call the agency",
        "Change the schedule",
        "Ask the man to call",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'I'll call them this afternoon if I don't hear back.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What service does the woman want to reserve?",
      'options': ["A hotel room", "A flight", "A taxi", "An airport shuttle"],
      'correctIndex': 3,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'I'd like to make a reservation for the airport shuttle...'",
    },
    {
      'question': "What time is the woman's flight?",
      'options': ["6:00 AM", "7:30 AM", "8:30 AM", "9:00 AM"],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'It departs at 8:30 AM.'",
    },
    {
      'question': "What shuttle time does the man recommend?",
      'options': ["5:30 AM", "6:00 AM", "6:30 AM", "7:00 AM"],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'I recommend taking the 6:00 AM shuttle...'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "Coffee preferences",
        "Office supplies",
        "A broken coffee machine",
        "Upgrading office equipment",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript50_52 \n\n=> The man thinks they should 'upgrade our office coffee machine.'",
    },
    {
      'question': "What problem is mentioned about the current machine?",
      'options': [
        "It makes bad coffee.",
        "It is too messy.",
        "It breaks down often.",
        "It is too expensive to run.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man says it 'keeps breaking down,' and the woman agrees it was 'out of order twice last month.'",
    },
    {
      'question': "What will the woman do?",
      'options': [
        "Buy a single-cup brewer",
        "Fix the current machine",
        "Research new models",
        "Compare coffee prices",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'Let's research some models online and compare the costs. I can look into it this week.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What has Laura finished doing?",
      'options': [
        "Attending a meeting",
        "Drafting meeting minutes",
        "Distributing documents",
        "Proofreading a report",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> Laura says, 'I've finished drafting the minutes from yesterday's board meeting.'",
    },
    {
      'question': "What does Mr. Tanaka ask Laura to do?",
      'options': [
        "Check for errors",
        "Attend the next meeting",
        "E-mail him the draft",
        "Make copies for the board",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript53_55 \n\n=> He asks her to 'please proofread them carefully for any errors'.",
    },
    {
      'question': "Who should receive the final document?",
      'options': [
        "Only Mr. Tanaka",
        "Only Laura",
        "All board members and Mr. Tanaka",
        "All board members except Mr. Tanaka",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> Laura asks if she should 'e-mail them to all board members', and Mr. Tanaka says 'Yes, please. And copy me on the e-mail as well.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "What session is the man interested in?",
      'options': [
        "AI in Business",
        "Social Media Strategy",
        "Digital Marketing Trends",
        "Cloud Computing",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'I'm trying to find the session on 'Digital Marketing Trends'.'",
    },
    {
      'question':
          "Look at the graphic. What time did the session in Room C start?",
      'options': ["9:00 AM", "10:00 AM", "2:00 PM", "3:30 PM"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The graphic shows '10:00 AM: Digital Marketing Trends (Room C)'.",
    },
    {
      'question':
          "Look at the graphic. Where is the 2:00 PM session on the same topic?",
      'options': ["Main Hall", "Room A", "Room B", "Room C"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The woman mentions 'the other is at 2:00 PM in Room A'. The graphic confirms '2:00 PM: Digital Marketing Trends (Room A)'.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A company memo",
        "Cafeteria furniture",
        "A building renovation",
        "A temporary break room",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman heard the company 'is planning to renovate the employee cafeteria.'",
    },
    {
      'question': "What is one problem with the current cafeteria?",
      'options': [
        "It is too small.",
        "The food is bad.",
        "The equipment breaks often.",
        "It is on the first floor.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The man mentions 'The furniture is old, and the equipment often breaks.'",
    },
    {
      'question': "How long will the renovation take?",
      'options': ["One week", "Six weeks", "One month", "Three months"],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man says the memo stated it 'should take about six weeks.'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the man calling?",
      'options': [
        "To order a book",
        "To return a book",
        "To check on a book order",
        "To ask for book recommendations",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'Hi, I'd like to check the status of a book I ordered...'",
    },
    {
      'question': "What is the title of the book?",
      'options': [
        "David Miller",
        "The Global Market",
        "Customer Service",
        "Không được đề cập",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The man specifies the book 'The Global Market'.",
    },
    {
      'question': "What does the woman tell the man?",
      'options': [
        "The book is out of stock.",
        "The book has arrived.",
        "The order was canceled.",
        "The book will arrive next week.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The woman checks and says, 'Yes, Mr. Miller, the book arrived this morning.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What event are the speakers planning?",
      'options': [
        "A company meeting",
        "An awards banquet",
        "A hotel conference",
        "An art exhibition",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'We need to choose a venue for the annual awards banquet.'",
    },
    {
      'question': "What venue does the woman suggest?",
      'options': [
        "The Grand Oak Hotel",
        "An online platform",
        "The City Art Museum",
        "A different hotel",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The woman asks, 'How about the City Art Museum?'",
    },
    {
      'question': "What information does the man want to find?",
      'options': [
        "The cost and capacity",
        "The availability date",
        "The menu options",
        "The location",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript65_67 \n\n=> The man asks about the museum, 'Do you know how much it costs and how many people it holds?'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the man's problem?",
      'options': [
        "His computer screen is blank.",
        "His keyboard is stuck.",
        "His mouse is not working correctly.",
        "He forgot his password.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'My computer mouse isn't working properly. The cursor keeps jumping...'",
    },
    {
      'question': "What did the man already try to do?",
      'options': [
        "Restart the computer",
        "Call IT",
        "Change the batteries",
        "Fill out a form",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman asks if he tried changing batteries, and he replies, 'Yes, I put new batteries in...'",
    },
    {
      'question': "How can the man request a new mouse?",
      'options': [
        "By calling IT",
        "By asking the receptionist",
        "By buying one himself",
        "By using an online form",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript68_70 \n\n=> The woman says, 'You can request a new one from IT. Just fill out the equipment request form on the intranet.'",
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
        'audioPath': 'LR_practice_tests/$testId/part3/audio.mp3',
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
Looking for fresh, local produce? Visit the Westside Farmers Market! Open every Saturday from 8 AM to 1 PM in Central Plaza. You'll find a wide variety of seasonal fruits and vegetables, fresh bread, local honey, and handmade crafts. Support your local farmers and artisans! Remember to bring your own reusable bags. Free parking is available in the garage across the street. See you Saturday!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
Attention passengers traveling on flight KL 105 to Amsterdam. This flight is now boarding at Gate D4. Please have your boarding pass and passport ready. We will begin boarding by zones, starting with Zone 1. Please check your boarding pass for your zone number. All carry-on luggage must adhere to size restrictions. Thank you.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
The final point I want to address is our company's website redesign project. We received the initial mockups from the design agency yesterday. Overall, they look promising, but I have some concerns about the navigation menu being too complex. I'd like everyone on the project team to review the mockups carefully today and send me your feedback by tomorrow morning so I can consolidate it and reply to the agency.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling City Electric Company. Our customer service representatives are available Monday through Friday, 8 AM to 6 PM. If you are calling to report a power outage or an emergency, please press one immediately. To pay your bill using our automated system, press two. For questions about your account or service, please press three. To hear these options again, press nine.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome aboard the City Harbor Cruise. My name is Kevin, and I'll be your guide. This 90-minute cruise will take us past several historical landmarks, including the lighthouse and Fort Mason. Please remain seated while the boat is moving. Restrooms are located at the back of the boat. Snacks and beverages are available for purchase at the concession stand. Enjoy the beautiful views!
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
This slide summarizes the results of our recent customer survey regarding our new product, the 'Smart Thermostat'. As you can see, 85% of users reported being satisfied or very satisfied. The most praised feature was its ease of use. However, about 15% of respondents mentioned difficulty connecting it to their home Wi-Fi network initially. This suggests we need to improve the setup instructions or provide better technical support for that specific issue.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
And now for the weather. Expect clear skies and warm temperatures today, with a high of 80 degrees. However, a change is coming tonight. Clouds will move in after midnight, and we are forecasting heavy rain starting tomorrow morning and continuing throughout the day. A flood watch may be issued for low-lying areas. Stay tuned for further updates.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
Our final speaker today is Ms. Jane Davis, a renowned expert in international trade law. Ms. Davis has advised numerous multinational corporations and government agencies. She is the author of 'Navigating Global Markets' and frequently contributes to major financial publications. Today, she will be speaking on the challenges and opportunities of expanding into emerging markets. Please welcome Jane Davis.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Hello fitness center members. I have an announcement about a class cancellation. Unfortunately, the instructor for the 6:00 PM Yoga class tonight is unwell and unable to teach. We apologize for this cancellation. The 7:00 PM Spinning class will proceed as scheduled in the main studio. Please check the notice board for any further updates or substitute instructors later this week.
---
**Tonight's Class Schedule**
- 5:00 PM: Kickboxing (Studio B)
- 6:00 PM: **Yoga** (Main Studio)
- 7:00 PM: Spinning (Main Studio)
- 7:00 PM: Pilates (Studio B)
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention, customers. Thank you for shopping at 'SuperMart'. The store will be closing in 10 minutes. Please make your final selections and proceed to the checkout counters. Any items left in shopping carts after closing will be returned to the shelves. We will reopen tomorrow morning at 8 AM. Thank you, and have a good evening.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What is being advertised?",
      'options': [
        "A grocery store",
        "A farmers market",
        "A gardening center",
        "A craft fair",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Westside Farmers Market' và đề cập đến 'local produce', 'fruits and vegetables', 'local farmers'.",
    },
    {
      'question': "When is the market open?",
      'options': ["Buổi chiều", "Chỉ Chủ Nhật", "Sáng Thứ Bảy", "Cả cuối tuần"],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'Open every Saturday from 8 AM to 1 PM'.",
    },
    {
      'question': "What are visitors advised to bring?",
      'options': [
        "Cash only",
        "Their own bags",
        "Gardening tools",
        "Parking validation",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói nhắc nhở, 'Remember to bring your own reusable bags.'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What flight is currently boarding?",
      'options': ["KL 105", "Zone 1", "To Amsterdam", "Gate D4"],
      'correctIndex': 0,
      'explain':
          "$transcript74_76 \n\n=> Thông báo dành cho 'passengers traveling on flight KL 105 to Amsterdam.'",
    },
    {
      'question': "Where should passengers go?",
      'options': [
        "To Zone 1",
        "To Amsterdam",
        "To Gate D4",
        "To the check-in counter",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Chuyến bay 'is now boarding at Gate D4.'",
    },
    {
      'question': "What must passengers have ready?",
      'options': [
        "Their luggage",
        "Their zone number",
        "Their passport",
        "Their boarding pass and passport",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript74_76 \n\n=> Người nói yêu cầu, 'Please have your boarding pass and passport ready.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What project is being discussed?",
      'options': [
        "A website redesign",
        "A marketing campaign",
        "A new navigation menu",
        "An agency review",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'let's talk about the company's website redesign project.'",
    },
    {
      'question': "What is the speaker's concern about the mockups?",
      'options': [
        "They are late.",
        "They look unprofessional.",
        "The navigation is too complex.",
        "They don't match the brand.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'I have some concerns about the navigation menu being too complex.'",
    },
    {
      'question': "What are the listeners asked to do?",
      'options': [
        "Approve the mockups",
        "Contact the design agency",
        "Send their feedback",
        "Redesign the menu",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói yêu cầu, 'review the mockups carefully today and send me your feedback by tomorrow morning'.",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What service is NOT mentioned as an option?",
      'options': [
        "Reporting an emergency",
        "Paying a bill",
        "Asking about an account",
        "Scheduling a repair",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn đề cập đến báo mất điện/khẩn cấp (press one), thanh toán hóa đơn (press two), hỏi về tài khoản (press three). 'Scheduling a repair' không được đề cập.",
    },
    {
      'question': "When are customer service representatives available?",
      'options': [
        "24/7",
        "8 AM to 6 PM on weekdays",
        "8 AM to 8 PM on weekdays",
        "9 AM to 5 PM Monday to Saturday",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'Our customer service representatives are available Monday through Friday, 8 AM to 6 PM.'",
    },
    {
      'question': "What should a caller press to ask about their service?",
      'options': ["One", "Two", "Three", "Nine"],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'For questions about your account or service, please press three.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': ["A lighthouse", "Fort Mason", "A city street", "On a boat"],
      'correctIndex': 3,
      'explain':
          "$transcript83_85 \n\n=> Người nói chào mừng 'aboard the City Harbor Cruise' và đề cập đến 'boat'.",
    },
    {
      'question': "How long will the tour last?",
      'options': ["45 minutes", "60 minutes", "90 minutes", "2 hours"],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'This 90-minute cruise...'",
    },
    {
      'question': "What can passengers buy on board?",
      'options': ["Souvenirs", "Snacks and drinks", "Tour guides", "Tickets"],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'Snacks and beverages are available for purchase at the concession stand.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What product is being discussed?",
      'options': [
        "A website",
        "A mobile app",
        "A smart thermostat",
        "A customer survey",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói đang tóm tắt 'results of our recent customer survey regarding our new product, the 'Smart Thermostat''.",
    },
    {
      'question': "What feature did customers praise the most?",
      'options': [
        "Its price",
        "Its appearance",
        "Its ease of use",
        "Its Wi-Fi connectivity",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'The most praised feature was its ease of use.'",
    },
    {
      'question': "What problem did some users experience?",
      'options': [
        "The battery life was short.",
        "The setup instructions were unclear.",
        "Connecting to Wi-Fi was difficult.",
        "The technical support was slow.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói đề cập 'difficulty connecting it to their home Wi-Fi network initially.'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What is the main topic of the report?",
      'options': [
        "Tonight's weather",
        "Tomorrow's weather forecast",
        "A flood watch",
        "Low-lying areas",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Bản tin tập trung vào dự báo cho 'tonight' và 'tomorrow morning and continuing throughout the day'.",
    },
    {
      'question': "What is forecast for tomorrow?",
      'options': [
        "Clear skies",
        "Warm temperatures",
        "Heavy rain",
        "Light clouds",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Người nói dự báo 'heavy rain starting tomorrow morning and continuing throughout the day.'",
    },
    {
      'question': "What might be issued?",
      'options': [
        "A traffic alert",
        "A flood watch",
        "A storm warning",
        "A weather update",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Người nói nói, 'A flood watch may be issued for low-lying areas.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Ms. Davis's field of expertise?",
      'options': [
        "Corporate law",
        "International trade law",
        "Financial reporting",
        "Emerging markets",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu cô ấy là 'a renowned expert in international trade law.'",
    },
    {
      'question': "What is the title of Ms. Davis's book?",
      'options': [
        "Expanding into Emerging Markets",
        "Global Corp",
        "Navigating Global Markets",
        "Challenges and Opportunities",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói đề cập cô ấy là tác giả của ''Navigating Global Markets''.",
    },
    {
      'question': "What will Ms. Davis talk about today?",
      'options': [
        "Her work with corporations",
        "Her latest publication",
        "Expanding into new markets",
        "Writing for financial publications",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'Today, she will be speaking on the challenges and opportunities of expanding into emerging markets.'",
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
          "$transcript95_97 \n\n=> Người nói nhấn mạnh 'Advanced Excel' và nói 'this session requires pre-registration'. Lịch trình cũng xác nhận điều này.",
    },
    {
      'question':
          "What department is 'Advanced Excel' particularly relevant for?",
      'options': ["Marketing", "Sales", "Finance", "IT"],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'The 'Advanced Excel' session is particularly relevant for those in the finance department.'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What products are on sale?",
      'options': [
        "All kitchen appliances",
        "KitchenPro brand appliances",
        "Toasters and blenders",
        "Items in aisle 5",
      ],
      'correctIndex': 1, // Be specific to the brand
      'explain':
          "$transcript98_100 \n\n=> Thông báo nói, 'All 'KitchenPro' brand small kitchen appliances... are now 50% off'.",
    },
    {
      'question': "How long will the sale last?",
      'options': ["10 minutes", "15 minutes", "30 minutes", "One hour"],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'For the next 15 minutes only...'",
    },
    {
      'question': "Where should shoppers go for the sale?",
      'options': [
        "Aisle 5",
        "The checkout counter",
        "The second floor",
        "The kitchen department",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'it's only for the next 15 minutes in aisle 5.'",
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
        'audioPath': 'LR_practice_tests/$testId/part4/audio.mp3',
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
      'question': "The orientation session will begin ______ at 9:00 A.M.",
      'options': ['prompt', 'promptly', 'prompted', 'promptness'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (promptly - đúng giờ) để bổ nghĩa cho động từ "will begin".',
    },
    {
      'question':
          "Please contact Ms. Chen ______ you have any questions about the schedule.",
      'options': ['if', 'unless', 'whether', 'therefore'],
      'correctIndex': 0,
      'explain': '"If" (nếu) được dùng để bắt đầu một mệnh đề điều kiện.',
    },
    {
      'question':
          "The company is looking for candidates with strong ______ skills.",
      'options': ['analyze', 'analytical', 'analysis', 'analyzed'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (analytical - thuộc về phân tích) để bổ nghĩa cho danh từ "skills".',
    },
    {
      'question': "Mr. Kim requested a ______ for his travel expenses.",
      'options': ['reimburse', 'reimbursed', 'reimbursing', 'reimbursement'],
      'correctIndex': 3,
      'explain':
          'Sau mạo từ "a" cần một danh từ (reimbursement - sự hoàn trả).',
    },
    {
      'question':
          "The new software update should make the system run more ______.",
      'options': ['smooth', 'smoother', 'smoothly', 'smoothness'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (smoothly - trơn tru) để bổ nghĩa cho động từ "run".',
    },
    {
      'question':
          "______ the manager was impressed with the proposal, some changes were requested.",
      'options': ['Because', 'Since', 'Although', 'Despite'],
      'correctIndex': 2,
      'explain':
          '"Although" (mặc dù) là liên từ được dùng để chỉ sự tương phản.',
    },
    {
      'question':
          "The R&D department made a significant ______ in battery technology.",
      'options': ['advance', 'advanced', 'advancing', 'advancement'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "significant" cần một danh từ (advancement - sự tiến bộ).',
    },
    {
      'question':
          "The workshop will cover ______ from basic techniques to advanced strategies.",
      'options': ['all', 'every', 'other', 'everything'],
      'correctIndex': 3,
      'explain':
          '"Everything from... to..." (Tất cả mọi thứ từ... đến...) là một cấu trúc phổ biến.',
    },
    {
      'question':
          "Please ensure all safety ______ are followed in the laboratory.",
      'options': ['precautions', 'precautionary', 'precautioned', 'precaution'],
      'correctIndex': 0,
      'explain':
          'Sau tính từ "safety" cần một danh từ số nhiều (precautions - biện pháp phòng ngừa).',
    },
    {
      'question':
          "Ms. Ito is ______ regarded as an expert in international finance.",
      'options': ['wide', 'width', 'widely', 'widen'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (widely - một cách rộng rãi) để bổ nghĩa cho động từ "regarded".',
    },
    {
      'question': "The deadline for ______ is next Friday, June 15.",
      'options': ['register', 'registered', 'registering', 'registration'],
      'correctIndex': 3,
      'explain':
          'Sau giới từ "for" cần một danh từ (registration - sự đăng ký).',
    },
    {
      'question':
          "______ arriving late, Mr. Tanaka missed the beginning of the presentation.",
      'options': ['Due to', 'Because', 'Owing', 'Despite'],
      'correctIndex':
          0, // 'Due to' + V-ing is common, meaning 'because of arriving late'.
      'explain': '"Due to" + V-ing (Do việc...) được dùng để chỉ nguyên nhân.',
    },
    {
      'question': "The sales team ______ exceeded their quarterly targets.",
      'options': ['consistent', 'consistently', 'consistence', 'consisted'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (consistently - một cách nhất quán) để bổ nghĩa cho động từ "exceeded".',
    },
    {
      'question':
          "The new office chairs are ______ adjustable to fit individual needs.",
      'options': ['full', 'fuller', 'fully', 'fullness'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (fully - hoàn toàn) để bổ nghĩa cho tính từ "adjustable".',
    },
    {
      'question':
          "All contracts must be reviewed by the legal department ______ they are signed.",
      'options': ['before', 'after', 'while', 'until'],
      'correctIndex': 0,
      'explain': '"Before" (trước khi) là liên từ chỉ thời gian phù hợp nhất.',
    },
    {
      'question': "The ______ of the new building took nearly two years.",
      'options': ['complete', 'completed', 'completely', 'completion'],
      'correctIndex': 3,
      'explain':
          'Sau mạo từ "The" cần một danh từ (completion - sự hoàn thành) để làm chủ ngữ.',
    },
    {
      'question':
          "Ms. Garcia has ______ worked in the finance industry for over 15 years.",
      'options': ['success', 'successful', 'successfully', 'succeed'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (successfully - một cách thành công) để bổ nghĩa cho động từ "has worked".',
    },
    {
      'question':
          "The information in this report is intended ______ for internal use.",
      'options': ['sole', 'solely', 'soleness', 'soled'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (solely - chỉ) để bổ nghĩa cho cụm giới từ "for internal use".',
    },
    {
      'question':
          "The company picnic will be held outdoors, ______ permitting.",
      'options': ['weather', 'whether', 'rather', 'leather'],
      'correctIndex': 0,
      'explain':
          'Cụm "weather permitting" (nếu thời tiết cho phép) là một cụm trạng ngữ cố định.',
    },
    {
      'question':
          "Employees ______ wish to attend the workshop must register in advance.",
      'options': ['who', 'which', 'whose', 'what'],
      'correctIndex': 0,
      'explain': 'Đại từ quan hệ "who" được dùng để chỉ người ("Employees").',
    },
    {
      'question': "The updated employee handbook ______ several new policies.",
      'options': ['contain', 'contains', 'contained', 'containing'],
      'correctIndex': 1,
      'explain':
          'Chủ ngữ là "The updated employee handbook" (số ít), nên động từ ở thì hiện tại đơn cần thêm "s" (contains).',
    },
    {
      'question':
          "Please respond to the invitation ______ your earliest convenience.",
      'options': ['at', 'on', 'in', 'by'],
      'correctIndex': 0,
      'explain':
          'Cụm từ "at your earliest convenience" (vào lúc thuận tiện sớm nhất của bạn) là một cụm cố định.',
    },
    {
      'question':
          "The restaurant received ______ reviews for its food and service.",
      'options': ['favor', 'favorable', 'favorably', 'favorite'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (favorable - thuận lợi, tốt) để bổ nghĩa cho danh từ "reviews".',
    },
    {
      'question': "______ candidate is selected will be notified by e-mail.",
      'options': ['Whatever', 'Whichever', 'Whenever', 'Wherever'],
      'correctIndex': 1,
      'explain':
          '"Whichever candidate" (Bất cứ ứng viên nào) đóng vai trò làm chủ ngữ của mệnh đề phụ.',
    },
    {
      'question':
          "The company experienced a ______ decline in sales last quarter.",
      'options': ['notice', 'noticing', 'noticeable', 'noticeably'],
      'correctIndex': 2,
      'explain':
          'Cần một tính từ (noticeable - đáng chú ý) để bổ nghĩa cho danh từ "decline".',
    },
    {
      'question': "All international shipments require ______ documentation.",
      'options': ['addition', 'additional', 'additionally', 'added'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (additional - bổ sung) để bổ nghĩa cho danh từ "documentation".',
    },
    {
      'question':
          "The new production facility is expected to be fully ______ by next month.",
      'options': ['operate', 'operational', 'operation', 'operator'],
      'correctIndex': 1,
      'explain':
          'Sau trạng từ "fully" cần một tính từ (operational - hoạt động được).',
    },
    {
      'question':
          "The manager reminded the team ______ the importance of meeting deadlines.",
      'options': ['of', 'about', 'with', 'for'],
      'correctIndex': 0,
      'explain': 'Cấu trúc "remind someone of something" (nhắc ai về điều gì).',
    },
    {
      'question':
          "______ regular maintenance, the equipment failed unexpectedly.",
      'options': ['Although', 'Because of', 'Despite', 'Therefore'],
      'correctIndex': 2,
      'explain':
          '"Despite" (mặc dù) là giới từ, theo sau là cụm danh từ ("regular maintenance") và chỉ sự tương phản.',
    },
    {
      'question':
          "The conference aims to promote ______ among researchers from different fields.",
      'options': [
        'collaborate',
        'collaborative',
        'collaboration',
        'collaborator',
      ],
      'correctIndex': 2,
      'explain':
          'Sau động từ "promote" cần một danh từ (collaboration - sự hợp tác).',
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

  // --- Passage 1: Questions 131-134 (Memo) ---
  final passage131_134 = """
**MEMORANDUM**
To: All Sales Representatives
From: Susan Chen, Sales Director
Subject: New Customer Relationship Management (CRM) System
Date: October 25

Next Monday, November 1, we will officially launch our new CRM system, 'SalesPro'. This system will replace the current software we have been using. 'SalesPro' offers enhanced features for tracking leads, managing contacts, and ____(131)____ sales reports.

Mandatory training sessions will be held this week. ____(132)____. It is crucial that everyone attends one session to learn how to use the new system ____(133)____.

The old system will be phased out by the end of November. Please ensure all your current client data is transferred ____(134)____ the new system before then.
""";
  // --- Passage 2: Questions 135-138 (E-mail) ---
  final passage135_138 = """
To: info@citygardensupply.com
From: james.lee@email.com
Subject: Inquiry about Lawn Mower Repair
Date: May 3

Hello,
I purchased a 'GreenCut' lawn mower from your store last summer. Recently, it has become difficult to start. I believe it might need servicing the engine ____(135)____ the spark plug.

Does your store offer repair services for the brands you sell? If so, could you please provide information on the ____(136)____ and how to schedule an appointment? ____(137)____.

My mower is still under warranty, so I assume the ____(138)____ would be covered. Please confirm. Thank you.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**'Travel Light' Backpacks - Adventure Ready!**

Planning your next trip? Choose 'Travel Light' backpacks! Our backpacks are designed for comfort and durability. Made from lightweight, water-resistant material, they are perfect ____(139)____ hiking, camping, or international travel.

The 'Explorer 50' model features multiple compartments, padded shoulder straps, and a dedicated laptop sleeve. It is ____(140)____ large enough for a week-long trip but still meets most airline carry-on requirements.

Visit our website today! ____(141)____. ____(142)____ details and customer reviews. Order now and get a free travel pouch with your purchase.
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**Downtown Restaurant Scene Continues to Grow**

(June 8) – The downtown area welcomed another new restaurant this week with the opening of 'The Golden Spoon', an upscale eatery specializing in modern European cuisine. This ____(143)____ the fifth new restaurant to open in the city center this year alone.

Local business leaders believe the trend reflects the growing ____(144)____ of the downtown district as a dining destination. "We're seeing more foot traffic and demand for diverse culinary options," said Maria Garcia, president of the Downtown Business Association.

____(145)____.  ____(146)____, the Golden Spoon's head chef, David Chen, previously worked at several renowned restaurants in New York City. The restaurant is located on Oak Street and serves dinner nightly.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["generate", "generates", "generated", "generating"],
      'correctIndex': 3,
      'explain':
          "Danh sách các tính năng được nối bằng 'and'. Sau 'tracking' và 'managing' (V-ing), cần một V-ing khác (generating).",
    },
    {
      'question': "",
      'options': [
        "Check your e-mail for the schedule.",
        "The current software is outdated.",
        "SalesPro was chosen after careful review.",
        "The system costs a lot of money.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này cung cấp thông tin hợp lý về cách nhân viên có thể tìm thấy lịch trình cho các buổi đào tạo ('training sessions') đã được đề cập.",
    },
    {
      'question': "",
      'options': ["effect", "effective", "effectively", "effectiveness"],
      'correctIndex': 2,
      'explain':
          "Cần một trạng từ (effectively - một cách hiệu quả) để bổ nghĩa cho động từ 'use'.",
    },
    {
      'question': "",
      'options': ["across", "over", "into", "within"],
      'correctIndex':
          1, // "transfer over to" or "transfer into". "Over" seems slightly better.
      'explain':
          "Cụm 'transfer over to' (chuyển sang) là một cách diễn đạt phổ biến trong ngữ cảnh chuyển đổi hệ thống.",
      // Edit: "transfer into" cũng rất phổ biến. Cả hai đều có thể đúng. Hãy dùng 'into' cho rõ ràng hơn.
      // 'correctIndex': 2,
      // 'explain': "Giới từ 'into' (vào trong) phù hợp với hành động chuyển dữ liệu vào hệ thống mới."
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["or", "and", "but", "so"],
      'correctIndex': 0,
      'explain':
          "Liên từ 'or' được dùng để nối hai khả năng (engine or spark plug).",
    },
    {
      'question': "",
      'options': ["cost", "costly", "costing", "costs"],
      'correctIndex': 3, // Plural costs
      'explain':
          "Sau mạo từ 'the' cần một danh từ. 'Costs' (chi phí - số nhiều) là phù hợp nhất.",
    },
    {
      'question': "",
      'options': [
        "The mower is difficult to start.",
        "I bought it last summer.",
        "Your store is conveniently located.",
        "I need it repaired as soon as possible.",
      ],
      'correctIndex': 3,
      'explain':
          "Câu này thể hiện sự cấp thiết của yêu cầu sửa chữa, phù hợp với ngữ cảnh của e-mail.",
    },
    {
      'question': "", // "Please confirm. Thank you."
      'options': ["repair", "repaired", "repairing", "repairable"],
      'correctIndex': 0,
      'explain': "Sau mạo từ 'the' cần một danh từ. 'repair' là phù hợp nhất.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["by", "for", "with", "as"],
      'correctIndex': 1,
      'explain':
          "Cụm 'perfect for' (hoàn hảo cho) được dùng để chỉ mục đích sử dụng.",
    },
    {
      'question': "",
      'options': ["scarce", "enough", "barely", "much"],
      'correctIndex': 1,
      'explain':
          "Cụm 'large enough' (đủ lớn) là cấu trúc đúng (tính từ + enough).",
    },
    {
      'question': "",
      'options': [
        "Our backpacks come in several colors.",
        "We offer free shipping on all orders.",
        "Check out our customer reviews!",
        "The Explorer 50 is our best-selling model.",
      ],
      'correctIndex': 2, // Thay đổi câu
      'explain':
          "Câu này khuyến khích khách hàng tiềm năng tìm hiểu thêm thông tin (đánh giá), phù hợp với mục đích quảng cáo.",
    },
    {
      'question': "",
      'options': ["See", "For", "With", "Check"],
      'correctIndex': 1, // "For details"
      'explain':
          "Cụm giới từ 'For details' (Để biết chi tiết) thường được sử dụng trong ngữ cảnh này.",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["marks", "marked", "marking", "mark"],
      'correctIndex': 0,
      'explain':
          "Chủ ngữ là 'This' (việc mở cửa này - số ít), nên động từ ở thì hiện tại đơn cần thêm 's' (marks - đánh dấu).",
    },
    {
      'question': "",
      'options': ["populate", "populous", "popularity", "popular"],
      'correctIndex': 2,
      'explain':
          "Sau tính từ 'growing' cần một danh từ (popularity - sự phổ biến).",
    },
    {
      'question': "",
      'options': [
        "Competition among restaurants is increasing.",
        "The Business Association meets monthly.",
        "The city center has undergone significant redevelopment.",
        "Many restaurants struggle with staffing.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này cung cấp một lý do có thể giải thích cho xu hướng ('trend') tăng trưởng nhà hàng ở khu trung tâm.",
    },
    {
      'question': "",
      'options': ["Meanwhile", "Additionally", "In contrast", "For example"],
      'correctIndex': 1, // Additionally = In addition
      'explain':
          "Trạng từ 'Additionally' (Thêm vào đó) được dùng để bổ sung thông tin về nhà hàng mới (The Golden Spoon).",
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
**Franklin Copy Center - Fast & Reliable Printing**

Need copies fast? Visit Franklin Copy Center!
* Black & White Copies: 5 cents per page
* Color Copies: 25 cents per page
* Volume discounts available for orders over 1,000 pages.

We also offer binding, laminating, and fax services. Open Monday-Friday 8 AM - 7 PM, Saturday 10 AM - 4 PM. Closed Sundays. Located at 101 Main Street.
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: All Employees <staff@apexcorp.com>
From: IT Department <it@apexcorp.com>
Subject: Mandatory Password Reset
Date: September 9

Dear Employees,
As part of our ongoing security enhancements, all employees are required to reset their network login passwords.
Please reset your password by the end of the day this Friday, September 13.
Instructions for resetting your password can be found on the company intranet under 'IT Support'. Your new password must be at least 10 characters long and include a mix of letters, numbers, and symbols.
Thank you for your cooperation.
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Mark (3:45 P.M.)**: Hi Laura, are you still planning to attend the marketing seminar tomorrow morning?
**Laura (3:46 P.M.)**: Yes, I am. Starts at 9 AM, right? In the main conference room?
**Mark (3:47 P.M.)**: That's right. I was wondering if you could share your notes with me afterward? I have to miss the first hour due to a client call.
**Laura (3:48 P.M.)**: Sure, no problem. I'll e-mail them to you during the lunch break.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**City Museum Extends Hours**

(April 5) – The Springfield City Museum announced today that it will extend its operating hours starting May 1. The museum will now stay open until 8:00 P.M. on Thursday evenings. Regular hours (10 AM - 5 PM) remain unchanged for other days (Tuesday-Sunday). The museum is closed on Mondays.

"We hope these extended Thursday hours will allow more working professionals and families to visit after work," said museum director Aris Thorne.

The change coincides with the opening of the museum's new special exhibit, "Ancient Civilizations," which also begins May 1.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Notice: Bike Rack Relocation**

Effective Monday, July 22, the bicycle rack currently located near the main entrance will be permanently moved.

The new location will be on the west side of the building, near the employee parking garage entrance. This move is necessary to accommodate the upcoming lobby renovation project.

Please use the new location for parking your bicycles starting next Monday. Thank you.
- Building Management
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Department Heads
**From**: Finance Department
**Date**: June 10
**Subject**: Q3 Budget Submission Deadline

This is a reminder that all departmental budget proposals for the third quarter (Q3) are due to the Finance Department by **Friday, June 21**.

Please use the standard budget template found on the shared drive. Ensure all proposed expenditures are clearly justified. Late submissions may not be considered during the budget review meeting.

Contact Maria Garcia in Finance if you have any questions.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Kenji Tanaka <ktanaka@techcorp.com>
From: Airport Parking <parking@cityairport.com>
Subject: Your Parking Reservation Confirmation
Date: August 12

Dear Mr. Tanaka,
This confirms your parking reservation at City Airport's Long-Term Lot C.
* **Entry Date**: August 15
* **Exit Date**: August 19
* **Total Cost**: \$60.00 (Prepaid)

Please scan the QR code included in this e-mail at the entry gate. Your reservation guarantees you a spot, even if the lot appears full. For assistance, press the help button at the gate.
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Position: Customer Service Representative (Full-Time)**

'Global Communications Inc.' is hiring friendly and motivated Customer Service Representatives for our call center.

**Responsibilities:**
* Answering inbound calls and responding to customer inquiries regarding billing and service.
* Resolving customer issues effectively and professionally.
* Documenting call details accurately in the company database.
* Meeting performance metrics for call handling time and customer satisfaction.

**Qualifications:**
* High school diploma or equivalent (college degree preferred).
* Minimum 1 year of customer service experience (call center experience is a plus).
* Excellent verbal communication and problem-solving skills.
* Ability to work flexible hours, including evenings and weekends.

We offer competitive pay and benefits. Apply online at GlobalCom.com/careers.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**'Style & Stitch' Tailoring - Alteration Ticket**

**Customer Name**: David Miller
**Ticket Number**: 4590
**Date Dropped Off**: Oct 5

**Item**: (1) Men's Suit Jacket (Gray)
**Service Requested**: Shorten sleeves by 1 inch.

**Estimated Completion Date**: October 12
**Estimated Cost**: \$30.00

**Customer Signature**: ___________________
**Notes**: Customer requested notification via text message when ready. Ph: 555-1010.
""";
  // Q172-175 (Article)
  final passage172_175 = """
**New Recycling Program Launched Citywide**

(May 15) – Springfield launched its new single-stream recycling program today. Residents no longer need to sort paper, plastic, and glass into separate bins. All recyclable materials can now be placed together in the blue recycling carts provided by the city.

"This new system is much more convenient for residents, and we expect it to significantly increase our recycling rates," said Mayor Lisa Cho.

However, officials remind residents that certain items, such as plastic bags, styrofoam, and food-contaminated containers, are still NOT recyclable and should be placed in the regular trash. A full list of acceptable items is available on the city's website.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (E-mail + Webpage)
  final passage176_180_1 = """
To: Manager <manager@oakwood_apartments.com>
From: j.smith@email.com
Subject: Maintenance Request - Apt 2B
Date: July 8

Dear Manager,
I am writing to report an issue with the air conditioning unit in my apartment (2B). It seems to be leaking water onto the floor when it runs.
This started yesterday evening. I have placed a towel underneath it for now, but I am concerned it could cause damage.
Could you please arrange for someone from maintenance to take a look as soon as possible? I am available tomorrow afternoon after 1 PM.
Thank you,
John Smith
""";
  final passage176_180_2 = """
**Oakwood Apartments - Resident Portal**

**Welcome, John Smith (Apt 2B)**
* Home | Pay Rent | **Submit Maintenance Request** | Community Board

**Submit a New Maintenance Request:**
* **Category**: [Plumbing / Electrical / Appliance / HVAC / Other] -> **HVAC** Selected
* **Location**: Apartment 2B
* **Problem Description**: Air conditioning unit leaking water onto floor. Started July 7 evening.
* **Permission to Enter**: [Yes / No / Call First] -> **Yes** Selected
* **Urgency**: [Low / Medium / High] -> **Medium** Selected
* **Preferred Time**: Tomorrow (July 9) after 1 PM.

*Request Submitted: July 8, 10:15 AM. Status: Received. Assigned to: Maintenance Team.*
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
To: All Marketing Staff
From: Sarah Chen, Director
Date: September 1
Subject: Weekly Team Meeting Time Change

Effective next week, our regular Monday morning marketing team meeting will be moved to a new time slot.
Instead of meeting at 9:00 A.M., the meeting will now begin at **10:00 A.M.** every Monday in the main conference room.
This change is being made to better accommodate schedules across different time zones, as several members of our expanded team work remotely. Please update your calendars.
""";
  final passage181_185_2 = """
To: Sarah Chen
From: Kenji Tanaka
Subject: Re: Weekly Team Meeting Time Change
Date: September 1

Hi Sarah,
Thanks for the update on the meeting time. 10:00 A.M. works fine for me.
Quick question - since the meeting is starting later, will it still end at the usual time (10:30 A.M.)? Or will it run longer, perhaps until 11:00 A.M.? I have another call scheduled at 10:45 A.M. on Mondays that I might need to adjust.
Thanks,
Kenji
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: 'ProClean' Home Cleaning Service**

Too busy to clean? Let ProClean handle it!
* **Services**: Standard Cleaning, Deep Cleaning, Move-In/Move-Out Cleaning.
* **Frequency**: Weekly, Bi-Weekly, Monthly, One-Time.
* **Pricing**: Starts at \$100 for a standard weekly cleaning (based on home size). Get a free instant quote on our website!
* **Special Offer**: New clients get \$25 off their first cleaning service! Mention code NEW25 when booking.
* Book online at ProClean.com or call 555-1212.
""";
  final passage186_190_2 = """
**From**: ProClean Booking <booking@proclean.com>
**To**: m.garcia@email.com
**Subject**: Your Cleaning Appointment Confirmation
**Date**: August 3

Dear Maria Garcia,
This confirms your booking for a **Standard Cleaning** service on **Friday, August 9, at 10:00 A.M.**
The estimated cost for your 2-bedroom apartment is \$120.00.
As a new client using code NEW25, your final price will be **\$95.00**.
Please ensure our team has access to your apartment at the scheduled time.
""";
  final passage186_190_3 = """
**From**: Maria Garcia <m.garcia@email.com>
**To**: ProClean Booking <booking@proclean.com>
**Subject**: Re: Your Cleaning Appointment Confirmation
**Date**: August 5

Hello,
Thank you for the confirmation. I need to reschedule my August 9 appointment. Something unexpected came up.
Would it be possible to move the cleaning service to the following Friday, August 16, at the same time (10:00 A.M.)?
Please let me know if that date is available. Will the \$25 new client discount still apply?
Thank you,
Maria Garcia
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**Westwood Daily: Library Renovation Update**
(March 15) – The renovation of the Westwood Public Library's main floor is progressing on schedule, library officials reported this week. The project, which began in January, involves creating a new computer lab, expanding the children's section, and adding more quiet study spaces.
The main floor remains closed to the public during construction. However, a temporary service desk has been set up on the second floor where patrons can check out holds and access limited services. The library expects the main floor to reopen in early June.
""";
  final passage191_195_2 = """
**To**: Library Staff <staff@westlib.org>
**From**: David Wu, Library Director <dwu@westlib.org>
**Subject**: Volunteer Opportunity - Shelving Help
**Date**: May 28

Hi Team,
As we prepare for the reopening of the main floor in early June, we need to move thousands of books back onto the newly installed shelves.
We are looking for staff volunteers to assist with this large task during the first week of June (June 3-7). Any time you can spare would be greatly appreciated.
Please sign up for shifts using the schedule sheet posted in the staff lounge. Let's work together to get our library ready!
""";
  final passage191_195_3 = """
**Main Floor Reshelving - Volunteer Sign-Up**
**Week of June 3 - June 7**

| Day       | 9 AM - 12 PM      | 1 PM - 4 PM       |
|-----------|-------------------|-------------------|
| Monday    | J. Smith, K. Lee  | M. Evans          |
| Tuesday   | A. Chen           |                   |
| Wednesday | **Laura Fernandez** | J. Smith, A. Chen |
| Thursday  | M. Evans          | K. Lee            |
| Friday    |                   | **Laura Fernandez** |
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: 'The Flower Pot' <orders@flowerpot.com>
**From**: kevin.s@corpnet.com
**Subject**: Flower Delivery Order
**Date**: February 10

Hello,
I would like to order a flower arrangement to be delivered on Valentine's Day, February 14.
* **Recipient**: Sarah Chen, Apex Corp, 100 Main St, Room 500.
* **Arrangement**: 'Thinking of You' Bouquet (Item #TY-01) - \$60
* **Card Message**: "Happy Valentine's Day! - Kevin"
Please confirm the order and total cost including delivery. My billing info is on file.
Thanks, Kevin
""";
  final passage196_200_2 = """
**The Flower Pot - INVOICE**
**Client**: Kevin S. (CorpNet)
**Invoice**: #FP-880
**Date**: February 11

**Order Date**: February 10
**Delivery Date**: February 14

**Items**:
* 'Thinking of You' Bouquet (#TY-01) .... \$60.00
* Delivery Fee (Business Address) ..... \$10.00
* Valentine's Day Surcharge ........... \$15.00
* * **TOTAL CHARGED**: **\$85.00**

**Recipient**: Sarah Chen, Apex Corp
**Status**: Confirmed. Scheduled for delivery Feb 14.
""";
  final passage196_200_3 = """
**To**: Kevin S. <kevin.s@corpnet.com>
**From**: 'The Flower Pot' <orders@flowerpot.com>
**Subject**: Re: Flower Delivery Order
**Date**: February 11

Dear Kevin,
Thank you for your order! We confirm your request for the 'Thinking of You' bouquet to be delivered to Sarah Chen at Apex Corp on February 14.
The total cost, including delivery and the standard Valentine's Day surcharge, is \$85.00. This has been charged to the card on file. Please see the attached invoice.
We appreciate your business!
""";

  final part7Questions = [
    // Q147-148 (Advertisement)
    {
      'question':
          passage147_148 +
          "\n\n147. What services are offered at Franklin Copy Center?",
      'options': [
        "Only black & white copies",
        "Printing, binding, and faxing",
        "Graphic design",
        "Shipping services",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo (Passage 1) liệt kê 'binding, laminating, and fax services' ngoài việc sao chép.",
    },
    {
      'question': passage147_148 + "\n\n148. When is the copy center closed?",
      'options': ["Buổi tối", "Thứ Bảy", "Chủ Nhật", "Sáng Thứ Hai"],
      'correctIndex': 2,
      'explain': "Quảng cáo (Passage 1) ghi 'Closed Sundays'.",
    },
    // Q149-150 (E-mail)
    {
      'question':
          passage149_150 + "\n\n149. What are employees required to do?",
      'options': [
        "Change their security questions",
        "Attend a security training",
        "Reset their network passwords",
        "Update their contact information",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) nói 'all employees are required to reset their network login passwords.'",
    },
    {
      'question':
          passage149_150 + "\n\n150. What is the deadline for this action?",
      'options': ["Hôm nay", "Thứ Sáu", "Cuối tháng", "Không có hạn chót"],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) yêu cầu 'reset your password by the end of the day this Friday, September 13.'",
    },
    // Q151-152 (Text Message Chain)
    {
      'question':
          passage151_152 +
          "\n\n151. Why can't Mark attend the first hour of the seminar?",
      'options': [
        "He has another meeting.",
        "He has a client call.",
        "He forgot the start time.",
        "He needs to prepare notes.",
      ],
      'correctIndex': 1,
      'explain':
          "Mark (Passage 3) viết, 'I have to miss the first hour due to a client call.'",
    },
    {
      'question': passage151_152 + "\n\n152. What does Laura offer to do?",
      'options': [
        "Call Mark during the break",
        "Reschedule the client call",
        "Send Mark her notes",
        "Wait for Mark to arrive",
      ],
      'correctIndex': 2,
      'explain':
          "Laura (Passage 3) trả lời, 'Sure, no problem. I'll e-mail them [notes] to you during the lunch break.'",
    },
    // Q153-155 (Article)
    {
      'question':
          passage153_155 + "\n\n153. What change did the City Museum announce?",
      'options': [
        "New admission fees",
        "A new special exhibit",
        "Closure on Mondays",
        "Extended hours on Thursdays",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 4) nói bảo tàng 'will extend its operating hours... until 8:00 P.M. on Thursday evenings.'",
    },
    {
      'question': passage153_155 + "\n\n154. When will the change take effect?",
      'options': ["April 5", "May 1", "Mùa hè", "Khi triển lãm mới mở"],
      'correctIndex': 1,
      'explain': "Bài báo (Passage 4) nói 'starting May 1'.",
    },
    {
      'question':
          passage153_155 +
          "\n\n155. According to Aris Thorne, who might benefit from the change?",
      'options': [
        "Tourists",
        "Students",
        "Working professionals",
        "Museum members",
      ],
      'correctIndex': 2,
      'explain':
          "Ông Thorne (Passage 4) hy vọng giờ mở cửa kéo dài 'will allow more working professionals and families to visit after work'.",
    },
    // Q156-157 (Notice)
    {
      'question': passage156_157 + "\n\n156. What is being moved?",
      'options': [
        "The main entrance",
        "The employee parking garage",
        "A bicycle rack",
        "The lobby furniture",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) nói 'the bicycle rack currently located near the main entrance will be permanently moved.'",
    },
    {
      'question': passage156_157 + "\n\n157. Why is the item being moved?",
      'options': [
        "To improve security",
        "To make space for renovations",
        "To be closer to parking",
        "Because it is broken",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 5) nói 'This move is necessary to accommodate the upcoming lobby renovation project.'",
    },
    // Q158-160 (Memo)
    {
      'question': passage158_160 + "\n\n158. What must department heads do?",
      'options': [
        "Meet with the Finance Department",
        "Submit budget proposals",
        "Justify all expenditures",
        "Attend a budget review meeting",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) nhắc nhở 'all departmental budget proposals... are due... by Friday, June 21.'",
    },
    {
      'question':
          passage158_160 + "\n\n159. What might happen if a proposal is late?",
      'options': [
        "It will be rejected.",
        "It might not be considered.",
        "The department head will be fined.",
        "Maria Garcia will contact the manager.",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) cảnh báo 'Late submissions may not be considered...'",
    },
    {
      'question':
          passage158_160 +
          "\n\n160. Where can managers find the budget template?",
      'options': [
        "In their e-mail",
        "Attached to the memo",
        "On the shared drive",
        "From Maria Garcia",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 6) nói 'Please use the standard budget template found on the shared drive.'",
    },
    // Q161-163 (E-mail)
    {
      'question':
          passage161_163 + "\n\n161. What is the purpose of the e-mail?",
      'options': [
        "To bill Mr. Tanaka",
        "To confirm a parking reservation",
        "To provide driving directions",
        "To offer parking assistance",
      ],
      'correctIndex': 1,
      'explain':
          "Chủ đề (Passage 7) là 'Your Parking Reservation Confirmation' và e-mail bắt đầu 'This confirms your parking reservation'.",
    },
    {
      'question':
          passage161_163 + "\n\n162. How long will Mr. Tanaka be parked?",
      'options': ["3 ngày", "4 ngày", "5 ngày", "Không rõ"],
      'correctIndex':
          1, // August 15, 16, 17, 18 (exit 19) = 4 days parking, 5 days total? No, exit date 19 means he leaves on 19. Parked 15, 16, 17, 18 = 4 days.
      'explain':
          "E-mail (Passage 7) ghi 'Entry Date: August 15' và 'Exit Date: August 19'. Khoảng thời gian đậu xe là 4 ngày (15, 16, 17, 18).",
    },
    {
      'question':
          passage161_163 + "\n\n163. How does Mr. Tanaka enter the lot?",
      'options': [
        "By paying at the gate",
        "By showing his reservation",
        "By pressing the help button",
        "By scanning a QR code",
      ],
      'correctIndex': 3,
      'explain':
          "E-mail (Passage 7) hướng dẫn 'Please scan the QR code included in this e-mail at the entry gate.'",
    },
    // Q164-167 (Webpage)
    {
      'question':
          passage164_167 +
          "\n\n164. What is one responsibility of the position?",
      'options': [
        "Training new hires",
        "Resolving customer issues",
        "Developing software",
        "Managing the call center",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) liệt kê 'Resolving customer issues effectively and professionally' là một 'Responsibility'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n165. What qualification is preferred but not required?",
      'options': [
        "A high school diploma",
        "Problem-solving skills",
        "Call center experience",
        "A college degree",
      ],
      'correctIndex': 3, // College degree is preferred
      'explain':
          "Trang web (Passage 8) ghi 'High school diploma or equivalent (college degree preferred)'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n166. What is mentioned about the working hours?",
      'options': [
        "They are standard office hours.",
        "They include evenings and weekends.",
        "They are part-time only.",
        "They are negotiable.",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) yêu cầu 'Ability to work flexible hours, including evenings and weekends'.",
    },
    {
      'question': passage164_167 + "\n\n167. How can someone apply?",
      'options': [
        "By calling the company",
        "By visiting the call center",
        "Through the company website",
        "By e-mailing HR",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) hướng dẫn 'Apply online at GlobalCom.com/careers.'",
    },
    // Q168-171 (Form)
    {
      'question': passage168_171 + "\n\n168. What item is being altered?",
      'options': ["Men's pants", "A gray suit", "A suit jacket", "Sleeves"],
      'correctIndex': 2,
      'explain': "Form (Passage 9) ghi 'Item: (1) Men's Suit Jacket (Gray)'.",
    },
    {
      'question': passage168_171 + "\n\n169. What service was requested?",
      'options': [
        "Làm sạch áo",
        "Lên gấu quần",
        "Làm ngắn tay áo",
        "Sửa ve áo",
      ],
      'correctIndex': 2,
      'explain':
          "Mục 'Service Requested' (Passage 9) ghi 'Shorten sleeves by 1 inch'.",
    },
    {
      'question':
          passage168_171 + "\n\n170. When is the work expected to be finished?",
      'options': ["October 5", "October 10", "October 12", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "Form (Passage 9) ghi 'Estimated Completion Date: October 12'.",
    },
    {
      'question':
          passage168_171 + "\n\n171. How will the customer be notified?",
      'options': [
        "By e-mail",
        "By phone call",
        "By text message",
        "Not specified",
      ],
      'correctIndex': 2,
      'explain':
          "Mục 'Notes' (Passage 9) ghi 'Customer requested notification via text message when ready.'",
    },
    // Q172-175 (Article)
    {
      'question':
          passage172_175 + "\n\n172. What is the main topic of the article?",
      'options': [
        "A new city website",
        "Changes to trash collection",
        "A new recycling program",
        "A list of recyclable items",
      ],
      'correctIndex': 2,
      'explain':
          "Tiêu đề và câu đầu tiên (Passage 10) thông báo 'Springfield launched its new single-stream recycling program today.'",
    },
    {
      'question':
          passage172_175 +
          "\n\n173. What is the main change in the new program?",
      'options': [
        "More items can be recycled.",
        "Recycling is now mandatory.",
        "Residents no longer need to sort recyclables.",
        "The city provides new blue carts.",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) nói, 'Residents no longer need to sort paper, plastic, and glass into separate bins. All recyclable materials can now be placed together'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n174. According to the article, what is an expected outcome?",
      'options': [
        "Lower trash collection fees",
        "Increased recycling rates",
        "Cleaner streets",
        "More convenient trash pickup",
      ],
      'correctIndex': 1,
      'explain':
          "Thị trưởng Cho (Passage 10) nói, 'we expect it to significantly increase our recycling rates.'",
    },
    {
      'question':
          passage172_175 + "\n\n175. What item is mentioned as NOT recyclable?",
      'options': [
        "Glass bottles",
        "Plastic bags",
        "Newspapers",
        "Aluminum cans",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nhắc nhở 'certain items, such as plastic bags... are still NOT recyclable'.",
    },

    // --- Double Passages ---

    // Q176-180 (E-mail + Webpage)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. Why did John Smith write the e-mail?",
      'options': [
        "To schedule maintenance",
        "To complain about noise",
        "To report a water leak",
        "To ask for a new air conditioner",
      ],
      'correctIndex': 2,
      'explain':
          "John (Passage 1) viết, 'the air conditioning unit... seems to be leaking water onto the floor'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. When is John Smith available for maintenance?",
      'options': ["Sáng mai", "Chiều mai", "Bất cứ lúc nào", "Cuối tuần"],
      'correctIndex': 1,
      'explain':
          "John (Passage 1) nói, 'I am available tomorrow afternoon after 1 PM.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What action was taken on the resident portal?",
      'options': [
        "Rent was paid.",
        "A community event was posted.",
        "A maintenance request was submitted.",
        "Account information was updated.",
      ],
      'correctIndex': 2,
      'explain':
          "Portal (Passage 2) hiển thị chi tiết của một 'New Maintenance Request' đã được gửi.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. What category was selected for the request?",
      'options': ["Plumbing", "Electrical", "Appliance", "HVAC"],
      'correctIndex': 3,
      'explain':
          "Portal (Passage 2) cho thấy 'HVAC' (Heating, Ventilation, Air Conditioning) đã được chọn làm 'Category'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What permission did John Smith give?",
      'options': [
        "Permission to enter his apartment",
        "Permission to call him first",
        "Permission to replace the unit",
        "Permission to charge his account",
      ],
      'correctIndex': 0,
      'explain':
          "Portal (Passage 2) cho thấy '[Yes]' đã được chọn cho 'Permission to Enter'.",
    },
    // Q181-185 (Memo + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What change is announced in the memo?",
      'options': [
        "A new meeting location",
        "A new meeting time",
        "A new team member",
        "A new meeting agenda",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 1) thông báo cuộc họp 'will be moved to a new time slot... 10:00 A.M. every Monday'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. Why is the change being made?",
      'options': [
        "The director is unavailable at 9 AM.",
        "The conference room is booked.",
        "To accommodate remote team members.",
        "To make the meeting shorter.",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) giải thích 'This change is being made to better accommodate schedules across different time zones...'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What does Kenji Tanaka ask about?",
      'options': [
        "If the location changed",
        "If he needs to attend",
        "If the meeting's end time changed",
        "If remote members can join",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 2) hỏi, 'since the meeting is starting later, will it still end at the usual time...?'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. What potential conflict does Kenji mention?",
      'options': [
        "A client meeting",
        "Another call",
        "A doctor's appointment",
        "Travel plans",
      ],
      'correctIndex': 1,
      'explain':
          "Kenji (Passage 2) nói, 'I have another call scheduled at 10:45 A.M. on Mondays'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What can be inferred about the original meeting length?",
      'options': [
        "It was 30 minutes.",
        "It was 45 minutes.",
        "It was 60 minutes.",
        "It was variable.",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) không nói rõ thời lượng. E-mail (Passage 2) hỏi liệu cuộc họp mới (bắt đầu 10:00 AM) có kết thúc vào 'usual time (10:30 A.M.)' hay không. Điều này ngụ ý cuộc họp ban đầu (bắt đầu 9:00 AM) thường kết thúc lúc 10:30 AM, tức là kéo dài 90 phút.",
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
          "\n\n186. What is the price of the 'Swift Clean' vacuum?",
      'options': ["\$30", "\$299.00", "\$316.94", "Không rõ"],
      'correctIndex': 1,
      'explain': "Quảng cáo (Passage 1) ghi 'Price: \$299.00'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. When did David Evans place his order?",
      'options': ["June 28", "June 30", "July 6", "Không rõ"],
      'correctIndex': 0,
      'explain':
          "E-mail xác nhận (Passage 2) được gửi vào 'June 28'. Vì anh ấy nhận được ưu đãi tháng 6 (kết thúc June 30 - Passage 1), anh ấy phải đặt hàng vào hoặc trước June 28.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What item was missing from Mr. Evans's delivery?",
      'options': [
        "The vacuum cleaner",
        "The charging dock",
        "The replacement filters",
        "The warranty card",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy (Passage 3) viết 'the free replacement filters... were not included in the box.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. How long is the warranty for the vacuum?",
      'options': ["30 ngày", "6 tháng", "1 năm", "2 năm"],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) ghi 'Warranty: 1-Year Limited Warranty'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What does Mr. Evans request in his second e-mail?",
      'options': [
        "A refund for the vacuum",
        "Instructions on how to use the vacuum",
        "The missing item to be sent",
        "An extension of the warranty",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy (Passage 3) hỏi, 'Could you please arrange to have these [the filters] sent to me?'",
    },
    // Q191-195 (Article + E-mail + Schedule)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. What is the main subject of the article?",
      'options': [
        "Library renovations",
        "A book signing event",
        "A need for volunteers",
        "David Wu's new position",
      ],
      'correctIndex': 0,
      'explain':
          "Tiêu đề bài báo (Passage 1) là 'Library Renovation Update' và nội dung nói về tiến độ dự án.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. According to the article, when is the main floor expected to reopen?",
      'options': ["Tháng 1", "Tháng 3", "Đầu tháng 6", "Cuối tháng 6"],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) nói, 'The library expects the main floor to reopen in early June.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. Why did David Wu send the e-mail?",
      'options': [
        "To announce the reopening date",
        "To ask for volunteers",
        "To provide a renovation update",
        "To post a sign-up sheet",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) có chủ đề 'Volunteer Opportunity' và kêu gọi 'staff volunteers to assist with this large task' (reshelving books).",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. According to the sign-up sheet, who is volunteering on Friday afternoon?",
      'options': ["J. Smith", "K. Lee", "Laura Fernandez", "A. Chen"],
      'correctIndex': 2,
      'explain':
          "Bảng đăng ký (Passage 3) ghi 'Friday | 1 PM - 4 PM | Laura Fernandez'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What is Laura Fernandez doing during the week of June 3?",
      'options': [
        "Working at the service desk",
        "Attending training",
        "Helping move books",
        "Managing volunteers",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) kêu gọi tình nguyện viên để 'move thousands of books back onto the... shelves'. Bảng đăng ký (Passage 3) cho thấy Laura Fernandez đã đăng ký hai ca.",
    },
    // Q196-200 (E-mail + Invoice + E-mail)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. What did Kevin order in the first e-mail?",
      'options': [
        "A quote for flowers",
        "Flowers for Sarah Chen",
        "Delivery service",
        "Confirmation of payment",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) là một đơn đặt hàng: 'I would like to order a flower arrangement to be delivered... Recipient: Sarah Chen'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the invoice, what additional fee was charged?",
      'options': [
        "Delivery Fee",
        "Tax",
        "Valentine's Day Surcharge",
        "Card Message Fee",
      ],
      'correctIndex': 2,
      'explain':
          "Hóa đơn (Passage 2) liệt kê một khoản phí 'Valentine's Day Surcharge' \$15.00.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. What is the purpose of the third e-mail?",
      'options': [
        "To confirm the order details",
        "To apologize for a late delivery",
        "To request payment",
        "To provide tracking information",
      ],
      'correctIndex': 0,
      'explain':
          "E-mail thứ ba (Passage 3) từ cửa hàng hoa gửi cho Kevin, xác nhận 'your request for the... bouquet to be delivered... The total cost... This has been charged...'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What is the item number for the bouquet?",
      'options': ["FP-880", "TY-01", "100", "500"],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) ghi 'Arrangement: 'Thinking of You' Bouquet (Item #TY-01)'. Hóa đơn (Passage 2) cũng ghi '#TY-01'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. When will the flowers be delivered?",
      'options': ["February 10", "February 11", "February 14", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "E-mail đầu tiên (Passage 1) yêu cầu giao hàng vào 'Valentine's Day, February 14'. Hóa đơn (Passage 2) và e-mail xác nhận (Passage 3) đều ghi 'Delivery Date: February 14'.",
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
