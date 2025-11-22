// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest03() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_03';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 03',
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
        'order': 3,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người phục vụ đang bưng một khay thức ăn trong nhà hàng.
      // Transcript:
      // (A) A man is carrying a tray of food.
      // (B) A man is paying his bill at a restaurant.
      // (C) A man is cooking a meal in a kitchen.
      // (D) A man is sitting down at an empty table.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Bức tranh cho thấy một người đàn ông (có thể là bồi bàn) đang bưng một khay có đĩa thức ăn.',
    },
    {
      // Image Description: Một chiếc xe tải đang được chất hàng hóa vào từ phía sau tại một nhà kho.
      // Transcript:
      // (A) A truck is being repaired by a mechanic.
      // (B) A truck is parked in a garage.
      // (C) A truck is being loaded with boxes.
      // (D) A truck is driving on a highway.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy cửa sau của xe tải đang mở và các thùng hàng đang được đưa lên xe.',
    },
    {
      // Image Description: Mọi người đang đi dạo và mua sắm tại một khu chợ ngoài trời.
      // Transcript:
      // (A) People are walking through an outdoor market.
      // (B) People are watching a street performance.
      // (C) People are boarding a crowded bus.
      // (D) People are sitting on a park bench.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Bức tranh cho thấy nhiều người và các quầy hàng (hoa quả, rau củ) ở bên ngoài, mô tả chính xác một khu chợ ngoài trời.',
    },
    {
      // Image Description: Một người phụ nữ đang nhìn vào kính hiển vi trong phòng thí nghiệm.
      // Transcript:
      // (A) She's cleaning the laboratory equipment.
      // (B) She's looking into a microscope.
      // (C) She's writing on a whiteboard.
      // (D) She's putting on safety glasses.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người phụ nữ đang cúi xuống và nhìn qua thị kính của kính hiển vi.',
    },
    {
      // Image Description: Một máy bay đang ở trên đường băng, chuẩn bị cất cánh.
      // Transcript:
      // (A) An airplane is taking off from the runway.
      // (B) Passengers are boarding the aircraft.
      // (C) Luggage is being loaded onto the plane.
      // (D) An airplane is parked at a gate.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Bức tranh cho thấy rõ một chiếc máy bay đang ở trên đường băng. (A) là mô tả chính xác nhất.',
    },
    {
      // Image Description: Một bàn làm việc bừa bộn với nhiều giấy tờ, cốc cà phê và máy tính.
      // Transcript:
      // (A) The office is empty and dark.
      // (B) The desk is cluttered with various items.
      // (C) A woman is typing on a keyboard.
      // (D) The chairs are stacked in a corner.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bàn làm việc có rất nhiều đồ vật (giấy tờ, cốc, máy tính) một cách lộn xộn, được mô tả là "cluttered".',
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
      // Q7: Where should I put these files?
      // (A) Just leave them on my desk.
      // (B) They are confidential.
      // (C) I filed them yesterday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "Where" (Ở đâu) đòi hỏi một câu trả lời về địa điểm. (A) là câu trả lời phù hợp.',
    },
    {
      // Q8: When is our appointment with the dentist?
      // (A) It's tomorrow at 10 AM.
      // (B) I'm feeling much better.
      // (C) At the dental clinic.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "When" (Khi nào) đòi hỏi một câu trả lời về thời gian. (A) cung cấp ngày và giờ.',
    },
    {
      // Q9: Who's leading the new marketing campaign?
      // (A) It's a new campaign.
      // (B) I believe Ms. Chen is.
      // (C) In the conference room.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Who" (Ai) đòi hỏi một câu trả lời về người. (B) chỉ định một người.',
    },
    {
      // Q10: Why was the flight delayed?
      // (A) Yes, by two hours.
      // (B) Due to a mechanical issue.
      // (C) It's arriving at Gate 5.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why" (Tại sao) đòi hỏi một lý do. (B) cung cấp lý do cho sự chậm trễ.',
    },
    {
      // Q11: How long does it take to get downtown?
      // (A) About 20 minutes by bus.
      // (B) The town is very old.
      // (C) I'm going there now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "How long" (Bao lâu) đòi hỏi một câu trả lời về khoảng thời gian. (A) là câu trả lời phù hợp.',
    },
    {
      // Q12: Is the new software update installed?
      // (A) It's a very soft pillow.
      // (B) I wear a large size.
      // (C) No, the IT team is doing it tonight.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là câu hỏi Yes/No. (C) trả lời "No" và cung cấp thêm thông tin.',
    },
    {
      // Q13: Would you prefer to meet on Monday or Tuesday?
      // (A) Yes, that's a good idea.
      // (B) I prefer to meet in the morning.
      // (C) Tuesday works better for me.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là câu hỏi lựa chọn (or). (C) chọn một trong hai phương án được đưa ra.',
    },
    {
      // Q14: What did you think of the presentation?
      // (A) I thought it was very informative.
      // (B) I'll present it tomorrow.
      // (C) I didn't get a present.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What did you think" (Bạn nghĩ gì) đòi hỏi một ý kiến. (A) đưa ra một ý kiến.',
    },
    {
      // Q15: You haven't seen my keys, have you?
      // (A) I don't have the key.
      // (B) I saw them on the kitchen counter.
      // (C) Yes, I have to go now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi đuôi (tag question). (B) trả lời gián tiếp cho câu hỏi "Bạn có thấy không?".',
    },
    {
      // Q16: How many copies of the report do you need?
      // (A) I'll report it to the manager.
      // (B) Just five for the meeting.
      // (C) It's a long report.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How many" (Bao nhiêu) đòi hỏi một con số. (B) cung cấp số lượng "five".',
    },
    {
      // Q17: Why don't we take a short break?
      // (A) It's not broken.
      // (B) That sounds like a good plan.
      // (C) I took the bus.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why don\'t we..." là một lời đề nghị. (B) là một câu trả lời đồng ý với lời đề nghị.',
    },
    {
      // Q18: Has the mail been delivered yet?
      // (A) Yes, it's on your desk.
      // (B) He delivered a great speech.
      // (C) It's a male voice.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No. (A) trả lời "Yes" và cung cấp thông tin về vị trí.',
    },
    {
      // Q19: Could you help me with this heavy box?
      // (A) I'm not very strong.
      // (B) The box office is closed.
      // (C) Sure, where is it going?
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là một lời yêu cầu giúp đỡ. (C) là một câu trả lời đồng ý giúp đỡ.',
    },
    {
      // Q20: This conference room is too cold.
      // (A) The conference was last week.
      // (B) I'll turn up the heat.
      // (C) Yes, I made a call.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là một câu nhận xét về một vấn đề (quá lạnh). (B) là một hành động hợp lý để giải quyết vấn đề.',
    },
    {
      // Q21: What time does the store close?
      // (A) I'm storing the boxes.
      // (B) It's close to the bank.
      // (C) At 9 P.M. tonight.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "What time" (Mấy giờ) đòi hỏi một câu trả lời về thời gian. (C) là câu trả lời phù hợp.',
    },
    {
      // Q22: Didn't Mr. Kim approve the budget?
      // (A) He's still reviewing it.
      // (B) He moved to a new apartment.
      // (C) The budget is very large.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu hỏi Yes/No dạng phủ định. (A) trả lời gián tiếp "No" bằng cách giải thích tình trạng hiện tại.',
    },
    {
      // Q23: Whose computer is this?
      // (A) It's a new computer.
      // (B) I think it's Maria's.
      // (C) I'll commute tomorrow.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Whose" (Của ai) đòi hỏi một câu trả lời về sự sở hữu. (B) chỉ định một người.',
    },
    {
      // Q24: How far is the convention center?
      // (A) It was a long convention.
      // (B) Only two blocks from here.
      // (C) It starts at 10 A.M.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How far" (Bao xa) đòi hỏi một câu trả lời về khoảng cách. (B) là câu trả lời phù hợp.',
    },
    {
      // Q25: Should I call him or send an e-mail?
      // (A) He called me yesterday.
      // (B) An e-mail is probably better.
      // (C) Yes, I should.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi lựa chọn (or). (B) chọn một trong hai phương án và giải thích.',
    },
    {
      // Q26: When will the repair work be finished?
      // (A) A pair of gloves.
      // (B) The technician is on lunch break.
      // (C) By the end of the day.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "When" (Khi nào) đòi hỏi một câu trả lời về thời gian. (C) đưa ra một thời hạn.',
    },
    {
      // Q27: I'm afraid I'll be late for the meeting.
      // (A) Don't worry, it was postponed.
      // (B) It's a late model.
      // (C) We met this morning.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu thông báo về một vấn đề (bị trễ). (A) là một câu trả lời trấn an, giải quyết vấn đề đó.',
    },
    {
      // Q28: How often do you travel for business?
      // (A) I traveled by plane.
      // (B) Usually once a month.
      // (C) The business is doing well.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How often" (Bao lâu một lần) đòi hỏi một câu trả lời về tần suất. (B) là câu trả lời phù hợp.',
    },
    {
      // Q29: Are you free for dinner tonight?
      // (A) The dinner was delicious.
      // (B) I'm working late tonight, unfortunately.
      // (C) Yes, it's free of charge.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là một lời mời. (B) là một cách từ chối lịch sự và nêu lý do.',
    },
    {
      // Q30: What's the main purpose of this meeting?
      // (A) To finalize the project plan.
      // (B) It's in the main boardroom.
      // (C) I'll meet you there.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What\'s the... purpose" (Mục đích... là gì) đòi hỏi một câu trả lời về mục đích. (A) là câu trả lời phù hợp.',
    },
    {
      // Q31: Have you read the memo about the new policy?
      // (A) The policy is very strict.
      // (B) I read it this morning.
      // (C) I'll send you a new one.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi Yes/No. (B) trả lời gián tiếp "Yes" và cung cấp thời gian.',
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
(Woman) Hello, I'd like to book a flight to Miami for next weekend.
(Man) Certainly. I have a flight departing on Friday evening at 7 PM, and one on Saturday morning at 9 AM.
(Woman) The Friday evening one sounds perfect. Is it a direct flight?
(Man) No, that one has a one-hour layover in Atlanta. The Saturday morning flight is direct.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Man) This photocopier is jammed again. I can't get this report to print.
(Woman) Oh, not again. Did you try opening the side panel? Usually, the paper gets stuck near the roller.
(Man) I did, but I don't see anything. We should probably call the technician.
(Woman) His number is on a sticker on top of the machine. I'll call him while you try restarting it.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Woman) Mark, do you have an update on the Apex project? The client just called me asking for a timeline.
(Man) I'm still waiting for the design team to send over the final mockups. They were supposed to be ready yesterday.
(Woman) That's not good. The client is expecting to see them by tomorrow.
(Man) I know. I'll go down to their department right now and see what the delay is.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Man) Excuse me, I bought this shirt online, and I'd like to return it.
(Woman) Of course. Is there a problem with it?
(Man) Yes, I ordered a size medium, but this one is a large. I brought my order confirmation.
(Woman) I see. My apologies. We do have it in a medium in stock. Would you like to exchange it, or would you prefer a refund?
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Woman) Where should we go for the team lunch today?
(Man) I'm not sure. I'm tired of the sandwich shop downstairs. How about that new Italian place on Main Street?
(Woman) The one near the park? I heard it's really good, but it can be crowded.
(Man) That's true. It's probably best if I call and make a reservation for us. How many people?
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Man) Hello, I'm calling about my home internet service. It's been down for over an hour.
(Woman) I'm sorry to hear that. Let me check your account. Can you please confirm your address?
(Man) It's 125 Oak Street.
(Woman) Thank you. Ah, yes, it appears there is a general outage in your neighborhood. Our crews are working on it now, and we expect service to be restored by 5 P.M.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Woman) Are you going to Mr. Tanaka's retirement party on Friday?
(Man) Yes, I am. I heard the department is buying him a gift. Do you know who is collecting the money?
(Woman) I think Sarah from marketing is. She sent an e-mail about it this morning.
(Man) Oh, I must have missed it. I'll find her later today and contribute.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Man) How did the quarterly sales meeting go?
(Woman) Pretty well. Our sales in Asia were up 20%, which is fantastic.
(Man) That's great news. What about the European market?
(Woman) That's where we're struggling. Sales were down 5%. We're going to need a new strategy there for the next quarter.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Woman) Excuse me, I'm trying to get to the Airport.
(Man) You just missed the 10:30 express.
(Woman) Oh, no. When is the next one? I'm looking at the schedule, but I find it confusing.
(Man) The next express train is at 11:15 from Platform 4. You could take the 10:45 local from Platform 1, but it stops at every station and takes an hour.
---
**Train Schedule - Platform 1 (Local)**
- 10:15 ... City Center
- 10:45 ... Airport
- 11:15 ... Southwick

**Train Schedule - Platform 4 (Express)**
- 10:30 ... Airport
- 11:15 ... Airport
- 12:30 ... Airport
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Man) Did you see the memo about the new work-from-home policy?
(Woman) Yes! I can't believe they're finally letting us.
(Man) I know. It says we can work from home up to two days a week, as long as our manager approves it.
(Woman) This is going to make my commute so much better. I'm going to talk to my manager about it this afternoon.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Woman) Hello, I'm calling to confirm my reservation for this weekend. My name is Laura Fisher.
(Man) Thank you for calling, Ms. Fisher. Let me check... I'm sorry, I don't see a reservation under that name.
(Woman) That's strange. I booked it online last week. Could you check under my husband's name? It might be under David Fisher.
(Man) Ah, yes, I see it now. A king-size room for two nights, checking in this Friday.
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Man) We've received a lot of strong applications for the new accountant position.
(Woman) Have you had a chance to review the resumes?
(Man) Yes, I went through them last night. There's one candidate, Ana Lopez, who stands out. She has five years of experience and a CPA certification.
(Woman) She sounds perfect. Let's schedule an interview with her as soon as possible.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Woman) I'm almost ready for the presentation to the board tomorrow, but I'm so nervous.
(Man) You'll do great. You know the material better than anyone.
(Woman) I'm worried about the Q&A session. What if they ask me something I don't know?
(Man) Let's practice. I'll pretend to be a board member and ask you some tough questions. It will help you prepare.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "What is the woman trying to do?",
      'options': [
        "Change her seat",
        "Book a flight",
        "Check in for a flight",
        "Cancel a trip",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I'd like to book a flight to Miami...'",
    },
    {
      'question': "What is the problem with the Friday flight?",
      'options': [
        "It is too early.",
        "It is fully booked.",
        "It is not a direct flight.",
        "It is too expensive.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'that one has a one-hour layover in Atlanta.'",
    },
    {
      'question': "What does the man say about the Saturday flight?",
      'options': [
        "It is direct.",
        "It arrives in the evening.",
        "It is cheaper.",
        "It has a layover.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'The Saturday morning flight is direct.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What is the man's problem?",
      'options': [
        "He ran out of paper.",
        "A machine is not working.",
        "He needs to make a call.",
        "The report is not finished.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'This photocopier is jammed again.'",
    },
    {
      'question': "What does the woman suggest the man do?",
      'options': [
        "Restart the machine",
        "Call a technician",
        "Use a different machine",
        "Open the side panel",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript35_37 \n\n=> The woman asks, 'Did you try opening the side panel?' This is a suggestion.",
    },
    {
      'question': "What will the woman do next?",
      'options': [
        "Make a phone call",
        "Restart the machine",
        "Go to a different office",
        "Print the report",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript35_37 \n\n=> The woman says, 'I'll call him [the technician]...'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "Why did the client call the woman?",
      'options': [
        "To approve a design",
        "To ask for a timeline",
        "To schedule a meeting",
        "To complain about a delay",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The woman says, 'The client just called me asking for a timeline.'",
    },
    {
      'question': "What is the cause of the delay?",
      'options': [
        "The client has not paid.",
        "The design team is late.",
        "The woman is on a call.",
        "The project is too complex.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'I'm still waiting for the design team to send over the final mockups.'",
    },
    {
      'question': "What will the man do next?",
      'options': [
        "Call the client",
        "Ask for more time",
        "Visit the design team",
        "Send the final mockups",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'I'll go down to their department right now and see what the delay is.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "Why is the man at the store?",
      'options': [
        "To buy a shirt",
        "To apply for a job",
        "To return an item",
        "To pick up an online order",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I bought this shirt online, and I'd like to return it.'",
    },
    {
      'question': "What is wrong with the shirt?",
      'options': [
        "It is the wrong color.",
        "It is damaged.",
        "It is the wrong size.",
        "It was too expensive.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I ordered a size medium, but this one is a large.'",
    },
    {
      'question': "What does the woman offer the man?",
      'options': [
        "A refund or an exchange",
        "A discount on a future purchase",
        "A free repair",
        "A different shirt model",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript41_43 \n\n=> The woman asks, 'Would you like to exchange it, or would you prefer a refund?'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A team project",
        "A place to have lunch",
        "A sandwich shop's menu",
        "A park event",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The woman asks, 'Where should we go for the team lunch today?'",
    },
    {
      'question': "What does the woman say about the Italian place?",
      'options': [
        "It is too expensive.",
        "It has a new menu.",
        "It might be busy.",
        "It is too far away.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'I heard it's really good, but it can be crowded.'",
    },
    {
      'question': "What will the man probably do next?",
      'options': [
        "Order sandwiches",
        "Go to the park",
        "Make a phone call",
        "Look up the address",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'It's probably best if I call and make a reservation for us.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What is the man's problem?",
      'options': [
        "His address is wrong.",
        "His bill is incorrect.",
        "His internet is not working.",
        "His power is out.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'my home internet service. It's been down for over an hour.'",
    },
    {
      'question': "What is the cause of the problem?",
      'options': [
        "A neighborhood-wide outage",
        "A problem with the man's computer",
        "Unpaid bills",
        "Scheduled maintenance",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'it appears there is a general outage in your neighborhood.'",
    },
    {
      'question': "When is the service expected to be restored?",
      'options': [
        "In one hour",
        "By 5 P.M.",
        "Tomorrow",
        "The woman does not know",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'we expect service to be restored by 5 P.M.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "An e-mail from marketing",
        "A new company policy",
        "A retirement party",
        "A department budget",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman asks, 'Are you going to Mr. Tanaka's retirement party on Friday?'",
    },
    {
      'question': "What is the department doing for Mr. Tanaka?",
      'options': [
        "Sending him an e-mail",
        "Collecting money for a gift",
        "Organizing the party",
        "Giving him a promotion",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man says, 'I heard the department is buying him a gift.'",
    },
    {
      'question': "How did Sarah notify the department?",
      'options': [
        "By phone",
        "In a meeting",
        "By sending an e-mail",
        "By posting a memo",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'She sent an e-mail about it this morning.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What is the topic of the conversation?",
      'options': [
        "Sales performance",
        "A new strategy",
        "The Asian market",
        "A quarterly meeting",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript53_55 \n\n=> The speakers are discussing 'quarterly sales' and performance in different markets.",
    },
    {
      'question': "What good news does the woman report?",
      'options': [
        "The meeting went quickly.",
        "Sales in Europe are stable.",
        "The new strategy is working.",
        "Sales in Asia have grown.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript53_55 \n\n=> The woman says, 'Our sales in Asia were up 20%, which is fantastic.'",
    },
    {
      'question': "What does the woman say about the European market?",
      'options': [
        "It needs a new strategy.",
        "It is her next focus.",
        "It grew by 5%.",
        "It is doing better than Asia.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript53_55 \n\n=> She says, 'Sales were down 5%. We're going to need a new strategy there...'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "Look at the graphic. What train did the woman miss?",
      'options': [
        "The 10:15 local",
        "The 10:30 express",
        "The 10:45 local",
        "The 11:15 express",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'You just missed the 10:30 express.'",
    },
    {
      'question':
          "Look at the graphic. From which platform does the 10:45 train depart?",
      'options': [
        "Platform 1",
        "Platform 4",
        "Platform 10",
        "The graphic does not say",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> The man mentions the 10:45 local from Platform 1, and the graphic confirms 'Platform 1 (Local)' has a '10:45 ... Airport' train.",
    },
    {
      'question': "What problem does the man mention about the 10:45 train?",
      'options': [
        "It is confusing.",
        "It is not going to the airport.",
        "It is more expensive.",
        "It takes a long time.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript56_58 \n\n=> The man says the 10:45 local 'stops at every station and takes an hour,' implying it is slow.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What is the topic of the memo?",
      'options': [
        "A new manager",
        "A flexible work policy",
        "The company's performance",
        "A new e-mail system",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man asks, 'Did you see the memo about the new work-from-home policy?'",
    },
    {
      'question': "What is a condition of the new policy?",
      'options': [
        "It is only for two days.",
        "It must be approved by a manager.",
        "It starts this afternoon.",
        "It is only for the sales team.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man says, 'as long as our manager approves it.'",
    },
    {
      'question': "How does the woman feel about the news?",
      'options': ["Pleased", "Confused", "Worried", "Indifferent"],
      'correctIndex': 0,
      'explain':
          "$transcript59_61 \n\n=> The woman says 'I can't believe they're finally letting us' and 'This is going to make my commute so much better,' indicating she is pleased.",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the woman calling?",
      'options': [
        "To book a new room",
        "To cancel a reservation",
        "To check on a reservation",
        "To complain about a room",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'I'm calling to confirm my reservation...'",
    },
    {
      'question': "What is the initial problem?",
      'options': [
        "The room is not available.",
        "The booking is for the wrong date.",
        "The man cannot find the booking.",
        "The woman's credit card was declined.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'I'm sorry, I don't see a reservation under that name [Laura Fisher].'",
    },
    {
      'question': "Under what name is the reservation finally found?",
      'options': [
        "David Fisher",
        "Laura Fisher",
        "Online Booking",
        "King-size Room",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript62_64 \n\n=> The woman asks him to check under 'David Fisher', and the man replies, 'Ah, yes, I see it now.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What position are the speakers trying to fill?",
      'options': ["Manager", "Graphic Designer", "Accountant", "Receptionist"],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man says, 'strong applications for the new accountant position.'",
    },
    {
      'question': "Why does Ana Lopez stand out?",
      'options': [
        "She has a certification.",
        "She reviewed the resumes.",
        "She is available immediately.",
        "She is perfect.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript65_67 \n\n=> The man highlights her 'five years of experience and a CPA certification.'",
    },
    {
      'question': "What do the speakers decide to do?",
      'options': [
        "Hire Ana Lopez",
        "Review more resumes",
        "Post the job opening",
        "Arrange an interview",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'Let's schedule an interview with her...'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the woman nervous about?",
      'options': [
        "Presenting to the board",
        "Finishing her material",
        "The Q&A session",
        "The board members",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman says, 'I'm worried about the Q&A session.'",
    },
    {
      'question': "What does the man say about the woman?",
      'options': [
        "She is not ready.",
        "She is a board member.",
        "She knows the material well.",
        "She should ask for help.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man reassures her, 'You know the material better than anyone.'",
    },
    {
      'question': "What does the man offer to do?",
      'options': [
        "Do the presentation for her",
        "Help her practice",
        "Cancel the Q&A session",
        "Write down the answers",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'Let's practice. I'll pretend to be a board member...'",
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

  // --- Talk 1: Questions 71-73 (Weather Forecast) ---
  final transcript71_73 = """
Good evening, and here is your 10 PM weather update. A heavy storm system is moving into our area overnight, bringing strong winds and heavy rain. We advise all residents to stay indoors tomorrow morning if possible. The rain should taper off by tomorrow afternoon, and we are expecting a clear and sunny day on Wednesday. Commuters should expect significant delays tomorrow morning.
""";

  // --- Talk 2: Questions 74-76 (Radio Advertisement) ---
  final transcript74_76 = """
Are you looking for a reliable and affordable car? Then come down to 'Apex Auto' this weekend! We are having our biggest sale of the year. All 2023 models are now 30% off the sticker price. Plus, we are offering zero-percent financing for all qualified buyers. Our experienced sales team is here to help you find the perfect car, truck, or SUV. Visit us on Route 10, just past the city mall. Don't miss this event!
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
Thank you all for joining this emergency meeting. As you know, our main competitor launched a product very similar to our new 'Pro-Widget' this morning. They are also pricing it 10% lower than our planned price. We cannot move forward with our scheduled launch next Monday. We need to regroup and decide on a new strategy. I want to hear suggestions from the marketing and pricing teams immediately.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling the Crestview Medical Center. Our normal business hours are 9 AM to 5 PM, Monday through Friday. If this is a medical emergency, please hang up and dial 9-1-1. To schedule an appointment with a doctor, please press one. For prescription refills, press two. To speak with our billing department, press three. For all other inquiries, please stay on the line to speak with an operator.
""";

  // --- Talk 5: Questions 83-85 (Museum Tour Guide) ---
  final transcript83_85 = """
Good morning and welcome to the National History Museum. My name is David, and I'll be your guide. This tour will focus on our 'Ancient Egypt' exhibit, which features over 300 artifacts. Before we begin, I must remind you that flash photography and video recording are not permitted in this exhibit. We also ask that you do not touch any of the glass cases. Our tour will last approximately 45 minutes. Please follow me.
""";

  // --- Talk 6: Questions 86-88 (Airport Announcement) ---
  final transcript86_88 = """
This is an announcement for passengers waiting for flight 21B to London. This flight has been delayed due to a mechanical issue with the aircraft. The new estimated departure time is 8:30 PM. We apologize for the inconvenience. The airline will be providing food vouchers to all ticketed passengers. Please see an agent at the gate desk to receive your voucher.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
In local news, the city has announced plans to expand the public park on River Street. The expansion will include a new children's playground, a dog park, and three new tennis courts. The project is being funded by a grant from the State Foundation. Construction is set to begin in September and is expected to be completed by next spring. The current park area will remain open during construction.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
It is my great honor to introduce our keynote speaker tonight, Dr. Lena Evans. Dr. Evans is a professor of economics at National University and the author of the best-selling book, 'The Future of Work'. Tonight, she will be discussing how automation and artificial intelligence are changing the job market. Please join me in giving a warm welcome to Dr. Lena Evans.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Hi everyone, welcome to the second day of the Writer's Workshop. I hope you enjoyed the morning sessions. I have a quick announcement about a schedule change this afternoon. The 'Character Development' session with author Jane Smith was so popular, we are moving it to a larger room. It will now be in the Grand Ballroom, instead of Room 20A. The time, 2:00 PM, remains the same. The 'Poetry' session will now be in Room 20A.
---
**Workshop Schedule - 2:00 PM**
- Session 1: Character Development (Room 20A)
- Session 2: Poetry Workshop (Room 20B)
- Session 3: Getting Published (Grand Ballroom)
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
May I have your attention, please. The store will be closing in 15 minutes. Please bring all your selected items to the front registers at this time. If you need help locating an item, our staff is available to assist you. We will re-open tomorrow morning at 9 AM. We thank you for shopping at 'HomeMart' and hope to see you again soon.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What is the weather forecast for tomorrow morning?",
      'options': [
        "Clear and sunny",
        "Cold and windy",
        "Stormy with heavy rain",
        "Light snow",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> The speaker says, 'A heavy storm system is moving into our area overnight, bringing strong winds and heavy rain' and advises staying indoors 'tomorrow morning'.",
    },
    {
      'question': "What does the speaker advise listeners to do?",
      'options': [
        "Expect delays",
        "Water their plants",
        "Go outside in the afternoon",
        "Listen to the 10 PM update",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript71_73 \n\n=> The speaker says, 'Commuters should expect significant delays tomorrow morning.'",
    },
    {
      'question': "When will the weather get better?",
      'options': ["Overnight", "Tomorrow morning", "Wednesday", "By 10 PM"],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> The speaker says, 'we are expecting a clear and sunny day on Wednesday.'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What is being advertised?",
      'options': [
        "A car sale",
        "A new mall",
        "A financing service",
        "A sticker shop",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript74_76 \n\n=> The ad is for 'Apex Auto' and mentions 'biggest sale of the year' for 'car, truck, or SUV'.",
    },
    {
      'question': "What discount is being offered on 2023 models?",
      'options': ["10%", "20%", "30%", "Zero-percent"],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> The speaker says, 'All 2023 models are now 30% off the sticker price.'",
    },
    {
      'question': "Where is the business located?",
      'options': [
        "At the city mall",
        "On Route 10",
        "In Apex",
        "At the sticker price",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> The ad states, 'Visit us on Route 10, just past the city mall.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "Why was the meeting called?",
      'options': [
        "To launch a new product",
        "To discuss a new pricing strategy",
        "To respond to a competitor's action",
        "To schedule a product launch",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> The speaker says, 'our main competitor launched a product very similar to ours... We cannot move forward... We need to regroup...'",
    },
    {
      'question': "What is the problem with the competitor's product?",
      'options': [
        "It is of lower quality.",
        "It is being launched on Monday.",
        "It is priced lower.",
        "It is being marketed well.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> The speaker says, 'They are also pricing it 10% lower than our planned price.'",
    },
    {
      'question': "Who will the speaker hear from first?",
      'options': [
        "The marketing team",
        "The competitor",
        "The 'Pro-Widget' team",
        "The Monday launch team",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript77_79 \n\n=> The speaker concludes, 'I want to hear suggestions from the marketing and pricing teams immediately.'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is this?",
      'options': [
        "A billing department",
        "A pharmacy",
        "A medical center",
        "An emergency service",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> The message says, 'Thank you for calling the Crestview Medical Center.'",
    },
    {
      'question': "When is the business closed?",
      'options': ["In the evening", "On weekends", "On Mondays", "On Fridays"],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> The hours are 'Monday through Friday'. This implies they are closed on weekends (Saturday and Sunday).",
    },
    {
      'question': "What should a caller do to ask about a bill?",
      'options': ["Press one", "Press two", "Press three", "Dial 9-1-1"],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> The message states, 'To speak with our billing department, press three.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Who is the speaker?",
      'options': [
        "A historian",
        "A photographer",
        "A tour guide",
        "An archaeologist",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> The speaker introduces himself: 'My name is David, and I'll be your guide.'",
    },
    {
      'question': "What is the main topic of the tour?",
      'options': [
        "The museum's history",
        "Ancient Egypt",
        "Photography rules",
        "Glassmaking",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> The speaker says, 'This tour will focus on our 'Ancient Egypt' exhibit...'",
    },
    {
      'question': "What are listeners asked NOT to do?",
      'options': [
        "Touch the glass",
        "Ask questions",
        "Take photos",
        "Follow the guide",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript83_85 \n\n=> The speaker says, 'We also ask that you do not touch any of the glass cases.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the problem with the flight to London?",
      'options': [
        "It is canceled.",
        "It is delayed.",
        "It is fully booked.",
        "It is leaving from a new gate.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> The speaker says, 'This flight has been delayed...'",
    },
    {
      'question': "What is the reason for the problem?",
      'options': [
        "Bad weather",
        "A staffing shortage",
        "A mechanical issue",
        "Air traffic",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> The flight is delayed 'due to a mechanical issue with the aircraft.'",
    },
    {
      'question': "What will the airline provide to passengers?",
      'options': [
        "A new aircraft",
        "Hotel vouchers",
        "A full refund",
        "Food vouchers",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> The speaker says, 'The airline will be providing food vouchers to all ticketed passengers.'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What is the topic of the news report?",
      'options': [
        "A park expansion",
        "A new children's program",
        "A state grant",
        "A construction delay",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> The report says, 'the city has announced plans to expand the public park on River Street.'",
    },
    {
      'question': "What is NOT mentioned as a new feature?",
      'options': [
        "A dog park",
        "A swimming pool",
        "Tennis courts",
        "A children's playground",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> The speaker lists a playground, dog park, and tennis courts. A swimming pool is not mentioned.",
    },
    {
      'question': "When is the project expected to be finished?",
      'options': [
        "In September",
        "Next spring",
        "During the construction",
        "Next year",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> The report says, 'Construction... is expected to be completed by next spring.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Dr. Evans's profession?",
      'options': ["A CEO", "An author", "A professor", "An AI developer"],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> The speaker introduces her as 'a professor of economics at National University'. She is also an author.",
    },
    {
      'question': "What is the topic of Dr. Evans's talk?",
      'options': [
        "Her best-selling book",
        "National University",
        "The future of economics",
        "The impact of automation on jobs",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> The speaker says, 'she will be discussing how automation and artificial intelligence are changing the job market.'",
    },
    {
      'question': "When is Dr. Evans speaking?",
      'options': ["Tonight", "Tomorrow", "In the future", "At the university"],
      'correctIndex': 0,
      'explain':
          "$transcript92_94 \n\n=> The speaker says, 'It is my great honor to introduce our keynote speaker tonight...'",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. Where was the 'Character Development' session originally scheduled?",
      'options': [
        "Room 20A",
        "Room 20B",
        "Grand Ballroom",
        "The graphic does not say",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript95_97 \n\n=> The original schedule shows 'Session 1: Character Development (Room 20A)'.",
    },
    {
      'question':
          "Look at the graphic. Where will the 'Poetry' session be held now?",
      'options': ["Room 20A", "Room 20B", "Grand Ballroom", "It is canceled."],
      'correctIndex': 0,
      'explain':
          "$transcript95_97 \n\n=> The speaker says 'The 'Poetry' session will now be in Room 20A.'",
    },
    {
      'question': "Why was the 'Character Development' session moved?",
      'options': [
        "The speaker was late.",
        "There was high demand.",
        "The room had a problem.",
        "The 'Poetry' session was shorter.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript95_97 \n\n=> The speaker says the session 'was so popular, we are moving it to a larger room... to accommodate the larger audience.'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What is the purpose of this announcement?",
      'options': [
        "To announce the store's opening",
        "To inform customers the store is closing soon",
        "To advertise a sale",
        "To ask for customer feedback",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> The speaker says, 'The store will be closing in 15 minutes.'",
    },
    {
      'question': "What are listeners asked to do?",
      'options': [
        "Locate a staff member",
        "Shop again tomorrow",
        "Go to the front registers",
        "Select their items quickly",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> The speaker says, 'Please bring all your selected items to the front registers at this time.'",
    },
    {
      'question': "When will the store open again?",
      'options': ["In 15 minutes", "At 9 AM", "At 9 PM", "In the morning"],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> The speaker says, 'We will re-open tomorrow morning at 9 AM.'",
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
      'question':
          "The deadline for the proposal submission is ______ Friday at 5:00 P.M.",
      'options': ['on', 'at', 'in', 'by'],
      'correctIndex': 0,
      'explain':
          'Giới từ "on" được sử dụng cho các ngày cụ thể trong tuần (on Friday).',
    },
    {
      'question':
          "Mr. Chen will ______ the London office while Ms. Evans is on vacation.",
      'options': ['manage', 'manager', 'management', 'managing'],
      'correctIndex': 0,
      'explain':
          'Sau động từ khuyết thiếu "will" cần một động từ nguyên mẫu (manage).',
    },
    {
      'question': "The company picnic was canceled ______ the heavy rain.",
      'options': ['because of', 'although', 'so', 'because'],
      'correctIndex': 0,
      'explain':
          '"Because of" (bởi vì) là một giới từ, theo sau là một cụm danh từ ("the heavy rain"). "Because" là một liên từ, theo sau là một mệnh đề.',
    },
    {
      'question':
          "All employees must complete the ______ training by the end of the month.",
      'options': ['require', 'requires', 'required', 'requiring'],
      'correctIndex': 2,
      'explain':
          'Tính từ "required" (bắt buộc) được dùng để bổ nghĩa cho danh từ "training".',
    },
    {
      'question':
          "The new software is ______ more efficient than the previous version.",
      'options': ['much', 'many', 'very', 'so'],
      'correctIndex': 0,
      'explain':
          '"Much" được sử dụng để nhấn mạnh cho các tính từ so sánh hơn (more efficient).',
    },
    {
      'question':
          "Please review the attached documents ______, as they contain important information.",
      'options': ['careful', 'careless', 'carefully', 'caring'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (carefully) để bổ nghĩa cho động từ "review".',
    },
    {
      'question':
          "The marketing team is responsible ______ developing the new ad campaign.",
      'options': ['for', 'to', 'at', 'with'],
      'correctIndex': 0,
      'explain': 'Cấu trúc "responsible for" (chịu trách nhiệm cho) + V-ing.',
    },
    {
      'question':
          "The keynote speaker was so ______ that the audience gave him a standing ovation.",
      'options': ['inspire', 'inspiring', 'inspired', 'inspiration'],
      'correctIndex': 1,
      'explain':
          'Tính từ "inspiring" (truyền cảm hứng) được dùng để mô tả bản chất của người nói (speaker). "Inspired" (được truyền cảm hứng) dùng để mô tả cảm xúc của khán giả.',
    },
    {
      'question':
          "______ you have any questions, please feel free to contact me.",
      'options': ['If', 'Unless', 'Whether', 'Therefore'],
      'correctIndex': 0,
      'explain': '"If" (nếu) được dùng để bắt đầu một mệnh đề điều kiện.',
    },
    {
      'question': "The construction project was completed ahead of ______.",
      'options': ['scheduled', 'scheduler', 'scheduling', 'schedule'],
      'correctIndex': 3,
      'explain':
          'Cụm từ "ahead of schedule" (trước tiến độ) là một cụm cố định, cần danh từ "schedule".',
    },
    {
      'question':
          "The new factory will significantly ______ the company's production capacity.",
      'options': ['boost', 'boosted', 'boosting', 'booster'],
      'correctIndex': 0,
      'explain':
          'Sau động từ khuyết thiếu "will" (và trạng từ "significantly") cần một động từ nguyên mẫu (boost).',
    },
    {
      'question':
          "Dr. Miles is a leading expert in the ______ of chemical engineering.",
      'options': ['field', 'area', 'space', 'position'],
      'correctIndex': 0,
      'explain':
          '"Field" (lĩnh vực) là từ vựng phù hợp nhất khi nói về chuyên môn học thuật (in the field of...).',
    },
    {
      'question': "The meeting has been ______ until next Monday at 10 A.M.",
      'options': ['postponed', 'cancelled', 'attended', 'scheduled'],
      'correctIndex': 0,
      'explain':
          '"Postponed" (trì hoãn) đi với "until" (cho đến khi). "Cancelled" (hủy) sẽ không dùng "until".',
    },
    {
      'question': "You must present a ______ driver's license to rent a car.",
      'options': ['valid', 'validation', 'validate', 'validly'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (valid - hợp lệ) để bổ nghĩa cho cụm danh từ "driver\'s license".',
    },
    {
      'question': "The report was divided ______ three main sections.",
      'options': ['in', 'into', 'by', 'with'],
      'correctIndex': 1,
      'explain': 'Cấu trúc "divide into" (chia thành) được sử dụng ở đây.',
    },
    {
      'question':
          "The success of this project depends ______ on effective teamwork.",
      'options': ['heavy', 'heavily', 'heaviness', 'heavier'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (heavily - nặng nề, chủ yếu) để bổ nghĩa cho động từ "depends".',
    },
    {
      'question':
          "______ Mr. Kim nor Ms. Lee will be able to attend the conference.",
      'options': ['Either', 'Both', 'Neither', 'Also'],
      'correctIndex': 2,
      'explain':
          'Cấu trúc "Neither... nor..." (Không... cũng không...) được sử dụng để nối hai chủ ngữ phủ định.',
    },
    {
      'question': "The hotel offers ______ breakfast to all of its guests.",
      'options': [
        'complimentary',
        'compliment',
        'complimented',
        'complimenting',
      ],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (complimentary - miễn phí) để bổ nghĩa cho danh từ "breakfast".',
    },
    {
      'question': "We apologize for the ______ in responding to your e-mail.",
      'options': ['delay', 'late', 'later', 'delayed'],
      'correctIndex': 0,
      'explain': 'Sau mạo từ "the" cần một danh từ (delay - sự chậm trễ).',
    },
    {
      'question':
          "The new manager ______ himself to the team at the meeting this morning.",
      'options': ['spoke', 'announced', 'introduced', 'talked'],
      'correctIndex': 2,
      'explain':
          '"Introduced" (giới thiệu) là động từ phù hợp nhất với tân ngữ "himself" (tự giới thiệu).',
    },
    {
      'question':
          "This information is ______ confidential and should not be shared.",
      'options': ['high', 'higher', 'highly', 'height'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (highly - hết sức) để bổ nghĩa cho tính từ "confidential".',
    },
    {
      'question':
          "The updated safety ______ are posted on the wall near the entrance.",
      'options': ['regulate', 'regulations', 'regulating', 'regulated'],
      'correctIndex': 1,
      'explain':
          'Cần một danh từ số nhiều (regulations - các quy định) để làm chủ ngữ cho động từ "are posted".',
    },
    {
      'question':
          "Sales figures have improved ______ since we launched the new website.",
      'options': ['notice', 'noticing', 'noticeable', 'noticeably'],
      'correctIndex': 3,
      'explain':
          'Cần một trạng từ (noticeably - một cách đáng kể) để bổ nghĩa cho động từ "have improved".',
    },
    {
      'question': "______ all the candidates, Ms. Wei is the most qualified.",
      'options': ['Of', 'With', 'From', 'By'],
      'correctIndex': 0,
      'explain':
          'Giới từ "Of" (Trong số) được dùng ở đây để bắt đầu một cụm so sánh nhất ("Of all the candidates...").',
    },
    {
      'question':
          "The company is relocating its ______ to a larger building downtown.",
      'options': ['headquarter', 'headquarters', 'headed', 'heading'],
      'correctIndex': 1,
      'explain':
          'Danh từ "headquarters" (trụ sở chính) luôn có "s" ở cuối, kể cả khi nói về một trụ sở.',
    },
    {
      'question':
          "The workshop will provide ______ advice on how to invest wisely.",
      'options': ['practice', 'practical', 'practically', 'practiced'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (practical - thực tế) để bổ nghĩa cho danh từ "advice".',
    },
    {
      'question':
          "You can ______ your reservation online or by calling the hotel directly.",
      'options': ['confirm', 'confirmation', 'confirmed', 'confirms'],
      'correctIndex': 0,
      'explain':
          'Sau động từ khuyết thiếu "can" cần một động từ nguyên mẫu (confirm).',
    },
    {
      'question':
          "The team leader is responsible for ______ tasks to each member.",
      'options': ['assign', 'assigned', 'assigning', 'assignment'],
      'correctIndex': 2,
      'explain':
          'Sau giới từ "for" (trong "responsible for") cần một danh động từ (assigning).',
    },
    {
      'question':
          "Our new vacuum cleaner is quieter ______ all other models on the market.",
      'options': ['than', 'as', 'then', 'from'],
      'correctIndex': 0,
      'explain': 'Tính từ so sánh hơn "quieter" phải đi kèm với "than" (hơn).',
    },
    {
      'question':
          "A full ______ of the event will be available on our website tomorrow.",
      'options': ['record', 'recorded', 'recording', 'recordable'],
      'correctIndex': 2,
      'explain':
          'Cần một danh từ. "Recording" (bản thu/ghi hình) phù hợp với ngữ cảnh "of the event".',
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
To: All Employees
From: Building Management
Subject: Elevator Maintenance
Date: July 10

Please be advised that the main elevators will be out of ____(131)____ tomorrow, July 11, from 9:00 A.M. to 3:00 P.M. for scheduled maintenance. This is part of our ongoing effort to ensure all building systems are modern and reliable.

During this time, employees will need to use the freight elevator at the west end of the building. We apologize for any ____(132)____ this may cause. ____(133)____.

Please plan accordingly, especially if you have client meetings. The elevators are expected to be fully ____(134)____ again by 3:00 P.M.
""";
  // --- Passage 2: Questions 135-138 (Memo) ---
  final passage135_138 = """
To: Sales Team
From: Kenji Tanaka, Sales Manager
Subject: New Sales Incentive Program

I am excited to announce our new sales incentive program, which will begin on August 1. The program is designed to ____(135)____ high performance and reward our top salespeople.

Instead of a single monthly bonus, we will now offer tiered bonuses based on sales targets. ____(136)____, there will be an additional bonus for the "Top Seller of the Quarter."

A full document detailing the new structure has been uploaded to the shared drive. Please review it carefully. ____(137)____ you have any questions before then, feel free to e-mail me. We will discuss this new program in more detail at our team meeting next Friday.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**Get Fit at Summit Sports Club!**

Are you looking for a clean, modern, and friendly gym? Summit Sports Club is now open! We offer state-of-the-art cardio and weight-training ____(139)____. We also have a wide variety of group classes, including yoga, spinning, and kickboxing.

Our ____(140)____ trainers are available to help you create a personalized workout plan.

Sign up this month and receive a 50% discount on your registration fee. Plus, all new members get a free personal training session. Visit us today at 500 Park Avenue!
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**Apex Solutions Announces Expansion**

(April 3) – Apex Solutions, a local software development company, announced today that it will be opening a new office in Toronto, Canada. This move marks the company's first ____(143)____ expansion.

The new office, which will open in September, will initially house a team of 30 software engineers and sales representatives. The company is currently in the process of ____(144)____ staff for the new location.

"We are thrilled to be expanding into the Canadian market," said CEO Maria Valdez. "This new office will ____(145)____ us to better serve our growing list of clients in Canada." ____(146)____.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["order", "service", "control", "mind"],
      'correctIndex': 1,
      'explain':
          "Cụm từ 'out of service' (ngừng hoạt động, không khả dụng) là cụm cố định dùng cho máy móc.",
    },
    {
      'question': "",
      'options': ["convenience", "inconvenience", "convenient", "inconvenient"],
      'correctIndex': 1,
      'explain':
          "Sau 'any' (trong ngữ cảnh xin lỗi) cần một danh từ. 'Inconvenience' (sự bất tiện) là danh từ phù hợp.",
    },
    {
      'question': "",
      'options': [
        "The freight elevator is much slower.",
        "Please use the stairs if you are able.",
        "The maintenance was requested last week.",
        "The building will be closed.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp một phương án thay thế khác (dùng cầu thang) cho việc thang máy chính bị hỏng, phù hợp với logic của đoạn văn.",
    },
    {
      'question': "",
      'options': ["operator", "operation", "operational", "operate"],
      'correctIndex': 2,
      'explain':
          "Cần một tính từ (operational - hoạt động được) sau động từ 'be'.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["motivate", "motivation", "motivated", "motivator"],
      'correctIndex': 0,
      'explain':
          "Sau 'to' (trong 'designed to') cần một động từ nguyên mẫu (motivate).",
    },
    {
      'question': "",
      'options': ["Therefore", "However", "In addition", "For example"],
      'correctIndex': 2,
      'explain':
          "'In addition' (Thêm vào đó) được dùng để thêm một thông tin, một phần thưởng khác (Top Seller) vào chương trình.",
    },
    {
      'question': "",
      'options': [
        "The old program was not successful.",
        "We are confident this will drive growth.",
        "The team meeting is cancelled.",
        "Sales were down last quarter.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này là một lời bình luận tích cực, tóm tắt mục đích của chương trình mới, phù hợp với đoạn văn.",
    },
    {
      'question':
          "", // "We will discuss this new program... at our team meeting next Friday."
      // Let's change the blank.
      // "A full document detailing the new structure... Please review it carefully. ____(137)____ you have any questions before then, feel free to e-mail me."
      // Options: [If, Unless, Although, Because] -> Correct: 0
      // Re-writing the passage text
      'options': ["If", "Unless", "Although", "Because"],
      'correctIndex': 0,
      'explain': "'If' (Nếu) được dùng để bắt đầu một mệnh đề điều kiện.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["equipment", "equipped", "equipping", "equip"],
      'correctIndex': 0,
      'explain':
          "Cần một danh từ (equipment - thiết bị) sau tính từ 'weight-training'. 'Equipment' là danh từ không đếm được.",
    },
    {
      'question': "",
      'options': ["experience", "experienced", "experiencing", "experiences"],
      'correctIndex': 1,
      'explain':
          "Cần một tính từ (experienced - có kinh nghiệm) để bổ nghĩa cho danh từ 'trainers'.",
    },
    {
      'question': "",
      'options': [
        "Our yoga classes are the most popular.",
        "The gym is located on Park Avenue.",
        "We are open 24 hours a day.",
        "Our membership fees are very affordable.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này cung cấp thêm một thông tin hấp dẫn (mở cửa 24/7) về phòng gym, phù hợp với mục đích quảng cáo.",
    },
    {
      'question':
          "", // "Sign up this month and receive a 50% discount... Plus, all new members get a free personal training session."
      // Let's change the blank.
      // "Our certified trainers are available to help you create a personalized workout plan ____(141)____ your goals."
      // Options: [suited for, aside from, instead of, similar to] -> Correct: 0
      'options': ["suited for", "aside from", "instead of", "similar to"],
      'correctIndex': 0,
      'explain':
          "Cụm từ 'suited for' (phù hợp với) được dùng để mô tả kế hoạch tập luyện được thiết kế cho mục tiêu (goals) của bạn.",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["nation", "national", "nationally", "international"],
      'correctIndex': 3,
      'explain':
          "Việc mở văn phòng ở Toronto (Canada) là một sự mở rộng 'international' (quốc tế) đối với một công ty 'local' (địa phương).",
    },
    {
      'question': "",
      'options': ["recruit", "recruited", "recruiting", "recruitment"],
      'correctIndex': 2,
      'explain':
          "Cấu trúc 'in the process of' (trong quá trình) + V-ing (recruiting - tuyển dụng).",
    },
    {
      'question': "",
      'options': ["allow", "allowed", "allowing", "allowance"],
      'correctIndex': 0,
      'explain': "Sau 'will' cần một động từ nguyên mẫu (allow).",
    },
    {
      'question': "",
      'options': [
        "The company's stock price rose yesterday.",
        "Ms. Valdez has been CEO for five years.",
        "This follows a record-breaking year of sales for Apex Solutions.",
        "Toronto is the largest city in Canada.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này cung cấp bối cảnh (doanh số kỷ lục) giải thích lý do tại sao công ty lại mở rộng, kết nối hợp lý với phần còn lại của bài báo.",
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

    // // Sửa lại câu hỏi 137 và 141 nếu chúng đã bị thay đổi
    // if (i == 6) questionText = passage135_138.replaceAll("Please review it carefully. ____(137)____.", "Please review it carefully. ____(137)____ you have any questions before then, feel free to e-mail me. We will discuss this new program in more detail at our team meeting next Friday.");
    // if (i == 10) questionText = passage139_142.replaceAll("...create a personalized workout plan. ____(141)____.", "...create a personalized workout plan ____(141)____ your goals. Sign up this month...");

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

  // Q147-148 (Notice)
  final passage147_148 = """
**Attention All Building Tenants**

The building's air conditioning system will be shut down for maintenance this Saturday, August 3, from 8:00 A.M. to 5:00 P.M.

During this time, the building will become very warm. We recommend that you plan to work remotely if possible.

We apologize for this inconvenience, but this necessary maintenance will improve the system's efficiency and prevent future breakdowns.

- Building Management
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: marketing_team@autocorp.com
From: David Chen <dchen@autocorp.com>
Subject: Meeting Room Change
Date: March 5

Hi Team,

A quick update on our 3:00 P.M. marketing meeting today. The main conference room (Room 101) is unavailable due to an emergency repair.

I have booked a new room. Please come to the **4th Floor Conference Room (Room 405)** instead. All other meeting details, including the agenda, remain the same.

See you there,
David
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Anna (2:10 P.M.)**: Hi Mark. I'm running late. I'm just leaving the client's office now.
**Mark (2:11 P.M.)**: No problem. Are you still planning to stop by the office today?
**Anna (2:11 P.M.)**: Yes, but I won't be back before 5:00 P.M. Could you do me a favor?
**Mark (2:12 P.M.)**: Sure, what's up?
**Anna (2:13 P.M.)**: Could you print the final sales report and leave it on my desk? I need it for my meeting first thing tomorrow morning.
**Mark (2:14 P.M.)**: Will do. It's the 'Q3-Final' file, right?
**Anna (2:14 P.M.)**: Yes, that's the one. Thanks a million!
""";
  // Q153-155 (Article)
  final passage153_155 = """
**Local Restaurant Wins National Award**

(June 10) – 'The Harbor Grill', a seafood restaurant in downtown Springfield, has won the prestigious "Best New Restaurant" award from National Dining Magazine. The award is a huge honor for owner and head chef, Elena Rodriguez.

Chef Rodriguez opened The Harbor Grill just one year ago. She is known for her commitment to using only locally sourced seafood and organic vegetables.

"We are incredibly honored," said Rodriguez. "This award is a testament to the hard work of my entire team."

The Harbor Grill is located on 15 Water Street and is open for dinner Tuesday through Sunday. Reservations are highly recommended.
""";
  // Q156-157 (Advertisement)
  final passage156_157 = """
**Fast-Track Office Solutions**

Is your computer running slow? Is your network unreliable? Call Fast-Track Office Solutions. We provide on-site IT support for small businesses.

Our services include:
* Network setup and security
* Computer repair and upgrades
* Data backup and recovery
* Virus removal

We offer affordable monthly plans or a simple pay-as-you-go hourly rate. Call us today for a free consultation and get 10% off your first service!
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Employees
**From**: Human Resources
**Date**: September 1
**Subject**: New Employee Referral Program

We are pleased to announce the launch of our new Employee Referral Program, effective immediately.

We believe that our best new hires come from our best current employees. To reward you for your recommendations, we will now offer a **\$500 bonus** for any referral who is hired and successfully completes their 90-day probationary period.

To refer someone, please fill out the referral form on the company intranet and submit it to HR *before* the candidate's official application. You cannot refer someone who has already applied.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: James Lee <jlee@email.com>
From: Dr. Hanson's Office <info@drhanson.com>
Subject: Your Appointment Reminder
Date: May 2

Dear Mr. Lee,

This is a reminder of your upcoming dental appointment with Dr. Hanson on **Friday, May 6, at 2:30 P.M.**

Please arrive 15 minutes early to complete your new patient paperwork. You will also need to bring your insurance card and a photo ID.

If you need to reschedule, please call our office at 555-1234 at least 24 hours in advance to avoid a cancellation fee.

We look forward to seeing you.
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Product: The 'Aero-100' Air Purifier**

Breathe cleaner air with the Aero-100. This powerful yet quiet air purifier is perfect for rooms up to 300 square feet (approx. 28 square meters).

**Key Features:**
* **True HEPA Filter**: Captures 99.97% of airborne particles, including dust, pollen, and smoke.
* **Smart Sensor**: Automatically monitors air quality and adjusts fan speed.
* **Quiet Mode**: Operates at a whisper-quiet 25dB, perfect for bedrooms.
* **Filter-Replacement Indicator**: An indicator light turns red when it's time to replace the filter (approximately every 6 months).

**Price**: \$149.99
**Warranty**: 2-Year Limited Warranty
""";
  // Q168-171 (Form)
  final passage168_171 = """
**Midtown Office Supply - Order Form**

**Sold To**: Peterson Legal Services
**Order Date**: 10/22
**Ship To**: 1500 Main St, Suite 400

| Item # | Description                 | Qty | Unit Price | Total    |
|--------|-----------------------------|-----|------------|----------|
| P-105  | Copy Paper (Case)           | 5   | \$40.00    | \$200.00 |
| B-210  | Ballpoint Pens (Black, 1-Dozen) | 10  | \$12.00    | \$120.00 |
| T-004  | Printer Toner (Model 45-B)  | 2   | \$80.00    | \$160.00 |
|        |                             |     | Subtotal   | \$480.00 |
|        |                             |     | Shipping   | \$25.00  |
|        |                             |     | **Total** | **\$505.00** |

**Notes**: Please ship all items together. Deliver to 4th-floor reception.
""";
  // Q172-175 (Article)
  final passage172_175 = """
**Westview City Council Approves New Budget**

(May 1) – The Westview City Council approved a \$50 million budget for the upcoming fiscal year after a long debate last night. The new budget, which passed by a 4-to-3 vote, includes a controversial 5% increase in property taxes.

Councilmember Ana Sharma, who voted in favor, argued the tax increase is essential for funding much-needed road repairs and hiring 10 new firefighters.

Councilmember John Kline, who voted against it, expressed concern that the tax increase would be a burden on residents. He had proposed cutting the budget for the summer arts festival instead, but his amendment was not approved.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (E-mail + Webpage)
  final passage176_180_1 = """
To: info@peakfitness.com
From: mark.chan@email.com
Subject: Personal Training Inquiry
Date: October 26

Hello,
I am interested in signing up for personal training sessions at your gym. I saw an ad online for a promotional package. Could you please provide more details?

I am a new member and my main goal is to lose weight and build muscle. My schedule is flexible, but I would prefer to train in the mornings.

Does the promotional package include a nutrition plan as well?

Thanks,
Mark Chan
""";
  final passage176_180_2 = """
**Peak Fitness - Personal Training**

Get in the best shape of your life! Our certified trainers are here to help you reach your goals.

**New Member 'Jump-Start' Package:**
* **10** Personal Training Sessions
* A customized workout plan
* A comprehensive nutrition consultation and plan
* **Price**: \$500 (A \$700 value!)

*Offer valid for new members only. Must be purchased within 30 days of joining.*

We also offer single sessions for \$70 or 5-session packages for \$325.
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
**To**: All Department Heads
**From**: Tech Services
**Date**: March 11
**Subject**: New Visitor Sign-In Procedure

To enhance building security, we are implementing a new digital visitor sign-in system, effective Monday, March 18.

All visitors to the building will now be required to check in at the front lobby desk. They must present a photo ID. Our security staff will then take their photo and print a visitor badge, which must be worn at all times.

Please inform your teams and any scheduled guests of this new procedure.
""";
  final passage181_185_2 = """
To: Tech Services
From: Sarah Jenkins (Marketing)
Subject: Re: New Visitor Sign-In Procedure
Date: March 12

Hello,
Thank you for the update on the new security system.

The marketing department is hosting a large focus group this coming **Friday, March 15**. We will have 20 participants arriving at the same time around 1:00 P.M.

Will this new system be in place then? Or does it only start on March 18? I want to make sure we don't cause a long delay at the front desk.

Thanks,
Sarah
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: The 'Pro-Traveler' Carry-On Suitcase**

Travel smarter with the Pro-Traveler.
* **Price**: \$150.00
* **Features**: Durable polycarbonate shell, built-in USB charging port (battery pack not included), silent 360-degree spinner wheels.
* **Dimensions**: 22 x 14 x 9 inches (Meets all major airline carry-on size requirements)
* **Warranty**: 5-Year Limited Warranty
* **Shipping**: Free standard shipping (5-7 days).
""";
  final passage186_190_2 = """
**From**: Apex Luggage <orders@apexluggage.com>
**To**: j.miller@email.com
**Subject**: Your Order #B-456
**Date**: November 5

Dear Jessica Miller,
Thank you for your order! Your 'Pro-Traveler' Carry-On Suitcase (Black) is being processed. You should receive a shipping confirmation within 2 business days.

**Order Summary**:
* Suitcase: \$150.00
* Standard Shipping: FREE
* Tax: \$9.00
* **Total**: **\$159.00**
""";
  final passage186_190_3 = """
**From**: Jessica Miller <j.miller@email.com>
**To**: Apex Luggage <orders@apexluggage.com>
**Subject**: Re: Your Order #B-456
**Date**: November 14

Hello,
I received my suitcase yesterday (November 13). I am very happy with the quality, but there is a problem. The website advertisement said the suitcase has a built-in USB charging port, but the one I received does not have one.

I think I may have been sent the wrong model. My main reason for purchasing this bag was for that specific feature, as I travel frequently for work.

Could you please assist me with an exchange for the correct model?

Thank you,
Jessica Miller
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**Oakville Gazette: Annual 'Taste of Oakville' Festival**
(July 1) – The annual 'Taste of Oakville' food festival will return to Central Park on Saturday, July 20. The event, which runs from 11 A.M. to 8 P.M., will feature food trucks and stalls from over 30 local restaurants.
In addition to the food, the main stage will host live music throughout the day. This year, the festival is also adding a cooking demonstration tent. Several well-known local chefs will be participating.
Entrance to the festival is free, but food and drink must be purchased with "food tickets," which are sold at booths near the entrance.
""";
  final passage191_195_2 = """
**To**: Sarah Chen <s.chen@oakvillegazette.com>
**From**: David Lee, 'Taste of Oakville' Coordinator <dlee@tasteofoakville.com>
**Subject**: Re: Chef Demonstration
**Date**: July 5

Hi Sarah,
Thanks for agreeing to have your restaurant, 'The Modern Plate', participate in the cooking demonstration! We are so excited to have you.
We have finalized the schedule (see attached). We have you slotted for the 2:00 P.M. time. Is this still acceptable for you?
Please let me know what audio/visual equipment you will need for your demonstration.
Best,
David
""";
  final passage191_195_3 = """
**'Taste of Oakville' - Cooking Demonstration Schedule**
**Location**: Demo Tent
**Date**: Saturday, July 20

* 12:00 P.M.: Chef Antonio (Vivaldi's Italian) - "Perfect Pasta"
* 1:00 P.M.: Chef Kumar (Spice Kingdom) - "Modern Indian"
* **2:00 P.M.: Chef Sarah Chen (The Modern Plate) - "Farm-to-Table"**
* 3:00 P.M.: Chef Frank (Frank's BBQ) - "BBQ Secrets"
* 4:00 P.M.: Pastry Chef Anna (SweetDreams) - "Decadent Desserts"
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: info@reliablemovers.com
**From**: kevin.s@email.com
**Subject**: Quote Request
**Date**: January 10

Hello,
I am moving to a new apartment on **February 1** and would like a quote for your services.
* **From**: 120 Main St (2nd-floor apartment, no elevator)
* **To**: 550 Oak Ave (3rd-floor apartment, with elevator)
* **Items**: 1-bedroom apartment (large sofa, bed, dresser, 50-60 boxes).
Please let me know your hourly rate and estimated time.
Thanks,
Kevin
""";
  final passage196_200_2 = """
**Reliable Movers - INVOICE**
**Client**: Kevin Smith
**Invoice**: #M-901
**Date**: February 1

**Service Date**: February 1
**Services Rendered**:
* Moving Service (3 movers): 4.0 hours @ \$150/hour .... \$600.00
* Travel & Truck Fee .................................... \$75.00
* Packing Materials (10 boxes) ........................ \$30.00
* * **TOTAL AMOUNT DUE**: **\$705.00**

**Payment Due**: Upon receipt.
""";
  final passage196_200_3 = """
**To**: Reliable Movers <info@reliablemovers.com>
**From**: kevin.s@email.com
**Subject**: Re: Invoice #M-901
**Date**: February 2

Hi,
The move yesterday went smoothly, and the team was very professional.
However, I am confused about one charge on the invoice. I was charged \$30 for 'Packing Materials (10 boxes)'.
As I mentioned in my original e-mail (and to the moving team), I had packed all 60 of my boxes myself and did not request or use any new packing materials from your company.
Could you please look into this and revise the bill?
Thanks,
Kevin Smith
""";

  final part7Questions = [
    // Q147-148 (Notice)
    {
      'question':
          passage147_148 + "\n\n147. What is the purpose of the notice?",
      'options': [
        "To warn about a power outage",
        "To announce a change in work hours",
        "To inform tenants about maintenance",
        "To recommend working remotely",
      ],
      'correctIndex': 2,
      'explain':
          "Nội dung chính của thông báo là 'The building's air conditioning system will be shut down for maintenance...'",
    },
    {
      'question':
          passage147_148 + "\n\n148. What is the reason for the maintenance?",
      'options': [
        "To prevent future breakdowns",
        "To reduce costs",
        "To install a new system",
        "To make the building warmer",
      ],
      'correctIndex': 0,
      'explain':
          "Thông báo nói rằng việc bảo trì là để 'improve the system's efficiency and prevent future breakdowns'.",
    },
    // Q149-150 (E-mail)
    {
      'question':
          passage149_150 + "\n\n149. What is the purpose of the e-mail?",
      'options': [
        "To cancel a meeting",
        "To change a meeting's agenda",
        "To change a meeting's location",
        "To schedule a repair",
      ],
      'correctIndex': 2,
      'explain':
          "Chủ đề e-mail là 'Meeting Room Change' và nội dung nói, 'Please come to the 4th Floor Conference Room (Room 405) instead.'",
    },
    {
      'question':
          passage149_150 + "\n\n150. What is NOT changing about the meeting?",
      'options': ["The room", "The time", "The location", "The participants"],
      'correctIndex': 1,
      'explain':
          "E-mail nói 'All other meeting details, including the agenda, remain the same.' và đề cập đến 'our 3:00 P.M. marketing meeting', ngụ ý thời gian 3:00 PM không đổi.",
    },
    // Q151-152 (Text Message Chain)
    {
      'question':
          passage151_152 +
          "\n\n151. Why will Anna be late returning to the office?",
      'options': [
        "She is in a meeting.",
        "She is printing a report.",
        "She is at a client's office.",
        "She is stuck in traffic.",
      ],
      'correctIndex': 2,
      'explain': "Anna viết, 'I'm just leaving the client's office now.'",
    },
    {
      'question': passage151_152 + "\n\n152. What does Anna ask Mark to do?",
      'options': [
        "Call her tomorrow morning",
        "Reschedule her meeting",
        "Go to the client's office",
        "Print a document for her",
      ],
      'correctIndex': 3,
      'explain':
          "Anna hỏi, 'Could you print the final sales report and leave it on my desk?'",
    },
    // Q153-155 (Article)
    {
      'question': passage153_155 + "\n\n153. What is the article mainly about?",
      'options': [
        "A local restaurant winning an award",
        "A new menu from Chef Rodriguez",
        "A guide to dining in Springfield",
        "The importance of organic vegetables",
      ],
      'correctIndex': 0,
      'explain':
          "Tiêu đề và câu đầu tiên nói rõ: ''The Harbor Grill'... has won the prestigious 'Best New Restaurant' award'.",
    },
    {
      'question': passage153_155 + "\n\n154. What is Chef Rodriguez known for?",
      'options': [
        "Working at National Dining Magazine",
        "Her hard-working team",
        "Using local and organic ingredients",
        "Her restaurant on Water Street",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo nói, 'She is known for her commitment to using only locally sourced seafood and organic vegetables.'",
    },
    {
      'question':
          passage153_155 + "\n\n155. What is mentioned about The Harbor Grill?",
      'options': [
        "It is open for lunch.",
        "It has been open for one year.",
        "It is closed on weekends.",
        "It is moving to a new location.",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo nói, 'Chef Rodriguez opened The Harbor Grill just one year ago.'",
    },
    // Q156-157 (Advertisement)
    {
      'question': passage156_157 + "\n\n156. Who is this advertisement for?",
      'options': [
        "Small businesses",
        "Large corporations",
        "Home computer users",
        "Job seekers",
      ],
      'correctIndex': 0,
      'explain':
          "Quảng cáo nói, 'We provide on-site IT support for small businesses.'",
    },
    {
      'question': passage156_157 + "\n\n157. What is offered to new clients?",
      'options': [
        "A free computer",
        "A 10% discount",
        "A monthly plan",
        "Free virus removal",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo nói, 'Call us today... and get 10% off your first service!'",
    },
    // Q158-160 (Memo)
    {
      'question': passage158_160 + "\n\n158. What is the purpose of the memo?",
      'options': [
        "To announce a new bonus program",
        "To remind employees about job applications",
        "To introduce a new HR manager",
        "To change the probationary period",
      ],
      'correctIndex': 0,
      'explain':
          "Chủ đề là 'New Employee Referral Program' và thông báo về một 'bonus' (tiền thưởng).",
    },
    {
      'question': passage158_160 + "\n\n159. How much is the bonus?",
      'options': ["\$90", "\$100", "\$500", "Không cố định"],
      'correctIndex': 2,
      'explain': "Thông báo nói, 'we will now offer a \$500 bonus'.",
    },
    {
      'question':
          passage158_160 + "\n\n160. When must the referral form be submitted?",
      'options': [
        "After the candidate is hired",
        "Before the candidate applies",
        "During the 90-day probationary period",
        "With the candidate's application",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo nói, 'submit it to HR *before* the candidate's official application.'",
    },
    // Q161-163 (E-mail)
    {
      'question': passage161_163 + "\n\n161. Why was this e-mail sent?",
      'options': [
        "To schedule an appointment",
        "To remind a patient about an appointment",
        "To request payment",
        "To confirm a cancellation",
      ],
      'correctIndex': 1,
      'explain':
          "Tiêu đề và câu đầu tiên nói rõ, 'This is a reminder of your upcoming dental appointment...'",
    },
    {
      'question': passage161_163 + "\n\n162. What is Mr. Lee asked to bring?",
      'options': [
        "His new patient paperwork",
        "His insurance card",
        "His dental records",
        "A form of payment",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail yêu cầu, 'You will also need to bring your insurance card and a photo ID.'",
    },
    {
      'question':
          passage161_163 + "\n\n163. How can Mr. Lee avoid a cancellation fee?",
      'options': [
        "By arriving 15 minutes early",
        "By completing his paperwork online",
        "By paying in advance",
        "By calling at least 24 hours ahead",
      ],
      'correctIndex': 3,
      'explain':
          "E-mail nói, 'please call our office... at least 24 hours in advance to avoid a cancellation fee.'",
    },
    // Q164-167 (Webpage)
    {
      'question': passage164_167 + "\n\n164. What product is being described?",
      'options': [
        "A fan",
        "A smoke detector",
        "An air purifier",
        "A bedroom light",
      ],
      'correctIndex': 2,
      'explain':
          "Tiêu đề sản phẩm là 'The 'Aero-100' Air Purifier' (máy lọc không khí).",
    },
    {
      'question': passage164_167 + "\n\n165. What does the 'Smart Sensor' do?",
      'options': [
        "Captures pollen and smoke",
        "Tells you when to replace the filter",
        "Operates at 25dB",
        "Adjusts the fan speed automatically",
      ],
      'correctIndex': 3,
      'explain':
          "Mô tả nói, 'Smart Sensor: Automatically monitors air quality and adjusts fan speed.'",
    },
    {
      'question':
          passage164_167 +
          "\n\n166. How often does the filter need to be replaced?",
      'options': [
        "Every 2 years",
        "Every 6 months",
        "Every 25 days",
        "When the air quality is poor",
      ],
      'correctIndex': 1,
      'explain':
          "Mô tả 'Filter-Replacement Indicator' nói 'approximately every 6 months'.",
    },
    {
      'question':
          passage164_167 + "\n\n167. What is indicated about the product?",
      'options': [
        "It is not suitable for bedrooms.",
        "It comes with a 6-month warranty.",
        "It can remove 99.97% of airborne particles.",
        "It is designed for large office spaces.",
      ],
      'correctIndex': 2,
      'explain':
          "Mô tả 'True HEPA Filter' nói, 'Captures 99.97% of airborne particles...'",
    },
    // Q168-171 (Form)
    {
      'question': passage168_171 + "\n\n168. Who is the customer?",
      'options': [
        "Midtown Office Supply",
        "Peterson Legal Services",
        "Suite 400",
        "Không rõ",
      ],
      'correctIndex': 1,
      'explain': "Trường 'Sold To' (Bán cho) ghi 'Peterson Legal Services'.",
    },
    {
      'question':
          passage168_171 +
          "\n\n169. What was the most expensive single item on the order?",
      'options': ["Copy Paper", "Ballpoint Pens", "Printer Toner", "Shipping"],
      'correctIndex': 2,
      'explain':
          "Mục 'Printer Toner' có đơn giá (Unit Price) cao nhất là \$80.00.",
    },
    {
      'question':
          passage168_171 + "\n\n170. How many total items were ordered?",
      'options': ["3", "17", "480", "505"],
      'correctIndex': 1,
      'explain':
          "Cộng số lượng (Qty) của 3 mặt hàng: 5 (Paper) + 10 (Pens) + 2 (Toner) = 17.",
    },
    {
      'question':
          passage168_171 +
          "\n\n171. What special instruction is included in the notes?",
      'options': [
        "Deliver to Suite 400",
        "Ship items separately",
        "Pay \$505.00",
        "Use a different shipping method",
      ],
      'correctIndex': 0,
      'explain':
          "Mục 'Notes' ghi 'Deliver to 4th-floor reception.' (Suite 400, 4th-floor).",
    },
    // Q172-175 (Article)
    {
      'question':
          passage172_175 + "\n\n172. What is the main topic of the article?",
      'options': [
        "A city council debate",
        "The approval of a new budget",
        "A property tax increase",
        "A summer arts festival",
      ],
      'correctIndex': 1,
      'explain':
          "Tiêu đề và câu đầu tiên nói rõ, 'Westview City Council Approves New Budget'.",
    },
    {
      'question':
          passage172_175 + "\n\n173. What controversial item is in the budget?",
      'options': [
        "A 5% property tax increase",
        "Hiring 10 new firefighters",
        "Cutting the arts festival",
        "A 4-to-3 vote",
      ],
      'correctIndex': 0,
      'explain':
          "Bài báo nói, 'includes a controversial 5% increase in property taxes.'",
    },
    {
      'question':
          passage172_175 + "\n\n174. Why did Ana Sharma vote for the budget?",
      'options': [
        "She wanted to cut the arts festival.",
        "She believed it would burden residents.",
        "She wanted to fund road repairs.",
        "She is a firefighter.",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo nói, 'Ana Sharma... argued the tax increase is essential for funding much-needed road repairs...'",
    },
    {
      'question': passage172_175 + "\n\n175. What did John Kline propose?",
      'options': [
        "A 5% tax increase",
        "Hiring more firefighters",
        "A higher budget",
        "Reducing funding for the arts festival",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo nói, 'He had proposed cutting the budget for the summer arts festival instead...'",
    },

    // --- Double Passages ---

    // Q176-180 (E-mail + Webpage)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. Why did Mark Chan write the e-mail?",
      'options': [
        "To sign up for a new membership",
        "To get information about a promotion",
        "To schedule a nutrition consultation",
        "To complain about his training",
      ],
      'correctIndex': 1,
      'explain':
          "Mark viết (Passage 1), 'I saw an ad online for a promotional package. Could you please provide more details?'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. When would Mark Chan prefer to train?",
      'options': [
        "In the mornings",
        "In the evenings",
        "On weekends",
        "In the afternoon",
      ],
      'correctIndex': 0,
      'explain':
          "Anh ấy viết (Passage 1), 'I would prefer to train in the mornings.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What is the price of the 'Jump-Start' package?",
      'options': ["\$70", "\$325", "\$500", "\$700"],
      'correctIndex': 2,
      'explain': "Trang web (Passage 2) ghi 'Price: \$500'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. Does the package include what Mr. Chan asked about?",
      'options': [
        "Yes, it includes a nutrition plan.",
        "No, it only includes workouts.",
        "Yes, it includes 10 nutrition sessions.",
        "No, that must be purchased separately.",
      ],
      'correctIndex': 0,
      'explain':
          "Mr. Chan (Passage 1) hỏi về 'nutrition plan'. Trang web (Passage 2) xác nhận gói này bao gồm 'A comprehensive nutrition consultation and plan'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What is a condition of the 'Jump-Start' package?",
      'options': [
        "It is only for morning sessions.",
        "It must be purchased within 30 days of joining.",
        "It does not include a nutrition plan.",
        "It is only for weight-loss goals.",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 2) ghi, '*Must be purchased within 30 days of joining.*'",
    },
    // Q181-185 (Memo + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What is the subject of the memo?",
      'options': [
        "A new security system",
        "A marketing focus group",
        "A building repair",
        "New ID badges",
      ],
      'correctIndex': 0,
      'explain':
          "Memo (Passage 1) có chủ đề 'New Visitor Sign-In Procedure' và mô tả hệ thống mới.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. What will visitors be required to do starting March 18?",
      'options': [
        "Sign in on their phones",
        "Get a new ID badge",
        "Present a photo ID at the lobby",
        "Be escorted by an employee",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) nói, 'All visitors... will now be required to check in at the front lobby desk. They must present a photo ID.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. Why did Sarah Jenkins write the e-mail?",
      'options': [
        "To complain about the new system",
        "To schedule a focus group",
        "To ask for clarification about a date",
        "To request 20 visitor badges",
      ],
      'correctIndex': 2,
      'explain':
          "Sarah (Passage 2) có một sự kiện vào 'Friday, March 15' và hỏi 'Will this new system be in place then? Or does it only start on March 18?' Đây là một yêu cầu làm rõ.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. When is Sarah's event?",
      'options': ["March 11", "March 12", "March 15", "March 18"],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) nói, 'The marketing department is hosting a large focus group this coming Friday, March 15.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What can be inferred about the focus group visitors on March 15?",
      'options': [
        "They will cause a long delay.",
        "They will not need to use the new system.",
        "They must all present photo ID.",
        "They are employees of Tech Services.",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 1) nói hệ thống mới 'effective Monday, March 18'. Sự kiện của Sarah (Passage 2) là vào March 15 (một ngày thứ Sáu). Do đó, sự kiện của cô ấy diễn ra *trước khi* hệ thống mới được áp dụng.",
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
          "\n\n186. What feature is NOT mentioned in the advertisement?",
      'options': [
        "A USB charging port",
        "A 5-year warranty",
        "A built-in battery pack",
        "Spinner wheels",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) nói 'built-in USB charging port (battery pack not included)'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. How much did Jessica Miller pay for shipping?",
      'options': ["\$0", "\$9.00", "\$150.00", "\$159.00"],
      'correctIndex': 0,
      'explain':
          "Quảng cáo (Passage 1) nói 'Free standard shipping'. E-mail xác nhận (Passage 2) cũng ghi 'Standard Shipping: FREE'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. When did Jessica Miller receive her order?",
      'options': ["November 5", "November 7", "November 13", "November 14"],
      'correctIndex': 2,
      'explain':
          "E-mail của cô ấy (Passage 3) ngày November 14 viết 'I received my suitcase yesterday (November 13).'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. What is Jessica Miller's main complaint?",
      'options': [
        "The suitcase arrived late.",
        "The suitcase is missing a key feature.",
        "The suitcase is the wrong color.",
        "The warranty is only 5 years.",
      ],
      'correctIndex': 2,
      'explain':
          "Khiếu nại chính của cô (Passage 3) là 'the website... said the suitcase has a built-in USB charging port, but the one I received does not have one.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What does Jessica Miller want the company to do?",
      'options': [
        "Send her a battery pack",
        "Give her a full refund",
        "Send her the correct model",
        "Pay for her business trip",
      ],
      'correctIndex': 2,
      'explain':
          "Cô ấy kết thúc (Passage 3) bằng câu hỏi 'Could you please assist me with an exchange for the correct model?'",
    },
    // Q191-195 (Article + E-mail + Schedule)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. What is the 'Taste of Oakville'?",
      'options': [
        "A music festival",
        "A cooking competition",
        "A food festival",
        "A new restaurant",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) mô tả nó là 'food festival' (lễ hội ẩm thực).",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. What is new at the festival this year?",
      'options': [
        "Live music",
        "Food trucks",
        "A cooking demonstration tent",
        "Free entrance",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) nói, 'This year, the festival is also adding a cooking demonstration tent.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. Who is Sarah Chen?",
      'options': [
        "A festival coordinator",
        "A musician",
        "A restaurant owner",
        "A journalist",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) nói 'your restaurant, 'The Modern Plate''. Lịch (Passage 3) cũng ghi 'Chef Sarah Chen (The Modern Plate)'. Cô ấy là một đầu bếp và chủ nhà hàng.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. In the e-mail, what does David Lee ask Sarah Chen?",
      'options': [
        "If she can attend the festival",
        "If the 2:00 P.M. time is acceptable",
        "If her restaurant can participate",
        "If she can bring her own equipment",
      ],
      'correctIndex': 1,
      'explain':
          "David (Passage 2) hỏi, 'We have you slotted for the 2:00 P.M. time. Is this still acceptable for you?'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What demonstration is scheduled just before Chef Kumar's?",
      'options': [
        "Perfect Pasta",
        "Modern Indian",
        "Farm-to-Table",
        "BBQ Secrets",
      ],
      'correctIndex': 0,
      'explain':
          "Lịch (Passage 3) cho thấy Chef Kumar lúc 1:00 P.M. Ngay trước đó, lúc 12:00 P.M., là 'Chef Antonio (Vivaldi's Italian) - 'Perfect Pasta''.",
    },
    // Q196-200 (E-mail + Invoice + E-mail)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. What is the main difference between Kevin's old and new apartments?",
      'options': [
        "The new apartment is on a higher floor.",
        "The new apartment has an elevator.",
        "The new apartment is smaller.",
        "The new apartment is on Oak Ave.",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) mô tả căn hộ cũ là '2nd-floor apartment, no elevator' và căn hộ mới là '3rd-floor apartment, with elevator'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the invoice, how long did the move take?",
      'options': ["2.0 hours", "3.0 hours", "4.0 hours", "1.0 hour"],
      'correctIndex': 2,
      'explain':
          "Hóa đơn (Passage 2) ghi 'Moving Service (3 movers): 4.0 hours...'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. Why did Kevin Smith send the third e-mail?",
      'options': [
        "To praise the moving team",
        "To ask for a copy of the invoice",
        "To report damaged furniture",
        "To dispute a charge on the bill",
      ],
      'correctIndex': 3,
      'explain':
          "Trong e-mail thứ ba (Passage 3), Kevin nói, 'I am confused about one charge... I was charged \$30 for 'Packing Materials'...' và yêu cầu 'revise the bill'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What does Kevin claim about the packing materials?",
      'options': [
        "He only used 10 boxes.",
        "He did not use any of the company's materials.",
        "They were included in the hourly rate.",
        "They cost \$60, not \$30.",
      ],
      'correctIndex': 1,
      'explain':
          "Anh ấy viết (Passage 3), 'I had packed all 60 of my boxes myself and did not request or use any new packing materials from your company.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What will the revised total on the invoice likely be?",
      'options': ["\$600.00", "\$675.00", "\$705.00", "\$735.00"],
      'correctIndex': 1,
      'explain':
          "Tổng hóa đơn (Passage 2) là \$705.00. Kevin (Passage 3) đang tranh chấp khoản phí \$30 cho vật liệu. Nếu khoản phí này được xóa, tổng mới sẽ là \$705 - \$30 = \$675.",
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
