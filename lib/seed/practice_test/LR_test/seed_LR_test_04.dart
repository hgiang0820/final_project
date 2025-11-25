// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest04() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_04';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 04',
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
        'order': 4,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người phụ nữ đang sơn một bức tường bằng con lăn.
      // Transcript:
      // (A) She's hanging a picture frame.
      // (B) She's painting a wall with a roller.
      // (C) She's cleaning a window.
      // (D) She's choosing a paint color.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy một người phụ nữ đang dùng con lăn (roller) để sơn lên một bức tường.',
    },
    {
      // Image Description: Một nhóm nhạc sĩ đang chơi nhạc cụ trên sân khấu.
      // Transcript:
      // (A) The musicians are packing their instruments.
      // (B) The audience is clapping for the performers.
      // (C) A band is performing on a stage.
      // (D) People are dancing in a club.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy nhiều người đang chơi nhạc cụ (một ban nhạc - band) trên một sân khấu (stage).',
    },
    {
      // Image Description: Một người đàn ông đang đẩy xe đẩy hàng trong một lối đi của siêu thị.
      // Transcript:
      // (A) A man is pushing a shopping cart.
      // (B) A man is stocking the shelves.
      // (C) A man is paying at the cash register.
      // (D) A man is bagging groceries.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Hình ảnh rõ ràng cho thấy một người đàn ông đang đẩy một chiếc xe đẩy (shopping cart) trong một lối đi.',
    },
    {
      // Image Description: Một con đường cao tốc nhiều làn xe với tình trạng giao thông đông đúc.
      // Transcript:
      // (A) Cars are parked in a garage.
      // (B) A road is closed for construction.
      // (C) Vehicles are moving in heavy traffic.
      // (D) A bridge is being built over a highway.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy nhiều ô tô (vehicles) đang di chuyển trên một con đường đông đúc (heavy traffic).',
    },
    {
      // Image Description: Một người đàn ông đeo ba lô đang đi bộ trên một con đường mòn trên núi.
      // Transcript:
      // (A) A man is hiking on a mountain trail.
      // (B) A man is riding a bicycle.
      // (C) A man is setting up a tent.
      // (D) A man is looking at a map.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người đàn ông đang đi bộ (hiking) trên một con đường mòn (trail) ở khu vực đồi núi.',
    },
    {
      // Image Description: Một nhà khoa học đang đổ chất lỏng từ cốc có mỏ vào ống nghiệm.
      // Transcript:
      // (A) A man is adjusting a microscope.
      // (B) A woman is typing on a laptop.
      // (C) A scientist is pouring liquid into a test tube.
      // (D) A patient is speaking to a doctor.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy một người (nhà khoa học) đang đổ chất lỏng (pouring liquid) vào một ống nghiệm (test tube).',
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
        'audioPath': 'LR_practice_tests/$testId/part1/LR_test4_part1.wav',
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
      // Q7: Where did you park the car?
      // (A) In the garage on the first floor.
      // (B) I'll park it later.
      // (C) Yes, it's a new car.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "Where" (Ở đâu) đòi hỏi một câu trả lời về địa điểm. (A) là câu trả lời phù hợp.',
    },
    {
      // Q8: When is the project proposal due?
      // (A) It's about the project.
      // (B) Next Monday at noon.
      // (C) I'll propose it soon.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "When" (Khi nào) đòi hỏi một câu trả lời về thời gian. (B) cung cấp một thời hạn cụ thể.',
    },
    {
      // Q9: Who's organizing the company retreat?
      // (A) We're retreating from the market.
      // (B) It's in the mountains.
      // (C) Someone from Human Resources.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "Who" (Ai) đòi hỏi một câu trả lời về người hoặc bộ phận. (C) là câu trả lời phù hợp.',
    },
    {
      // Q10: Why was the train late?
      // (A) There was a signal failure.
      // (B) It's on track 3.
      // (C) No, I'm not late.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "Why" (Tại sao) đòi hỏi một lý do. (A) cung cấp lý do cho sự chậm trễ.',
    },
    {
      // Q11: How do I reset my password?
      // (A) It's a very secure password.
      // (B) You have to click the 'Forgot Password' link.
      // (C) I'll set it on the table.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How" (Như thế nào) đòi hỏi một câu trả lời về phương pháp hoặc quy trình. (B) giải thích cách làm.',
    },
    {
      // Q12: Is this the new version of the software?
      // (A) Yes, it was installed last night.
      // (B) I'll wear a soft shirt.
      // (C) The new version is expensive.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No. (A) trả lời "Yes" và cung cấp thêm thông tin.',
    },
    {
      // Q13: Should we order pizza or sandwiches?
      // (A) It was a large order.
      // (B) The sand is on the beach.
      // (C) Pizza sounds good to me.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là câu hỏi lựa chọn (or). (C) chọn một trong hai phương án được đưa ra.',
    },
    {
      // Q14: What did you think of the new manager?
      // (A) She seems very experienced.
      // (B) I'll manage to finish it.
      // (C) He's in a new office.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What did you think" (Bạn nghĩ gì) đòi hỏi một ý kiến. (A) đưa ra một ý kiến.',
    },
    {
      // Q15: The flight hasn't been canceled, has it?
      // (A) I canceled the subscription.
      // (B) No, it's just delayed.
      // (C) Yes, I have a ticket.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi đuôi (tag question). (B) trả lời "No" và làm rõ tình hình.',
    },
    {
      // Q16: How many people applied for the job?
      // (A) I applied it to the surface.
      // (B) The job is very demanding.
      // (C) Over one hundred, I heard.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "How many" (Bao nhiêu) đòi hỏi một con số. (C) cung cấp một số lượng ước tính.',
    },
    {
      // Q17: Why don't we go to the lobby to wait?
      // (A) I've been waiting a long time.
      // (B) It's probably less crowded there.
      // (C) No, it's not heavy.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why don\'t we..." là một lời đề nghị. (B) là một câu trả lời đồng ý và nêu lý do tại sao đó là ý hay.',
    },
    {
      // Q18: Has the invoice been paid?
      // (A) I'll pay for dinner.
      // (B) Yes, I sent the payment this morning.
      // (C) It's a new invoice.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi Yes/No. (B) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
    {
      // Q19: Could you close the window, please?
      // (A) It's a new window display.
      // (B) No, I don't see it.
      // (C) Sure, it is getting noisy.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là một lời yêu cầu. (C) là một câu trả lời đồng ý ("Sure") và nêu lý do.',
    },
    {
      // Q20: This new printer is much faster.
      // (A) I'm fast at typing.
      // (B) The paper is in the tray.
      // (C) Yes, it saves us a lot of time.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là một câu nhận xét. (C) đồng ý ("Yes") và thêm một bình luận liên quan.',
    },
    {
      // Q21: What time is your meeting with Mr. Jones?
      // (A) It's at 2:30 PM.
      // (B) We met in the cafeteria.
      // (C) He's the new manager.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "What time" (Mấy giờ) đòi hỏi một câu trả lời về thời gian. (A) là câu trả lời phù hợp.',
    },
    {
      // Q22: Didn't you receive the memo?
      // (A) I'll send it later.
      // (B) Yes, I read it this morning.
      // (C) The new policy is great.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi Yes/No dạng phủ định. (B) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
    {
      // Q23: Whose jacket is this?
      // (A) It's a black leather jacket.
      // (B) It's probably David's.
      // (C) I'll pack it in the suitcase.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Whose" (Của ai) đòi hỏi một câu trả lời về sự sở hữu. (B) chỉ định một người.',
    },
    {
      // Q24: How long have you been working here?
      // (A) I work on the marketing team.
      // (B) It's a long way from here.
      // (C) For almost three years.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "How long" (Bao lâu) đòi hỏi một câu trả lời về khoảng thời gian. (C) là câu trả lời phù hợp.',
    },
    {
      // Q25: Should I file these documents or shred them?
      // (A) You should shred the old ones.
      // (B) The file cabinet is locked.
      // (C) Yes, please.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi lựa chọn (or). (A) đưa ra một câu trả lời cụ thể, chọn một hành động cho một phần của tài liệu.',
    },
    {
      // Q26: When does the warranty on this laptop expire?
      // (A) I'll check the receipt for you.
      // (B) It's a very fast laptop.
      // (C) Yes, I need one.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "When" (Khi nào). (A) là một câu trả lời gián tiếp, đề nghị một cách để tìm ra câu trả lời.',
    },
    {
      // Q27: I'm really impressed with your proposal.
      // (A) Thank you, I worked hard on it.
      // (B) I'll propose it later.
      // (C) It's an impressive building.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một lời khen. (A) là một cách lịch sự để đáp lại lời khen ("Thank you...").',
    },
    {
      // Q28: How often should I update the software?
      // (A) It will update automatically.
      // (B) It's a new software.
      // (C) The update is very large.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "How often" (Bao lâu một lần). (A) trả lời câu hỏi bằng cách nói rằng không cần cập nhật thủ công.',
    },
    {
      // Q29: Are you available to discuss the budget now?
      // (A) I'm in another meeting until 11:00.
      // (B) The budget was approved.
      // (C) It's not available yet.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No về sự sẵn có. (A) là một cách trả lời "No" (gián tiếp) và nêu lý do.',
    },
    {
      // Q30: What's the fastest way to get to the airport?
      // (A) The airport is very busy.
      // (B) The express train is probably best.
      // (C) I'll be there at 5:00.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "What\'s the fastest way" (Cách nhanh nhất là gì). (B) đề xuất một phương tiện (tàu tốc hành).',
    },
    {
      // Q31: Have you finished the slides for the presentation?
      // (A) I'm still working on the last one.
      // (B) It was an excellent presentation.
      // (C) The slide is broken.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No về một nhiệm vụ. (A) trả lời "No" (gián tiếp) và giải thích tình trạng hiện tại.',
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
        'audioPath': 'LR_practice_tests/$testId/part2/LR_test4_part2.wav',
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
(Woman) I'd like to return this sweater, please. I bought it last week.
(Man) Is there anything wrong with it?
(Woman) No, I just decided I don't like the color. I have the receipt right here.
(Man) I see. We can offer you store credit, or you can exchange it for another item of the same value. We don't offer cash refunds for items that aren't defective.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Man) Hi, I have an appointment with Dr. Chen at 3:00 P.M. My name is Mark Johnson.
(Woman) Hello, Mr. Johnson. Yes, I see you here. Unfortunately, the doctor is running about 20 minutes behind schedule.
(Man) Oh, okay. That's fine. Is there a restroom I could use while I wait?
(Woman) Yes, it's just down the hall to your left. We'll call your name as soon as she's ready.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Woman) David, do you know how to use this new accounting software? I can't figure out how to generate an invoice.
(Man) I'm not sure. I haven't been trained on it yet. Did you check the user manual?
(Woman) I looked, but it's very confusing. I think I'll just call the IT help desk.
(Man) Good idea. Their extension is 4-5-0-0 if you need it.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Man) I've finished the first draft of the monthly newsletter.
(Woman) That was fast! Could you send it to me? I'd like to review the article about the new factory.
(Man) Of course. I'm just waiting for the marketing department to send me the images to include.
(Woman) All right. Send it to me once it's complete, but please do it before 5 P.M. so I can review it today.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Woman) I'm reserving the conference room for our client meeting on Wednesday. Should I order lunch?
(Man) Yes, that would be good. There will be six of us, including the two clients.
(Woman) Okay. Should I order sandwiches from the usual deli?
(Man) Let's try that new Thai restaurant instead. I've heard good things about their catering.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Man) Excuse me, what's the fastest way to get to the City Museum from here?
(Woman) You can take the number 10 bus. It stops right in front of the museum. The stop is just across the street.
(Man) How often does it run?
(Woman) I believe it's every 15 minutes. You'll also need exact change for the fare, which is two dollars.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Woman) The new advertising campaign has been a huge success. Our website traffic is up by 40%.
(Man) That's incredible. The video ads on social media seem to be very effective.
(Woman) They are. Now we need to make sure our website can handle the increased traffic and that our sales team is ready for the new leads.
(Man) I agree. I'll schedule a meeting with the sales manager this afternoon.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Man) Hi, I'm calling to check on my computer repair. I dropped it off on Monday.
(Woman) Can I have your last name, please?
(Man) It's Peterson, James Peterson.
(Woman) Thank you. Let me check... Yes, it's ready for pickup. The technician replaced the hard drive. You can pick it up anytime before 6 P.M.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Woman) I'm trying to sign up for a workshop for the sales conference. I'm interested in 'Advanced Negotiation'.
(Man) Oh, I heard that one filled up really quickly. Let me check the registration list. Yes, it's full.
(Woman) That's too bad. What about 'Using Social Media'? Is there still space in that one?
(Man) Let me see... Yes, there are still a few spots left in that 1:00 PM session. I can add your name.
---
**Workshop Schedule**
- 1:00 PM: Using Social Media (Room 10A) - 18/20 registered
- 1:00 PM: Advanced Negotiation (Room 10B) - 20/20 registered
- 3:00 PM: Presentation Skills (Room 10A) - 15/20 registered
- 3:00 PM: Closing Strategies (Room 10C) - 12/20 registered
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Man) Ms. Lee, this is Ken from facilities. We're here to paint your office today.
(Woman) Oh, I thought that was scheduled for tomorrow.
(Man) The painters finished the 4th floor early, so we're starting on this floor today. It should take about three hours.
(Woman) I see. I have a lot of work to do. Is there somewhere else I can work?
(Man) Yes, you can use the empty office next to the break room, Room 502.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Woman) Hi, I'd like to apply for a library card.
(Man) Certainly. I just need you to fill out this application form. Do you have a photo ID and proof of address?
(Woman) Yes, I have my driver's license. Is that all I need?
(Man) That's perfect. It will just take a few minutes to process.
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Man) We've received a lot of complaints about the new software update.
(Woman) I know. People are saying it's confusing and slower than the old version.
(Man) The IT department said they are working on a patch to fix the speed issue.
(Woman) That's good, but we also need to offer more training. I'll e-mail HR and suggest we schedule some optional training sessions.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Woman) I just heard that our client, Apex Industries, is merging with Tech-Global.
(Man) Really? That's big news. They are our biggest account.
(Woman) I know. I'm worried about what this will mean for us. They might switch to Tech-Global's suppliers.
(Man) We should schedule a meeting with our contact at Apex as soon as possible to discuss our contract.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "Why is the woman at the store?",
      'options': [
        "To buy a sweater",
        "To exchange an item",
        "To apply for a job",
        "To return a defective item",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I'd like to return this sweater... I just decided I don't like the color.' The man's response implies an exchange or store credit.",
    },
    {
      'question': "What does the woman need to complete the return?",
      'options': [
        "A store credit card",
        "The original packaging",
        "A photo ID",
        "A receipt",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I have the receipt right here.'",
    },
    {
      'question': "Why won't the man give a cash refund?",
      'options': [
        "The woman lost her receipt.",
        "The item is not damaged.",
        "The item was on sale.",
        "The store is out of cash.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'We don't offer cash refunds for items that aren't defective.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "Why is the man at the office?",
      'options': [
        "To see a doctor",
        "To pick up a schedule",
        "To make a new appointment",
        "To use the restroom",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'I have an appointment with Dr. Chen at 3:00 P.M.'",
    },
    {
      'question': "What problem does the woman mention?",
      'options': [
        "The man is late.",
        "The man's name is wrong.",
        "The doctor is behind schedule.",
        "The restroom is closed.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> The woman says, 'the doctor is running about 20 minutes behind schedule.'",
    },
    {
      'question': "Where does the woman tell the man to go?",
      'options': [
        "To the front desk",
        "Down the hall",
        "To Dr. Chen's office",
        "Outside",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man asks for the restroom, and the woman says, 'it's just down the hall to your left.'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "What is the woman's problem?",
      'options': [
        "She cannot find the user manual.",
        "She does not know how to use some software.",
        "The IT help desk is not answering.",
        "She needs to write an invoice.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The woman asks, 'do you know how to use this new accounting software? I can't figure out how to generate an invoice.'",
    },
    {
      'question': "What does the man say about the software?",
      'options': [
        "It is very easy to use.",
        "He has not been trained on it.",
        "It is better than the old software.",
        "He will teach the woman how to use it.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man replies, 'I'm not sure. I haven't been trained on it yet.'",
    },
    {
      'question': "What information does the man provide?",
      'options': [
        "A username",
        "A password",
        "A phone number",
        "A website address",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'Their [the help desk's] extension is 4-5-0-0 if you need it.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What has the man finished?",
      'options': [
        "A factory tour",
        "A marketing plan",
        "A newsletter draft",
        "A review",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I've finished the first draft of the monthly newsletter.'",
    },
    {
      'question': "What is the man waiting for?",
      'options': [
        "Some images",
        "A review from the woman",
        "An article about the factory",
        "A call from marketing",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I'm just waiting for the marketing department to send me the images to include.'",
    },
    {
      'question': "When does the woman want the document?",
      'options': ["Now", "Tomorrow", "By 5 P.M.", "After she reviews it"],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'please do it before 5 P.M. so I can review it today.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What are the speakers arranging?",
      'options': [
        "A client meeting",
        "A lunch reservation",
        "A catering delivery",
        "A new restaurant opening",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The woman asks about ordering lunch for a 'client meeting on Wednesday.'",
    },
    {
      'question': "How many people will be at the meeting?",
      'options': ["Two", "Four", "Six", "Eight"],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'There will be six of us, including the two clients.'",
    },
    {
      'question': "What does the man suggest?",
      'options': [
        "Ordering from the usual deli",
        "Trying a new restaurant",
        "Eating at the cafeteria",
        "Ordering sandwiches",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'Let's try that new Thai restaurant instead.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "Where does the man want to go?",
      'options': [
        "To a bus stop",
        "Across the street",
        "To the City Museum",
        "To a train station",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man asks, 'what's the fastest way to get to the City Museum from here?'",
    },
    {
      'question': "How often does the number 10 bus run?",
      'options': [
        "Every 10 minutes",
        "Every 15 minutes",
        "Every 20 minutes",
        "Every 30 minutes",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'I believe it's every 15 minutes.'",
    },
    {
      'question': "What does the woman say the man will need?",
      'options': ["A map", "A ticket", "A credit card", "Exact change"],
      'correctIndex': 3,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'You'll also need exact change for the fare...'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A new website",
        "A sales team meeting",
        "An advertising campaign",
        "A social media policy",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'The new advertising campaign has been a huge success.'",
    },
    {
      'question': "What has increased by 40%?",
      'options': [
        "Sales",
        "Website traffic",
        "Social media posts",
        "New leads",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'Our website traffic is up by 40%.'",
    },
    {
      'question': "What will the man do this afternoon?",
      'options': [
        "Check the website",
        "Meet with the sales manager",
        "Create new video ads",
        "Handle new leads",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man says, 'I'll schedule a meeting with the sales manager this afternoon.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "Why is the man calling?",
      'options': [
        "To pick up a computer",
        "To check on a repair",
        "To make a payment",
        "To schedule a repair",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'I'm calling to check on my computer repair.'",
    },
    {
      'question': "What part of the computer was replaced?",
      'options': [
        "The screen",
        "The keyboard",
        "The hard drive",
        "The battery",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> The woman says, 'The technician replaced the hard drive.'",
    },
    {
      'question': "When can the man pick up his item?",
      'options': ["On Monday", "Before 6 P.M.", "After 6 P.M.", "Tomorrow"],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The woman says, 'You can pick it up anytime before 6 P.M.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question':
          "Look at the graphic. What is the problem with the 'Advanced Negotiation' workshop?",
      'options': [
        "It is too late.",
        "It is full.",
        "It is in Room 10A.",
        "It is too expensive.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'it filled up really quickly... Yes, it's full.' The graphic confirms this (20/20).",
    },
    {
      'question':
          "Look at the graphic. At what time is the 'Using Social Media' session?",
      'options': ["1:00 PM", "3:00 PM", "10:00 AM", "The graphic does not say"],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> The woman asks about 'Using Social Media'. The man confirms 'that 1:00 PM session'. The graphic also shows '1:00 PM: Using Social Media'.",
    },
    {
      'question': "What will the man do for the woman?",
      'options': [
        "Register her for a workshop",
        "Put her on a waiting list",
        "Move her to the 3:00 PM session",
        "Find her a different workshop",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> After confirming there are spots, the man says, 'I can add your name.'",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "Who most likely is the man?",
      'options': [
        "A painter",
        "An office manager",
        "A facilities worker",
        "The woman's colleague",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The man introduces himself as 'Ken from facilities' and is there to manage the painters.",
    },
    {
      'question': "Why is the woman surprised?",
      'options': [
        "The man is early.",
        "The office is being painted.",
        "The work is scheduled for today.",
        "The painters finished quickly.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'Oh, I thought that was scheduled for tomorrow.' This implies they are a day early.",
    },
    {
      'question': "What does the man suggest the woman do?",
      'options': [
        "Go home for the day",
        "Help the painters",
        "Work in a different office",
        "Wait for three hours",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman asks where she can work, and the man suggests, 'you can use the empty office next to the break room...'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "What is the woman trying to do?",
      'options': [
        "Borrow a book",
        "Pay a fine",
        "Renew a card",
        "Get a library card",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript62_64 \n\n=> The woman states, 'Hi, I'd like to apply for a library card.'",
    },
    {
      'question': "What does the man ask the woman for?",
      'options': [
        "A completed form",
        "A photo ID and proof of address",
        "A library card",
        "An application fee",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'Do you have a photo ID and proof of address?'",
    },
    {
      'question': "What does the woman use as proof of address?",
      'options': [
        "A utility bill",
        "A passport",
        "Her driver's license",
        "The application form",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman replies, 'Yes, I have my driver's license.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A software update",
        "A new product",
        "Negative customer feedback",
        "The IT department",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript65_67 \n\n=> The man says, 'We've received a lot of complaints about the new software update.'",
    },
    {
      'question': "What is one complaint about the update?",
      'options': [
        "It is too expensive.",
        "It is difficult to install.",
        "It is slower than the old version.",
        "It is not secure.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'People are saying it's confusing and slower than the old version.'",
    },
    {
      'question': "What does the woman suggest?",
      'options': [
        "Going back to the old version",
        "Scheduling training sessions",
        "Calling the IT department",
        "Fixing the speed issue",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'we also need to offer more training... I'll e-mail HR and suggest we schedule some... training sessions.'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What news did the woman just hear?",
      'options': [
        "Apex Industries is a new client.",
        "Tech-Global is a new supplier.",
        "Two companies are merging.",
        "The man is getting a new account.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman says, 'Apex Industries, is merging with Tech-Global.'",
    },
    {
      'question': "Why is the woman worried?",
      'options': [
        "They might lose a major client.",
        "The news is big.",
        "They have to change suppliers.",
        "The contract is ending.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript68_70 \n\n=> The man notes 'They are our biggest account,' and the woman is worried 'They might switch to Tech-Global's suppliers' (i.e., stop using them).",
    },
    {
      'question': "What do the speakers decide to do?",
      'options': [
        "Call Tech-Global",
        "Find new clients",
        "Contact Apex",
        "Revise their contract",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'We should schedule a meeting with our contact at Apex...'",
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
        'audioPath': 'LR_practice_tests/$testId/part3/LR_test4_part3.wav',
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

  // --- Talk 1: Questions 71-73 (Radio Advertisement) ---
  final transcript71_73 = """
Are you tired of cleaning your house every weekend? Call 'Sparkle Cleaners'! We provide professional, reliable home cleaning services. Our bonded and insured staff will make your home shine. We offer weekly, bi-weekly, or one-time cleaning packages. And for a limited time, new clients who book a weekly service will get 50% off their first cleaning. Call 555-9000 or visit us online at sparklecleaners.com to get a free estimate today!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
May I have your attention, please. This is the final boarding call for flight BA-45 to Hong Kong. All passengers must proceed to Gate 12A immediately. The aircraft doors will be closing in ten minutes. Please have your boarding pass and passport ready. Passengers who require special assistance may board at this time. Thank you.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
Good morning, everyone. The first item on our agenda is the quarterly budget. As you know, our energy costs have risen sharply over the last three months. We need to find ways to reduce our electricity consumption. I want to strongly encourage everyone to turn off computers and lights when you leave your office. Also, I am asking the facilities department to look into installing more energy-efficient light bulbs.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling the Orion movie theater. For movie times and locations, please press one. To purchase tickets, please press two. For information about our party and event rentals, please press three. Please note that our special Tuesday discount, where all tickets are \$5, is temporarily suspended. To speak with a theater representative, please stay on the line.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome to the City Botanical Gardens. My name is Anna, and I'll be your guide. Today, we'll be touring the award-winning Tropical Greenhouse, which houses over 500 species of exotic plants. This tour will last about one hour. Please stay on the marked paths and do not touch or pick any of the plants. After the tour, you are free to explore the outdoor gardens or visit our gift shop.
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
In this part of the presentation, I'd like to discuss our company's performance in the second quarter. As you can see from this chart, our sales revenue grew by 15%, which is excellent. This growth was driven primarily by the successful launch of our new mobile app. However, our manufacturing costs also increased, which affected our profit margins. For the next quarter, we need to focus on controlling those costs.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
This is a traffic update from 88.5 FM. A water main has broken on First Avenue, and the road is completely closed between Oak Street and Pine Street. Crews are on site, but repairs are expected to take all morning. Commuters are advised to avoid the downtown area and use the Central Expressway as an alternate route. We will have more updates as they become available.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
It gives me great pleasure to introduce our next speaker, Mr. Kenji Tanaka. Mr. Tanaka is the founder and CEO of Tanaka Electronics, a company he started from his garage 20 years ago. Tonight, he will be sharing his insights on innovation and entrepreneurship in the tech industry. His new book, 'Build from Scratch', is also available for sale in the lobby. Please give a warm welcome to Mr. Kenji Tanaka.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Hello, conference attendees. I need to announce a room change for one of our afternoon panels. The 3:00 P.M. panel, 'Global Marketing Trends', was originally scheduled for the Pine Room. Due to overwhelming interest, we are moving it to the much larger Oak Ballroom. Again, that's the 'Global Marketing Trends' panel at 3:00 P.M., now in the Oak Ballroom.
---
**Conference Schedule - 3:00 PM**
- Panel 1: AI in Business (Cedar Room)
- Panel 2: Global Marketing Trends (Pine Room)
- Panel 3: Software Security (Birch Room)
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention, shoppers. We are having a special flash sale in our electronics department. For the next 30 minutes only, all 'Pro-Sound' brand headphones are 40% off the marked price. This is a limited-time offer, so head to the electronics department on the second floor now. Don't miss out on this incredible deal. This sale ends promptly at 4:00 PM.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What type of service is being advertised?",
      'options': ["Home repair", "Cleaning", "Gardening", "Painting"],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Sparkle Cleaners' và cung cấp 'professional, reliable home cleaning services'.",
    },
    {
      'question': "What is offered to new clients?",
      'options': [
        "A free estimate",
        "A 50% discount",
        "A weekly service",
        "A bi-weekly package",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói đề cập 'new clients who book a weekly service will get 50% off their first cleaning'. (A) cũng được đề cập, nhưng (B) là một ưu đãi đặc biệt.",
    },
    {
      'question': "How can listeners get a free estimate?",
      'options': [
        "By booking a weekly service",
        "By visiting the office",
        "By calling or visiting the website",
        "By talking to a staff member",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'Call 555-9000 or visit us online at sparklecleaners.com to get a free estimate'.",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What is the purpose of the announcement?",
      'options': [
        "To announce a flight delay",
        "To change a departure gate",
        "To call passengers for boarding",
        "To welcome passengers to Hong Kong",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói nói, 'This is the final boarding call... All passengers must proceed to Gate 12A immediately.'",
    },
    {
      'question': "What is the flight's destination?",
      'options': ["Gate 12A", "Hong Kong", "London", "BA-45"],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Thông báo dành cho 'flight BA-45 to Hong Kong.'",
    },
    {
      'question': "What will happen in ten minutes?",
      'options': [
        "The flight will take off.",
        "The aircraft doors will close.",
        "Special assistance will begin boarding.",
        "The gate will change.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Người nói nói, 'The aircraft doors will be closing in ten minutes.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of the meeting?",
      'options': [
        "The quarterly budget",
        "Rising energy costs",
        "Installing new light bulbs",
        "The facilities department",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Mặc dù 'quarterly budget' được đề cập, nhưng lý do chính là 'our energy costs have risen sharply... We need to find ways to reduce our electricity consumption.'",
    },
    {
      'question': "What are employees encouraged to do?",
      'options': [
        "Leave the office early",
        "Turn off computers and lights",
        "Install new light bulbs",
        "Reduce their energy use by 15%",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'I want to strongly encourage everyone to turn off computers and lights when you leave...'",
    },
    {
      'question': "Who has been asked to research new light bulbs?",
      'options': [
        "All employees",
        "The facilities department",
        "The budget committee",
        "The speaker",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'I am asking the facilities department to look into installing... light bulbs.'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is this?",
      'options': [
        "A movie theater",
        "A rental agency",
        "A ticket vendor",
        "A party planner",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'Thank you for calling the Orion movie theater.'",
    },
    {
      'question': "What should a caller do to buy tickets?",
      'options': ["Press one", "Press two", "Press three", "Stay on the line"],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'To purchase tickets, please press two.'",
    },
    {
      'question': "What does the speaker say about Tuesdays?",
      'options': [
        "The theater is closed.",
        "A special discount is not available.",
        "All tickets must be purchased online.",
        "Party rentals are available.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'our special Tuesday discount... is temporarily suspended.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': [
        "In a greenhouse",
        "In a gift shop",
        "In an art gallery",
        "In an outdoor garden",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'Today, we'll be touring the award-winning Tropical Greenhouse...'",
    },
    {
      'question': "How many species of plants are in the exhibit?",
      'options': ["45", "100", "300", "500"],
      'correctIndex': 3,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'which houses over 500 species of exotic plants.'",
    },
    {
      'question': "What are listeners asked NOT to do?",
      'options': [
        "Ask questions",
        "Visit the gift shop",
        "Explore the outdoor gardens",
        "Touch the plants",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript83_85 \n\n=> Người nói yêu cầu, 'Please... do not touch or pick any of the plants.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the topic of the presentation?",
      'options': [
        "A new mobile app",
        "Manufacturing costs",
        "Profit margins",
        "Quarterly performance",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'I'd like to discuss our company's performance in the second quarter.'",
    },
    {
      'question': "What caused the growth in sales revenue?",
      'options': [
        "Lower manufacturing costs",
        "Higher profit margins",
        "A new chart",
        "A new mobile app launch",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'This growth was driven primarily by the successful launch of our new mobile app.'",
    },
    {
      'question': "What does the speaker say needs to be controlled?",
      'options': [
        "Sales revenue",
        "The mobile app",
        "Manufacturing costs",
        "The next quarter",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'our manufacturing costs also increased... we need to focus on controlling those costs.'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What is the topic of the news report?",
      'options': [
        "A road closure",
        "A traffic accident",
        "A new expressway",
        "A weather update",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> Tin tức là 'a water main has broken on First Avenue, and the road is completely closed...'",
    },
    {
      'question': "What has caused the problem?",
      'options': [
        "Construction work",
        "A broken water main",
        "An event downtown",
        "The morning commute",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> 'A water main has broken on First Avenue...'",
    },
    {
      'question': "What are commuters advised to do?",
      'options': [
        "Use the Central Expressway",
        "Wait for updates",
        "Avoid Oak Street",
        "Contact the repair crews",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> Người nói nói, 'Commuters are advised to... use the Central Expressway as an alternate route.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "Who is Mr. Tanaka?",
      'options': ["An author", "A professor", "An innovator", "A CEO"],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu ông ấy là 'the founder and CEO of Tanaka Electronics'. Ông ấy cũng là một tác giả.",
    },
    {
      'question': "What will Mr. Tanaka discuss?",
      'options': [
        "His company's history",
        "His new book",
        "Innovation and entrepreneurship",
        "The tech industry",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'Tonight, he will be sharing his insights on innovation and entrepreneurship...'",
    },
    {
      'question': "What is available in the lobby?",
      'options': [
        "Electronics",
        "A book for sale",
        "A reception",
        "The speaker",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'His new book... is also available for sale in the lobby.'",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. Where was 'Global Marketing Trends' originally scheduled?",
      'options': ["Cedar Room", "Pine Room", "Birch Room", "Oak Ballroom"],
      'correctIndex': 1,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'The 3:00 P.M. panel, 'Global Marketing Trends', was originally scheduled for the Pine Room.' Lịch trình cũng xác nhận điều này.",
    },
    {
      'question': "Look at the graphic. Which room will the panel be in now?",
      'options': ["Cedar Room", "Pine Room", "Birch Room", "Oak Ballroom"],
      'correctIndex': 3,
      'explain':
          "$transcript95_97 \n\n=> Người nói thông báo, 'we are moving it to the much larger Oak Ballroom.'",
    },
    {
      'question': "Why was the room changed?",
      'options': [
        "The speaker was late.",
        "There was a technical problem.",
        "The Pine Room was too small.",
        "The time of the panel changed.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'Due to overwhelming interest, we are moving it to the much larger Oak Ballroom.' Điều này ngụ ý căn phòng ban đầu (Pine Room) quá nhỏ.",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What is the purpose of the announcement?",
      'options': [
        "To advertise a new product",
        "To announce a special sale",
        "To give the store's hours",
        "To close the electronics department",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói thông báo, 'We are having a special flash sale in our electronics department.'",
    },
    {
      'question': "How long will the sale last?",
      'options': ["15 minutes", "30 minutes", "40 minutes", "One hour"],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'For the next 30 minutes only... This sale ends promptly at 4:00 PM.'",
    },
    {
      'question': "Where is the electronics department?",
      'options': [
        "At the front registers",
        "Next to the 'Pro-Sound' display",
        "On the second floor",
        "At 4:00 PM",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'head to the electronics department on the second floor now.'",
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
        'audioPath': 'LR_practice_tests/$testId/part4/LR_test4_part4.wav',
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
          "The new intern is ______ to learn all aspects of the business.",
      'options': ['eager', 'eagerly', 'eagerness', 'eagered'],
      'correctIndex': 0,
      'explain':
          'Sau động từ "is" và trước động từ "to learn", cần một tính từ (eager - háo hức) để mô tả "intern".',
    },
    {
      'question': "The meeting will begin ______ the CEO arrives.",
      'options': ['as soon as', 'as long as', 'as well as', 'as good as'],
      'correctIndex': 0,
      'explain':
          '"As soon as" (ngay khi) là liên từ chỉ thời gian phù hợp nhất.',
    },
    {
      'question': "We must ______ our expenses in order to increase profits.",
      'options': ['reduction', 'reduce', 'reduced', 'reducing'],
      'correctIndex': 1,
      'explain':
          'Sau động từ khuyết thiếu "must" cần một động từ nguyên mẫu (reduce).',
    },
    {
      'question':
          "All employees must get ______ from their supervisor before booking travel.",
      'options': ['approve', 'approved', 'approving', 'approval'],
      'correctIndex': 3,
      'explain':
          'Sau động từ "get" cần một danh từ (approval - sự chấp thuận).',
    },
    {
      'question':
          "Ms. Gupta is not in the office ______ Wednesday and Friday afternoons.",
      'options': ['at', 'in', 'on', 'with'],
      'correctIndex': 2,
      'explain':
          'Giới từ "on" được sử dụng cho các ngày cụ thể hoặc các buổi của ngày (on Wednesday afternoons).',
    },
    {
      'question': "The company performed ______ in the third quarter.",
      'options': ['exception', 'exceptional', 'exceptionally', 'except'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (exceptionally - một cách xuất sắc) để bổ nghĩa cho động từ "performed".',
    },
    {
      'question':
          "The new policy will be ______ to all employees, regardless of department.",
      'options': ['apply', 'applying', 'applicable', 'application'],
      'correctIndex': 2,
      'explain':
          'Sau động từ "be" cần một tính từ (applicable - có thể áp dụng).',
    },
    {
      'question':
          "We need to hire someone ______ has experience in digital marketing.",
      'options': ['who', 'which', 'whose', 'what'],
      'correctIndex': 0,
      'explain': 'Đại từ quan hệ "who" được dùng để chỉ người ("someone").',
    },
    {
      'question': "The quality of our products is our highest ______.",
      'options': ['prioritize', 'priority', 'prior', 'prioritization'],
      'correctIndex': 1,
      'explain':
          'Sau tính từ sở hữu "our" và tính từ "highest" cần một danh từ (priority - sự ưu tiên).',
    },
    {
      'question': "The seminar was canceled ______ a lack of interest.",
      'options': ['because', 'due to', 'although', 'so'],
      'correctIndex': 1,
      'explain':
          '"Due to" (do) là một giới từ, theo sau là một cụm danh từ ("a lack of interest").',
    },
    {
      'question': "You can find more information ______ our website.",
      'options': ['on', 'at', 'in', 'with'],
      'correctIndex': 0,
      'explain': 'Giới từ "on" được dùng với "website" (on our website).',
    },
    {
      'question': "The new building is ______ located in the city center.",
      'options': ['convenience', 'convenient', 'conveniently', 'convene'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (conveniently - một cách thuận tiện) để bổ nghĩa cho động từ "located".',
    },
    {
      'question': "The research team ______ a major breakthrough last week.",
      'options': ['makes', 'made', 'has made', 'making'],
      'correctIndex': 1,
      'explain':
          'Trạng từ chỉ thời gian "last week" (tuần trước) đòi hỏi thì quá khứ đơn (made).',
    },
    {
      'question':
          "The manual provides detailed ______ on how to assemble the product.",
      'options': ['instruct', 'instructs', 'instructor', 'instructions'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "detailed" cần một danh từ (instructions - hướng dẫn).',
    },
    {
      'question': "______ of the two designs was approved by the committee.",
      'options': ['Either', 'Neither', 'Both', 'All'],
      'correctIndex': 1,
      'explain':
          'Động từ "was" (số ít) cho thấy chủ ngữ là số ít. "Neither" (Không cái nào) phù hợp với "of the two" và động từ số ít.',
    },
    {
      'question': "The CEO ______ will be attending the awards ceremony.",
      'options': ['he', 'his', 'him', 'himself'],
      'correctIndex': 3,
      'explain':
          'Đại từ phản thân "himself" được dùng để nhấn mạnh chủ ngữ "The CEO".',
    },
    {
      'question':
          "Our team is looking forward to ______ you at the conference.",
      'options': ['see', 'seeing', 'saw', 'seen'],
      'correctIndex': 1,
      'explain':
          'Cụm từ "look forward to" được theo sau bởi một danh động từ (V-ing).',
    },
    {
      'question': "This printer model is known for its ______.",
      'options': ['reliable', 'reliability', 'reliably', 'rely'],
      'correctIndex': 1,
      'explain':
          'Sau tính từ sở hữu "its" cần một danh từ (reliability - độ tin cậy).',
    },
    {
      'question':
          "The flight was delayed, ______ we still arrived at the hotel on time.",
      'options': ['but', 'so', 'and', 'because'],
      'correctIndex': 0,
      'explain':
          '"But" (nhưng) là liên từ được dùng để chỉ sự tương phản (bị trễ NHƯNG vẫn đến đúng giờ).',
    },
    {
      'question': "The new system is not ______ with our old software.",
      'options': ['compatible', 'compatibility', 'compatibly', 'compete'],
      'correctIndex': 0,
      'explain': 'Cần một tính từ (compatible - tương thích) sau động từ "is".',
    },
    {
      'question':
          "______ the storm, the outdoor concert will be moved indoors.",
      'options': [
        'In the event of',
        'Instead of',
        'As a result of',
        'In addition to',
      ],
      'correctIndex': 0,
      'explain':
          '"In the event of" (Trong trường hợp) được dùng để chỉ một tình huống có thể xảy ra trong tương lai.',
    },
    {
      'question':
          "It is ______ to turn off all equipment at the end of the day.",
      'options': ['advise', 'advisable', 'advice', 'advising'],
      'correctIndex': 1,
      'explain': 'Cần một tính từ (advisable - nên) sau động từ "is".',
    },
    {
      'question': "The company offers ______ salaries and excellent benefits.",
      'options': ['compete', 'competitive', 'competition', 'competitively'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (competitive - cạnh tranh) để bổ nghĩa cho danh từ "salaries".',
    },
    {
      'question': "The manager asked ______ to finish the report by Friday.",
      'options': ['we', 'our', 'ours', 'us'],
      'correctIndex': 3,
      'explain': 'Cần một tân ngữ (us - chúng tôi) sau động từ "asked".',
    },
    {
      'question':
          "Please read the safety guidelines ______ before entering the lab.",
      'options': ['careful', 'carefully', 'carefulness', 'caring'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (carefully - một cách cẩn thận) để bổ nghĩa cho động từ "read".',
    },
    {
      'question':
          "The ______ for the new community center will begin next month.",
      'options': ['construct', 'construction', 'constructed', 'constructive'],
      'correctIndex': 1,
      'explain':
          'Sau mạo từ "The" cần một danh từ (construction - sự xây dựng) để làm chủ ngữ.',
    },
    {
      'question': "Dr. Evans is a ______ speaker at international conferences.",
      'options': ['frequent', 'frequently', 'frequency', 'frequented'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (frequent - thường xuyên) để bổ nghĩa cho danh từ "speaker".',
    },
    {
      'question': "The restaurant is famous ______ its delicious seafood.",
      'options': ['by', 'with', 'at', 'for'],
      'correctIndex': 3,
      'explain': 'Cấu trúc "famous for" (nổi tiếng vì) là một cụm cố định.',
    },
    {
      'question': "We must ______ our production process to reduce waste.",
      'options': ['modern', 'modernize', 'modernity', 'modernization'],
      'correctIndex': 1,
      'explain':
          'Sau động từ khuyết thiếu "must" cần một động từ nguyên mẫu (modernize - hiện đại hóa).',
    },
    {
      'question':
          "The changes to the schedule will be ______ tomorrow morning.",
      'options': ['announce', 'announcing', 'announced', 'announcement'],
      'correctIndex': 2,
      'explain':
          'Cần một quá khứ phân từ (announced) để tạo thành thể bị động (will be announced - sẽ được thông báo).',
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
To: All Staff
From: Human Resources
Subject: New Company Health Plan
Date: June 5

This is to inform all employees about our new health insurance plan, which will take effect on July 1. We are switching our ____(131)____ from 'HealthCore' to 'MediFirst'.

This new plan offers more comprehensive coverage, including dental and vision care, at no additional cost to you. All employees will be automatically ____(132)____ in the new plan.

. ____(133)____. You will receive a new insurance card in the mail before July 1. An information session will be held next Tuesday at 10 A.M. in the main conference room to answer any questions you may have.
""";
  // --- Passage 2: Questions 135-138 (E-mail) ---
  final passage135_138 = """
To: Team Leaders
From: Sarah Chen, IT Director
Subject: Software Update
Date: April 14

This is a reminder that the IT department will be installing a critical software update on all company computers this Friday evening, April 18. This update is ____(135)____ to patch several security vulnerabilities.

The installation will begin at 7:00 P.M. and may take up to two hours. Please instruct your team members to save all their work and log ____(136)____ of their computers before leaving the office on Friday.

Any computers left on will be automatically restarted, which may result in the loss of unsaved work. ____(137)____ appreciate your cooperation.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**Parkview Hotel: Your Home Away From Home**

Located in the heart of downtown, the Parkview Hotel offers the perfect blend of comfort and convenience. ____(139)____. Each of our 200 rooms features luxury bedding, a flat-screen TV, and complimentary high-speed Internet.

Guests can enjoy our state-of-the-art fitness center, indoor swimming pool, and our ____(140)____ restaurant, 'The Oak Room'.

We are ____(141)____ located just steps from the convention center and the city's best shopping. ____(142)____, we offer a free shuttle service to the airport.

Book your stay today at parkviewhotel.com.
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**LTech Announces New CEO**

(September 10) – LTech's board of directors announced today that it has ____(143)____ Anita Brown as its new Chief Executive Officer. Ms. Brown will replace Robert Miller, who is retiring after 12 years with the company.

Ms. Brown brings over 20 years of industry experience to the role. She ____(144)____ served as the Chief Operating Officer at 'Future Systems', where she was instrumental in doubling the company's revenue.

"I am honored to lead LTech into its next chapter," Ms. Brown stated. "My focus will be on innovation and international ____(145)____." ____(146)____. She will officially begin her new role on October 1.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["provider", "providing", "provided", "provide"],
      'correctIndex': 0,
      'explain':
          "Cần một danh từ (provider - nhà cung cấp) sau tính từ sở hữu 'our'.",
    },
    {
      'question': "",
      'options': ["enroll", "enrolled", "enrollment", "enrolling"],
      'correctIndex': 1,
      'explain':
          "Cần một quá khứ phân từ (enrolled - được ghi danh) để tạo thành thể bị động (will be... enrolled).",
    },
    {
      'question': "",
      'options': [
        "Please bring your old card to the session.",
        "This card should be used for all future medical appointments.",
        "You must sign up by July 1.",
        "The session is mandatory for new hires only.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp thông tin hợp lý, giải thích mục đích của chiếc thẻ bảo hiểm mới được đề cập ở câu trước.",
    },
    {
      'question':
          "", // "An information session will be held... to answer any questions you may have."
      // Let's change the blank.
      // "All employees will be automatically enrolled... at no additional cost to you. ____(133)____. You will receive a new insurance card..."
      // Options: [This is a significant improvement. / You must choose your plan. / This only applies to full-time staff. / MediFirst is a local company.]
      // 'question': passage131_134.replaceAll("____(133)____. An information session...", "at no additional cost to you. All employees... new plan. ____(133)____. You will receive a new insurance card..."),
      'options': [
        "This is a significant improvement over the old plan.",
        "You must choose your dental plan by Friday.",
        "This only applies to full-time staff.",
        "MediFirst is a local company.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này đóng vai trò như một lời bình luận tích cực, kết nối lợi ích (không mất thêm phí) với việc chuyển đổi.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["need", "needs", "needed", "needing"],
      'correctIndex': 2,
      'explain':
          "Cần một tính từ (needed - cần thiết) sau động từ 'is' (Bị động rút gọn: is needed = is necessary).",
    },
    {
      'question': "",
      'options': ["off", "out", "on", "up"],
      'correctIndex': 0,
      'explain': "Cụm động từ 'log off' (đăng xuất) là cụm từ chính xác.",
    },
    {
      'question': "",
      'options': [
        "Please bring your laptops to the IT department.",
        "This update should not be delayed.",
        "The IT department will be closed on Friday.",
        "We do not expect any other interruptions.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này nhấn mạnh tầm quan trọng của việc cập nhật, giải thích lý do tại sao mọi người phải tuân thủ, phù hợp với logic của đoạn văn.",
    },
    {
      'question': "", // "Your cooperation is appreciated."
      // Let's change the blank.
      // "...result in the loss of unsaved work. ____(137)____ appreciate your cooperation."
      // Options: [We, They, You, It]
      // 'question': passage135_138.replaceAll("Your cooperation is appreciated.", "____(137)____ appreciate your cooperation."),
      'options': ["We", "They", "You", "It"],
      'correctIndex': 0,
      'explain':
          "Chủ ngữ 'We' (Chúng tôi - đại diện cho IT Department) là chủ thể của hành động 'appreciate'.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': [
        "We are located in the heart of downtown.",
        "Our hotel offers stunning views of the park.",
        "The Oak Room is open for dinner.",
        "The hotel was recently renovated.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp một đặc điểm hấp dẫn của khách sạn (tầm nhìn ra công viên), phù hợp với tên 'Parkview Hotel'.",
    },
    {
      'question': "", // "Book your stay today at parkviewhotel.com."
      // Let's change the blank.
      // "Guests can enjoy our... indoor swimming pool, and our ____(141)____ restaurant, 'The Oak Room'."
      // Options: [award-win, winning-award, award-winning, award-won]
      // 'question': passage139_142.replaceAll("...our award-winning restaurant, 'The Oak Room'.", "...our ____(141)____ restaurant, 'The Oak Room'."),
      'options': ["award-win", "winning-award", "award-winning", "award-won"],
      'correctIndex': 2,
      'explain':
          "Tính từ kép 'award-winning' (đoạt giải thưởng) được dùng để bổ nghĩa cho 'restaurant'.",
    },
    {
      'question': "",
      'options': ["ideal", "ideally", "idea", "idealist"],
      'correctIndex': 1,
      'explain':
          "Cần một trạng từ (ideally - một cách lý tưởng) để bổ nghĩa cho động từ 'located'.",
    },
    {
      'question': "",
      'options': ["However", "Therefore", "In contrast", "Furthermore"],
      'correctIndex': 3,
      'explain':
          "'Furthermore' (Hơn nữa) được dùng để thêm một tiện ích (dịch vụ đưa đón) vào danh sách các tiện ích đã nêu.",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["select", "selected", "selecting", "selection"],
      'correctIndex': 1,
      'explain':
          "Cần một quá khứ phân từ (selected - đã chọn) sau động từ 'has' (thì hiện tại hoàn thành, thể chủ động).",
    },
    {
      'question': "",
      'options': ["previous", "previously", "preview", "prevent"],
      'correctIndex': 1,
      'explain':
          "Cần một trạng từ (previously - trước đây) để bổ nghĩa cho động từ 'served'.",
    },
    {
      'question': "",
      'options': ["expand", "expands", "expanded", "expansion"],
      'correctIndex': 3,
      'explain':
          "Sau tính từ 'international' cần một danh từ (expansion - sự mở rộng).",
    },
    {
      'question': "",
      'options': [
        "Mr. Miller will stay on as an advisor.",
        "The company's stock rose 5% on the news.",
        "LTech is based in Seattle.",
        "Ms. Brown is the first woman to lead the company.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp một thông tin tài chính liên quan (giá cổ phiếu tăng) đến tin tức quan trọng vừa được công bố.",
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

  // Q147-148 (E-mail)
  final passage147_148 = """
To: Frank Doyle <f.doyle@prosys.com>
From: Tech Support <support@prosys.com>
Subject: Your support ticket #892-A
Date: May 18

Dear Mr. Doyle,

We are writing to follow up on your support request regarding an issue with your laptop's audio. A technician, Ms. Ana Sharma, has been assigned to your case.

She will stop by your desk (4-C) this afternoon, May 18, between 2:00 P.M. and 3:00 P.M. to diagnose the problem. Please ensure your laptop is at your desk during this time.

Thank you,
ProSys Tech Support
""";
  // Q149-150 (Notice)
  final passage149_150 = """
**Attention: All tenants of 500 Central Plaza**

The building's fire alarm system will undergo its annual mandatory testing this Friday, June 1. The testing will begin at 10:00 A.M. and may last for up to three hours.

During this period, you will hear loud alarms and see flashing lights. This is only a test, and no evacuation is necessary.

We apologize for any noise or disruption. This test is required by city safety regulations.

- Building Management
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**David (4:00 P.M.)**: Hi, Maria. Are you still at the client's site?
**Maria (4:01 P.M.)**: Just wrapping up. I'm heading back to the office now. Should be there by 4:30. Why?
**David (4:02 P.M.)**: Can you bring back the signed contract with you? Our director wants to see it before he leaves for the day.
**Maria (4:03 P.M.)**: Absolutely. I have it right here in my bag. See you soon.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**Duratech Announces New Smartphone**

(March 20) – Duratech, a leader in rugged electronics, today announced its newest smartphone, the 'Dura-X'. Designed for outdoor enthusiasts and construction workers, the Dura-X is waterproof, dustproof, and shock-resistant.

The phone boasts an extra-long battery life and a screen that is readable even in direct sunlight. "Our customers need a phone that can withstand tough environments," said CEO Jane Choi.

The Dura-X will be available for purchase starting April 15. It will be sold through Duratech's website and major mobile carriers.
""";
  // Q156-157 (Advertisement)
  final passage156_157 = """
**Need a professional meeting space?**

Book the 'Executive Hub' at the City Business Center.

Our meeting rooms are available for hourly or daily rental and include:
* High-speed Wi-Fi
* A large smart-screen for presentations
* Whiteboards and markers
* Complimentary coffee and water

We are located on the 10th floor of the Tower Building, just one block from the central subway station. Visit citybiz.com to book.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Sales Department Staff
**From**: Robert Brown, VP of Sales
**Date**: October 1
**Subject**: New Travel and Expense Policy

This is to inform all sales staff of an important update to our travel and expense policy, effective immediately.

All international travel must now be approved by me *in addition* to your direct manager. Please submit your travel request at least three weeks in advance.

Furthermore, all meal expenses are now capped at \$75 per day. Any expenses submitted above this limit will not be reimbursed without special authorization.

Please review the full, updated policy on the company intranet.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Laura Chen <lchen@email.com>
From: 'The Book Nook' <orders@booknook.com>
Subject: Your Order Has Shipped!
Date: July 22

Dear Laura Chen,
Your order (#901-B) has been shipped via standard mail and is expected to arrive within 5-7 business days.

**Items in this shipment:**
* (1) 'The Silent Witness' by J. Anderson
* (1) 'A Guide to Gardening' by S. Lee

You can track your package at [link]. We hope you enjoy your new books!
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Position: Marketing Coordinator (Full-Time)**

'GreenLeaf Organics' is seeking a highly motivated Marketing Coordinator to join our growing team.

**Responsibilities:**
* Manage all social media accounts (Facebook, Instagram, Twitter).
* Create and send out our weekly e-mail newsletter.
* Assist in organizing promotional events and trade shows.
* Track and report on marketing campaign performance.

**Qualifications:**
* Bachelor's degree in Marketing or Communications.
* 1-2 years of experience in a similar role.
* Excellent writing and communication skills.
* Experience with e-mail marketing software (e.g., MailChimp) is a plus.

To apply, please send your resume and a cover letter to careers@greenleaf.com by August 30.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**'Tech Today' Magazine - Subscription Form**

**Subscriber Name**: Sarah Kim
**Address**: 450 Oak St, Cityville

**Subscription Details:**
[X] 1-Year Subscription (12 Issues)
[ ] 2-Year Subscription (24 Issues)

**Format:**
[ ] Print Only (\$30.00/year)
[X] Digital Only (\$25.00/year)
[ ] Print + Digital (\$40.00/year)

**Payment Method:**
* Credit Card (Visa)
* Card Number: XXXX-XXXX-XXXX-9012
* **Total Charged**: **\$25.00**

**Start Date**: Subscription will begin with the next month's issue (June).
""";
  // Q172-175 (Article)
  final passage172_175 = """
**City Library Announces Digital Archive Project**

(August 14) – The Springfield City Library has announced a new project to digitize its entire archive of local newspapers, with some issues dating back to the 1880s. The project, funded by a grant from the National Heritage Foundation, is expected to take three years to complete.

"This is a vital project for preserving our city's history," said library director David Wu. "Once completed, the entire archive will be accessible to the public for free through our website."

The library is currently seeking volunteers to help with the scanning process. "No technical experience is needed," Mr. Wu added. "We will provide all the necessary training." Interested parties are encouraged to visit the library's website for more information.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (Notice + E-mail)
  final passage176_180_1 = """
**Notice: Westview Community Center**

**Fall Class Registration Opens August 15!**
We have a new lineup of exciting classes for adults and children.
* Pottery (Tuesdays, 7 PM)
* Digital Photography (Wednesdays, 6 PM)
* Introduction to Spanish (Thursdays, 7 PM)
* Yoga (Saturdays, 10 AM)

**Fees**: All classes are \$80 for the 8-week session, plus a \$20 materials fee for the Pottery class.
Registration must be done in person at the community center.
""";
  final passage176_180_2 = """
To: Director <info@westviewcc.org>
From: ana.g@email.com
Subject: Class Registration Question
Date: August 16

Hello,
I tried to register my husband and myself for the 'Introduction to Spanish' class this morning, but the staff member at the desk said the class was already full. I was very surprised, as registration only opened yesterday.

Is it possible to be put on a waiting list? Or will you be adding a second class? We were really looking forward to it.

Thank you,
Ana Garcia
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
To: All Staff
From: Human Resources
Date: December 1
Subject: Annual Holiday Party

This year's annual holiday party will be held on **Friday, December 20**, at **The Grand Oak Hotel**. The event will begin at 7:00 P.M.

This will be a dinner event, and employees may bring one guest. Please note that while the dinner is paid for by the company, there will be a cash bar for all alcoholic beverages.

Please RSVP to your department administrator by December 13 so we can provide the hotel with a final headcount.
""";
  final passage181_185_2 = """
To: Janet Lee (HR)
From: Kevin Scott
Subject: Holiday Party
Date: December 14

Hi Janet,
I apologize for the late reply. I just saw the memo about the holiday party. I was on a business trip and missed the RSVP deadline of December 13.

Is it still possible to attend? I would like to bring my wife.

Please let me know.
Thanks,
Kevin
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: 'Pro-Tone' Wireless Earbuds**

Experience True Wireless Freedom!
* **Price**: \$99.00
* **Features**: Active noise-cancelling, 8-hour battery life (32 hours with charging case), water-resistant (IPX-5).
* **Colors**: Black, White, Midnight Blue
* **Shipping**: Standard (5-7 business days) - FREE. Express (2 business days) - \$10.
* **Returns**: 30-day money-back guarantee.
""";
  final passage186_190_2 = """
**From**: orders@pro-tone.com
**To**: m.chen@email.com
**Subject**: Your Order #C-112
**Date**: October 10

Dear Michael Chen,
Thank you for your order! Your 'Pro-Tone' Wireless Earbuds (Color: Midnight Blue) have been shipped via Express Shipping. Your total charge was **\$109.00**.
Your tracking number is E-556. You can expect delivery on **October 12**.
""";
  final passage186_190_3 = """
**From**: Michael Chen <m.chen@email.com>
**To**: orders@pro-tone.com
**Subject**: Re: Your Order #C-112
**Date**: October 13

Hello,
I received my earbuds yesterday, but I am having a problem. The active noise-cancelling feature does not seem to be working. I can still hear all the background noise on my commute.

Also, the advertisement stated they are "water-resistant," but the user manual included in the box says "avoid all contact with moisture." This is confusing.

I would like to return these under the 30-day guarantee for a full refund. Please send me a return shipping label.
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**Oakville Business Journal: Annual Leadership Conference**
(May 1) – The Oakville Business Journal is proud to host its 10th Annual Leadership Conference on June 5 at the Oakville Grand Hotel. This all-day event will feature workshops, networking sessions, and a keynote address by world-renowned economist, Dr. Aris Thorne.
Dr. Thorne, author of "The Global Market," will be speaking at 1:00 P.M. Other speakers include CEOs from several top local companies.
Registration is \$200 and is open until May 30.
""";
  final passage191_195_2 = """
**To**: Dr. Aris Thorne <a.thorne@univ.edu>
**From**: Sarah Kim, Event Coordinator <s.kim@oakvillejournal.com>
**Subject**: RE: June 5 Conference
**Date**: May 28

Dear Dr. Thorne,
We are so looking forward to your keynote address at our conference next week. I am writing to confirm a minor change to the schedule. Due to a scheduling conflict with the hotel, the lunch break has been moved *after* your speech, not before.
This means your keynote will now begin at **12:00 P.M.** instead of 1:00 P.M. Please see the attached revised schedule.
We apologize for this change and hope it does not cause any inconvenience.
""";
  final passage191_195_3 = """
**Oakville Leadership Conference - June 5**
**Revised Schedule**
* 9:00 AM: Registration & Networking
* 10:00 AM: Workshop 1: "Managing Teams"
* 11:00 AM: Workshop 2: "Digital Marketing"
* **12:00 PM: Keynote Address - Dr. Aris Thorne**
* 1:00 PM: Lunch Break
* 2:30 PM: CEO Panel Discussion
* 4:00 PM: Closing Remarks
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: reservations@grandviewhotel.com
**From**: admin@corp-solutions.com
**Subject**: Booking Inquiry
**Date**: March 1

To Whom It May Concern,
I would like to book a block of 10 single rooms for our company's executives.
* **Check-in**: Tuesday, April 15
* **Check-out**: Thursday, April 17 (2 nights)
We also need to reserve the 'Oak' conference room for all day on April 16.
Could you please confirm availability and provide a quote?
""";
  final passage196_200_2 = """
**Grand View Hotel - INVOICE**
**Client**: Corp-Solutions
**Invoice**: #H-778
**Date**: April 18

**Services Rendered**:
* 10 Single Rooms (2 nights @ \$180/night) ........ \$3,600.00
* 'Oak' Conference Room Rental (April 16) ........ \$500.00
* Conference Room Catering (April 16) ............ \$450.00
* * **TOTAL AMOUNT DUE**: **\$4,550.00**

**Payment Due**: May 18
""";
  final passage196_200_3 = """
**To**: reservations@grandviewhotel.com
**From**: admin@corp-solutions.com
**Subject**: Re: Invoice #H-778
**Date**: April 19

Hello,
I just received the invoice for our event last week. Thank you.
I am confused about one of the charges. The invoice lists a \$450 charge for 'Conference Room Catering'.
In my original request, I only asked to reserve the conference room. I do not recall authorizing or receiving any catering.
Could you please check your records? I believe this charge is an error.
""";

  final part7Questions = [
    // Q147-148 (E-mail)
    {
      'question':
          passage147_148 + "\n\n147. What is the purpose of the e-mail?",
      'options': [
        "To fix a laptop",
        "To assign a technician to a case",
        "To ask about an audio problem",
        "To schedule a desk change",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 1) thông báo cho Mr. Doyle rằng 'A technician, Ms. Ana Sharma, has been assigned to your case.'",
    },
    {
      'question': passage147_148 + "\n\n148. What is Mr. Doyle asked to do?",
      'options': [
        "Go to the support center",
        "Call Ana Sharma",
        "Be at his desk between 2 and 3 P.M.",
        "Diagnose the problem himself",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 1) yêu cầu 'Please ensure your laptop is at your desk during this time (2:00 P.M. and 3:00 P.M.).'",
    },
    // Q149-150 (Notice)
    {
      'question':
          passage149_150 + "\n\n149. What is the purpose of the notice?",
      'options': [
        "To schedule a fire drill",
        "To inform tenants about a system test",
        "To announce new safety regulations",
        "To ask people to evacuate the building",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 2) nói 'The building's fire alarm system will undergo its annual mandatory testing...'",
    },
    {
      'question':
          passage149_150 +
          "\n\n150. What are tenants told to do during the test?",
      'options': [
        "Evacuate the building",
        "Stay away from flashing lights",
        "Contact building management",
        "Nothing, as no evacuation is needed",
      ],
      'correctIndex': 3,
      'explain':
          "Thông báo (Passage 2) nói rõ 'This is only a test, and no evacuation is necessary.'",
    },
    // Q151-152 (Text Message Chain)
    {
      'question': passage151_152 + "\n\n151. At 4:01 P.M., where is Maria?",
      'options': [
        "At the office",
        "At a client's site",
        "At home",
        "In a meeting with David",
      ],
      'correctIndex': 1,
      'explain':
          "Maria (Passage 3) viết, 'Just wrapping up. I'm just leaving the client's office now.'",
    },
    {
      'question': passage151_152 + "\n\n152. What does David ask Maria to do?",
      'options': [
        "Meet the director",
        "Bring a contract to the office",
        "Send him a file",
        "Stay at the client's site",
      ],
      'correctIndex': 1,
      'explain':
          "David (Passage 3) hỏi, 'Can you bring back the signed contract with you?'",
    },
    // Q153-155 (Article)
    {
      'question': passage153_155 + "\n\n153. What is the article mainly about?",
      'options': [
        "A new waterproof phone",
        "A successful CEO",
        "A new mobile carrier",
        "A guide for construction workers",
      ],
      'correctIndex': 0,
      'explain':
          "Bài báo (Passage 4) thông báo về 'its newest smartphone, the 'Dura-X'' và mô tả các tính năng của nó.",
    },
    {
      'question': passage153_155 + "\n\n154. What is a feature of the Dura-X?",
      'options': [
        "It is inexpensive.",
        "It has a long battery life.",
        "It is sold only online.",
        "It is designed for CEOs.",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) khoe rằng điện thoại 'boasts an extra-long battery life'.",
    },
    {
      'question': passage153_155 + "\n\n155. When will the phone be available?",
      'options': ["March 20", "April 15", "Không rõ", "Năm sau"],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) nói, 'The Dura-X will be available for purchase starting April 15.'",
    },
    // Q156-157 (Advertisement)
    {
      'question': passage156_157 + "\n\n156. What service is NOT mentioned?",
      'options': [
        "Free coffee",
        "High-speed Wi-Fi",
        "Catering service",
        "Smart-screens",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 5) liệt kê Wi-Fi, smart-screen, whiteboards, và coffee/water. 'Catering service' (dịch vụ ăn uống) không được đề cập.",
    },
    {
      'question': passage156_157 + "\n\n157. What is true about the location?",
      'options': [
        "It is on the 10th floor.",
        "It is inside the subway station.",
        "It has 10 rooms.",
        "It is available for long-term lease.",
      ],
      'correctIndex': 0,
      'explain':
          "Quảng cáo (Passage 5) nói, 'We are located on the 10th floor of the Tower Building...'",
    },
    // Q158-160 (Memo)
    {
      'question': passage158_160 + "\n\n158. What is the memo about?",
      'options': [
        "A new sales bonus",
        "A new expense reimbursement system",
        "A change to travel and meal policies",
        "A new VP of Sales",
      ],
      'correctIndex': 2,
      'explain':
          "Chủ đề (Passage 6) là 'New Travel and Expense Policy' và nội dung mô tả các thay đổi về du lịch quốc tế và chi phí bữa ăn.",
    },
    {
      'question':
          passage158_160 +
          "\n\n159. What is the new rule for international travel?",
      'options': [
        "It is capped at \$75 per day.",
        "It must be approved by two people.",
        "It must be submitted 3 weeks after.",
        "It is no longer permitted.",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) nói, 'All international travel must now be approved by me *in addition* to your direct manager' (nghĩa là 2 người).",
    },
    {
      'question':
          passage158_160 + "\n\n160. What is the new limit for meals per day?",
      'options': ["\$15", "\$75", "\$90", "Không có giới hạn"],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) nói, 'all meal expenses are now capped at \$75 per day.'",
    },
    // Q161-163 (E-mail)
    {
      'question':
          passage161_163 + "\n\n161. What is the purpose of the e-mail?",
      'options': [
        "To confirm a book order has shipped",
        "To sell new books",
        "To provide a tracking number",
        "To ask for a review",
      ],
      'correctIndex': 0,
      'explain':
          "Chủ đề (Passage 7) là 'Your Order Has Shipped!' và câu đầu tiên xác nhận 'Your order... has been shipped'.",
    },
    {
      'question':
          passage161_163 +
          "\n\n162. How long is the delivery expected to take?",
      'options': [
        "1-2 business days",
        "3-5 business days",
        "5-7 business days",
        "22 business days",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 7) nói, 'is expected to arrive within 5-7 business days.'",
    },
    {
      'question': passage161_163 + "\n\n163. What did Laura Chen purchase?",
      'options': [
        "Only one book",
        "A gardening guide and a novel",
        "A book by J. Anderson only",
        "A gardening magazine",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 7) liệt kê hai cuốn sách: 'The Silent Witness' (tiểu thuyết) và 'A Guide to Gardening' (sách hướng dẫn làm vườn).",
    },
    // Q164-167 (Webpage)
    {
      'question':
          passage164_167 +
          "\n\n164. What is a responsibility of the Marketing Coordinator?",
      'options': [
        "Leading the marketing team",
        "Designing organic products",
        "Managing social media",
        "Reporting to the CEO",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) liệt kê 'Manage all social media accounts' là một 'Responsibility'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n165. What qualification is desired but not mandatory?",
      'options': [
        "A Bachelor's degree",
        "Experience with MailChimp",
        "Excellent writing skills",
        "1-2 years of experience",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) nói 'Experience with e-mail marketing software... is a plus' (là một điểm cộng), nghĩa là không bắt buộc.",
    },
    {
      'question': passage164_167 + "\n\n166. What must applicants submit?",
      'options': [
        "A resume and a cover letter",
        "A resume and a marketing portfolio",
        "A cover letter and references",
        "An application and a degree",
      ],
      'correctIndex': 0,
      'explain':
          "Trang web (Passage 8) nói, 'please send your resume and a cover letter...'",
    },
    {
      'question': passage164_167 + "\n\n167. What is the deadline to apply?",
      'options': ["August 1", "August 2", "August 30", "Không có hạn chót"],
      'correctIndex': 2,
      'explain': "Trang web (Passage 8) nói, 'To apply... by August 30.'",
    },
    // Q168-171 (Form)
    {
      'question':
          passage168_171 + "\n\n168. What is the name of the subscriber?",
      'options': ["Tech Today", "Sarah Kim", "Cityville", "Visa"],
      'correctIndex': 1,
      'explain': "Form (Passage 9) ghi 'Subscriber Name: Sarah Kim'.",
    },
    {
      'question': passage168_171 + "\n\n169. What did Sarah Kim purchase?",
      'options': [
        "A 2-year digital subscription",
        "A 1-year print subscription",
        "A 1-year print and digital subscription",
        "A 1-year digital-only subscription",
      ],
      'correctIndex': 3,
      'explain':
          "Form (Passage 9) cho thấy cô ấy đã chọn '[X] 1-Year Subscription' và '[X] Digital Only'.",
    },
    {
      'question': passage168_171 + "\n\n170. How much did she pay?",
      'options': ["\$25.00", "\$30.00", "\$40.00", "\$50.00"],
      'correctIndex': 0,
      'explain':
          "Form (Passage 9) ghi 'Total Charged: \$25.00', tương ứng với giá 'Digital Only (\$25.00/year)'.",
    },
    {
      'question': passage168_171 + "\n\n171. When will her subscription start?",
      'options': ["Tháng này", "Tháng 6", "Tháng 1", "Tháng 12"],
      'correctIndex': 1,
      'explain':
          "Form (Passage 9) ghi 'Start Date: Subscription will begin with the next month's issue (June).'",
    },
    // Q172-175 (Article)
    {
      'question':
          passage172_175 + "\n\n172. What is the main topic of the article?",
      'options': [
        "A local history archive",
        "The National Heritage Foundation",
        "A new library website",
        "A digitization project",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 10) thông báo về 'a new project to digitize its entire archive of local newspapers'.",
    },
    {
      'question': passage172_175 + "\n\n173. What is the goal of the project?",
      'options': [
        "To get a grant",
        "To hire David Wu",
        "To preserve history",
        "To train volunteers",
      ],
      'correctIndex': 2,
      'explain':
          "Ông Wu (Passage 10) nói, 'This is a vital project for preserving our city's history.'",
    },
    {
      'question':
          passage172_175 + "\n\n174. How long is the project expected to take?",
      'options': ["3 năm", "1 năm", "1880 năm", "Không rõ"],
      'correctIndex': 0,
      'explain':
          "Bài báo (Passage 10) nói, 'is expected to take three years to complete.'",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. What is the library currently looking for?",
      'options': [
        "A new director",
        "Donations",
        "Old newspapers",
        "Volunteers",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 10) nói, 'The library is currently seeking volunteers to help with the scanning process.'",
    },

    // --- Double Passages ---

    // Q176-180 (Notice + E-mail)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. What is the fee for the Pottery class?",
      'options': ["\$20", "\$60", "\$80", "\$100"],
      'correctIndex': 3,
      'explain':
          "Thông báo (Passage 1) nói tất cả các lớp là '\$80', 'plus a \$20 materials fee for the Pottery class.' (\$80 + \$20 = \$100).",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. How must people register for classes?",
      'options': ["By e-mail", "By phone", "In person", "Online"],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 1) nói, 'Registration must be done in person at the community center.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What class did Ana Garcia try to register for?",
      'options': [
        "Pottery",
        "Digital Photography",
        "Introduction to Spanish",
        "Yoga",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) nói, 'I tried to register... for the 'Introduction to Spanish' class...'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. When did Ms. Garcia try to register?",
      'options': ["August 14", "August 15", "August 16", "August 17"],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 1) nói đăng ký mở vào 'August 15'. E-mail của cô ấy (Passage 2) được viết vào 'August 16' và nói 'I tried to register... this morning'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What problem did Ms. Garcia have?",
      'options': [
        "She couldn't find the center.",
        "The class was canceled.",
        "The class was already full.",
        "The fee was too high.",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 2) nói, 'the staff member... said the class was already full.'",
    },
    // Q181-185 (Memo + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What is the purpose of the memo?",
      'options': [
        "To announce the location of a party",
        "To ask for hotel recommendations",
        "To set a date for a business trip",
        "To change the bar policy",
      ],
      'correctIndex': 0,
      'explain':
          "Memo (Passage 1) thông báo chi tiết về 'Annual Holiday Party', bao gồm ngày và địa điểm ('The Grand Oak Hotel').",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. What must employees pay for at the party?",
      'options': [
        "The dinner",
        "Their guest's meal",
        "Alcoholic beverages",
        "Hotel parking",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) nói, 'there will be a cash bar for all alcoholic beverages.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What was the deadline to RSVP?",
      'options': ["December 1", "December 13", "December 14", "December 20"],
      'correctIndex': 1,
      'explain': "Memo (Passage 1) nói, 'Please RSVP... by December 13'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Why did Kevin Scott write the e-mail?",
      'options': [
        "To RSVP for the party",
        "To ask about the menu",
        "To complain about the cash bar",
        "To cancel his RSVP",
      ],
      'correctIndex': 0,
      'explain':
          "E-mail (Passage 2) được viết vào 'December 14', sau hạn chót, hỏi 'Is it still possible to attend?'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. Why did Kevin miss the deadline?",
      'options': [
        "He didn't see the memo.",
        "He was on a business trip.",
        "He forgot to check his e-mail.",
        "He didn't know if he could bring a guest.",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) nói, 'I was on a business trip and missed the RSVP deadline...'",
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
          "\n\n186. What feature is NOT advertised for the 'Pro-Tone' earbuds?",
      'options': [
        "Water-resistance",
        "Noise-cancelling",
        "Long battery life",
        "A free charging case",
      ],
      'correctIndex': 3,
      'explain':
          "Quảng cáo (Passage 1) đề cập đến '32 hours with charging case' nhưng không nói \"free\". Nó liệt kê các tính năng khác.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. How much did Michael Chen pay in total?",
      'options': ["\$10", "\$99.00", "\$109.00", "\$119.00"],
      'correctIndex': 2,
      'explain':
          "E-mail xác nhận (Passage 2) ghi 'Your total charge was \$109.00' (gồm \$99 sản phẩm + \$10 vận chuyển nhanh).",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What is Michael Chen's main complaint?",
      'options': [
        "The item arrived late.",
        "The item is the wrong color.",
        "A key feature is not working.",
        "The battery life is too short.",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail của anh ấy (Passage 3) nói, 'The active noise-cancelling feature does not seem to be working.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. What confusion does Mr. Chen mention?",
      'options': [
        "The price",
        "The warranty",
        "The user manual instructions",
        "The 30-day guarantee",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy (Passage 3) bối rối vì quảng cáo (Passage 1) nói 'water-resistant', nhưng 'user manual... says \"avoid all contact with moisture.\"'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What does Mr. Chen request?",
      'options': [
        "A replacement",
        "A full refund",
        "A new user manual",
        "Technical support",
      ],
      'correctIndex': 1,
      'explain':
          "Anh ấy (Passage 3) viết, 'I would like to return these under the 30-day guarantee for a full refund.'",
    },
    // Q191-195 (Article + E-mail + Schedule)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. What is the topic of the article?",
      'options': [
        "A new book by Dr. Thorne",
        "An upcoming business conference",
        "A profile of a local CEO",
        "A hotel renovation",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) thông báo về '10th Annual Leadership Conference on June 5'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. What is the purpose of the e-mail from Ms. Kim?",
      'options': [
        "To invite Dr. Thorne to speak",
        "To inform Dr. Thorne of a schedule change",
        "To ask about Dr. Thorne's book",
        "To cancel the lunch break",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) viết, 'I am writing to confirm a minor change to the schedule... your keynote will now begin at 12:00 P.M. instead of 1:00 P.M.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. According to the article, what was the *original* start time for Dr. Thorne's speech?",
      'options': ["10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM"],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 1), được viết trước e-mail, nói 'Dr. Thorne... will be speaking at 1:00 P.M.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. What event is scheduled at 10:00 A.M.?",
      'options': [
        "Registration",
        "Workshop 1: 'Managing Teams'",
        "Workshop 2: 'Digital Marketing'",
        "Keynote Address",
      ],
      'correctIndex': 1,
      'explain':
          "Lịch trình (Passage 3) ghi '10:00 AM: Workshop 1: 'Managing Teams''.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What will happen immediately after Dr. Thorne's speech?",
      'options': [
        "The CEO Panel Discussion",
        "Workshop 2",
        "The Lunch Break",
        "Closing Remarks",
      ],
      'correctIndex': 2,
      'explain':
          "Lịch trình (Passage 3) cho thấy bài phát biểu của Dr. Thorne kết thúc lúc 1:00 PM, và '1:00 PM: Lunch Break' bắt đầu.",
    },
    // Q196-200 (E-mail + Invoice + E-mail)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. In the first e-mail, what did the client request?",
      'options': [
        "10 rooms and catering",
        "10 rooms and a conference room",
        "A quote for 2 nights",
        "A conference room and catering",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) yêu cầu 'a block of 10 single rooms' và 'reserve the 'Oak' conference room'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the invoice, what was the total cost for the 10 rooms?",
      'options': ["\$180.00", "\$500.00", "\$3,600.00", "\$4,550.00"],
      'correctIndex': 2,
      'explain':
          "Hóa đơn (Passage 2) ghi '10 Single Rooms (2 nights @ \$180/night) ........ \$3,600.00'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. Why did the client send the third e-mail?",
      'options': [
        "To request a late payment",
        "To book another event",
        "To question a charge",
        "To thank the hotel",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail thứ ba (Passage 3) nói, 'I am confused about one of the charges... I believe this charge is an error.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What charge is being disputed?",
      'options': [
        "The cost of the rooms",
        "The conference room rental",
        "The catering service",
        "The total amount",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 3) nói, 'The invoice lists a \$450 charge for 'Conference Room Catering'... I do not recall authorizing or receiving any catering.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What is implied about the catering?",
      'options': [
        "It was included with the room rental.",
        "It was ordered by someone else.",
        "It was not requested by the client.",
        "It was for 10 people.",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail đầu tiên (Passage 1) chỉ yêu cầu phòng họp. E-mail thứ ba (Passage 3) nói, 'I only asked to reserve the conference room. I do not recall authorizing... any catering.' Điều này ngụ ý rằng dịch vụ này không được khách hàng yêu cầu.",
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
