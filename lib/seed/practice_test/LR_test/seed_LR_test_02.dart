// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest02() async {
  final db = FirebaseFirestore.instance;
  final testId = 'testLR_full_02';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 02',
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
        'order': 2,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang xem biểu đồ trên màn hình máy tính.
      // Transcript:
      // (A) He's plugging in a monitor.
      // (B) He's analyzing some data on a screen.
      // (C) He's hanging a picture on the wall.
      // (D) He's drawing a chart by hand.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'The man is looking intently at a chart on the monitor, which is accurately described as "analyzing some data on a screen".',
    },
    {
      // Image Description: Một nhóm người đang ăn tối tại một nhà hàng ngoài trời.
      // Transcript:
      // (A) People are dining at an outdoor patio.
      // (B) The tables are being cleared by a waiter.
      // (C) A chef is preparing food in a kitchen.
      // (D) People are waiting in line to be seated.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'The picture shows several people eating at tables set up outside, which is an "outdoor patio".',
    },
    {
      // Image Description: Một người phụ nữ đang xếp hàng hóa lên kệ trong siêu thị.
      // Transcript:
      // (A) She's pushing a shopping cart.
      // (B) She's paying for groceries at the checkout.
      // (C) She's stocking items on a shelf.
      // (D) She's mopping the floor of an aisle.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'The woman is taking items (likely from a box) and placing them onto the shelves, which is "stocking items".',
    },
    {
      // Image Description: Một chiếc thuyền buồm được buộc vào cầu cảng.
      // Transcript:
      // (A) A ship is sailing in the open ocean.
      // (B) A boat is secured to a dock.
      // (C) People are boarding a ferry.
      // (D) A man is fishing from a pier.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'The boat is tied with ropes to a wooden structure (a dock/pier), so it is "secured".',
    },
    {
      // Image Description: Một nhạc sĩ đang chơi đàn guitar trên sân khấu.
      // Transcript:
      // (A) A man is adjusting a microphone.
      // (B) A man is performing in front of an audience.
      // (C) A man is packing up his instrument.
      // (D) A man is playing a guitar on a stage.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 3,
      'explain':
          'The image clearly shows a man with a guitar on an elevated platform, which is a stage.',
    },
    {
      // Image Description: Một công trường xây dựng với nhiều cần cẩu.
      // Transcript:
      // (A) Cranes are operating at a construction site.
      // (B) The building is being demolished.
      // (C) Trucks are being loaded with materials.
      // (D) Workers are painting the side of a building.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'The most prominent features in the image are the large cranes on a site that is clearly under construction.',
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
      // Q7: Where's the new printer located?
      // (A) By the reception desk.
      // (B) It was delivered yesterday.
      // (C) I prefer the old one.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'The question asks "Where", so the correct response is a location.',
    },
    {
      // Q8: When does the presentation start?
      // (A) In the main conference room.
      // (B) In about ten minutes.
      // (C) It was about marketing.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The question asks "When", requiring a time. (B) provides a time frame.',
    },
    {
      // Q9: Who's responsible for the new project?
      // (A) The project is on schedule.
      // (B) Yes, it's a new one.
      // (C) I believe Michael is.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'The question asks "Who", so the answer must be a person.',
    },
    {
      // Q10: Why was the meeting postponed?
      // (A) The manager was sick.
      // (B) At 3:00 PM tomorrow.
      // (C) Yes, I'll be there.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'The question asks "Why", and (A) provides a reason.',
    },
    {
      // Q11: How do I log in to the new system?
      // (A) It's a new laptop.
      // (B) You need to reset your password first.
      // (C) About two hours ago.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The question asks "How", and (B) explains the method/process.',
    },
    {
      // Q12: Is this the right form for travel reimbursement?
      // (A) Yes, that's the one.
      // (B) I traveled by train.
      // (C) He'll be back on Friday.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is a yes/no question. (A) provides a direct confirmation.',
    },
    {
      // Q13: Would you like coffee or tea?
      // (A) I already had some.
      // (B) Coffee would be great, thanks.
      // (C) We met this morning.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'This is an alternative question. (B) chooses one of the options.',
    },
    {
      // Q14: What do you think of the new office layout?
      // (A) It's much more open.
      // (B) I'll lay it on the table.
      // (C) The office is on the fifth floor.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'The question asks for an opinion, and (A) provides one.',
    },
    {
      // Q15: You've finished the report, haven't you?
      // (A) No, I didn't see it.
      // (B) The reporter is on TV.
      // (C) I just e-mailed it to you.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'This is a tag question seeking confirmation. (C) confirms the action is complete.',
    },
    {
      // Q16: How many people are coming to the workshop?
      // (A) The shop is on Main Street.
      // (B) It works very well.
      // (C) We're expecting about fifty.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'The question asks "How many", so the answer should be a number or quantity.',
    },
    {
      // Q17: Why don't we review the sales figures now?
      // (A) That's a good idea.
      // (B) I bought it on sale.
      // (C) He reviews them every day.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is a suggestion. (A) is a common way to agree to a suggestion.',
    },
    {
      // Q18: Has the client approved the design?
      // (A) It's a new design.
      // (B) Yes, she sent her approval this morning.
      // (C) The client is from Singapore.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'This is a yes/no question about a specific action. (B) answers it directly.',
    },
    {
      // Q19: Could you turn down the volume, please?
      // (A) Oh, sorry. Is this better?
      // (B) I'll be back down in a minute.
      // (C) It's a new volume of the encyclopedia.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is a request. (A) is a polite and logical response to the request.',
    },
    {
      // Q20: The new software is really complicated.
      // (A) I agree. The training was too short.
      // (B) No, it's not soft at all.
      // (C) Please complete the form.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is a statement of opinion. (A) agrees with the statement and adds a related comment.',
    },
    {
      // Q21: What time is your flight to Tokyo?
      // (A) It was a very pleasant flight.
      // (B) It departs at 8:00 P.M.
      // (C) No, I'm driving there.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The question asks "What time", and (B) provides a specific time.',
    },
    {
      // Q22: Didn't you get my e-mail?
      // (A) I'll send it tomorrow.
      // (B) No, let me check my inbox.
      // (C) The mail comes at noon.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'This is a negative question. (B) directly answers it.',
    },
    {
      // Q23: Whose briefcase is this?
      // (A) It's a brief meeting.
      // (B) Oh, that's mine. Thanks.
      // (C) No, I can't.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain': 'The question asks "Whose", and (B) identifies the owner.',
    },
    {
      // Q24: How far is the hotel from the train station?
      // (A) It's just a five-minute walk.
      // (B) I trained for three months.
      // (C) The hotel was very expensive.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'The question asks "How far" (distance), and (A) provides an answer in terms of walking time.',
    },
    {
      // Q25: Should I reserve the room for 2:00 or 3:00?
      // (A) The room is on the left.
      // (B) Yes, you should.
      // (C) 3:00 is better for me.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'This is an alternative-choice question. (C) chooses one of the options.',
    },
    {
      // Q26: When will the building repairs be finished?
      // (A) A pair of new shoes.
      // (B) The architect is from Canada.
      // (C) By the end of next month.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain': 'The question asks "When", and (C) gives a future deadline.',
    },
    {
      // Q27: I'd like to return this shirt.
      // (A) It's a very nice shirt.
      // (B) Certainly, is there anything wrong with it?
      // (C) I'll turn it in tomorrow.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'This is a request from a customer. (B) is a standard response from a sales assistant.',
    },
    {
      // Q28: How often does the committee meet?
      // (A) They're meeting in the boardroom.
      // (B) It was a short meeting.
      // (C) Once every two weeks.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 2,
      'explain':
          'The question asks "How often" (frequency), and (C) provides a frequency.',
    },
    {
      // Q29: Do you want to join us for lunch?
      // (A) I'd love to, but I have another commitment.
      // (B) I launched the new product.
      // (C) It was a very long lunch.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': 'This is an invitation. (A) is a polite way to decline.',
    },
    {
      // Q30: What's the topic of the seminar?
      // (A) On the top shelf.
      // (B) It's about personal finance.
      // (C) No, I didn't see it.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 1,
      'explain':
          'The question asks "What\'s the topic", and (B) provides the subject.',
    },
    {
      // Q31: Have you ordered the new monitors?
      // (A) Yes, they should arrive on Friday.
      // (B) I'm monitoring the situation.
      // (C) The new restaurant is open.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain':
          'This is a yes/no question about a task. (A) confirms the task is done and provides extra info.',
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
(Man) Hi, I'm calling to check on the status of my order. I bought a bookshelf from your website last week, order number 45B.
(Woman) Let me check that for you. 45B... Ah, yes, Mr. Harris. It looks like your order has been processed and is scheduled for delivery this Friday.
(Man) Oh, Friday? The website said delivery within three business days.
(Woman) I apologize for the delay. We've had an unexpectedly high volume of orders. As compensation, I can waive the delivery fee for you.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Woman) Ken, do you have a minute to talk about the team-building event?
(Man) Sure, Sarah. What's on your mind? I was just looking at the catering proposals.
(Woman) I'm concerned about the date. We have it scheduled for the 15th, but I just realized that's the same day the quarterly budget is due.
(Man) You're right. That's not going to work. Let's look at the following weekend, maybe the 22nd. I'll check the venue's availability.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Man) Excuse me, I think I left my wallet at this table about 20 minutes ago. Has anyone turned one in?
(Woman) Not that I'm aware of. I just started my shift. Let me ask my manager. What does it look like?
(Man) It's a brown leather wallet with a small silver money clip on the side.
(Woman) Okay, I'll check with my manager in the back office. Please wait here.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Woman) I've finished drafting the press release for the new product launch.
(Man) Great. I'm excited about this new software. Did you include the quotes from our CEO?
(Woman) Yes, and I also highlighted the new features, especially the mobile integration. I'm about to send it to the legal department for review.
(Man) Perfect. Once they approve it, please send it out to our media contacts immediately.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Man) The new automated phone system is... frustrating. I keep getting complaints from clients.
(Woman) I've noticed that too. They say it's too complicated and they can never reach a real person.
(Man) Exactly. I think we need to simplify the menu options. We should only have three or four main choices.
(Woman) I agree. I'll schedule a meeting with the IT department to see what changes we can make.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Woman) Hi, I'd like to sign up for a membership. I'm interested in your yoga classes.
(Man) Welcome! We have two main membership options. The 'Basic' plan includes access to the gym equipment, and the 'Premium' plan includes all group classes, like yoga and spinning.
(Woman) The 'Premium' plan sounds good. Do you offer a discount for new members?
(Man) Yes, if you sign up today, we can give you 20% off your first three months.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Man) We're almost out of printer paper in the sales department.
(Woman) Already? I just ordered a box last week. How much are we using?
(Man) A lot. We've been printing out all the training manuals. But I think that's the last batch.
(Woman) Okay, I'll put in another order, but let's try to use double-sided printing to cut down on waste. I'll send out a memo.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Woman) The client feedback on the new advertising campaign has been fantastic! They loved the slogan.
(Man) That's wonderful to hear. It was a real team effort. Did they have any revisions?
(Woman) Just one minor change. They want to use a different photo for the magazine ad. The one they chose is in the shared drive.
(Man) No problem. I can make that swap easily. I'll send you the revised version by end of day.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Man) Hi, I'm here for the 2:00 P.M. interview with Ms. Rodriguez.
(Woman) Welcome. I see your name on the schedule. You're Mr. Chen, correct? For the graphic designer position?
(Man) No, that's not right. My name is James Chen, and I'm here for the Marketing Manager position.
(Woman) Oh, my apologies. Let me check the full schedule. Ah, yes. You're meeting with Mr. Davies in Room 3B, not Ms. Rodriguez. She is interviewing the designer in 3A. Let me show you the way.
---
**Interview Schedule - Room 3A**
- 1:00 PM: Jane Smith (Designer)
- 2:00 PM: David Lee (Designer)
- 3:00 PM: Anna Kim (Designer)

**Interview Schedule - Room 3B**
- 2:00 PM: James Chen (Marketing)
- 3:00 PM: Mark Owen (Marketing)
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Woman) I'm trying to book my flight for the conference in Chicago, but the company travel portal is down.
(Man) Oh, right. They're doing system maintenance until 1 P.M. today. I got an e-mail about it.
(Woman) I must have missed that. I need to book this flight soon, or the price will go up.
(Man) The e-mail said if it's urgent, we should call the travel agency directly. Their number is in the e-mail. I can forward it to you.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Man) We need to finalize the guest speaker for our annual banquet. Have you had any luck?
(Woman) I reached out to Maria pacing, the author, but she's unavailable. However, her agent suggested Dr. Alan Ray, an economist.
(Man) An economist? I'm not sure that fits our theme of 'Innovation in Technology'.
(Woman) I thought so, too. But apparently, he wrote a book on the economics of artificial intelligence. It could be very relevant. I have his speaker reel.
""";

  // --- Conversation 12: Questions 65-67 (with Inference) ---
  final transcript65_67 = """
(Woman) I just finished inspecting the new apartment units on the fifth floor. They look great.
(Man) How's the new cleaning crew doing? Are they better than the last one?
(Woman) Much better. The kitchens are spotless and the carpets are clean. They didn't miss anything. They're ready for the new tenants to move in tomorrow.
(Man) Excellent. That's a relief. I'll approve their invoice right away.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Man) My computer keeps freezing. This is the third time this morning.
(Woman) That's not good. Did you try restarting it?
(Man) Yes, but it only helps for about ten minutes. I'm worried I'm going to lose the budget file I'm working on.
(Woman) You should call the help desk. Their extension is 5-5-5. In the meantime, try to save your file to the network drive every few minutes.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "Why is the man calling?",
      'options': [
        "To purchase a bookshelf",
        "To check on a delivery",
        "To change his delivery address",
        "To complain about a product",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'I'm calling to check on the status of my order.'",
    },
    {
      'question': "When was the delivery originally expected?",
      'options': [
        "In three business days",
        "On Friday",
        "Last week",
        "In a month",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'The website said delivery within three business days.'",
    },
    {
      'question': "What does the woman offer to do?",
      'options': [
        "Cancel the order",
        "Offer a free gift",
        "Refund the delivery fee",
        "Schedule an earlier delivery",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'As compensation, I can waive the delivery fee for you.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What are the speakers mainly discussing?",
      'options': [
        "A catering proposal",
        "A budget deadline",
        "A team-building event",
        "A venue's availability",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> The woman starts by saying, 'do you have a minute to talk about the team-building event?'",
    },
    {
      'question': "What is the woman's concern about the 15th?",
      'options': [
        "The venue is not available.",
        "The catering is too expensive.",
        "It conflicts with a work deadline.",
        "The team will be on vacation.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> She says, 'that's the same day the quarterly budget is due.'",
    },
    {
      'question': "What will the man do next?",
      'options': [
        "Submit the budget",
        "Contact the catering company",
        "Cancel the event",
        "Check a venue's schedule",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'I'll check the venue's availability' for the new date.",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "Why is the man at the restaurant?",
      'options': [
        "To order a meal",
        "To meet a colleague",
        "To apply for a job",
        "To look for a lost item",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'I think I left my wallet at this table...'",
    },
    {
      'question': "What does the wallet look like?",
      'options': [
        "It is black with a zipper.",
        "It is brown with a money clip.",
        "It is new and has a logo.",
        "It is small and red.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man describes it as 'a brown leather wallet with a small silver money clip'.",
    },
    {
      'question': "What will the woman do next?",
      'options': [
        "Serve the man some water",
        "Look under the table",
        "Call the man later",
        "Speak to her manager",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript38_40 \n\n=> The woman says, 'Let me ask my manager. ... I'll check with my manager in the back office.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What have the speakers been working on?",
      'options': [
        "A new software product",
        "A press release",
        "A legal document",
        "A mobile application",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'I've finished drafting the press release...'",
    },
    {
      'question': "What feature did the woman highlight?",
      'options': [
        "The price",
        "The CEO's quotes",
        "The mobile integration",
        "The launch date",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'I also highlighted the new features, especially the mobile integration.'",
    },
    {
      'question': "What is the next step for the document?",
      'options': [
        "It will be sent to the CEO.",
        "It will be reviewed by the legal department.",
        "It will be sent to media contacts.",
        "It will be published on the website.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'I'm about to send it to the legal department for review.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What product are the speakers discussing?",
      'options': [
        "A new phone",
        "A software update",
        "An automated phone system",
        "A company website",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'The new automated phone system is... frustrating.'",
    },
    {
      'question': "What problem do clients have?",
      'options': [
        "They are being overcharged.",
        "They cannot find the company's number.",
        "The audio quality is poor.",
        "They find it difficult to reach a person.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'they can never reach a real person.'",
    },
    {
      'question': "What does the woman suggest doing?",
      'options': [
        "Hiring more staff",
        "Scheduling a meeting with IT",
        "Sending an e-mail to clients",
        "Replacing the system",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'I'll schedule a meeting with the IT department...'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What is the woman interested in?",
      'options': [
        "Gym equipment",
        "Personal training",
        "Group classes",
        "A spa treatment",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The woman says, 'I'm interested in your yoga classes,' which are group classes.",
    },
    {
      'question': "What is included in the 'Premium' plan?",
      'options': [
        "Gym access and group classes",
        "Only yoga classes",
        "Gym access and personal training",
        "Only spinning classes",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript47_49 \n\n=> The man says the 'Premium' plan 'includes all group classes, like yoga and spinning' and implies it also includes what the 'Basic' plan has (gym equipment).",
    },
    {
      'question': "What special offer does the man mention?",
      'options': [
        "A free personal training session",
        "A discount on the first few months",
        "A free gym bag",
        "A waiver of the registration fee",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> He says, 'we can give you 20% off your first three months.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What supply is the sales department low on?",
      'options': [
        "Training manuals",
        "Ink cartridges",
        "Printer paper",
        "Envelopes",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man says, 'We're almost out of printer paper...'",
    },
    {
      'question': "Why has so much of the supply been used?",
      'options': [
        "There was a large mailing.",
        "Training manuals were printed.",
        "The paper was the wrong size.",
        "There was a printer malfunction.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man explains, 'We've been printing out all the training manuals.'",
    },
    {
      'question': "What will the woman recommend in a memo?",
      'options': [
        "Ordering supplies less often",
        "Using digital copies of documents",
        "Printing on both sides of the paper",
        "Using a different printer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'let's try to use double-sided printing... I'll send out a memo.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A team effort",
        "A company budget",
        "A new slogan",
        "Feedback on an ad campaign",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript53_55 \n\n=> The woman starts, 'The client feedback on the new advertising campaign has been fantastic!'",
    },
    {
      'question': "What change did the client request?",
      'options': [
        "Use a different slogan",
        "Change a photograph",
        "Revise the budget",
        "Correct a spelling error",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The woman says, 'They want to use a different photo for the magazine ad.'",
    },
    {
      'question': "What will the man do by the end of the day?",
      'options': [
        "Call the client",
        "Choose a new slogan",
        "Send a revised file",
        "Meet with the team",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'I'll send you the revised version by end of day.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "Why is Mr. Chen at the company?",
      'options': [
        "To meet Ms. Rodriguez",
        "To fix a computer",
        "For a job interview",
        "To deliver a package",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'I'm here for the 2:00 P.M. interview...'",
    },
    {
      'question':
          "Look at the graphic. What position is David Lee interviewing for?",
      'options': [
        "Designer",
        "Marketing Manager",
        "The graphic does not say",
        "Assistant",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> The schedule for Room 3A shows '2:00 PM: David Lee (Designer)'.",
    },
    {
      'question': "Look at the graphic. Who will Mr. Chen be meeting with?",
      'options': ["Ms. Rodriguez", "Mr. Davies", "David Lee", "Anna Kim"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The woman corrects herself and says, 'You're meeting with Mr. Davies in Room 3B'. The graphic confirms the Marketing interview is in 3B.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What problem is the woman having?",
      'options': [
        "She cannot find a flight.",
        "A company portal is not working.",
        "A flight is too expensive.",
        "She missed an e-mail.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'the company travel portal is down.'",
    },
    {
      'question': "Why is the portal unavailable?",
      'options': [
        "It is being updated.",
        "The woman forgot her password.",
        "It is after business hours.",
        "The conference was canceled.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript59_61 \n\n=> The man says, 'They're doing system maintenance...'",
    },
    {
      'question': "What does the man offer to do?",
      'options': [
        "Book the flight for the woman",
        "Restart the portal",
        "Send the woman an e-mail",
        "Drive the woman to the airport",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The man says, 'Their number is in the e-mail. I can forward it to you.'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "What are the speakers trying to do?",
      'options': [
        "Write a book",
        "Organize a banquet",
        "Develop new technology",
        "Schedule a meeting",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'We need to finalize the guest speaker for our annual banquet.'",
    },
    {
      'question': "Why might Dr. Ray be a suitable speaker?",
      'options': [
        "He is an expert on technology.",
        "He is a famous author.",
        "He wrote a relevant book.",
        "He is recommended by Maria Pacing.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman says he 'wrote a book on the economics of artificial intelligence. It could be very relevant' to their technology theme.",
    },
    {
      'question': "What does the woman have?",
      'options': [
        "Dr. Ray's phone number",
        "A copy of Dr. Ray's book",
        "A video of Dr. Ray speaking",
        "A list of other speakers",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'I have his speaker reel.' A speaker reel is a video compilation.",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "Who most likely are the speakers?",
      'options': [
        "Cleaning staff",
        "Property managers",
        "New tenants",
        "Construction workers",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> They are discussing 'apartment units', 'cleaning crew', and 'new tenants', which are all responsibilities of property managers.",
    },
    {
      'question': "What does the woman say about the cleaning crew?",
      'options': [
        "They missed a few spots.",
        "They were very thorough.",
        "They finished late.",
        "They charged too much.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says they are 'Much better', 'spotless', and 'didn't miss anything.'",
    },
    {
      'question': "What will the man probably do next?",
      'options': [
        "Hire a new crew",
        "Inspect the apartments",
        "Meet the new tenants",
        "Authorize a payment",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript65_67 \n\n=> The man says, 'I'll approve their invoice right away,' which means authorizing a payment.",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the man's problem?",
      'options': [
        "He cannot find a file.",
        "His computer is not working properly.",
        "He lost the budget report.",
        "He doesn't know an extension.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'My computer keeps freezing.'",
    },
    {
      'question': "What is the man worried about?",
      'options': [
        "Missing a meeting",
        "Losing his work",
        "Being late for a call",
        "Forgetting his password",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> He says, 'I'm worried I'm going to lose the budget file I'm working on.'",
    },
    {
      'question': "What does the woman advise the man to do?",
      'options': [
        "Buy a new computer",
        "Stop working on the budget",
        "E-mail his file to her",
        "Contact the help desk",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript68_70 \n\n=> The woman says, 'You should call the help desk.'",
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
          'explain': q['explain'],
          'order': questionNumber,
        });
  }

  // // === PART 4 === LISTENING (Talks)
  // Total 30 Questions (10 Talks x 3 Questions)

  // --- Talk 1: Questions 71-73 (Radio Advertisement) ---
  final transcript71_73 = """
Good morning, commuters! Are you looking for a better cup of coffee on your way to work? Then stop by 'The Daily Grind', located just outside the Central Train Station on Park Avenue. We open at 6 A.M. every weekday. We proudly serve locally roasted beans and fresh pastries baked in-house. For this week only, show your train pass when you order any large drink and get a free croissant or muffin. That's 'The Daily Grind' on Park Avenue. Start your morning off right!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
Attention all passengers. This is a gate change announcement for flight 580 to Vancouver. This flight was originally scheduled to depart from Gate A12. We will now be boarding at Gate C30. We apologize for the last-minute change. The boarding time remains the same at 4:30 P.M. Please proceed to Gate C30 at this time. Thank you.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
Thanks for coming everyone. The main reason for this meeting is to discuss our quarterly sales figures. As you all can see from the chart, our sales in the Northeast region have been excellent. However, performance in the Southern region has dropped by 15%. This is a significant concern. I want us to focus on why this is happening and what we can do to fix it. I'd like to hear from the Southern sales team first. What challenges are you facing?
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling the City Museum of Art. Our hours are Tuesday through Sunday, 10 a.m. to 6 p.m. We are closed on Mondays. Admission is \$20 for adults and \$15 for seniors and students. Tickets can be purchased online at our website, cityart.org, or at the admissions desk. The special 'Modern Photography' exhibit is closing this Sunday. For information about group tours, please press one. To speak to a staff member, please press zero or stay on the line.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome to the historical city of Kingston. My name is Alex, and I'll be your guide for this walking tour. We'll begin here at the town square and make our way down to the waterfront. This tour will take about 90 minutes. I'll be pointing out several important landmarks, including the old post office and the founder's statue. Please stay together and don't hesitate to ask questions. After the tour, I'll be happy to recommend some great local restaurants for lunch.
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
Good morning. In this presentation, I'm going to outline our new social media marketing strategy. Our primary goal is to increase engagement with customers under the age of 30. To do this, we will be focusing less on traditional platforms and more on new video-based apps. We've allocated an increased budget for creating short, professional videos. After my presentation, our new social media coordinator, Jenna, will show you some examples of the content we plan to produce.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
This is 99.5 FM with the local news. The City Council has just approved a plan to build a new public library in the downtown area. The project, which is budgeted at 10 million dollars, will replace the current library on Elm Street. Construction is set to begin this spring and is expected to take two years. The new building will feature a larger children's section, a computer lab, and a community meeting hall. More details will be made available at the mayor's press conference this Friday.
""";

  // --- Talk 8: Questions 92-94 (Factory Safety Briefing) ---
  final transcript92_94 = """
Before we begin the tour of the factory floor, I must go over some important safety rules. First, everyone must wear these safety goggles at all times. Second, please stay within the yellow painted walkways. Do not, under any circumstances, touch any of the machinery. Some of it is automated and can start without warning. Finally, this is a loud environment, so I'll be using this headset to speak to you. If you can't hear me, please raise your hand.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Hello, everyone, and welcome to the annual Innovate Conference. Please take a look at the schedule in your program. We're about to begin our opening keynote by Dr. Evans in this room, the main hall. I want to draw your attention to one change. The 11 A.M. workshop, 'Future of AI', was so popular that we've moved it from Room 20A to the Grand Ballroom to accommodate the larger audience. Room 20A will now host the 'Data Security' panel instead. Enjoy the conference.
---
**Innovate Conference - Morning Schedule**
- 9:00 AM: Opening Keynote (Main Hall)
- 11:00 AM: Workshop: Future of AI (Room 20A)
- 11:00 AM: Panel: Data Security (Room 20B)
- 11:00 AM: Lecture: Cloud Computing (Grand Ballroom)
""";

  // --- Talk 10: Questions 98-100 (Weather Forecast) ---
  final transcript98_100 = """
And now for your weekend weather. If you have outdoor plans for Saturday, you're in luck. We're expecting clear skies and warm temperatures, with a high of 75 degrees. However, a cold front will be moving in late Saturday night, bringing heavy rain and strong winds. The rain will continue all day on Sunday, and temperatures will drop to a chilly 55 degrees. The storm should clear out by Monday morning, just in time for the start of the work week.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What type of business is being advertised?",
      'options': [
        "A train station",
        "A bakery",
        "A coffee shop",
        "A grocery store",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> The ad is for 'The Daily Grind' and mentions 'cup of coffee' and 'locally roasted beans'.",
    },
    {
      'question': "Where is the business located?",
      'options': [
        "Inside the train station",
        "On Park Avenue",
        "Across from a bakery",
        "At the commuter lounge",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> The speaker says it's 'located just outside the Central Train Station on Park Avenue.'",
    },
    {
      'question': "How can customers get a free pastry?",
      'options': [
        "By ordering a large drink",
        "By visiting on a weekday",
        "By showing a train pass",
        "By buying locally roasted beans",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> The ad says, 'show your train pass when you order any large drink and get a free croissant or muffin.' Showing the pass is the key action.",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What is the purpose of the announcement?",
      'options': [
        "To announce a flight delay",
        "To change a departure gate",
        "To cancel a flight",
        "To call passengers for boarding",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> The speaker says, 'This is a gate change announcement...'",
    },
    {
      'question': "What is the flight's destination?",
      'options': [
        "Gate A12",
        "Gate C30",
        "Vancouver",
        "The announcement does not say",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> The announcement is for 'flight 580 to Vancouver.'",
    },
    {
      'question': "What will happen at 4:30 P.M.?",
      'options': [
        "The flight will depart.",
        "The gate will change again.",
        "Boarding will begin.",
        "The flight will be canceled.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> The speaker says, 'The boarding time remains the same at 4:30 P.M.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of the meeting?",
      'options': [
        "Regional sales performance",
        "A new marketing chart",
        "Hiring a new sales team",
        "Challenges in the Northeast region",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript77_79 \n\n=> The speaker says, 'The main reason for this meeting is to discuss our quarterly sales figures' and then contrasts two regions.",
    },
    {
      'question': "What does the speaker say about the Southern region?",
      'options': [
        "It has exceeded its goals.",
        "It needs a new manager.",
        "Its sales have declined.",
        "It is facing new competition.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> The speaker states, 'performance in the Southern region has dropped by 15%.'",
    },
    {
      'question': "Who will most likely speak next?",
      'options': [
        "The head of marketing",
        "A representative from the Southern region",
        "A new employee",
        "The CEO",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> The speaker concludes by saying, 'I'd like to hear from the Southern sales team first.'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What are the museum's hours on a Sunday?",
      'options': [
        "It is closed.",
        "10 a.m. to 6 p.m.",
        "10 a.m. to 9 p.m.",
        "9 a.m. to 5 p.m.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> The message states, 'Our hours are Tuesday through Sunday, 10 a.m. to 6 p.m.'",
    },
    {
      'question':
          "What does the speaker say about the 'Modern Photography' exhibit?",
      'options': [
        "It requires a separate ticket.",
        "It is opening this weekend.",
        "It is closing soon.",
        "It is located online.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> The speaker says the exhibit 'is closing this Sunday.'",
    },
    {
      'question': "How can a listener buy tickets in advance?",
      'options': [
        "By pressing one",
        "By pressing zero",
        "By visiting the museum's website",
        "By e-mailing the museum",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> The message says, 'Tickets can be purchased online at our website, cityart.org...'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Who is the speaker?",
      'options': [
        "A city mayor",
        "A tour guide",
        "A restaurant owner",
        "A museum curator",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> The speaker says, 'My name is Alex, and I'll be your guide for this walking tour.'",
    },
    {
      'question': "How long will the tour last?",
      'options': [
        "30 minutes",
        "60 minutes",
        "90 minutes",
        "120 minutes (2 hours)",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> The speaker says, 'This tour will take about 90 minutes.'",
    },
    {
      'question': "What will the speaker do after the tour?",
      'options': [
        "Point out the post office",
        "Give restaurant recommendations",
        "Take questions from the group",
        "Lead a tour of the waterfront",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> The speaker says, 'After the tour, I'll be happy to recommend some great local restaurants for lunch.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the main goal of the new strategy?",
      'options': [
        "To increase engagement with a younger audience",
        "To reduce the marketing budget",
        "To create new traditional ads",
        "To hire a new coordinator",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript86_88 \n\n=> The speaker says, 'Our primary goal is to increase engagement with customers under the age of 30.'",
    },
    {
      'question': "What will the company focus on?",
      'options': [
        "Radio advertisements",
        "Video-based apps",
        "Traditional platforms",
        "Customer surveys",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> The speaker states, 'we will be focusing... more on new video-based apps.'",
    },
    {
      'question': "Who is Jenna?",
      'options': [
        "The head of marketing",
        "A new client",
        "The social media coordinator",
        "A video producer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> The speaker introduces 'our new social media coordinator, Jenna...'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What did the City Council just approve?",
      'options': [
        "A new budget",
        "A new park",
        "A new library",
        "A new community hall",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> The report states, 'The City Council has just approved a plan to build a new public library...'",
    },
    {
      'question': "What is mentioned about the new building?",
      'options': [
        "It will cost 10 million dollars.",
        "It will be on Elm Street.",
        "It will be built this year.",
        "It will replace a computer lab.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript89_91 \n\n=> The report says, 'The project, which is budgeted at 10 million dollars...'",
    },
    {
      'question': "When will more information be available?",
      'options': ["This spring", "In two years", "On the radio", "On Friday"],
      'correctIndex': 3,
      'explain':
          "$transcript89_91 \n\n=> The report concludes, 'More details will be made available at the mayor's press conference this Friday.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is the main purpose of this talk?",
      'options': [
        "To explain safety rules",
        "To demonstrate how to use machinery",
        "To introduce the tour guide",
        "To describe the factory's products",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript92_94 \n\n=> The speaker says, 'I must go over some important safety rules.'",
    },
    {
      'question': "What must everyone wear?",
      'options': ["A hard hat", "Safety goggles", "Gloves", "A headset"],
      'correctIndex': 1,
      'explain':
          "$transcript92_94 \n\n=> The speaker says, 'everyone must wear these safety goggles at all times.'",
    },
    {
      'question': "Why are listeners forbidden from touching the machinery?",
      'options': [
        "It is very loud.",
        "It is painted.",
        "It can start automatically.",
        "It is very valuable.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> The speaker warns, 'Some of it is automated and can start without warning.'",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. Where was the 'Data Security' panel originally scheduled?",
      'options': ["Main Hall", "Room 20A", "Room 20B", "Grand Ballroom"],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> The original schedule shows 'Panel: Data Security (Room 20B)'.",
    },
    {
      'question':
          "Look at the graphic. Which event was moved to the Grand Ballroom?",
      'options': [
        "Opening Keynote",
        "Future of AI",
        "Data Security",
        "Cloud Computing",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript95_97 \n\n=> The speaker says, 'The 11 A.M. workshop, 'Future of AI',... we've moved it from Room 20A to the Grand Ballroom.'",
    },
    {
      'question': "Why was this change made?",
      'options': [
        "The speaker was late.",
        "There was a technical problem.",
        "To accommodate a large crowd.",
        "The 'Cloud Computing' lecture was canceled.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> The speaker says it was moved 'to accommodate the larger audience.'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What will the weather be like on Saturday?",
      'options': [
        "Rainy and windy",
        "Cold and cloudy",
        "Clear and warm",
        "Chilly and wet",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> The forecast says Saturday will have 'clear skies and warm temperatures, with a high of 75 degrees.'",
    },
    {
      'question': "When will the weather get worse?",
      'options': [
        "Saturday morning",
        "Saturday night",
        "Sunday night",
        "Monday morning",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> The speaker says, 'a cold front will be moving in late Saturday night...'",
    },
    {
      'question': "What is forecast for Sunday?",
      'options': [
        "Heavy rain",
        "Clear skies",
        "Warm temperatures",
        "The start of the work week",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript98_100 \n\n=> The forecast states, 'The rain will continue all day on Sunday...'",
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
          'explain': q['explain'],
          'order': questionNumber,
        });
  }

  // =====================================================================
  // ========================== READING SECTION ==========================
  // =================================0====================================

  // // === PART 5: Incomplete Sentences === (30 Questions)
  final part5Questions = [
    {
      'question':
          "Ms. Tanaka has ______ decided to transfer to the London office.",
      'options': ['finally', 'final', 'finalize', 'finality'],
      'correctIndex': 0,
      'explain':
          'The sentence needs an adverb ("finally") to modify the verb "has decided".',
    },
    {
      'question':
          "The new software makes it easier ______ track of employee vacations.",
      'options': ['to keep', 'keeping', 'kept', 'keep'],
      'correctIndex': 0,
      'explain':
          'The structure "make it easier to do something" requires the infinitive "to keep".',
    },
    {
      'question':
          "______ the bad weather, the annual company picnic has been postponed.",
      'options': ['Despite', 'Although', 'Because', 'Due to'],
      'correctIndex': 3,
      'explain':
          '"Due to" is a preposition used to show a cause, followed by a noun phrase ("the bad weather").',
    },
    {
      'question':
          "All employees are required to attend the ______ safety training session.",
      'options': ['mandate', 'mandatory', 'mandating', 'mandated'],
      'correctIndex': 1,
      'explain':
          'The sentence needs an adjective ("mandatory") to describe the noun "training session".',
    },
    {
      'question':
          "The flight to Singapore will be departing ______ Gate 22B at 8:00 P.M.",
      'options': ['from', 'on', 'at', 'with'],
      'correctIndex': 0,
      'explain':
          'The preposition "from" is used with "departing" to indicate the origin or starting point.',
    },
    {
      'question': "Please review the contract ______ before you sign it.",
      'options': ['careful', 'carefulness', 'care', 'carefully'],
      'correctIndex': 3,
      'explain':
          'The sentence needs an adverb ("carefully") to modify the verb "review".',
    },
    {
      'question': "The new CEO is much more ______ than the previous one.",
      'options': ['approach', 'approachable', 'approached', 'approaching'],
      'correctIndex': 1,
      'explain':
          'The adjective "approachable" (friendly, easy to talk to) is needed to describe the CEO.',
    },
    {
      'question':
          "You can find the report ______ on the shared network drive or on the company portal.",
      'options': ['either', 'both', 'neither', 'so'],
      'correctIndex': 0,
      'explain':
          'The correlative conjunction "either... or..." is used to present two options.',
    },
    {
      'question': "Our team worked ______ to meet the project deadline.",
      'options': ['diligence', 'diligent', 'diligently', 'most diligent'],
      'correctIndex': 2,
      'explain':
          'The adverb "diligently" ( chăm chỉ) is needed to describe how the team "worked".',
    },
    {
      'question':
          "The person ______ is chosen for the job will need to have five years of experience.",
      'options': ['who', 'which', 'whose', 'what'],
      'correctIndex': 0,
      'explain': 'The relative pronoun "who" is used to refer to "The person".',
    },
    {
      'question':
          "The marketing campaign was successful, ______ in a 20% increase in sales.",
      'options': ['result', 'results', 'resulting', 'resulted'],
      'correctIndex': 2,
      'explain':
          'The participle "resulting" is used to introduce the outcome of the campaign.',
    },
    {
      'question': "This coupon is ______ only at participating locations.",
      'options': ['valid', 'value', 'validate', 'validity'],
      'correctIndex': 0,
      'explain':
          'The adjective "valid" (hợp lệ) is needed after the verb "is".',
    },
    {
      'question': "We must reduce our ______ on a single supplier.",
      'options': ['rely', 'reliable', 'reliability', 'reliance'],
      'correctIndex': 3,
      'explain':
          'The sentence needs a noun ("reliance") after the adjective "our". "Reliance on" means sự phụ thuộc vào.',
    },
    {
      'question':
          "______ the merger is complete, the new company will be the largest in the industry.",
      'options': ['Once', 'Yet', 'While', 'Still'],
      'correctIndex': 0,
      'explain':
          '"Once" (một khi) is used as a conjunction to mean "as soon as" or "after".',
    },
    {
      'question': "The manager was very ______ of the team's efforts.",
      'options': ['appreciate', 'appreciative', 'appreciated', 'appreciation'],
      'correctIndex': 1,
      'explain':
          'The adjective "appreciative" (biết ơn, trân trọng) is needed to describe the manager.',
    },
    {
      'question': "All new employees receive training ______ company policy.",
      'options': ['on', 'at', 'for', 'with'],
      'correctIndex': 0,
      'explain':
          'The preposition "on" is used here to mean "about" or "concerning" a specific topic.',
    },
    {
      'question':
          "The new building will be ______ to the old one via a covered walkway.",
      'options': ['connect', 'connecting', 'connected', 'connection'],
      'correctIndex': 2,
      'explain': 'The passive voice "will be connected" is needed here.',
    },
    {
      'question':
          "Sales have increased ______ since the new ad campaign began.",
      'options': ['consider', 'considerate', 'considerably', 'consideration'],
      'correctIndex': 2,
      'explain':
          'The adverb "considerably" (đáng kể) is needed to modify the verb "have increased".',
    },
    {
      'question':
          "The restaurant is popular ______ its high-quality food and excellent service.",
      'options': ['because of', 'although', 'in spite of', 'as'],
      'correctIndex': 0,
      'explain':
          '"Because of" is a preposition used to show the reason, followed by a noun phrase.',
    },
    {
      'question':
          "Mr. Lee ______ for the company for ten years before he retired.",
      'options': ['works', 'has worked', 'had worked', 'is working'],
      'correctIndex': 2,
      'explain':
          'The past perfect "had worked" is used to describe an action that was completed before another action in the past (he retired).',
    },
    {
      'question': "The ______ of the new factory will begin next month.",
      'options': ['construct', 'constructive', 'construction', 'constructed'],
      'correctIndex': 2,
      'explain':
          'The sentence needs a noun ("construction") to be the subject of the verb "will begin".',
    },
    {
      'question':
          "Customers with inquiries ______ their accounts should visit the service desk.",
      'options': ['regarding', 'regards', 'regarded', 'disregard'],
      'correctIndex': 0,
      'explain':
          '"Regarding" (liên quan đến) is a preposition used to introduce a topic.',
    },
    {
      'question':
          "The hotel offers a wide range of ______ including a pool and a fitness center.",
      'options': ['amenities', 'commands', 'payments', 'statements'],
      'correctIndex': 0,
      'explain':
          '"Amenities" (tiện nghi) are features that provide comfort or convenience, like a pool or gym.',
    },
    {
      'question':
          "______ the CEO was impressed with the presentation, she still had some concerns.",
      'options': ['Because', 'Therefore', 'Unless', 'Although'],
      'correctIndex': 3,
      'explain':
          '"Although" (mặc dù) is a conjunction used to show a contrast.',
    },
    {
      'question': "This product is ______ to all others on the market.",
      'options': ['superior', 'supervise', 'superfluous', 'superbly'],
      'correctIndex': 0,
      'explain':
          'The adjective "superior" (vượt trội, tốt hơn) is used with the preposition "to".',
    },
    {
      'question':
          "Please return the signed contract ______ 5:00 P.M. on Friday.",
      'options': ['by', 'until', 'since', 'at'],
      'correctIndex': 0,
      'explain':
          '"By" is used to indicate a deadline (trước, hoặc chậm nhất là).',
    },
    {
      'question':
          "The new branch will be ______ located near the city's financial district.",
      'options': ['strategy', 'strategic', 'strategically', 'strategies'],
      'correctIndex': 2,
      'explain':
          'The adverb "strategically" (một cách chiến lược) is needed to modify the verb "located".',
    },
    {
      'question':
          "All new products must be ______ tested before they are sold.",
      'options': ['thorough', 'thoroughly', 'thoroughness', 'through'],
      'correctIndex': 1,
      'explain':
          'The adverb "thoroughly" (một cách kỹ lưỡng) is needed to modify the verb "tested".',
    },
    {
      'question':
          "Neither the manager ______ his assistant was aware of the problem.",
      'options': ['or', 'nor', 'and', 'but'],
      'correctIndex': 1,
      'explain': 'The correlative conjunction pair is "neither... nor...".',
    },
    {
      'question':
          "The company is committed to ______ its environmental impact.",
      'options': ['reduce', 'reducing', 'reduced', 'reduction'],
      'correctIndex': 1,
      'explain':
          'The preposition "to" (as part of "committed to") is followed by a gerund ("reducing").',
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
To: All Staff <all@ziptech.com>
From: IT Department <it@ziptech.com>
Subject: Upcoming Server Maintenance

This is to inform you that we will be conducting essential server maintenance this weekend. The maintenance is scheduled to begin at 10:00 P.M. on Friday, March 20, and will last for approximately eight hours.

During this time, the company e-mail, internal website, and shared network drives will be ____(131)____. We have scheduled this for the weekend to minimize disruption to your work.

Please make sure you have saved all important documents and logged off the network ____(132)____ 10:00 P.M. on Friday. ____(133)____. We recommend you do not plan to work during this maintenance window.

This upgrade is ____(134)____ to improve the speed and security of our network. We apologize for any inconvenience.
""";
  // --- Passage 2: Questions 135-138 (Memo) ---
  final passage135_138 = """
To: All Marketing Department Employees
From: Janine Dubois, Marketing Director
Subject: New Advertising Agency

As you know, for the past two months, we have been ____(135)____ proposals from various advertising agencies for our new product line. After careful consideration, we have selected 'Apex Media'.

Apex Media has a proven track record of creating innovative and successful campaigns. Their team demonstrated a deep understanding of our brand and target market. We are ____(136)____ about this new partnership.

They will begin work immediately. A kick-off meeting is scheduled for this Monday, April 5. ____(137)____. The meeting will be held in the main conference room. Please come prepared to share your initial ideas for the campaign.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**Experience the Best of Italy at Vivaldi's Restaurant!**

Vivaldi's is proud to announce its grand opening next week in the heart of the city. We offer authentic Italian cuisine in a warm, ____(139)____ atmosphere. Our head chef, Antonio Rossi, comes directly from Rome and has created a menu that features classic dishes made with fresh, local ingredients.

We are now accepting reservations. ____(140)____, for our opening month, all diners will receive a complimentary glass of wine with their main course. We also offer private dining rooms for special events and celebrations.

____(141)____. Visit our website at vivaldis.com to view our full menu and book your table. We look forward to ____(142)____ you soon!
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**Orion Manufacturing to Open New Factory**

Crestwood, (May 3) – Orion Manufacturing, a leading ____(143)____ of automotive parts, announced today that it will be opening a new factory in Crestwood. The new facility is expected to create over 200 jobs for the local community.

The decision to build in Crestwood was made after months of deliberation. "Crestwood's skilled workforce and ____(144)____ location near major shipping routes make it an ideal choice for our expansion," said CEO Elena Gomez.

Local officials have praised the move. ____(145)____. Construction is scheduled to begin on August 1 and is expected to be complete within two years. The company will begin the ____(146)____ process for new employees next spring.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["accessible", "unavoidable", "unavailable", "operational"],
      'correctIndex': 2,
      'explain':
          "The sentence describes the state of the servers 'During this time' (maintenance), so they will be 'unavailable' (không thể truy cập).",
    },
    {
      'question': "",
      'options': ["after", "by", "on", "within"],
      'correctIndex': 1,
      'explain':
          "'By' (trước) is used to set a deadline for the action 'logged off'.",
    },
    {
      'question': "",
      'options': [
        "Please contact the IT department if you have issues.",
        "You will need to reset your password on Monday.",
        "This means you will not be able to access these services from any location.",
        "The maintenance was requested by the finance department.",
      ],
      'correctIndex': 2,
      'explain':
          "This sentence logically follows the previous one by explaining the consequence of the servers being unavailable.",
    },
    {
      'question': "",
      'options': ["necessary", "optional", "additional", "temporary"],
      'correctIndex': 0,
      'explain':
          "The talk refers to the maintenance as 'essential' in the first line. 'Necessary' (cần thiết) is a synonym.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["reviewing", "review", "reviewed", "reviews"],
      'correctIndex': 0,
      'explain':
          "After 'have been', the present participle 'reviewing' is needed to form the present perfect continuous tense.",
    },
    {
      'question': "",
      'options': ["confused", "cautious", "enthusiastic", "concerned"],
      'correctIndex': 2,
      'explain':
          "'Enthusiastic' (hào hứng, nhiệt tình) is a positive adjective that fits the context of announcing a new partnership.",
    },
    {
      'question': "",
      'options': [
        "Apex Media will present their ideas first.",
        "The product line has been very successful.",
        "Please clear your schedules from 9 A.M. to 11 A.M.",
        "The previous agency was not renewed.",
      ],
      'correctIndex': 2,
      'explain':
          "This sentence provides the specific time for the 'kick-off meeting' mentioned in the previous sentence.",
    },
    {
      'question': "",
      'options': ["share", "shared", "sharing", "shares"],
      'correctIndex': 0,
      'explain':
          "The phrase 'come prepared to do something' requires the infinitive 'to share'.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142, // "inviting" atmosphere
      'options': ["inviting", "invited", "invitation", "invite"],
      'correctIndex': 0,
      'explain':
          "The adjective 'inviting' (mời gọi, lôi cuốn) is needed to describe the noun 'atmosphere'.",
    },
    {
      'question': "", // "____(140)____, for our opening month..."
      'options': ["However", "Therefore", "As such", "Moreover"],
      'correctIndex': 3,
      'explain':
          "'Moreover' (Hơn nữa) is used to add an additional, related piece of information (the free wine).",
    },
    {
      'question':
          "", // "We also offer private dining rooms... ____(141)____. Visit our website..."
      'options': [
        "The restaurant is closed on Sundays.",
        "Parking is available behind the restaurant.",
        "We do not accept credit cards.",
        "The menu was very expensive.",
      ],
      'correctIndex': 1,
      'explain':
          "This sentence provides additional useful information for a potential diner, fitting logically between the services and the call to action.",
    },
    {
      'question': "", // "We look forward to ____(142)____ you soon!"
      'options': ["serve", "served", "serving", "serves"],
      'correctIndex': 2,
      'explain':
          "The phrase 'look forward to' is followed by a gerund (verb + -ing).",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["produce", "producer", "production", "productive"],
      'correctIndex': 1,
      'explain':
          "The sentence needs a noun ('producer') to describe the company.",
    },
    {
      'question': "",
      'options': ["strategy", "strategic", "strategist", "strategically"],
      'correctIndex': 1,
      'explain':
          "The adjective 'strategic' (chiến lược) is needed to describe the noun 'location'.",
    },
    {
      'question': "",
      'options': [
        "This will be Orion's first facility in the region.",
        "The factory will replace an old shipping center.",
        "The CEO will be retiring next year.",
        "The city's mayor, Tom Wales, said, 'This is a huge win for our town.'",
      ],
      'correctIndex': 3,
      'explain':
          "This sentence logically follows 'Local officials have praised the move' by providing a specific example of that praise.",
    },
    {
      'question': "",
      'options': ["hire", "hiring", "hired", "hires"],
      'correctIndex': 1,
      'explain':
          "The sentence needs a noun or gerund after 'the'. 'The hiring process' is a standard collocation.",
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
**Central Perk Coffee Shop**
**Grand Re-opening!**

Come and see our newly renovated space! To celebrate, all customers will receive a **15% discount** on all food and drink purchases from May 1 to May 7.

We are also introducing our new mobile app. Order ahead and pay from your phone! The first 100 users to download the app and make a purchase will receive a free reusable Central Perk travel mug.

We are located at 120 Elm Street, across from the city park.
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: Frank Doyle <fdoyle@techsolutions.com>
From: Alicia Chen <achen@techsolutions.com>
Subject: Your upcoming travel
Date: November 12

Hi Frank,

This is to confirm that I have booked your flight and hotel for your trip to the conference in Sydney. Your flight departs from LAX on Tuesday, December 3, at 9:00 P.M. (Flight #QA12) and arrives in Sydney on December 5 (due to the time difference).

You will be staying at the Harborview Hotel. I have e-mailed the hotel confirmation and your e-ticket to you separately. Please let me know if you need me to arrange for a rental car.

Best,
Alicia
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Ken (10:30 A.M.)**: Hi Sarah, are you almost at the office? The client meeting is at 11:00 A.M.
**Sarah (10:31 A.M.)**: I'm so sorry, Ken. My train is stuck due to a signal problem. I'm not going to make it in time.
**Ken (10:32 A.M.)**: Oh no. Should I reschedule?
**Sarah (10:33 A.M.)**: Can you start without me? The presentation is on the shared drive, under 'Clients/Apex'. I can join via phone in about 15 minutes.
**Ken (10:34 A.M.)**: OK, I can handle the introductions and the first part. Let me know when you're on the line.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**A new Director for the City Art Museum**

The City Art Museum's board of trustees announced yesterday that it has hired Dr. Aris Thorne as its new director. Dr. Thorne, who is currently the chief curator at the National Gallery, will assume his new role on September 1.

Dr. Thorne is known for his innovative exhibitions, including the highly successful 'Modern Art in Asia' show last year. He specializes in 20th-century painting.

"I am thrilled to be joining the City Art Museum," Dr. Thorne said. "My main goal is to increase community engagement, especially with younger audiences. I plan to introduce new digital programs and more interactive exhibits."

Dr. Thorne replaces Eleanor Vance, who retired last month after 15 years as director.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Notice: Fitness Center Closure**

The Hamilton Fitness Center's swimming pool and locker rooms will be closed for annual maintenance from Monday, July 8, to Friday, July 12. During this time, crews will be retiling the pool and upgrading the showers.

All other areas of the fitness center, including the weight room and cardio equipment area, will remain open. All group fitness classes will run as scheduled.

We apologize for the inconvenience and appreciate your understanding as we work to improve our facilities.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Employees
**From**: Building Management
**Date**: January 21
**Subject**: New Parking Regulations

Starting Monday, January 28, new parking regulations will take effect. The parking lot behind the building (Lot B) will now be reserved for visitor and short-term parking (2-hour limit).

All employees must park in the North Garage (Lot A), located across the street. Employees will need to use their company ID badge to access the garage.

This change is being made to ensure that our clients and visitors have convenient access to our building. Cars parked in Lot B for more than 2 hours will be ticketed.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Sarah Jenkins <s.jenkins@citymail.com>
From: 'The Daily Bistro' <contact@dailybistro.com>
Subject: Your Reservation Confirmation
Date: August 2

Dear Ms. Jenkins,

This e-mail confirms your reservation at The Daily Bistro for **Saturday, August 10, at 7:30 P.M.** for a party of **four**.

Please note our cancellation policy: We require at least 24 hours' notice for any cancellations. A fee of \$20 per person will be charged for no-shows or late cancellations.

We also kindly request that your party arrives on time, as we can only hold a table for 15 minutes.

We look forward to welcoming you.

Sincerely,
The Daily Bistro Management
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Join Our Team at the Laketown Library!**

The Laketown Library is seeking a **Part-Time Library Assistant**. The successful candidate will work approximately 20 hours per week, including evenings and some weekends.

**Responsibilities:**
* Assisting patrons at the front desk with check-outs and returns.
* Answering patron inquiries in person and over the phone.
* Shelving returned books and maintaining the order of collections.
* Assisting with special programs, such as children's story time.

**Qualifications:**
* Strong customer service and communication skills.
* Excellent organizational skills and attention to detail.
* Must be proficient with computers.
* Previous library experience is preferred but not required.

To apply, please send your resume and a cover letter to Mary Evans at mevans@laketownlib.org by October 25.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**Bayside Electronics - Online Order Return**

**Order Number**: 301-A45
**Order Date**: July 11
**Customer Name**: Mark Johnson

**Item Returned**:
* (1) 'Aero' Wireless Headphones (Model: H-300)
* **Price**: \$129.99

**Reason for Return**: (Please check one)
[ ] Ordered wrong item
[X] Item defective
[ ] Arrived too late
[ ] Changed mind

**Customer Comment**: The right earpiece stopped working after two days of use. I tried charging it and resetting it as per the manual, but it still does not produce any sound.

**Desired Action**:
[ ] Credit my account
[X] Send replacement

**Return Processed By**: T.S. (July 18)
**Action Taken**: Replacement unit (Model: H-300) shipped via express mail.
""";
  // Q172-175 (Article)
  final passage172_175 = """
**ProTech Conference Sells Out**

(March 5) – The annual ProTech Conference, one of the technology industry's most anticipated events, has officially sold out. The conference will take place at the Monarch Convention Center from April 1-3. This year's event is set to be the largest yet, with over 8,000 attendees registered.

The conference will feature over 200 speakers, including keynote addresses from tech CEOs Mira Cho of 'Future Systems' and David Chen of 'LogiCore'. The main theme of this year's conference is "The Future of Artificial Intelligence."

In addition to the lectures, the event will host an exhibition hall where 150 companies will showcase their latest products. For those who were unable to get tickets, organizers have announced that all keynote addresses will be streamed live on the conference website.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (E-mail + Webpage)
  final passage176_180_1 = """
To: Carlos Gomez <cgomez@greentech.com>
From: Info <info@proprintservices.com>
Subject: Your Order Status
Date: May 9

Dear Mr. Gomez,

Thank you for your recent order. This e-mail is to confirm that your order (#882-B) for 500 custom-printed brochures has been completed and will ship today via express courier. You can expect to receive it tomorrow, May 10.

The total charge for your order, including tax and express shipping, is **\$215.50**. This amount has been charged to the credit card on file.

We appreciate your business.

Sincerely,
ProPrint Services
""";
  final passage176_180_2 = """
**GreenTech Solutions - Website**

**About Us | Services | News | Contact**

**News & Updates**
*May 12* – GreenTech Solutions is proud to be a sponsor of the 2024 Clean Energy Fair! This exciting event brings together leaders in sustainable technology from around the world. The fair takes place from May 11-13 at the City Convention Center.

Come visit us at **Booth 40B**! We will be distributing information about our new solar panel technology and handing out free gifts. We will also have our new company brochures, fresh from the printer, which detail all of our services. We hope to see you there!
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**MEMORANDUM**
To: All Sales Staff
From: Susan Chen, Sales Director
Date: June 1
Subject: New Commission Structure

This memo is to inform you of a change to our commission structure, effective July 1.

Starting next month, the commission rate for all sales *over* \$10,000 will be increased from 5% to 7%. The rate for sales under \$10,000 will remain at 5%.

This change is designed to reward our top performers and incentivize the sale of our larger enterprise packages.

Furthermore, we will be introducing a "Salesperson of the Month" award, which includes a \$500 bonus. The first winner will be announced at the all-hands meeting in early August (for sales made in July).
""";
  final passage181_185_2 = """
To: Susan Chen
From: David Kim
Subject: Re: New Commission Structure
Date: June 1

Hi Susan,

Thanks for the update. This is great news, and I think it will be a strong motivator for the team.

I have one question. Does the new 7% rate apply to the entire sale amount, or only to the portion that is over \$10,000? For example, if I make a \$12,000 sale, is the commission 7% of \$12,000, or 5% of \$10,000 and 7% of \$2,000?

Could you please clarify?

Thanks,
David
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Web Advertisement: The Professional's Choice Laptop Bag**

Tired of carrying a heavy, unorganized bag? The 'Nomad Pro' bag by Apex Gear is the solution.
* **Price**: \$120.00
* **Features**: Water-resistant nylon, padded laptop sleeve (fits up to 15-inch laptops), 10 separate compartments for accessories, and a security-check friendly design.
* **Colors**: Black, Gray, Navy Blue
* **Shipping**: Standard (5-7 business days) - FREE. Express (2 business days) - \$15.
* Order now at ApexGear.com.
""";
  final passage186_190_2 = """
**From**: Apex Gear Customer Service <service@apexgear.com>
**To**: t.sullivan@email.com
**Subject**: Your Order #A-901
**Date**: October 2

Dear Mr. Sullivan,
Thank you for your order! Your 'Nomad Pro' bag (Color: Navy Blue) has been shipped. Because you chose Express Shipping, your tracking number is E-2234, and your estimated delivery date is October 4.
Your total charge was \$135.00.
""";
  final passage186_190_3 = """
**From**: Tom Sullivan <t.sullivan@email.com>
**To**: Apex Gear Customer Service <service@apexgear.com>
**Subject**: Re: Your Order #A-901
**Date**: October 5

To Whom It May Concern,
I received my order yesterday, but I am very disappointed. I ordered the 'Nomad Pro' in Navy Blue, but I received a Black one.
More importantly, the advertisement on your website clearly states the bag fits up to 15-inch laptops. My laptop is exactly 15 inches, and it does not fit in the padded sleeve.
I am leaving for a business trip on October 8 and needed this bag. Please advise on how to get a refund.
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**Ashland Times: Business Leader of the Year**
(April 10) – The Ashland Business Association (ABA) has named Kenji Tanaka, founder and CEO of 'Tanaka Robotics', as its Business Leader of the Year. The award is given annually to an individual who has demonstrated both outstanding business success and a strong commitment to the community.
'Tanaka Robotics' has grown into a global leader in automated systems, but Mr. Tanaka has kept his headquarters in his hometown of Ashland. He is also being recognized for his 'Tech for Teens' program, which provides free robotics workshops to local high school students.
The award will be presented at the ABA's annual banquet on May 20.
""";
  final passage191_195_2 = """
**To**: Kenji Tanaka <ktanaka@tanakarobotics.com>
**From**: Sarah Hill <shill@ashlandba.org>
**Subject**: ABA Banquet Details
**Date**: April 28

Dear Mr. Tanaka,
Congratulations again on being named Business Leader of the Year. We are all looking forward to the banquet on May 20.
We have finalized the schedule for the evening (see attached). As the guest of honor, you will be seated at the head table. We have you scheduled to give a 15-minute acceptance speech following the dinner and the awards presentation.
Please let me know if you have any questions.
""";
  final passage191_195_3 = """
**ABA Annual Banquet - May 20**
**Location**: Grand Regency Hotel

**Schedule of Events**
* 6:00 P.M. – 7:00 P.M.: Cocktail Reception (Lobby)
* 7:00 P.M. – 8:00 P.M.: Dinner (Grand Ballroom)
* 8:00 P.M. – 8:30 P.M.: Welcome by ABA President
* 8:30 P.M. – 9:00 P.M.: Awards Presentation
* 9:00 P.M. – 9:15 P.M.: Acceptance Speech
* 9:15 P.M. – 9:30 P.M.: Closing Remarks
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: info@greenwaycatering.com
**From**: maria.lee@corpnet.com
**Subject**: Catering for Corporate Event
**Date**: June 2

To Whom It May Concern,
I am organizing a corporate luncheon for my company, CorpNet, on **Friday, June 24**. We are expecting approximately 80 guests.
We would like a buffet-style meal. Could you please send me your menu options and a price estimate? We also require beverage service (coffee, tea, and water).
Thank you,
Maria Lee
""";
  final passage196_200_2 = """
**GreenWay Catering - INVOICE**
**Client**: CorpNet (Maria Lee)
**Invoice**: #C-456
**Date**: June 25

**Event Date**: June 24
**Guests**: 80

**Services Rendered**:
* 'Executive Buffet' Luncheon: 80 guests @ \$30/person .... \$2,400.00
* Beverage Service: 80 guests @ \$5/person .................. \$400.00
* Staffing & Service Fee (18%) ................................. \$504.00
* * **TOTAL AMOUNT DUE**: **\$3,304.00**
""";
  final passage196_200_3 = """
**To**: Maria Lee <maria.lee@corpnet.com>
**From**: accounts@greenwaycatering.com
**Subject**: Re: Invoice #C-456
**Date**: June 28

Dear Ms. Lee,
I hope you enjoyed your event last Friday.
This is a friendly reminder that invoice #C-456 for the luncheon on June 24 is still outstanding. Per our agreement, payment is due within 30 days of the event date.
However, it appears we overcharged you. Your original quote included a 10% corporate discount, which was not applied to the final invoice.
I have attached a **revised invoice** for **\$3,023.60**. Please disregard the previous one. We apologize for the error.
""";

  final part7Questions = [
    // Q147-148
    {
      'question': passage147_148 + "\n\n147. What is being advertised?",
      'options': [
        "A new coffee shop",
        "A special discount",
        "A mobile payment system",
        "A city park event",
      ],
      'correctIndex': 1,
      'explain':
          "The ad announces a 'Grand Re-opening' and a '15% discount' to celebrate.",
    },
    {
      'question':
          passage147_148 + "\n\n148. How can customers get a free travel mug?",
      'options': [
        "By visiting from May 1 to May 7",
        "By spending \$15 or more",
        "By being one of the first 100 app users to make a purchase",
        "By ordering coffee ahead of time",
      ],
      'correctIndex': 2,
      'explain':
          "The ad states, 'The first 100 users to download the app and make a purchase will receive a free... mug'.",
    },
    // Q149-150
    {
      'question':
          passage149_150 + "\n\n149. What is the purpose of the e-mail?",
      'options': [
        "To ask Frank to book a flight",
        "To confirm travel arrangements",
        "To inquire about a rental car",
        "To change a conference date",
      ],
      'correctIndex': 1,
      'explain':
          "Alicia writes, 'This is to confirm that I have booked your flight and hotel...'",
    },
    {
      'question':
          passage149_150 +
          "\n\n150. What will Alicia e-mail to Frank separately?",
      'options': [
        "A conference schedule",
        "A rental car form",
        "Hotel and flight confirmations",
        "A map of Sydney",
      ],
      'correctIndex': 2,
      'explain':
          "She states, 'I have e-mailed the hotel confirmation and your e-ticket to you separately.'",
    },
    // Q151-152
    {
      'question': passage151_152 + "\n\n151. Why is Sarah going to be late?",
      'options': [
        "She is in another meeting.",
        "She is finishing a presentation.",
        "There is a problem with her train.",
        "She is feeling sick.",
      ],
      'correctIndex': 2,
      'explain': "Sarah texts, 'My train is stuck due to a signal problem.'",
    },
    {
      'question':
          passage151_152 + "\n\n152. At 10:34 A.M., what does Ken agree to do?",
      'options': [
        "Reschedule the meeting",
        "Start the presentation without Sarah",
        "E-mail the presentation to the client",
        "Call Sarah back in 15 minutes",
      ],
      'correctIndex': 1,
      'explain':
          "Ken says, 'OK, I can handle the introductions and the first part.'",
    },
    // Q153-155
    {
      'question': passage153_155 + "\n\n153. What is the article mainly about?",
      'options': [
        "The retirement of a museum director",
        "A successful art exhibition",
        "A new leadership appointment",
        "A new community program",
      ],
      'correctIndex': 2,
      'explain':
          "The article announces that the museum 'has hired Dr. Aris Thorne as its new director'.",
    },
    {
      'question': passage153_155 + "\n\n154. What is Dr. Thorne's main goal?",
      'options': [
        "To increase community engagement",
        "To focus on 20th-century painting",
        "To replace Eleanor Vance",
        "To open a new digital program",
      ],
      'correctIndex': 0,
      'explain':
          "Dr. Thorne states, 'My main goal is to increase community engagement...'",
    },
    {
      'question':
          passage153_155 + "\n\n155. What is NOT mentioned about Dr. Thorne?",
      'options': [
        "He will start his new job on September 1.",
        "He is currently a chief curator.",
        "He organized a successful show.",
        "He used to work at the City Art Museum.",
      ],
      'correctIndex': 3,
      'explain':
          "The article says he is *joining* the museum, not that he worked there before. The other three points are explicitly mentioned.",
    },
    // Q156-157
    {
      'question':
          passage156_157 +
          "\n\n156. What part of the fitness center will be closed?",
      'options': [
        "The weight room",
        "The swimming pool",
        "The cardio area",
        "The group fitness studio",
      ],
      'correctIndex': 1,
      'explain':
          "The notice says 'The... swimming pool and locker rooms will be closed...'",
    },
    {
      'question':
          passage156_157 + "\n\n157. What service will continue as usual?",
      'options': [
        "Shower access",
        "Pool access",
        "Group fitness classes",
        "Locker usage",
      ],
      'correctIndex': 2,
      'explain':
          "The notice states, 'All group fitness classes will run as scheduled.'",
    },
    // Q158-160
    {
      'question': passage158_160 + "\n\n158. What is the purpose of the memo?",
      'options': [
        "To introduce new employees",
        "To announce a new parking policy",
        "To request employees use their ID badge",
        "To assign parking spaces to visitors",
      ],
      'correctIndex': 1,
      'explain':
          "The subject is 'New Parking Regulations' and the memo details the changes.",
    },
    {
      'question':
          passage158_160 +
          "\n\n159. Starting January 28, where must employees park?",
      'options': [
        "In Lot B",
        "In the North Garage",
        "Behind the building",
        "In any 2-hour space",
      ],
      'correctIndex': 1,
      'explain':
          "The memo states, 'All employees must park in the North Garage (Lot A)...'",
    },
    {
      'question': passage158_160 + "\n\n160. Why is this change being made?",
      'options': [
        "To ticket employees",
        "To encourage walking",
        "To provide convenience for clients",
        "To repair the North Garage",
      ],
      'correctIndex': 2,
      'explain':
          "The memo says, 'This change is being made to ensure that our clients and visitors have convenient access...'",
    },
    // Q161-163
    {
      'question':
          passage161_163 + "\n\n161. What is the purpose of this e-mail?",
      'options': [
        "To cancel a reservation",
        "To ask for a table",
        "To confirm a booking",
        "To change the number of guests",
      ],
      'correctIndex': 2,
      'explain':
          "The e-mail states, 'This e-mail confirms your reservation...'",
    },
    {
      'question':
          passage161_163 +
          "\n\n162. How many people are in Ms. Jenkins's party?",
      'options': ["Two", "Four", "Twenty", "Twenty-four"],
      'correctIndex': 1,
      'explain': "The e-mail confirms a 'party of four'.",
    },
    {
      'question':
          passage161_163 +
          "\n\n163. What will happen if Ms. Jenkins cancels on August 10?",
      'options': [
        "She will be charged a fee.",
        "She will be moved to a waiting list.",
        "The table will be held for 15 minutes.",
        "The restaurant will call to confirm.",
      ],
      'correctIndex': 0,
      'explain':
          "The policy requires 'at least 24 hours' notice'. Canceling on August 10 (the day of the reservation) is a 'late cancellation' and will incur a fee.",
    },
    // Q164-167
    {
      'question':
          passage164_167 + "\n\n164. What kind of position is advertised?",
      'options': [
        "Full-time librarian",
        "Part-time assistant",
        "Children's program coordinator",
        "Customer service manager",
      ],
      'correctIndex': 1,
      'explain': "The ad is for a 'Part-Time Library Assistant'.",
    },
    {
      'question':
          passage164_167 + "\n\n165. What is NOT listed as a responsibility?",
      'options': [
        "Checking out books",
        "Answering phones",
        "Organizing collections",
        "Ordering new books",
      ],
      'correctIndex': 3,
      'explain':
          "The responsibilities include assisting patrons (check-outs), answering inquiries (phones), and shelving (organizing). Ordering new books is not mentioned.",
    },
    {
      'question':
          passage164_167 +
          "\n\n166. What qualification is preferred but not required?",
      'options': [
        "Computer proficiency",
        "Strong communication skills",
        "Previous library experience",
        "Attention to detail",
      ],
      'correctIndex': 2,
      'explain':
          "The ad states, 'Previous library experience is preferred but not required.'",
    },
    {
      'question': passage164_167 + "\n\n167. How should one apply for the job?",
      'options': [
        "By visiting the library",
        "By calling Mary Evans",
        "By filling out an online form",
        "By sending an e-mail",
      ],
      'correctIndex': 3,
      'explain':
          "The ad says, 'send your resume and a cover letter to Mary Evans at mevans@laketownlib.org'.",
    },
    // Q168-171
    {
      'question':
          passage168_171 +
          "\n\n168. Why did Mark Johnson return the headphones?",
      'options': [
        "He changed his mind.",
        "They arrived too late.",
        "They were the wrong color.",
        "They were not working correctly.",
      ],
      'correctIndex': 3,
      'explain':
          "He checked the box 'Item defective' and commented that the 'right earpiece stopped working'.",
    },
    {
      'question': passage168_171 + "\n\n169. What did Mr. Johnson try to do?",
      'options': [
        "Order a new item",
        "Follow the manual's instructions",
        "Contact customer service",
        "Repair the earpiece",
      ],
      'correctIndex': 1,
      'explain':
          "He wrote, 'I tried charging it and resetting it as per the manual...'",
    },
    {
      'question': passage168_171 + "\n\n170. What did Mr. Johnson request?",
      'options': [
        "A refund",
        "A different model",
        "A replacement",
        "Store credit",
      ],
      'correctIndex': 2,
      'explain':
          "In the 'Desired Action' section, the box next to 'Send replacement' is checked.",
    },
    {
      'question': passage168_171 + "\n\n171. What action was taken on July 18?",
      'options': [
        "The item was repaired.",
        "A refund was issued.",
        "A new item was shipped.",
        "The return was denied.",
      ],
      'correctIndex': 2,
      'explain':
          "The 'Action Taken' field says, 'Replacement unit (Model: H-300) shipped via express mail.'",
    },
    // Q172-175
    {
      'question':
          passage172_175 + "\n\n172. What is the main topic of the article?",
      'options': [
        "A new product by Future Systems",
        "A technology conference",
        "The future of artificial intelligence",
        "A new streaming service",
      ],
      'correctIndex': 1,
      'explain': "The article is about the 'ProTech Conference' selling out.",
    },
    {
      'question':
          passage172_175 + "\n\n173. What is this year's conference theme?",
      'options': [
        "The Future of Artificial Intelligence",
        "ProTech Conference Sells Out",
        "New Products from 150 Companies",
        "Systems by Mira Cho and David Chen",
      ],
      'correctIndex': 0,
      'explain':
          "The article clearly states, 'The main theme of this year's conference is \"The Future of Artificial Intelligence.\"'",
    },
    {
      'question':
          passage172_175 +
          "\n\n174. How many companies will be at the exhibition hall?",
      'options': ["2", "150", "200", "8,000"],
      'correctIndex': 1,
      'explain':
          "The article says, 'an exhibition hall where 150 companies will showcase their latest products.'",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. How can people who do not have tickets participate?",
      'options': [
        "By visiting the exhibition hall",
        "By watching keynote speeches online",
        "By registering for next year's event",
        "By contacting Mira Cho",
      ],
      'correctIndex': 1,
      'explain':
          "The article says, 'organizers have announced that all keynote addresses will be streamed live on the conference website.'",
    },

    // --- Double Passages ---

    // Q176-180
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. What did ProPrint Services send to Mr. Gomez?",
      'options': [
        "A credit card",
        "Company brochures",
        "A shipping label",
        "A tax form",
      ],
      'correctIndex': 1,
      'explain':
          "The e-mail from ProPrint confirms an 'order (#882-B) for 500 custom-printed brochures'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. When did Mr. Gomez likely receive his order?",
      'options': ["May 9", "May 10", "May 11", "May 12"],
      'correctIndex': 1,
      'explain':
          "The e-mail on May 9 states the order 'will ship today' and 'You can expect to receive it tomorrow, May 10.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What event is GreenTech Solutions sponsoring?",
      'options': [
        "A printing convention",
        "A clean energy fair",
        "A new product launch",
        "A technology summit",
      ],
      'correctIndex': 1,
      'explain':
          "The website news from May 12 says GreenTech is a sponsor of the '2024 Clean Energy Fair'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. What will GreenTech distribute at its booth?",
      'options': [
        "Solar panels",
        "Free gifts",
        "Credit cards",
        "Shipping labels",
      ],
      'correctIndex': 1,
      'explain':
          "The website says, 'We will be... handing out free gifts.' It also mentions brochures.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What is suggested about the brochures mentioned on the website?",
      'options': [
        "They cost \$215.50.",
        "They were printed by ProPrint Services.",
        "They are for the Clean Energy Fair.",
        "They have a shipping error.",
      ],
      'correctIndex': 1,
      'explain':
          "The e-mail confirms ProPrint just shipped brochures to GreenTech (Carlos Gomez) on May 10. The website news on May 12 says GreenTech will have their 'new company brochures, fresh from the printer' at the fair. This implies the brochures just arrived from ProPrint.",
    },
    // Q181-185
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What is the subject of the memo?",
      'options': [
        "A new salesperson award",
        "A change in sales territories",
        "A new enterprise package",
        "A change in payment calculation",
      ],
      'correctIndex': 3,
      'explain':
          "The memo describes a 'New Commission Structure,' which is a 'change in payment calculation'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. When will the new structure take effect?",
      'options': ["June 1", "July 1", "August 1", "The memo does not say"],
      'correctIndex': 1,
      'explain': "The memo states, 'effective July 1'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What will be announced in August?",
      'options': [
        "A new commission rate",
        "The winner of a bonus",
        "A new sales director",
        "A new enterprise package",
      ],
      'correctIndex': 1,
      'explain':
          "The memo says, 'The first winner [of the \$500 bonus] will be announced at the all-hands meeting in early August'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Why did David Kim write the e-mail?",
      'options': [
        "To thank Susan Chen",
        "To ask for clarification",
        "To complain about the change",
        "To suggest a higher bonus",
      ],
      'correctIndex': 1,
      'explain':
          "David writes, 'I have one question...' and 'Could you please clarify?', indicating he needs clarification.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What is David Kim asking about?",
      'options': [
        "If the \$12,000 sale is eligible",
        "How the new 7% rate is applied",
        "When the bonus winner is chosen",
        "Why the rate for small sales did not change",
      ],
      'correctIndex': 1,
      'explain':
          "He gives a specific example (\$12,000) to ask if the 7% rate applies to the whole amount or just the part over \$10,000. This is a question about *how* the rate is applied.",
    },

    // --- Triple Passages ---

    // Q186-190
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n186. How much did Mr. Sullivan pay for shipping?",
      'options': ["\$0", "\$15", "\$120", "\$135"],
      'correctIndex': 1,
      'explain':
          "The ad shows Express shipping is \$15. The e-mail (Passage 2) confirms he chose Express Shipping and his total was \$135 (\$120 bag + \$15 shipping).",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. What was wrong with the color of the bag Mr. Sullivan received?",
      'options': [
        "It was Gray instead of Black.",
        "It was Navy Blue instead of Black.",
        "It was Black instead of Navy Blue.",
        "It was not water-resistant.",
      ],
      'correctIndex': 2,
      'explain':
          "Passage 2 confirms he ordered Navy Blue. Passage 3 says, 'I ordered the 'Nomad Pro' in Navy Blue, but I received a Black one.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What problem did Mr. Sullivan have with the bag's feature?",
      'options': [
        "It was not water-resistant.",
        "It was missing a compartment.",
        "His laptop did not fit.",
        "It was not security-check friendly.",
      ],
      'correctIndex': 2,
      'explain':
          "He writes, 'the advertisement... states the bag fits up to 15-inch laptops. My laptop... does not fit'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. When did Mr. Sullivan receive his bag?",
      'options': ["October 2", "October 4", "October 5", "October 8"],
      'correctIndex': 1,
      'explain':
          "Passage 2 (dated Oct 2) gives an 'estimated delivery date is October 4'. In Passage 3 (dated Oct 5), he writes, 'I received my order yesterday...'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What is Mr. Sullivan's main goal in his e-mail?",
      'options': [
        "To request a different color",
        "To ask for a replacement",
        "To get information about a refund",
        "To complain about the shipping cost",
      ],
      'correctIndex': 2,
      'explain':
          "He ends his e-mail with, 'Please advise on how to get a refund.'",
    },
    // Q191-195
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. Why is Mr. Tanaka being recognized?",
      'options': [
        "For his company's global success and community work",
        "For his 'Tech for Teens' program only",
        "For moving his headquarters to Ashland",
        "For demonstrating automated systems",
      ],
      'correctIndex': 0,
      'explain':
          "The article (Passage 1) states the award is for 'both outstanding business success and a strong commitment to the community'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. What is the purpose of the e-mail from Ms. Hill?",
      'options': [
        "To invite Mr. Tanaka to an event",
        "To ask him to be a guest of honor",
        "To provide a schedule for an event",
        "To ask him to present an award",
      ],
      'correctIndex': 2,
      'explain':
          "Ms. Hill (Passage 2) writes, 'We have finalized the schedule for the evening (see attached)' and tells him when his speech is.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. What is scheduled to happen at 8:30 P.M.?",
      'options': [
        "Dinner",
        "Cocktail Reception",
        "Acceptance Speech",
        "Awards Presentation",
      ],
      'correctIndex': 3,
      'explain':
          "The schedule (Passage 3) lists '8:30 P.M. – 9:00 P.M.: Awards Presentation'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. In the e-mail, what does Ms. Hill ask Mr. Tanaka to do?",
      'options': [
        "Prepare a 15-minute speech",
        "Arrive at 6:00 P.M.",
        "Sit at the head table",
        "Contact her with questions",
      ],
      'correctIndex': 3,
      'explain':
          "The e-mail (Passage 2) *informs* him about the speech and seating, but it *asks* him to 'Please let me know if you have any questions.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. At what time will Mr. Tanaka give his speech?",
      'options': ["7:00 P.M.", "8:00 P.M.", "8:30 P.M.", "9:00 P.M."],
      'correctIndex': 3,
      'explain':
          "The schedule (Passage 3) lists the 'Acceptance Speech' at '9:00 P.M. – 9:15 P.M.' This matches the e-mail (Passage 2) which says his speech is 'following the dinner and the awards presentation'.",
    },
    // Q196-200
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. In the first e-mail, what is Maria Lee requesting?",
      'options': [
        "A menu and a price estimate",
        "To book a luncheon for 80 people",
        "A corporate discount",
        "A list of beverage options",
      ],
      'correctIndex': 0,
      'explain':
          "In Passage 1, Maria Lee asks, 'Could you please send me your menu options and a price estimate?'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the invoice, what was the cost per person for food?",
      'options': ["\$5", "\$18", "\$30", "\$35"],
      'correctIndex': 2,
      'explain':
          "The invoice (Passage 2) lists ''Executive Buffet' Luncheon: 80 guests @ \$30/person'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. Why did GreenWay Catering send the third e-mail?",
      'options': [
        "To request payment for an overdue invoice",
        "To confirm the number of guests",
        "To correct a billing error",
        "To offer a future discount",
      ],
      'correctIndex': 2,
      'explain':
          "The e-mail (Passage 3) states, 'it appears we overcharged you' and 'I have attached a revised invoice'. This is a billing correction.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What was the mistake on the first invoice?",
      'options': [
        "The number of guests was wrong.",
        "The beverage service was not included.",
        "A discount was not applied.",
        "The staffing fee was too high.",
      ],
      'correctIndex': 2,
      'explain':
          "Passage 3 explains, 'Your original quote included a 10% corporate discount, which was not applied to the final invoice.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What is the new total amount due?",
      'options': ["\$400.00", "\$504.00", "\$3,023.60", "\$3,304.00"],
      'correctIndex': 2,
      'explain':
          "Passage 3 explicitly states, 'I have attached a revised invoice for \$3,023.60.'",
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
