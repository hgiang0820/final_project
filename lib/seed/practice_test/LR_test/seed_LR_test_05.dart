// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest05() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_05';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 05',
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
        'order': 5,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người phụ nữ đang tưới cây trong vườn.
      // Transcript:
      // (A) She's planting flowers in a garden.
      // (B) She's watering plants with a hose.
      // (C) She's cutting the grass.
      // (D) She's sitting on a bench.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy người phụ nữ đang cầm một vòi nước (hose) và hướng nó vào các chậu cây (plants).',
    },
    {
      // Image Description: Nhiều người đang xem một buổi biểu diễn đường phố.
      // Transcript:
      // (A) People are lined up to buy tickets.
      // (B) A crowd is watching a performance.
      // (C) Musicians are playing instruments indoors.
      // (D) A parade is moving down the street.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy một nhóm người (crowd) đang tập trung nhìn về một hướng, có vẻ như đang xem một buổi biểu diễn (performance).',
    },
    {
      // Image Description: Một người đàn ông đang điều chỉnh cà vạt trước gương.
      // Transcript:
      // (A) He's tying his shoelaces.
      // (B) He's adjusting his necktie.
      // (C) He's putting on a jacket.
      // (D) He's polishing his shoes.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người đàn ông đang dùng tay chỉnh lại chiếc cà vạt (necktie) của mình.',
    },
    {
      // Image Description: Một chiếc xe đạp đang dựa vào tường gạch.
      // Transcript:
      // (A) A bicycle is leaning against a wall.
      // (B) A bicycle is being ridden down a path.
      // (C) A bicycle has a flat tire.
      // (D) A bicycle is locked to a rack.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Bức tranh cho thấy một chiếc xe đạp đang dựa (leaning) vào một bức tường (wall).',
    },
    {
      // Image Description: Thức ăn được bày biện đẹp mắt trên bàn ăn trong nhà hàng.
      // Transcript:
      // (A) The table is being set for dinner.
      // (B) Food has been arranged on a table.
      // (C) A waiter is taking an order.
      // (D) The diners are finishing their meal.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy các món ăn (food) đã được sắp xếp (arranged) trên một cái bàn.',
    },
    {
      // Image Description: Một người công nhân đang vận hành máy móc trong nhà máy.
      // Transcript:
      // (A) A worker is operating machinery.
      // (B) A worker is cleaning the factory floor.
      // (C) A worker is inspecting a finished product.
      // (D) A worker is taking a break.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người công nhân đang đứng cạnh và thao tác trên một cỗ máy (machinery).',
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
      // Q7: Where is the nearest coffee shop?
      // (A) I prefer tea.
      // (B) It closes at 6 PM.
      // (C) Just around the corner.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "Where" (Ở đâu) đòi hỏi một câu trả lời về địa điểm. (C) là câu trả lời phù hợp.',
    },
    {
      // Q8: When did you send the package?
      // (A) I sent it yesterday afternoon.
      // (B) By express mail.
      // (C) It's a large package.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "When" (Khi nào) đòi hỏi một câu trả lời về thời gian. (A) cung cấp thời gian cụ thể.',
    },
    {
      // Q9: Who's going to the conference in Berlin?
      // (A) It starts next week.
      // (B) I think Sarah and Tom are.
      // (C) I've never been to Berlin.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Who" (Ai) đòi hỏi một câu trả lời về người. (B) chỉ định hai người.',
    },
    {
      // Q10: Why did you choose this restaurant?
      // (A) I'm not very hungry.
      // (B) I read some great reviews online.
      // (C) Let's choose something else.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Why" (Tại sao) đòi hỏi một lý do. (B) cung cấp lý do cho sự lựa chọn.',
    },
    {
      // Q11: How long is the warranty for this camera?
      // (A) It's a digital camera.
      // (B) It's covered for two years.
      // (C) I bought it last month.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How long" (Bao lâu) đòi hỏi một câu trả lời về khoảng thời gian. (B) là câu trả lời phù hợp.',
    },
    {
      // Q12: Is the report ready for review?
      // (A) The review was positive.
      // (B) I'll report it later.
      // (C) Almost, I just need to check the figures.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Đây là câu hỏi Yes/No. (C) trả lời "No" (gián tiếp) và giải thích tình trạng hiện tại.',
    },
    {
      // Q13: Would you like me to make a reservation?
      // (A) Yes, that would be helpful.
      // (B) I prefer a window seat.
      // (C) The presentation is ready.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một lời đề nghị giúp đỡ. (A) là một câu trả lời đồng ý lịch sự.',
    },
    {
      // Q14: What's the new intern's name?
      // (A) He started this morning.
      // (B) I think it's David Lee.
      // (C) He turned it in already.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "What\'s the... name" (Tên... là gì) đòi hỏi một cái tên. (B) cung cấp một cái tên.',
    },
    {
      // Q15: You took the train this morning, didn't you?
      // (A) No, I drove because of the rain.
      // (B) The training session was useful.
      // (C) Yes, I took notes.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi đuôi (tag question). (A) trả lời "No" và đưa ra lý do.',
    },
    {
      // Q16: How many chairs do we need for the meeting room?
      // (A) The meeting is at 2 PM.
      // (B) About fifteen, I think.
      // (C) I'll chair the meeting.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How many" (Bao nhiêu) đòi hỏi một con số. (B) cung cấp số lượng ước tính.',
    },
    {
      // Q17: Why don't we ask Mr. Kim for help?
      // (A) He's busy with another project.
      // (B) I asked him already.
      // (C) Yes, he helped me.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Câu hỏi "Why don\'t we..." là một lời đề nghị. (A) đưa ra lý do tại sao không thể thực hiện lời đề nghị đó.',
    },
    {
      // Q18: Has the client reviewed the contract?
      // (A) Yes, they sent it back with signatures.
      // (B) The view is excellent.
      // (C) It's a long-term contract.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No. (A) trả lời "Yes" và cung cấp thông tin chi tiết.',
    },
    {
      // Q19: Could you speak a little louder, please?
      // (A) I spoke to him yesterday.
      // (B) Sorry, is this better?
      // (C) It's a very loud noise.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là một lời yêu cầu. (B) là một phản hồi lịch sự và kiểm tra xem đã đáp ứng yêu cầu chưa.',
    },
    {
      // Q20: This new coffee machine is confusing.
      // (A) I know, the instructions aren't clear.
      // (B) I'd like a coffee, please.
      // (C) The machine is broken.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu nhận xét về một vấn đề (khó hiểu). (A) đồng ý ("I know") và thêm một bình luận liên quan.',
    },
    {
      // Q21: What time should we leave for the airport?
      // (A) We left it at home.
      // (B) Around 6:30 to avoid traffic.
      // (C) Yes, let's go now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "What time" (Mấy giờ) đòi hỏi một câu trả lời về thời gian. (B) đề xuất một thời gian và lý do.',
    },
    {
      // Q22: Didn't you already finish that report?
      // (A) I finished it yesterday.
      // (B) No, I still have one section left.
      // (C) The report is on your desk.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi Yes/No dạng phủ định. (B) trả lời "No" và giải thích tình trạng.',
    },
    {
      // Q23: Whose turn is it to buy coffee?
      // (A) I turned it off.
      // (B) It's my turn today.
      // (C) Let's buy some now.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'Câu hỏi "Whose turn" (Đến lượt ai). (B) trả lời trực tiếp.',
    },
    {
      // Q24: How far is the post office from here?
      // (A) It closes at 5 PM.
      // (B) I mailed the letter.
      // (C) It's about a 10-minute walk.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'Câu hỏi "How far" (Bao xa). (C) đưa ra khoảng cách ước tính bằng thời gian đi bộ.',
    },
    {
      // Q25: Should I schedule the interview for morning or afternoon?
      // (A) The view is nice in the morning.
      // (B) Let's do the afternoon.
      // (C) Yes, I'm available.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Đây là câu hỏi lựa chọn (or). (B) chọn một trong hai phương án.',
    },
    {
      // Q26: When is the deadline to register for the workshop?
      // (A) It's about online marketing.
      // (B) You have until Friday.
      // (C) I registered yesterday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "When is the deadline" (Hạn chót là khi nào). (B) cung cấp một thời hạn.',
    },
    {
      // Q27: I can't seem to log in to my e-mail.
      // (A) Did you try resetting your password?
      // (B) The mail arrived late today.
      // (C) I'll send you an e-mail later.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là một câu thông báo về một vấn đề (không đăng nhập được). (A) là một gợi ý để giải quyết vấn đề.',
    },
    {
      // Q28: How often does the shuttle bus run?
      // (A) It goes to the airport.
      // (B) Every half hour.
      // (C) I ran for the bus.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "How often" (Bao lâu một lần) đòi hỏi một câu trả lời về tần suất. (B) là câu trả lời phù hợp.',
    },
    {
      // Q29: Would you mind closing the door?
      // (A) The store closes soon.
      // (B) No, not at all.
      // (C) Yes, I do.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'Câu hỏi "Would you mind...?" (Bạn có phiền...?) là một yêu cầu lịch sự. "No, not at all" (Không, không phiền gì cả) là cách đồng ý lịch sự.',
    },
    {
      // Q30: What kind of business does Mr. Tanaka own?
      // (A) He's out of the office today.
      // (B) It's his own business.
      // (C) An electronics company, I believe.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'Câu hỏi "What kind" (Loại gì). (C) đưa ra loại hình công ty.',
    },
    {
      // Q31: Have you met the new graphic designer yet?
      // (A) Yes, I met him this morning.
      // (B) The design is very modern.
      // (C) I haven't signed it yet.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'Đây là câu hỏi Yes/No về một trải nghiệm. (A) trả lời "Yes" và cung cấp thời gian.',
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
(Man) Excuse me, do you know when the next train to downtown leaves?
(Woman) The express train just left a few minutes ago. The next local train leaves in 10 minutes from Platform 2.
(Man) How long does the local train take?
(Woman) It takes about 45 minutes, with all the stops. The next express is in 30 minutes, and that only takes 20 minutes.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Woman) Hi Kenji, it's Maria. I'm calling about the invoice for Apex Corp. Did you get a chance to send it out?
(Man) Not yet, Maria. I noticed there's a discrepancy in the total amount compared to the quote we gave them.
(Woman) Oh? What's the issue?
(Man) The quote didn't include the sales tax. I need to add that before I send it. I'll do it right now.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Man) Good morning. I'd like to check out, please. Room 405.
(Woman) Certainly, Mr. Davies. How was your stay?
(Man) It was very pleasant, thank you. Could you print a copy of my bill? I need it for my expense report.
(Woman) Of course. Here you are. The total comes to \$350. How will you be paying?
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Woman) Our sales numbers for the new tablet are lower than expected.
(Man) I know. I think the price might be too high compared to our competitors.
(Woman) That could be part of it. I also think our advertising hasn't reached the right audience. Maybe we should focus more on online ads.
(Man) That's a good point. Let's schedule a meeting with the marketing team to discuss revising our strategy.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Man) Hi, I'd like to order a flower arrangement for delivery.
(Woman) Okay. What occasion is it for? And what kind of flowers were you thinking of?
(Man) It's for my colleague's birthday. Maybe something bright and cheerful? Like sunflowers or tulips?
(Woman) Sunflowers are lovely this time of year. We can create a beautiful arrangement with sunflowers and some greenery. Where does it need to be delivered?
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Woman) The internet connection in the main conference room is really slow today.
(Man) Is it? I haven't heard any other complaints. Did you try restarting the router?
(Woman) No, I didn't know where it was.
(Man) It's in the cabinet under the screen. There's a small reset button on the back. Try holding that down for ten seconds. If that doesn't work, call IT support.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Man) I just read the feedback from the training session. Most people found it useful, but several mentioned it was too long.
(Woman) I agree. Four hours is a long time without a break. Maybe next time we should split it into two sessions?
(Man) That's a good idea. Or we could keep it at four hours but include a 15-minute break in the middle.
(Woman) I think the break is a better option. Let's suggest that to the training department.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Woman) Excuse me, I'm looking for the latest novel by author Jane Anderson. Do you know where I can find it?
(Man) Yes, her new releases are usually in the 'New Fiction' section, right near the front entrance.
(Woman) I checked there, but I didn't see it.
(Man) Hmm, let me check our computer system. Ah, it looks like we're currently sold out. We should be getting another shipment tomorrow afternoon.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Man) Hi, I need to get this package to London by Friday. What are my options?
(Woman) Let me see. Today is Wednesday. Okay, we have our 'Express International' service, which guarantees delivery in two business days. That would get it there by Friday.
(Man) Great. How much would that cost? It's just documents, about half a kilogram.
(Woman) Looking at the chart... for Zone 3, under one kilogram, the Express International rate is \$65.
---
**International Shipping Rates (Documents)**
| Zone | Service             | Weight (kg) | Price | Delivery Time |
|------|---------------------|-------------|-------|---------------|
| 1    | Standard            | < 1         | \$20  | 5-7 days      |
| 1    | Express             | < 1         | \$40  | 2 days        |
| 2    | Standard            | < 1         | \$25  | 5-7 days      |
| 2    | Express             | < 1         | \$50  | 2 days        |
| **3**| Standard            | **< 1** | \$35  | 5-7 days      |
| **3**| **Express** | **< 1** | **\$65**| **2 days** |
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Woman) The office kitchen is a mess again. There are dirty dishes piled up in the sink.
(Man) I know, it's frustrating. We have a dishwasher, but people don't seem to load it.
(Woman) Maybe we need to put up a sign reminding everyone to clean up after themselves.
(Man) It might help. I'll draft a short, friendly reminder and post it above the sink.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Man) Good afternoon, thank you for calling Tech Support. How can I help you?
(Woman) Hi, I'm having trouble accessing the company's shared drive from home. It keeps giving me an error message.
(Man) Okay. Are you connected to the company's VPN? You need to be logged into the VPN to access the drive remotely.
(Woman) Oh, I forgot about that step. Let me try connecting now. Thanks!
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Woman) I reviewed the catering proposal for the annual awards dinner. The menu looks great, but the cost is higher than we budgeted.
(Man) How much higher? We might be able to cut costs somewhere else.
(Woman) It's about \$1,000 over budget. Maybe we could choose a less expensive dessert option? Or cut the appetizer course?
(Man) Let's ask them if they can offer a discount first. If not, cutting the appetizer seems like the best option.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Man) I'm going to be out of the office for the next two weeks on vacation.
(Woman) Oh, nice! Where are you going?
(Man) To Hawaii. While I'm gone, could you handle my urgent e-mails? I'll set up an auto-reply, but some things might need immediate attention.
(Woman) No problem at all. Just forward me anything important. Have a great trip!
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "Where does the man want to go?",
      'options': [
        "To Platform 2",
        "Downtown",
        "Atlanta",
        "To the ticket office",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The man asks, 'when the next train to downtown leaves?'",
    },
    {
      'question': "When does the next local train leave?",
      'options': [
        "In a few minutes",
        "In 10 minutes",
        "In 20 minutes",
        "In 30 minutes",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'The next local train leaves in 10 minutes...'",
    },
    {
      'question': "What is the advantage of the express train?",
      'options': [
        "It leaves sooner.",
        "It goes to Platform 2.",
        "It is faster.",
        "It has fewer stops.", // Note: Faster implies fewer stops or direct.
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The woman says the local train takes 45 minutes, while the express 'only takes 20 minutes'.",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A sales quote",
        "An invoice discrepancy",
        "A client complaint",
        "A delivery schedule",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man mentions 'a discrepancy in the total amount' on the invoice for Apex Corp.",
    },
    {
      'question': "What was missing from the original quote?",
      'options': ["Sales tax", "Delivery fee", "Item cost", "Discount"],
      'correctIndex': 0,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'The quote didn't include the sales tax.'",
    },
    {
      'question': "What will the man do next?",
      'options': [
        "Call the client",
        "Send the invoice",
        "Correct the quote",
        "Add tax to the invoice",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'I need to add that [the sales tax] before I send it. I'll do it right now.'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "Where most likely are the speakers?",
      'options': ["In an office", "At a hotel", "In a taxi", "At an airport"],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man asks to 'check out' of 'Room 405', and the woman asks about his 'stay'. This indicates a hotel.",
    },
    {
      'question': "What does the man request?",
      'options': [
        "A later check-out time",
        "Help with his luggage",
        "A copy of his bill",
        "A taxi to the airport",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man asks, 'Could you print a copy of my bill?'",
    },
    {
      'question': "What information does the woman provide?",
      'options': [
        "The room number",
        "The check-out time",
        "The total amount due",
        "An expense report form",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> After printing the bill, the woman says, 'The total comes to \$350.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What product are the speakers discussing?",
      'options': ["A computer", "A tablet", "A phone", "A competitor"],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'Our sales numbers for the new tablet are lower than expected.'",
    },
    {
      'question': "What does the man think might be a problem?",
      'options': [
        "The product quality",
        "The advertising audience",
        "The competitors' prices",
        "The product's price",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I think the price might be too high...'",
    },
    {
      'question': "What do the speakers agree to do?",
      'options': [
        "Lower the price",
        "Launch a new product",
        "Meet with the marketing team",
        "Create online ads",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man suggests, 'Let's schedule a meeting with the marketing team to discuss revising our strategy.' The woman agrees with his previous point.",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What is the man ordering?",
      'options': [
        "A birthday cake",
        "Some gardening supplies",
        "A flower arrangement",
        "Lunch delivery",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'I'd like to order a flower arrangement for delivery.'",
    },
    {
      'question': "What is the reason for the order?",
      'options': [
        "An anniversary",
        "A colleague's birthday",
        "A get-well gift",
        "A holiday celebration",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'It's for my colleague's birthday.'",
    },
    {
      'question': "What kind of flowers does the woman suggest?",
      'options': ["Roses", "Tulips", "Sunflowers", "Greenery"],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> After the man mentions sunflowers or tulips, the woman says, 'Sunflowers are lovely this time of year.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What problem is the woman experiencing?",
      'options': [
        "The printer is broken.",
        "The internet connection is slow.",
        "The conference room is too cold.",
        "She cannot find the router.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'The internet connection in the main conference room is really slow today.'",
    },
    {
      'question': "What does the man suggest the woman try first?",
      'options': [
        "Calling IT support",
        "Restarting the router",
        "Moving to a different room",
        "Checking the connection",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The man asks, 'Did you try restarting the router?' and then explains how to do it.",
    },
    {
      'question': "Where is the router located?",
      'options': [
        "On the desk",
        "Under the screen",
        "Next to the phone",
        "Outside the room",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'It's in the cabinet under the screen.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What did people say about the training session?",
      'options': [
        "It was not useful.",
        "It was too short.",
        "It was too long.",
        "It needed more feedback.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man reports, 'several mentioned it was too long.'",
    },
    {
      'question': "How long was the session?",
      'options': ["1 hour", "2 hours", "4 hours", "15 minutes"],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'Four hours is a long time without a break.'",
    },
    {
      'question': "What solution do the speakers prefer?",
      'options': [
        "Splitting the session",
        "Shortening the session",
        "Adding a break",
        "Offering it online",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man suggests splitting or adding a break. The woman replies, 'I think the break is a better option.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "Where most likely are the speakers?",
      'options': [
        "In a library",
        "In a bookstore",
        "At a publishing house",
        "In an author's office",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The woman is looking for a 'novel', and the man mentions 'New Fiction' section and checking the 'computer system' for stock, typical of a bookstore.",
    },
    {
      'question': "What is the woman looking for?",
      'options': [
        "A specific author",
        "The new fiction section",
        "A book by Jane Anderson",
        "A shipment of books",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> The woman asks for 'the latest novel by author Jane Anderson.'",
    },
    {
      'question': "What does the man say about the book?",
      'options': [
        "It is in the front section.",
        "It is not available right now.",
        "It will arrive this afternoon.",
        "He needs to order it.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'it looks like we're currently sold out.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "What does the man need to do?",
      'options': [
        "Send a package",
        "Receive a package",
        "Check shipping rates",
        "Go to London",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'Hi, I need to get this package to London...'",
    },
    {
      'question':
          "Look at the graphic. What is the delivery time for Express International?",
      'options': ["1 day", "2 days", "3 days", "5-7 days"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The woman says it guarantees 'delivery in two business days'. The graphic confirms 'Express... 2 days'.",
    },
    {
      'question':
          "Look at the graphic. How much does the recommended service cost?",
      'options': ["\$35", "\$40", "\$50", "\$65"],
      'correctIndex': 3,
      'explain':
          "$transcript56_58 \n\n=> The woman looks at the chart and says 'for Zone 3, under one kilogram, the Express International rate is \$65.'",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A broken dishwasher",
        "A dirty kitchen",
        "A new company policy",
        "A reminder sign",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'The office kitchen is a mess again. There are dirty dishes piled up...'",
    },
    {
      'question': "What problem does the man mention?",
      'options': [
        "The sink is broken.",
        "People don't use the dishwasher.",
        "There are no cleaning supplies.",
        "The reminder sign is missing.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man says, 'We have a dishwasher, but people don't seem to load it.'",
    },
    {
      'question': "What will the man do?",
      'options': [
        "Wash the dishes",
        "Buy a new dishwasher",
        "Talk to the manager",
        "Create and post a sign",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript59_61 \n\n=> The man says, 'I'll draft a short, friendly reminder and post it above the sink.'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the woman calling Tech Support?",
      'options': [
        "She forgot her password.",
        "She cannot access a shared drive.",
        "She needs to install VPN.",
        "She received an error message.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'I'm having trouble accessing the company's shared drive from home.'",
    },
    {
      'question': "What does the man say is required to access the drive?",
      'options': [
        "A special password",
        "A VPN connection",
        "A new error message",
        "A home computer",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The man asks, 'Are you connected to the company's VPN? You need to be logged into the VPN...'",
    },
    {
      'question': "What did the woman forget to do?",
      'options': [
        "Restart her computer",
        "Connect to the VPN",
        "Save her work",
        "Call Tech Support earlier",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> After the man mentions the VPN, the woman says, 'Oh, I forgot about that step.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What event are the speakers discussing?",
      'options': [
        "A budget meeting",
        "An awards dinner",
        "A catering proposal",
        "A dessert tasting",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'I reviewed the catering proposal for the annual awards dinner.'",
    },
    {
      'question': "What is the problem with the proposal?",
      'options': [
        "The menu is not good.",
        "It is over budget.",
        "The dessert is too expensive.",
        "The appetizer is missing.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'the cost is higher than we budgeted... It's about \$1,000 over budget.'",
    },
    {
      'question': "What does the man suggest doing first?",
      'options': [
        "Choosing a cheaper dessert",
        "Cutting the appetizer",
        "Asking for a discount",
        "Finding another caterer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man says, 'Let's ask them if they can offer a discount first.'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "Why will the man be out of the office?",
      'options': [
        "He is attending a conference.",
        "He is going on vacation.",
        "He is visiting a client.",
        "He is working from home.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'I'm going to be out of the office for the next two weeks on vacation.'",
    },
    {
      'question': "What does the man ask the woman to do?",
      'options': [
        "Set up his auto-reply",
        "Forward important messages",
        "Handle all his e-mails",
        "Call him in Hawaii",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man asks, 'could you handle my urgent e-mails?' and the woman replies, 'Just forward me anything important.'",
    },
    {
      'question': "What will the man do before he leaves?",
      'options': [
        "Finish his work",
        "Meet with the woman",
        "Set up an auto-reply",
        "Forward his e-mails",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'I'll set up an auto-reply...'",
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
Planning a party or event? Let 'Superb Catering' handle the food! We offer delicious menus for all occasions, from corporate lunches to weddings. Choose from buffet-style meals, plated dinners, or appetizer platters. Our experienced chefs use only the freshest ingredients. Visit superb-catering.com to view our menus and request a quote. Book your event by the end of this month and receive a 10% discount!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
May I have your attention, please? This is a security announcement. All bags left unattended in the terminal will be removed and may be destroyed. Please keep your personal belongings with you at all times. If you see any suspicious activity or unattended items, please report it immediately to airport security or any airline employee. Thank you for your cooperation.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
Okay everyone, let's talk about the upcoming software launch. We are still on schedule for the release date of June 1st. The development team has confirmed that the final testing phase is almost complete. However, the marketing department still needs to finalize the press release and website copy. Sarah, can you give us an update on that? We need those materials ready by next Friday at the latest.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling the Central Library. Our hours are Monday to Thursday, 9 AM to 9 PM, Friday and Saturday, 9 AM to 5 PM, and Sunday, 1 PM to 5 PM. To renew items or check your account, please visit our website at centrallib.org. For information about upcoming events and programs, press one. To speak with a librarian at the reference desk, press two.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome to the historic Miller House. Built in 1890, this house is one of the oldest in the city. My name is Susan, and I'll be your guide. This tour will take about 45 minutes, covering the first and second floors. Please stay with the group and refrain from touching any of the furniture or artifacts. Photography is allowed, but please turn off your flash. Are there any questions before we begin?
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
This next slide shows our customer satisfaction ratings over the past year. As you can see, our overall satisfaction score has remained high, consistently above 90%. However, we did see a slight dip in satisfaction regarding our phone support wait times during the third quarter. We addressed this by hiring additional support staff in October, and you can see the rating improved in the fourth quarter.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
And now, a look at business news. Tech giant 'Global Corp' announced today that it plans to acquire 'Innovate Software' in a deal valued at 5 billion dollars. Innovate Software is best known for its popular video editing application. Global Corp stated that the acquisition will help expand its portfolio of creative software tools. The deal is expected to close by the end of the year, pending regulatory approval.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
Our next speaker is Dr. Aris Thorne, a leading expert in renewable energy. Dr. Thorne has spent the last decade researching solar power efficiency and has published numerous papers on the topic. He is here today to talk about the latest advancements in solar panel technology and their potential impact on the global energy market. Please welcome Dr. Aris Thorne.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Welcome back from the lunch break. Just a reminder about our afternoon breakout sessions starting at 2:00 PM. Please check the graphic projected on the screen for room assignments. I want to highlight one session in particular. If you are interested in our company's new international expansion plans, please attend the 'Global Markets' session. It will be led by our VP of International Sales, Ms. Chen, in the Maple Room.
---
**Afternoon Breakout Sessions - 2:00 PM**
- Session A: Product Development (Oak Room)
- Session B: **Global Markets** (**Maple Room**)
- Session C: Financial Planning (Cedar Room)
- Session D: IT Security (Pine Room)
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention, shoppers. For the next hour only, all men's suits are buy one, get one 50% off. That's right, buy any men's suit at regular price, and get a second suit of equal or lesser value for half price. This incredible offer is only valid until 7:00 PM tonight. Visit our men's department on the third floor. Don't miss out!
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What type of business is being advertised?",
      'options': [
        "A restaurant",
        "A cleaning service",
        "A catering company",
        "A party planning service",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Superb Catering' và đề cập đến 'handle the food', 'delicious menus', 'buffet-style meals', 'plated dinners'.",
    },
    {
      'question': "What does the company offer?",
      'options': [
        "Wedding planning",
        "Corporate lunches",
        "Venue rental",
        "Chef training",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói đề cập 'We offer delicious menus for all occasions, from corporate lunches to weddings.'",
    },
    {
      'question': "What is offered to customers who book soon?",
      'options': [
        "Free delivery",
        "A 10% discount",
        "A free appetizer platter",
        "A consultation",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'Book your event by the end of this month and receive a 10% discount!'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "Where is this announcement likely being made?",
      'options': [
        "At a train station",
        "At an airport",
        "At a shopping mall",
        "At a bus terminal",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Thông báo đề cập đến 'terminal', 'airport security', và 'airline employee', tất cả đều liên quan đến sân bay.",
    },
    {
      'question': "What are listeners warned about?",
      'options': [
        "Flight delays",
        "Security checks",
        "Unattended bags",
        "Suspicious activity",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói cảnh báo, 'All bags left unattended in the terminal will be removed...'",
    },
    {
      'question': "What should listeners do if they see something suspicious?",
      'options': [
        "Leave the terminal",
        "Keep their belongings close",
        "Report it to security",
        "Cooperate with staff",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói hướng dẫn, 'If you see any suspicious activity or unattended items, please report it immediately to airport security...'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of the meeting?",
      'options': [
        "Final testing",
        "A competitor's product",
        "A software launch schedule",
        "Website copy",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'let's talk about the upcoming software launch... We are still on schedule for the release date...'",
    },
    {
      'question': "When is the software scheduled to be released?",
      'options': ["Next Friday", "Next Monday", "June 1st", "Today"],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'We are still on schedule for the release date of June 1st.'",
    },
    {
      'question': "What does the marketing department need to do?",
      'options': [
        "Complete final testing",
        "Meet the schedule",
        "Finish promotional materials",
        "Contact Sarah",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'the marketing department still needs to finalize the press release and website copy.'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is this?",
      'options': [
        "A library",
        "A bookstore",
        "A government office",
        "A museum",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'Thank you for calling the Central Library.'",
    },
    {
      'question': "When is the library open on Sundays?",
      'options': [
        "It is closed.",
        "9 AM to 5 PM",
        "9 AM to 9 PM",
        "1 PM to 5 PM",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói giờ mở cửa 'Sunday, 1 PM to 5 PM.'",
    },
    {
      'question': "What should a caller do to speak with a librarian?",
      'options': [
        "Press one",
        "Press two",
        "Visit the website",
        "Check their account",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'To speak with a librarian at the reference desk, press two.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "What is the Miller House?",
      'options': ["A museum", "A historic home", "A city hall", "A library"],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> Người nói giới thiệu, 'Welcome to the historic Miller House. Built in 1890...'",
    },
    {
      'question': "How long will the tour last?",
      'options': ["15 minutes", "30 minutes", "45 minutes", "60 minutes"],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'This tour will take about 45 minutes...'",
    },
    {
      'question': "What are listeners allowed to do?",
      'options': [
        "Touch the furniture",
        "Use flash photography",
        "Take pictures",
        "Leave the group",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'Photography is allowed, but please turn off your flash.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the main topic of this part of the presentation?",
      'options': [
        "Customer satisfaction",
        "Sales revenue",
        "Phone support",
        "Manufacturing costs",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'This next slide shows our customer satisfaction ratings...'",
    },
    {
      'question': "What problem occurred during the third quarter?",
      'options': [
        "Sales revenue decreased.",
        "Overall satisfaction dropped.",
        "Manufacturing costs increased.",
        "Phone support wait times were long.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'we did see a slight dip in satisfaction regarding our phone support wait times during the third quarter.'",
    },
    {
      'question': "What did the company do in October?",
      'options': [
        "Improve profit margins",
        "Launch a mobile app",
        "Hire more support staff",
        "Conduct a survey",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'We addressed this by hiring additional support staff in October...'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What company is acquiring 'Innovate Software'?",
      'options': ["Global Corp", "Tech Giant", "Innovate Software", "Không rõ"],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> Tin tức nói, 'Tech giant 'Global Corp' announced today that it plans to acquire 'Innovate Software'...'.",
    },
    {
      'question': "What is 'Innovate Software' known for?",
      'options': [
        "Creative software tools",
        "Video editing software",
        "Acquiring other companies",
        "Regulatory approval",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Tin tức nói, 'Innovate Software is best known for its popular video editing application.'",
    },
    {
      'question': "When is the deal expected to be finalized?",
      'options': [
        "Today",
        "This year",
        "Next year",
        "After regulatory approval",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Tin tức nói, 'The deal is expected to close by the end of the year...'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Dr. Thorne an expert in?",
      'options': [
        "Solar power",
        "Global energy markets",
        "Publishing papers",
        "Panel technology",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu ông ấy là 'a leading expert in renewable energy' và đã nghiên cứu 'solar power efficiency'.",
    },
    {
      'question': "What will Dr. Thorne discuss?",
      'options': [
        "His research papers",
        "The global energy market",
        "His decade of research",
        "New solar panel technology",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'He is here today to talk about the latest advancements in solar panel technology...'",
    },
    {
      'question': "What is implied about Dr. Thorne?",
      'options': [
        "He has spoken here before.",
        "He works for a solar company.",
        "He has written books.", // Although not explicitly stated as his *book*, he has published *papers*. Let's refine.
        "He has published research.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói ông ấy 'has published numerous papers on the topic.'",
    },
    // Talk 9 (Q95-97)
    {
      'question': "Look at the graphic. Which session is in the Oak Room?",
      'options': [
        "Product Development",
        "Global Markets",
        "Financial Planning",
        "IT Security",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript95_97 \n\n=> Lịch trình hiển thị 'Session A: Product Development (Oak Room)'.",
    },
    {
      'question':
          "Look at the graphic. Who is leading the 'Global Markets' session?",
      'options': ["Ms. Chen", "Mr. Lee", "The speaker", "Not specified"],
      'correctIndex': 0,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'It will be led by our VP of International Sales, Ms. Chen...'",
    },
    {
      'question':
          "Look at the graphic. Which room is mentioned by the speaker?",
      'options': ["Oak Room", "Maple Room", "Cedar Room", "Pine Room"],
      'correctIndex': 1,
      'explain':
          "$transcript95_97 \n\n=> Người nói nhấn mạnh phiên 'Global Markets'... 'in the Maple Room.'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What product is on sale?",
      'options': [
        "All men's clothing",
        "Men's suits",
        "Headphones",
        "Electronics",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Thông báo nói, 'all men's suits are buy one, get one 50% off.'",
    },
    {
      'question': "What is the special offer?",
      'options': [
        "40% off",
        "50% off one item",
        "Buy one, get one 50% off",
        "Buy one, get one free",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'buy any men's suit... and get a second suit... for half price,' tức là 'buy one, get one 50% off'.",
    },
    {
      'question': "When does the sale end?",
      'options': ["In 30 minutes", "In one hour", "At 7:00 PM", "At 9:00 AM"],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'This incredible offer is only valid until 7:00 PM tonight.'",
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
          "The quarterly report must be submitted ______ Friday afternoon.",
      'options': ['by', 'on', 'at', 'in'],
      'correctIndex': 0,
      'explain': '"By" (trước, hoặc chậm nhất là) được dùng để chỉ hạn chót.',
    },
    {
      'question':
          "Ms. Chen is ______ for managing the entire marketing department.",
      'options': ['response', 'responsible', 'respond', 'responsibly'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (responsible - chịu trách nhiệm) sau động từ "is".',
    },
    {
      'question': "The workshop was ______ informative and engaging.",
      'options': ['either', 'both', 'neither', 'whether'],
      'correctIndex': 1,
      'explain':
          '"Both... and..." (Vừa... vừa...) được dùng để nối hai tính từ (informative and engaging).',
    },
    {
      'question':
          "All employees should familiarize ______ with the new safety procedures.",
      'options': ['they', 'their', 'themselves', 'theirs'],
      'correctIndex': 2,
      'explain':
          'Động từ "familiarize" thường đi với đại từ phản thân (themselves - tự làm quen).',
    },
    {
      'question':
          "The train ______ arrives at 8:00 A.M. was delayed this morning.",
      'options': ['what', 'when', 'who', 'that'],
      'correctIndex': 3,
      'explain':
          'Đại từ quan hệ "that" (hoặc "which") được dùng để giới thiệu mệnh đề quan hệ chỉ vật ("The train").',
    },
    {
      'question':
          "We offer a ______ range of services to meet our clients' needs.",
      'options': ['wide', 'width', 'widely', 'widen'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (wide - rộng) để bổ nghĩa cho danh từ "range".',
    },
    {
      'question':
          "The success of the project was ______ due to the team's hard work.",
      'options': ['large', 'larger', 'largely', 'largest'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (largely - phần lớn) để bổ nghĩa cho cụm "due to".',
    },
    {
      'question': "Please turn off all lights ______ leaving the office.",
      'options': ['before', 'after', 'while', 'until'],
      'correctIndex': 0,
      'explain':
          '"Before" (trước khi) là giới từ phù hợp nhất chỉ thời điểm thực hiện hành động.',
    },
    {
      'question':
          "The company is seeking ______ candidates for the management position.",
      'options': ['qualify', 'qualifies', 'qualified', 'qualification'],
      'correctIndex': 2,
      'explain':
          'Cần một tính từ (qualified - đủ tiêu chuẩn) để bổ nghĩa cho danh từ "candidates".',
    },
    {
      'question': "The CEO gave an ______ speech at the annual conference.",
      'options': ['impress', 'impressed', 'impressive', 'impression'],
      'correctIndex': 2,
      'explain':
          'Cần một tính từ (impressive - ấn tượng) để bổ nghĩa cho danh từ "speech".',
    },
    {
      'question': "All expense reports must include ______ receipts.",
      'options': ['origin', 'original', 'originally', 'originate'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (original - gốc) để bổ nghĩa cho danh từ "receipts".',
    },
    {
      'question': "The flight was canceled ______ severe weather conditions.",
      'options': ['because', 'although', 'despite', 'owing to'],
      'correctIndex': 3,
      'explain':
          '"Owing to" (do) là một cụm giới từ, theo sau là một cụm danh từ ("severe weather conditions").',
    },
    {
      'question': "The new software update will be ______ next week.",
      'options': ['install', 'installed', 'installing', 'installation'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (installed) để tạo thành thể bị động (will be installed - sẽ được cài đặt).',
    },
    {
      'question': "Mr. Kim is known for his ______ in contract negotiation.",
      'options': ['expert', 'expertise', 'expertly', 'exported'],
      'correctIndex': 1,
      'explain':
          'Sau tính từ sở hữu "his" cần một danh từ (expertise - chuyên môn).',
    },
    {
      'question':
          "Please complete the form and return it ______ your earliest convenience.",
      'options': ['at', 'on', 'in', 'by'],
      'correctIndex': 0,
      'explain':
          'Cụm từ "at your earliest convenience" (vào lúc thuận tiện sớm nhất của bạn) là một cụm cố định.',
    },
    {
      'question':
          "The marketing campaign was ______ successful than we had anticipated.",
      'options': ['more', 'most', 'much', 'many'],
      'correctIndex': 0,
      'explain':
          'Cần "more" để tạo thành dạng so sánh hơn của tính từ "successful".',
    },
    {
      'question': "All visitors must sign in ______ the reception desk.",
      'options': ['at', 'on', 'in', 'by'],
      'correctIndex': 0,
      'explain':
          'Giới từ "at" được dùng để chỉ vị trí cụ thể (at the reception desk).',
    },
    {
      'question':
          "The company offers ______ training programs for new employees.",
      'options': ['extend', 'extensive', 'extension', 'extensively'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (extensive - sâu rộng) để bổ nghĩa cho cụm danh từ "training programs".',
    },
    {
      'question':
          "The presentation provided a clear ______ of the project goals.",
      'options': ['overview', 'oversee', 'overheard', 'overlook'],
      'correctIndex': 0,
      'explain': 'Cần một danh từ (overview - tổng quan) sau mạo từ "a".',
    },
    {
      'question':
          "______ the budget has been approved, we can begin hiring new staff.",
      'options': ['Even though', 'Now that', 'Unless', 'Whereas'],
      'correctIndex': 1,
      'explain':
          '"Now that" (Bởi vì bây giờ) là liên từ chỉ nguyên nhân - kết quả phù hợp nhất.',
    },
    {
      'question':
          "Ms. Evans worked ______ as a consultant before joining our company.",
      'options': ['previous', 'previously', 'prevent', 'preview'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (previously - trước đây) để bổ nghĩa cho động từ "worked".',
    },
    {
      'question': "This product comes with a two-year ______.",
      'options': ['guarantee', 'guaranteed', 'guaranteeing', 'guarantor'],
      'correctIndex': 0,
      'explain':
          'Sau tính từ "two-year" cần một danh từ (guarantee - sự bảo hành).',
    },
    {
      'question':
          "The updated schedule will be distributed to all attendees ______.",
      'options': ['short', 'shortly', 'shorten', 'shortage'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (shortly - sớm) để chỉ thời gian thực hiện hành động.',
    },
    {
      'question':
          "The new office building has ______ parking for employees and visitors.",
      'options': ['ample', 'amply', 'amplify', 'amplitude'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (ample - nhiều, dư dả) để bổ nghĩa cho danh từ "parking".',
    },
    {
      'question':
          "______ arriving at the hotel, please check in at the front desk.",
      'options': ['Upon', 'During', 'Since', 'While'],
      'correctIndex': 0,
      'explain':
          '"Upon" + V-ing (Ngay khi) được dùng để chỉ hành động xảy ra ngay sau một hành động khác.',
    },
    {
      'question': "The manager praised the team for their ______ efforts.",
      'options': [
        'collaborate',
        'collaborative',
        'collaboration',
        'collaborator',
      ],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (collaborative - mang tính hợp tác) để bổ nghĩa cho danh từ "efforts".',
    },
    {
      'question':
          "The seminar is intended for ______ who are new to the industry.",
      'options': ['that', 'these', 'them', 'those'],
      'correctIndex': 3,
      'explain':
          'Đại từ "those" (những người) được dùng ở đây thay cho "people".',
    },
    {
      'question':
          "We need to find a ______ solution to this recurring problem.",
      'options': ['permit', 'permanence', 'permanently', 'permanent'],
      'correctIndex': 3,
      'explain':
          'Cần một tính từ (permanent - lâu dài) để bổ nghĩa cho danh từ "solution".',
    },
    {
      'question':
          "The renovations are expected ______ completed by the end of the year.",
      'options': ['be', 'to be', 'being', 'been'],
      'correctIndex': 1,
      'explain': 'Sau "expected" cần một động từ nguyên mẫu có "to" (to be).',
    },
    {
      'question':
          "______ the high quality of the materials, the price is quite reasonable.",
      'options': ['Considering', 'Considered', 'Considerate', 'Consideration'],
      'correctIndex': 0,
      'explain':
          '"Considering" (Xét đến) được dùng như một giới từ trong trường hợp này.',
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

  // --- Passage 1: Questions 131-134 (Notice) ---
  final passage131_134 = """
**Community Center Newsletter - June Issue**

Summer is almost here, and the Westside Community Center is ready with a full schedule of activities! Registration for our summer programs opens on June 10. We ____(131)____ everything from swimming lessons for children to pottery classes for adults.

Our popular summer day camp for ages 6-12 still has a few spots ____(132)____. Sign up soon before it fills up! ____(133)____.

A complete list of programs and registration forms can be found on our website or at the front desk. We look forward to a fun and active summer ____(134)____ you!
""";
  // --- Passage 2: Questions 135-138 (E-mail) ---
  final passage135_138 = """
To: Frank Peterson <f.peterson@mail.com>
From: Apex Office Solutions <service@apexoffice.com>
Subject: Your Service Appointment
Date: March 22

Dear Mr. Peterson,

This e-mail is to confirm your service appointment for your Apex Model 500 printer. A technician is scheduled to arrive at your office ____(135)____ Thursday, March 24, between 1 P.M. and 3 P.M.

The technician assigned is Mr. David Chen. Please ensure someone is available to grant him ____(136)____ to the equipment. The technician assigned is Mr. David Chen. ____(137)____ will call before arriving.

If you need to reschedule this appointment, please call us at least 24 hours in advance. Thank you for choosing Apex Office Solutions.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**The Daily Scoop Cafe - Now Open!**

Come visit The Daily Scoop Cafe, your new neighborhood spot for coffee, pastries, and light lunches. We are located at 15 River Street, right next to the bookstore.

We proudly serve locally roasted coffee and fresh baked goods made ____(139)____ in our kitchen. Our lunch menu ____(140)____  delicious sandwiches, salads, and soups.

To celebrate our grand opening, we are offering a free small coffee with any pastry purchase ____(141)____ this week. ____(142)____. We are open Monday to Saturday from 7 A.M. to 6 P.M. We hope to see you soon!
""";
  // --- Passage 4: Questions 143-146 (Memo) ---
  final passage143_146 = """
To: All Department Managers
From: Kenji Tanaka, Director of Operations
Subject: Quarterly Performance Reviews
Date: September 1

Please be reminded that all employee performance reviews for the third quarter must be completed ____(143)____ September 30. This deadline is firm.

Managers should schedule individual meetings with each employee to discuss their performance and set goals for the next quarter. The ____(144)____ review forms can be downloaded from the HR section of the company intranet.

Completed forms must be signed by both the employee and the manager. ____(145)____. Please submit them to Human Resources no later than October 5. Your timely ____(146)____ is appreciated.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["offer", "offered", "offering", "offers"],
      'correctIndex': 0,
      'explain':
          "Chủ ngữ là 'We' (số nhiều), nên cần động từ nguyên mẫu (offer) ở thì hiện tại đơn.",
    },
    {
      'question': "",
      'options': ["available", "reserved", "complete", "open"],
      'correctIndex': 0,
      'explain':
          "Tính từ 'available' (còn trống) là phù hợp nhất để mô tả 'spots' (chỗ).",
    },
    {
      'question': "",
      'options': [
        "The camp runs from 9 AM to 3 PM daily.",
        "Pottery classes require an extra fee.",
        "The swimming pool is currently closed.",
        "Adult supervision is required.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này cung cấp thêm thông tin chi tiết (giờ hoạt động) về trại hè (camp) đã được đề cập ở câu trước.",
    },
    {
      'question': "",
      'options': ["at", "for", "with", "to"],
      'correctIndex': 2,
      'explain':
          "Giới từ 'with' (với) được dùng trong ngữ cảnh này (summer with you).",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["at", "in", "on", "by"],
      'correctIndex': 2,
      'explain':
          "Giới từ 'on' được dùng cho các ngày cụ thể trong tuần (on Thursday).",
    },
    {
      'question': "",
      'options': ["access", "accessible", "accessed", "accessing"],
      'correctIndex': 0,
      'explain':
          "Sau động từ 'grant' (cho phép) cần một danh từ (access - sự truy cập).",
    },
    {
      'question': "",
      'options': [
        "The repair should take about one hour.",
        "Please provide the printer model number.",
        "Our technician will call before arriving.",
        "Payment is due upon completion of service.",
      ],
      'correctIndex': 2, // Thay đổi câu để hợp lý hơn
      'explain':
          "Câu này cung cấp thông tin bổ sung hữu ích về quy trình dịch vụ, phù hợp với luồng thông tin.",
    },
    {
      'question': "",
      'options': ["He", "She", "They", "We"],
      'correctIndex': 0,
      'explain': "Đại từ 'He' thay thế cho 'Mr. David Chen'.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["day", "daily", "date", "data"],
      'correctIndex': 1,
      'explain':
          "Cần một trạng từ (daily - hàng ngày) để bổ nghĩa cho động từ 'made'.",
    },
    {
      'question': "",
      'options': ["feature", "features", "featured", "featuring"],
      'correctIndex': 1,
      'explain':
          "Chủ ngữ là 'Our lunch menu' (số ít), nên động từ ở thì hiện tại đơn cần thêm 's' (features).",
    },
    {
      'question': "",
      'options': ["while", "during", "since", "by"],
      'correctIndex': 1,
      'explain':
          "Giới từ 'during' (trong suốt) được dùng để chỉ khoảng thời gian diễn ra ưu đãi ('this week').",
    },
    {
      'question': "",
      'options': [
        "We also offer catering services.",
        "Our coffee beans are imported from Colombia.",
        "The bookstore next door is also new.",
        "Stop by on your way to work!",
      ],
      'correctIndex': 3,
      'explain':
          "Câu này là một lời kêu gọi hành động (call to action), khuyến khích khách hàng ghé thăm, phù hợp với giọng văn quảng cáo.",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["at", "by", "on", "in"],
      'correctIndex': 1,
      'explain': "Giới từ 'by' (trước) được dùng để chỉ hạn chót.",
    },
    {
      'question': "",
      'options': ["necessary", "necessity", "necessarily", "necessitate"],
      'correctIndex': 0,
      'explain': "Cần một tính từ (necessary - cần thiết) sau mạo từ 'the'.",
    },
    {
      'question': "",
      'options': [
        "These goals should be specific and measurable.",
        "Employees should prepare for these meetings.",
        "These forms are different from last year's.",
        "Both signatures are required for validation.",
      ],
      'correctIndex': 3,
      'explain':
          "Câu này làm rõ yêu cầu về chữ ký đã được đề cập ở câu trước ('Completed forms must be signed...').",
    },
    {
      'question': "",
      'options': ["comply", "complied", "compliant", "compliance"],
      'correctIndex': 3,
      'explain':
          "Sau tính từ sở hữu 'Your' và tính từ 'timely' cần một danh từ (compliance - sự tuân thủ).",
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
**Franklin Office Furniture - Spring Sale!**

Upgrade your workspace this spring! All desks, chairs, and filing cabinets are **20% off** through the end of April.

We offer a wide selection of ergonomic chairs designed for comfort and productivity. Visit our showroom at 45 Industrial Way to try them out!

Free delivery and assembly on all orders over \$500.
Showroom hours: Monday-Saturday, 9 A.M. - 6 P.M.
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: Team Members <team@innovate.com>
From: Kenji Tanaka <ktanaka@innovate.com>
Subject: Project Phoenix Update
Date: July 15

Hi Team,

Quick update on Project Phoenix. The client has approved the final design mockups! This is great news.

The next step is for the development team to begin coding. Mark, please ensure your team has all the necessary specifications. Let's aim to have a functional prototype ready for internal review by August 15.

Keep up the great work!
Kenji
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Susan (1:30 P.M.)**: Hi David, just checking in. Have the catering trays arrived for the 2:00 PM meeting yet?
**David (1:31 P.M.)**: Not yet. I called the restaurant, and they said the driver is stuck in traffic but should be here any minute.
**Susan (1:32 P.M.)**: Okay, thanks for checking. Can you let me know as soon as they arrive? I want to make sure everything is set up before the clients get here.
**David (1:33 P.M.)**: Will do.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**City Plans New Downtown Parking Garage**

(May 5) – The Springfield City Council voted last night to approve the construction of a new multi-level parking garage on Elm Street. The five-story structure will provide 400 additional parking spaces for downtown shoppers and workers.

The project aims to alleviate the current parking shortage, which local businesses say has hurt their sales. Construction is slated to begin in October and is expected to cost approximately \$15 million.

Funding will come from city bonds and future parking revenue. "This is a necessary investment in our downtown infrastructure," said Mayor Lisa Cho. The garage is expected to open in early 2027.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Attention Library Patrons:**

Due to a software upgrade, the library's online catalog and account services will be unavailable from 10:00 P.M. tonight, June 20, until 8:00 A.M. tomorrow, June 21.

During this time, you will not be able to search the catalog, place holds, or renew items online. The library building will maintain its normal hours.

We apologize for the temporary inconvenience.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Research & Development Staff
**From**: Dr. Chen, R&D Director
**Date**: November 10
**Subject**: Lab Safety Audit

Next week, from November 17-18, an external auditor will be visiting our labs to conduct a comprehensive safety audit. This is a routine procedure to ensure we meet all industry safety standards.

Please ensure your workstations are clean and organized. All chemicals must be properly labeled and stored. Safety equipment (goggles, gloves, etc.) must be readily available and in good condition.

The auditor may ask questions. Please cooperate fully. Let's demonstrate our commitment to a safe working environment.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Customers <list@freshfoods.com>
From: 'Fresh Foods Market' <info@freshfoods.com>
Subject: Weekly Specials - June 3-9
Date: June 2

Hello Valued Customers,

Get ready for summer grilling with our amazing weekly specials!
* Fresh Salmon Fillets: \$9.99/lb (Save \$3/lb)
* Organic Strawberries: 2 packs for \$6
* Angus Beef Burgers: \$5.99/pack
* Corn on the Cob: 5 for \$2

Plus, spend \$50 or more and receive a free reusable shopping bag! Visit us today!
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Job Opening: Administrative Assistant (Part-Time)**

'Peterson & Associates Law Firm' is seeking a reliable and organized Administrative Assistant for our busy downtown office. This is a part-time position, approximately 25 hours per week (afternoons, Monday-Friday).

**Responsibilities:**
* Answering phones and greeting clients.
* Scheduling appointments and managing calendars.
* Filing, copying, and scanning documents.
* Preparing correspondence and basic reports.

**Qualifications:**
* Minimum 2 years of office experience.
* Proficient in Microsoft Office Suite (Word, Excel, Outlook).
* Excellent communication and organizational skills.
* Professional demeanor.

To apply, please submit your resume via our website's career portal by May 15.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**SkyHigh Airlines - Baggage Claim Form**

**Passenger Name**: Laura Fernandez
**Flight Number**: SH 205
**Date of Flight**: August 8
**From**: London **To**: New York

**Type of Claim**:
[ ] Damaged Baggage
[X] Delayed Baggage

**Bag Description**: Medium-sized, hard-shell suitcase, color: Silver. Tag # SH12345.

**Contents Summary**: Clothing, toiletries, books.

**Contact Information**: l.fernandez@email.com / 555-9876

**Agent Notes**: Passenger arrived, bag did not. Located bag on next flight (SH 207), arriving approx. 4 hours later. Arranged for courier delivery to passenger's hotel. - Agent K. Lee (Aug 8)
""";
  // Q172-175 (Article)
  final passage172_175 = """
**New Community Art Center Opens**

(July 25) – The Riverbend Community Art Center officially opened its doors to the public this past Saturday with a day of free workshops and demonstrations. The new center, located in the renovated old library building on Park Street, aims to provide affordable art education for all ages.

Classes offered this fall include painting, ceramics, photography, and jewelry making. Registration for fall classes begins August 1.

"We are thrilled to bring this resource to the Riverbend community," said Center Director Maria Garcia. The renovation project was funded through a combination of city grants and private donations.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (E-mail + Webpage)
  final passage176_180_1 = """
To: service@quickprinters.com
From: alice.w@email.com
Subject: Problem with Order #QP-701
Date: September 10

Hello,
I received my order for 200 custom business cards today. However, there is a significant typo in my e-mail address printed on the cards. It should read 'alice.w@email.com' but it is printed as 'alice.e@email.com'.

This makes the cards unusable. As per your satisfaction guarantee listed on your website, I would like to request a reprint with the correct information at no additional charge.

Please let me know how to proceed.
Alice Wong
""";
  final passage176_180_2 = """
**QuickPrinters.com - Help & FAQs**

**Our Guarantee**: We guarantee the quality and accuracy of our printing. If you are not satisfied with your order due to an error made by QuickPrinters (e.g., printing quality, incorrect cutting), we will reprint your order free of charge.

**Customer Errors**: We strongly recommend carefully proofreading all text and designs before submitting your order. We are not responsible for customer errors, such as typos or incorrect information provided in the order form. Reprints due to customer errors will be charged at the normal price.

**How to Request a Reprint**: Please contact customer service within 10 days of receiving your order. Include your order number and a photo of the issue.
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
To: All Employees
From: Building Management
Date: May 2
Subject: Parking Garage Cleaning

Please be advised that the employee parking garage (Lot A) will be closed for annual cleaning and maintenance from **Friday, May 12 (6:00 P.M.)** through **Sunday, May 14**.

All vehicles must be removed from the garage by 6:00 P.M. on Friday. Any vehicles remaining after this time will be towed at the owner's expense.

During this closure, employees working on the weekend may use the visitor parking lot (Lot B) located behind the building. Normal garage access will resume on Monday, May 15.
""";
  final passage181_185_2 = """
To: Building Management
From: Kenji Tanaka
Subject: Re: Parking Garage Cleaning
Date: May 3

Hello,
Thank you for the notification about the garage cleaning.
I am scheduled to work this coming weekend (May 13-14). My usual parking spot is in Lot A.

The memo mentions using Lot B. However, Lot B is quite small. Will there be enough space for all employees who need to work on Saturday and Sunday? I am concerned about finding a spot.

Thank you,
Kenji Tanaka
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: 'Swift Clean' Robot Vacuum**

Spend less time cleaning, more time living!
* **Price**: \$299.00
* **Features**: Smart navigation, automatic recharging, works on carpets and hard floors, controllable via smartphone app.
* **Special Offer**: Order by June 30 and receive a free set of replacement filters (a \$30 value).
* **Shipping**: Free standard shipping (5-7 days).
* **Warranty**: 1-Year Limited Warranty.
""";
  final passage186_190_2 = """
**From**: orders@swiftclean.com
**To**: d.evans@email.com
**Subject**: Your Order Confirmation #SC-550
**Date**: June 28

Dear David Evans,
Thank you for purchasing the 'Swift Clean' Robot Vacuum! Your order total is \$316.94 (including tax). Your item will ship within 2 business days via standard shipping.

As part of our June promotion, a free set of replacement filters will be included with your order.
""";
  final passage186_190_3 = """
**From**: David Evans <d.evans@email.com>
**To**: orders@swiftclean.com
**Subject**: Re: Your Order Confirmation #SC-550
**Date**: July 6

Hello,
I received my 'Swift Clean' vacuum today. The vacuum itself seems fine, but the free replacement filters mentioned in the advertisement and the confirmation e-mail were not included in the box.

Could you please arrange to have these sent to me? My order number is SC-550.

Thank you,
David Evans
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**Westwood Library Hosts Author Event**
(October 1) – The Westwood Public Library is excited to host an evening with best-selling historical fiction author, Ms. Eleanor Vance, on Thursday, October 18. Ms. Vance will discuss her latest novel, "The Gilded Cage," and sign copies afterward.
The event begins at 7:00 P.M. in the library's main reading room. It is free and open to the public, but seating is limited. Copies of Ms. Vance's books will be available for purchase.
""";
  final passage191_195_2 = """
**To**: David Wu <dwu@westlib.org>
**From**: Eleanor Vance <evance@authors.com>
**Subject**: Re: October 18 Event
**Date**: October 15

Dear David,
I am writing regarding my upcoming talk at the library this Thursday. Unfortunately, my flight schedule has changed, and I will now be arriving in Westwood later than originally planned.

Would it be possible to push the start time of the event back by 30 minutes, perhaps to 7:30 P.M.? This would give me enough time to get from the airport to the library.

Please let me know if this is feasible. I apologize for any trouble.
Best,
Eleanor Vance
""";
  final passage191_195_3 = """
**Westwood Library - Website Update**

**Event Update**: Please note a time change for the author event with Eleanor Vance this Thursday, October 18. Due to unforeseen travel issues, the event will now begin at **7:30 P.M.** instead of 7:00 P.M. All other details remain the same. We apologize for the inconvenience.
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: accounts@cityscape_landscaping.com
**From**: admin@parktowers.com
**Subject**: Service Request
**Date**: July 5

Hello,
This is Maria Rossi from Park Towers Condominiums. We would like to schedule our regular monthly landscaping service for the week of July 18.
Please include lawn mowing, hedge trimming, and weeding of the flower beds.
Could you confirm availability and assign a crew?
Thanks,
Maria
""";
  final passage196_200_2 = """
**Cityscape Landscaping - INVOICE**
**Client**: Park Towers Condominiums
**Invoice**: #L-101
**Date**: July 25

**Service Date**: July 20
**Services Rendered**:
* Monthly Landscaping Package (Lawn, Hedges, Weeding) .... \$600.00
* **Additional**: Tree Branch Removal .......................... \$150.00
* * **TOTAL AMOUNT DUE**: **\$750.00**

**Payment Due**: August 24
""";
  final passage196_200_3 = """
**To**: accounts@cityscape_landscaping.com
**From**: admin@parktowers.com
**Subject**: Re: Invoice #L-101
**Date**: July 26

Hello,
I received invoice #L-101. Could you please provide clarification on the \$150 charge for 'Tree Branch Removal'?

This service was not part of our regular monthly request (sent July 5) and was not pre-authorized. While we appreciate your crew being proactive if there was a safety hazard, we need documentation or prior approval for additional charges like this.

Please adjust the invoice or provide justification for the extra service.
Thank you,
Maria Rossi
""";

  final part7Questions = [
    // Q147-148 (Advertisement)
    {
      'question': passage147_148 + "\n\n147. What products are on sale?",
      'options': [
        "All office furniture",
        "Ergonomic chairs only",
        "Desks, chairs, and filing cabinets",
        "Items over \$500",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) nói, 'All desks, chairs, and filing cabinets are 20% off'.",
    },
    {
      'question':
          passage147_148 + "\n\n148. What is offered for orders over \$500?",
      'options': [
        "A 20% discount",
        "Free assembly", // Combined with delivery
        "A free chair",
        "Extended warranty",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo (Passage 1) nói, 'Free delivery and assembly on all orders over \$500.'",
    },
    // Q149-150 (E-mail)
    {
      'question':
          passage149_150 + "\n\n149. What is the main purpose of the e-mail?",
      'options': [
        "To approve a design",
        "To update the team on project progress",
        "To request new specifications",
        "To set a new deadline",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) bắt đầu 'Quick update on Project Phoenix' và thông báo các bước tiếp theo.",
    },
    {
      'question':
          passage149_150 + "\n\n150. When should the prototype be ready?",
      'options': ["July 15", "August 15", "Khi client phê duyệt", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "Kenji (Passage 2) viết, 'Let's aim to have a functional prototype ready for internal review by August 15.'",
    },
    // Q151-152 (Text Message Chain)
    {
      'question': passage151_152 + "\n\n151. What is Susan waiting for?",
      'options': [
        "David to arrive",
        "A phone call",
        "The clients",
        "A food delivery",
      ],
      'correctIndex': 3,
      'explain': "Susan (Passage 3) hỏi, 'Have the catering trays arrived...?'",
    },
    {
      'question': passage151_152 + "\n\n152. What caused the delay?",
      'options': [
        "The restaurant was busy.",
        "David forgot to call.",
        "The driver is stuck in traffic.",
        "The meeting started early.",
      ],
      'correctIndex': 2,
      'explain':
          "David (Passage 3) nói, 'they said the driver is stuck in traffic'.",
    },
    // Q153-155 (Article)
    {
      'question': passage153_155 + "\n\n153. What is the article mainly about?",
      'options': [
        "A new parking garage",
        "Downtown shopping sales",
        "A city council election",
        "Elm Street businesses",
      ],
      'correctIndex': 0,
      'explain':
          "Tiêu đề và nội dung bài báo (Passage 4) tập trung vào việc phê duyệt và xây dựng 'a new multi-level parking garage'.",
    },
    {
      'question':
          passage153_155 + "\n\n154. Why is the project being undertaken?",
      'options': [
        "To improve Elm Street",
        "To provide 400 jobs",
        "To ease a parking shortage",
        "To raise \$15 million",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) nói, 'The project aims to alleviate the current parking shortage'.",
    },
    {
      'question':
          passage153_155 + "\n\n155. When is the garage expected to open?",
      'options': ["Tháng 10", "Năm sau", "Năm 2027", "Khi đủ tiền"],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) nói, 'The garage is expected to open in early 2027.'",
    },
    // Q156-157 (Notice)
    {
      'question': passage156_157 + "\n\n156. What service will be unavailable?",
      'options': [
        "Access to the library building",
        "Borrowing new books",
        "Online catalog and account access",
        "Librarian assistance",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) nói, 'the library's online catalog and account services will be unavailable'.",
    },
    {
      'question':
          passage156_157 +
          "\n\n157. How long will the service interruption last?",
      'options': ["3 giờ", "8 giờ", "10 giờ", "Cả ngày"],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) nói gián đoạn từ '10:00 P.M. tonight' đến '8:00 A.M. tomorrow', tổng cộng là 10 tiếng.",
    },
    // Q158-160 (Memo)
    {
      'question': passage158_160 + "\n\n158. What is the purpose of the memo?",
      'options': [
        "To announce a safety audit",
        "To introduce a new auditor",
        "To update safety standards",
        "To schedule safety training",
      ],
      'correctIndex': 0,
      'explain':
          "Chủ đề (Passage 6) là 'Lab Safety Audit' và nội dung thông báo về chuyến thăm của kiểm toán viên.",
    },
    {
      'question': passage158_160 + "\n\n159. What are employees asked to do?",
      'options': [
        "Clean and organize their workstations",
        "Attend a safety meeting",
        "Avoid the labs next week",
        "Update chemical labels",
      ],
      'correctIndex': 0,
      'explain':
          "Memo (Passage 6) yêu cầu, 'Please ensure your workstations are clean and organized.'",
    },
    {
      'question': passage158_160 + "\n\n160. What is implied about the audit?",
      'options': [
        "It is unexpected.",
        "It happens regularly.",
        "It is only for new employees.",
        "It will result in penalties.",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) nói, 'This is a routine procedure', ngụ ý nó diễn ra thường xuyên/định kỳ.",
    },
    // Q161-163 (E-mail)
    {
      'question':
          passage161_163 + "\n\n161. What product is NOT listed on special?",
      'options': ["Salmon", "Strawberries", "Chicken", "Corn"],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 7) liệt kê cá hồi (Salmon), dâu tây (Strawberries), thịt bò băm (Beef Burgers), và ngô (Corn). Gà (Chicken) không được đề cập.",
    },
    {
      'question':
          passage161_163 +
          "\n\n162. How much do two packs of strawberries cost?",
      'options': ["\$2", "\$3", "\$6", "\$9.99"],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 7) ghi, 'Organic Strawberries: 2 packs for \$6'.",
    },
    {
      'question':
          passage161_163 +
          "\n\n163. What can customers receive if they spend \$50?",
      'options': ["Free salmon", "\$3 off", "A reusable bag", "Free delivery"],
      'correctIndex': 2,
      'explain':
          "E-mail (Passage 7) nói, 'spend \$50 or more and receive a free reusable shopping bag!'",
    },
    // Q164-167 (Webpage)
    {
      'question': passage164_167 + "\n\n164. What kind of company is hiring?",
      'options': [
        "A tech company",
        "A marketing agency",
        "A law firm",
        "An administrative service",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) là của ''Peterson & Associates Law Firm' (Công ty luật).",
    },
    {
      'question':
          passage164_167 + "\n\n165. What is mentioned as a responsibility?",
      'options': [
        "Managing client accounts",
        "Scheduling appointments",
        "Writing legal briefs",
        "Using Excel for reports", // Implied but not explicitly a responsibility
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) liệt kê 'Scheduling appointments and managing calendars' là một 'Responsibility'.",
    },
    {
      'question':
          passage164_167 + "\n\n166. What is the minimum required experience?",
      'options': ["Không yêu cầu", "1 năm", "2 năm", "5 năm"],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) ghi 'Minimum 2 years of office experience' trong phần 'Qualifications'.",
    },
    {
      'question': passage164_167 + "\n\n167. How should candidates apply?",
      'options': [
        "By calling the office",
        "By e-mailing Peterson",
        "By using the website portal",
        "By visiting the office",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) hướng dẫn, 'submit your resume via our website's career portal'.",
    },
    // Q168-171 (Form)
    {
      'question':
          passage168_171 +
          "\n\n168. What type of claim did Laura Fernandez file?",
      'options': [
        "Damaged baggage",
        "Lost baggage",
        "Delayed baggage",
        "Missing items",
      ],
      'correctIndex': 2,
      'explain':
          "Form (Passage 9) có dấu '[X]' bên cạnh 'Delayed Baggage' (Hành lý bị trễ).",
    },
    {
      'question': passage168_171 + "\n\n169. What color was the suitcase?",
      'options': ["Đen", "Bạc", "Xám", "Xanh"],
      'correctIndex': 1,
      'explain': "Mô tả túi (Passage 9) ghi 'color: Silver'.",
    },
    {
      'question': passage168_171 + "\n\n170. What did Agent K. Lee do?",
      'options': [
        "Located the bag on a later flight",
        "Filed the claim form for the passenger",
        "Gave the passenger a new bag tag",
        "Asked the passenger to wait 4 hours",
      ],
      'correctIndex': 0,
      'explain':
          "Ghi chú của nhân viên (Passage 9) nói, 'Located bag on next flight (SH 207)...'",
    },
    {
      'question': passage168_171 + "\n\n171. What will happen to the bag?",
      'options': [
        "It will be held at the airport.",
        "It will be shipped to London.",
        "It will be delivered to the passenger's hotel.",
        "It will be inspected for damage.",
      ],
      'correctIndex': 2,
      'explain':
          "Ghi chú của nhân viên (Passage 9) nói, 'Arranged for courier delivery to passenger's hotel.'",
    },
    // Q172-175 (Article)
    {
      'question': passage172_175 + "\n\n172. What is the article mainly about?",
      'options': [
        "An old library building",
        "A community art center opening",
        "Upcoming fall art classes",
        "Maria Garcia's career",
      ],
      'correctIndex': 1,
      'explain':
          "Tiêu đề và câu đầu tiên (Passage 10) thông báo 'The Riverbend Community Art Center officially opened...'",
    },
    {
      'question': passage172_175 + "\n\n173. Where is the new center located?",
      'options': [
        "On Park Street",
        "In a new building",
        "Next to city hall",
        "Near Riverbend",
      ],
      'correctIndex': 0,
      'explain':
          "Bài báo (Passage 10) nói trung tâm 'located in the renovated old library building on Park Street'.",
    },
    {
      'question': passage172_175 + "\n\n174. What is the goal of the center?",
      'options': [
        "To offer free workshops",
        "To provide affordable art education",
        "To raise private donations",
        "To renovate old buildings",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nói trung tâm 'aims to provide affordable art education for all ages.'",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. When does registration for fall classes begin?",
      'options': ["Thứ Bảy tuần trước", "Ngày 1 tháng 8", "Mùa thu", "Thứ Ba"],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nói, 'Registration for fall classes begins August 1.'",
    },

    // --- Double Passages ---

    // Q176-180 (E-mail + Webpage)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. Why did Alice Wong write the e-mail?",
      'options': [
        "To order more business cards",
        "To complain about print quality",
        "To report an error on her order",
        "To ask about the satisfaction guarantee",
      ],
      'correctIndex': 2,
      'explain':
          "Alice (Passage 1) viết, 'there is a significant typo in my e-mail address printed on the cards.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. What is the correct e-mail address?",
      'options': [
        "alice.w@email.com",
        "alice.e@email.com",
        "service@quickprinters.com",
        "Không rõ",
      ],
      'correctIndex': 0,
      'explain':
          "Alice (Passage 1) nói, 'It should read 'alice.w@email.com'...",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What does Alice Wong request?",
      'options': [
        "A refund",
        "A discount on her next order",
        "A free reprint",
        "A photo of the issue",
      ],
      'correctIndex': 2,
      'explain':
          "Alice (Passage 1) viết, 'I would like to request a reprint with the correct information at no additional charge.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. According to the webpage, when will QuickPrinters provide a free reprint?",
      'options': [
        "If the customer makes a typo",
        "If the order arrives late",
        "If the customer changes their mind",
        "If the error was made by the company",
      ],
      'correctIndex': 3,
      'explain':
          "Trang web (Passage 2) nói, 'If you are not satisfied... due to an error made by QuickPrinters..., we will reprint your order free of charge.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What is implied about the error on Alice Wong's cards?",
      'options': [
        "It was likely her mistake.",
        "It will be reprinted for free.",
        "It happened during shipping.",
        "It needs to be photographed.",
      ],
      'correctIndex': 0,
      'explain':
          "Alice (Passage 1) không nói lỗi do ai gây ra. Trang web (Passage 2) nói công ty không chịu trách nhiệm cho lỗi của khách hàng ('typos or incorrect information provided'). Vì Alice chỉ yêu cầu in lại theo 'satisfaction guarantee', có khả năng cao đây là lỗi của cô ấy khi đặt hàng, và cô ấy có thể sẽ phải trả tiền in lại.",
    },
    // Q181-185 (Memo + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What is the purpose of the memo?",
      'options': [
        "To announce the closure of Lot B",
        "To assign parking spaces",
        "To inform staff about garage cleaning",
        "To remind staff to remove vehicles",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) có chủ đề 'Parking Garage Cleaning' và thông báo về việc đóng cửa để vệ sinh.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. When will the parking garage be closed?",
      'options': ["Thứ Sáu", "Thứ Hai", "Cuối tuần", "Thứ Năm"],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) nói nhà xe sẽ đóng cửa từ 'Friday, May 12 (6:00 P.M.)' đến 'Sunday, May 14', tức là cuối tuần.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What will happen to cars left in Lot A after 6:00 P.M. on Friday?",
      'options': [
        "They will be cleaned.",
        "They will be moved to Lot B.",
        "They will be towed.",
        "They will be ticketed.",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 1) cảnh báo, 'Any vehicles remaining after this time will be towed at the owner's expense.'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Why did Kenji Tanaka write the e-mail?",
      'options': [
        "To request weekend parking",
        "To complain about towing fees",
        "To ask about parking availability",
        "To confirm the cleaning schedule",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 2) sẽ làm việc cuối tuần và hỏi, 'Will there be enough space [in Lot B]...?' Anh ấy lo lắng về việc tìm chỗ đậu xe.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What does Kenji imply about Lot B?",
      'options': [
        "It is reserved for visitors.",
        "It is usually empty on weekends.",
        "It is inconveniently located.",
        "It might not be large enough.",
      ],
      'correctIndex': 3,
      'explain':
          "Kenji (Passage 2) nói, 'Lot B is quite small. Will there be enough space...?' ngụ ý rằng nó có thể không đủ lớn.",
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
          "\n\n186. What was included as a special offer in June?",
      'options': [
        "Free shipping",
        "A \$30 discount",
        "A 1-year warranty",
        "Free replacement filters",
      ],
      'correctIndex': 3,
      'explain':
          "Quảng cáo (Passage 1) ghi 'Order by June 30 and receive a free set of replacement filters'. E-mail xác nhận (Passage 2) cũng xác nhận điều này.",
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
          "E-mail xác nhận (Passage 2) được gửi vào 'June 28'. Vì anh ấy đủ điều kiện nhận ưu đãi tháng 6 (kết thúc June 30 - Passage 1), anh ấy phải đặt hàng vào hoặc trước June 28.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What problem did David Evans report?",
      'options': [
        "The vacuum arrived late.",
        "The vacuum is too noisy.",
        "An item was missing from the order.",
        "The smartphone app does not work.",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy viết (Passage 3), 'the free replacement filters... were not included in the box.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. What information does Mr. Evans provide to identify his order?",
      'options': [
        "His address",
        "The date he received the item",
        "The shipping method",
        "His order number",
      ],
      'correctIndex': 3,
      'explain': "Anh ấy viết (Passage 3), 'My order number is SC-550.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What does Mr. Evans ask the company to do?",
      'options': [
        "Send the missing item",
        "Provide a refund",
        "Replace the vacuum",
        "Explain the warranty",
      ],
      'correctIndex': 0,
      'explain':
          "Anh ấy hỏi (Passage 3), 'Could you please arrange to have these [the filters] sent to me?'",
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
        "A new novel by Eleanor Vance",
        "Westwood library renovations",
        "An upcoming author event",
        "Limited seating availability",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) thông báo thư viện 'is excited to host an evening with best-selling... author, Ms. Eleanor Vance'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. Why did Eleanor Vance write the e-mail?",
      'options': [
        "To confirm her attendance",
        "To request a change in start time",
        "To ask for directions",
        "To cancel her appearance",
      ],
      'correctIndex': 1,
      'explain':
          "Trong e-mail (Passage 2), cô ấy giải thích về việc chuyến bay bị trễ và hỏi 'Would it be possible to push the start time of the event back by 30 minutes...?'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. What action did the library take?",
      'options': [
        "They canceled the event.",
        "They changed the event's start time.",
        "They moved the event online.",
        "They found a new speaker.",
      ],
      'correctIndex': 1,
      'explain':
          "Cập nhật trên website (Passage 3) thông báo 'the event will now begin at 7:30 P.M. instead of 7:00 P.M.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. What is the title of Ms. Vance's latest novel?",
      'options': [
        "October 18 Event",
        "The Gilded Cage",
        "Travel Issues",
        "Không được đề cập",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) nói cô ấy sẽ thảo luận về 'her latest novel, \"The Gilded Cage.\"'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What will happen after Ms. Vance's talk?",
      'options': [
        "The library will close.",
        "Books will be sold.",
        "She will answer questions.",
        "She will sign books.",
      ],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 1) nói cô ấy sẽ 'discuss her latest novel... and sign copies afterward.'",
    },
    // Q196-200 (E-mail + Invoice + E-mail)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. What service did Maria Rossi request in the first e-mail?",
      'options': [
        "Tree branch removal",
        "Weekly lawn mowing",
        "Monthly landscaping service",
        "Flower bed weeding only",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail đầu tiên (Passage 1) yêu cầu 'schedule our regular monthly landscaping service'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the invoice, when was the service performed?",
      'options': ["July 5", "July 18", "July 20", "July 25"],
      'correctIndex': 2,
      'explain': "Hóa đơn (Passage 2) ghi 'Service Date: July 20'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. Why did Maria Rossi send the third e-mail?",
      'options': [
        "To pay the invoice",
        "To schedule the next service",
        "To question an additional charge",
        "To praise the landscaping crew",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail thứ ba (Passage 3) hỏi về 'the \$150 charge for 'Tree Branch Removal'' và nói 'This service was not part of our regular monthly request... and was not pre-authorized.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What does Maria Rossi imply about the tree branch removal?",
      'options': [
        "It was unnecessary.",
        "It should have been included in the monthly package.",
        "It was done without prior approval.",
        "It cost more than expected.",
      ],
      'correctIndex': 2,
      'explain':
          "Cô ấy (Passage 3) nói dịch vụ này 'was not pre-authorized' và yêu cầu 'prior approval for additional charges like this'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What does Maria Rossi ask Cityscape Landscaping to do?",
      'options': [
        "Remove the charge or explain it",
        "Send documentation for approval",
        "Cancel future services",
        "Offer a discount",
      ],
      'correctIndex': 0,
      'explain':
          "Cô ấy (Passage 3) yêu cầu, 'Please adjust the invoice or provide justification for the extra service.'",
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
