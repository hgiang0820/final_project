// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest09() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_09';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 09',
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
        'order': 9,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang đọc sách trên ghế băng công viên.
      // Transcript:
      // (A) He's sleeping on a bench.
      // (B) He's reading a book outdoors.
      // (C) He's buying a newspaper.
      // (D) He's walking through a park.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người đàn ông đang ngồi trên ghế (outdoors) và đọc một cuốn sách (reading a book).',
    },
    {
      // Image Description: Một phòng bếp hiện đại, sạch sẽ, không có người.
      // Transcript:
      // (A) A meal is being prepared on the stove.
      // (B) Dirty dishes are piled in the sink.
      // (C) The kitchen counters are clear.
      // (D) People are gathered around the table.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy các bề mặt quầy bếp (kitchen counters) trống trải, không có đồ vật lộn xộn (clear).',
    },
    {
      // Image Description: Một người phụ nữ đang chỉ vào màn hình máy tính cho một đồng nghiệp xem.
      // Transcript:
      // (A) She's pointing at something on a monitor.
      // (B) She's giving a presentation to a large group.
      // (C) She's answering a phone call.
      // (D) She's drawing a diagram on a board.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người phụ nữ đang dùng ngón tay chỉ (pointing) vào màn hình máy tính (monitor) cho người khác xem.',
    },
    {
      // Image Description: Hàng hóa được xếp chồng lên cao trong một nhà kho.
      // Transcript:
      // (A) Boxes are stacked high in a warehouse.
      // (B) A forklift is lifting a pallet.
      // (C) Shelves are empty in a storage room.
      // (D) Workers are packing items for shipment.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Bức tranh cho thấy nhiều thùng hàng (boxes) được xếp chồng (stacked) lên cao trong một không gian giống nhà kho (warehouse).',
    },
    {
      // Image Description: Một người nhạc công đang chơi violin.
      // Transcript:
      // (A) A man is playing the piano.
      // (B) A woman is tuning a guitar.
      // (C) A musician is playing the violin.
      // (D) An orchestra is performing on stage.
      'question': "",
     'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Hình ảnh rõ ràng cho thấy một người (musician) đang chơi đàn violin.',
    },
    {
      // Image Description: Một người đi xe đạp đang dừng lại ở đèn tín hiệu giao thông.
      // Transcript:
      // (A) A cyclist is waiting at a traffic light.
      // (B) A car is turning at an intersection.
      // (C) Pedestrians are crossing the street.
      // (D) A bicycle is parked next to a building.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người đi xe máy (biker) đang dừng lại (waiting) tại một cột đèn tín hiệu giao thông (traffic light).',
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
        'audioPath': 'LR_practice_tests/$testId/part1/LR_test9_part1.wav',
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
      // Q7
      // Where should I leave this package for Mr. Kim?
      // (A) He left early today.
      // (B) Just put it on his desk.
      // (C) It's a heavy package.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Where". (B) provides a location.',
    },
    {
      // Q8
      // When will the train arrive?
      // (A) It arrived on time.
      // (B) It should be here any minute.
      // (C) At the central station.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "When". (B) provides an estimated time frame.',
    },
    {
      // Q9
      // Who is responsible for booking the flights?
      // (A) I booked it online.
      // (B) Sarah in administration handles that.
      // (C) The flight is fully booked.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Who". (B) names a person and department.',
    },
    {
      // Q10
      // Why was the road closed this morning?
      // (A) Yes, I took a detour.
      // (B) It closes at 10 PM.
      // (C) Because of a traffic accident.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "Why". (C) provides a reason.',
    },
    {
      // Q11
      // How long did it take you to finish the report?
      // (A) About three days.
      // (B) The report is on your desk.
      // (C) I took the bus.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Question asks "How long". (A) provides a duration.',
    },
    {
      // Q12
      // Is this seat available?
      // (A) Yes, please sit down.
      // (B) I prefer a window seat.
      // (C) It's available online.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Yes/No question. (A) answers "Yes" and invites.',
    },
    {
      // Q13
      // Would you like water or juice?
      // (A) I'm not thirsty, thank you.
      // (B) The water is cold.
      // (C) Yes, I would.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Alternative question ("or"). (A) politely declines both options.',
    },
    {
      // Q14
      // What's the agenda for today's meeting?
      // (A) It starts at 11 AM.
      // (B) We'll be discussing the quarterly budget.
      // (C) The agent will call you back.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Question asks "What\'s the agenda". (B) provides the main topic.',
    },
    {
      // Q15
      // You didn't forget the client presentation, did you?
      // (A) No, it's right here in my bag.
      // (B) The client was very pleased.
      // (C) I presented it last week.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Negative tag question. (A) answers "No" and confirms possession.',
    },
    {
      // Q16
      // How many people work in this department?
      // (A) They work very hard.
      // (B) About twenty-five.
      // (C) It's the sales department.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "How many". (B) provides a number.',
    },
    {
      // Q17
      // Why don't we take the elevator instead of the stairs?
      // (A) It's only two flights up.
      // (B) Okay, that sounds easier.
      // (C) The elevator is broken.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Suggestion ("Why don\'t we...?"). (B) agrees ("Okay"). (C) could also be correct, but B is a more direct agreement.',
    },
    {
      // Q18
      // Has the new equipment been delivered?
      // (A) Yes, it arrived this morning.
      // (B) It's very expensive equipment.
      // (C) We deliver on weekdays.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Yes/No question. (A) answers "Yes" and gives time.',
    },
    {
      // Q19
      // Could you please make 10 copies of this document?
      // (A) I'll read the document later.
      // (B) Sure, I'll do it right away.
      // (C) The copy machine is new.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Request. (B) agrees ("Sure") and states immediacy.',
    },
    {
      // Q20
      // The coffee in the break room tastes terrible.
      // (A) I'll make a fresh pot.
      // (B) I prefer tea anyway.
      // (C) The break is at 10:30.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Statement of a problem/opinion. (A) offers a solution.',
    },
    {
      // Q21
      // What time did you leave the office last night?
      // (A) I left the report on your desk.
      // (B) Around 7:30 PM.
      // (C) Because I had to finish a project.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "What time". (B) gives a time.',
    },
    {
      // Q22
      // Didn't you get the memo about the meeting change?
      // (A) The meeting was very productive.
      // (B) No, when was it sent?
      // (C) I'll change it now.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Negative Yes/No question. (B) answers "No" and asks for more info.',
    },
    {
      // Q23
      // Whose laptop is charging over there?
      // (A) It needs to be charged soon.
      // (B) That must be Susan's.
      // (C) It's a brand new laptop.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Whose". (B) identifies the likely owner.',
    },
    {
      // Q24
      // How far is the hotel from the conference center?
      // (A) The conference is next week.
      // (B) It's within walking distance.
      // (C) The hotel offers free breakfast.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "How far". (B) gives distance relatively.',
    },
    {
      // Q25
      // Should I send the invoice today or tomorrow?
      // (A) The invoice amount is correct.
      // (B) Today would be better.
      // (C) Yes, please send it.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Alternative question ("or"). (B) chooses one option.',
    },
    {
      // Q26
      // When is the best time to call Mr. Tanaka?
      // (A) He's usually in his office after 10 AM.
      // (B) I called him yesterday.
      // (C) It's the best time of year.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Question asks "When". (A) provides a suitable time frame.',
    },
    {
      // Q27
      // I can't read your handwriting on this note.
      // (A) Sorry, I'll type it up for you.
      // (B) I wrote it this morning.
      // (C) Please hand it to me.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Statement of a problem. (A) apologizes and offers a solution.',
    },
    {
      // Q28
      // How often should I check the inventory levels?
      // (A) The inventory is stored in the back.
      // (B) We should do it once a week.
      // (C) I checked it yesterday.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "How often". (B) suggests a frequency.',
    },
    {
      // Q29
      // Would you mind holding my calls for the next hour?
      // (A) I called him an hour ago.
      // (B) No problem, I can do that.
      // (C) The hold music is pleasant.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Request ("Would you mind...?"). (B) agrees ("No problem").',
    },
    {
      // Q30
      // What kind of identification do I need?
      // (A) A driver's license or passport will work.
      // (B) Please identify yourself.
      // (C) I need some help.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Question asks "What kind". (A) lists acceptable types.',
    },
    {
      // Q31
      // Have you finished reviewing the budget proposal?
      // (A) The budget is very tight this year.
      // (B) Not yet, I need another hour or so.
      // (C) I'll propose it at the meeting.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Yes/No question. (B) answers "No" ("Not yet") and gives timeframe.',
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
        'audioPath': 'LR_practice_tests/$testId/part2/LR_test9_part2.wav',
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
(Man) Hi, I'd like to sign up for the advanced photography workshop next Saturday.
(Woman) Okay. Have you taken our beginner's course before? This workshop assumes some prior knowledge.
(Man) Oh, no, I haven't. I just bought my first digital camera last month.
(Woman) In that case, I'd strongly recommend starting with our 'Introduction to Digital Photography' course. It covers all the basics. We have one starting this Wednesday evening.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Woman) Kenji, the client just called. They need the final project report by tomorrow morning, not Friday.
(Man) Tomorrow morning? That's impossible. We still need to incorporate the feedback from the legal team.
(Woman) I know. I told them we needed more time, but they insisted.
(Man) Okay, let's focus. Can you chase the legal team for their comments? I'll start revising the sections that are already approved. We'll have to work late tonight.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Man) Excuse me, could you direct me to the baggage claim area for flight 405 from Tokyo?
(Woman) Certainly. Just follow the signs for Baggage Claim B. It's down this escalator and to your left.
(Man) Baggage Claim B. Thank you. Do you know which carousel the luggage will be on?
(Woman) It should be displayed on the monitors above the carousels once you get down there. Usually, international flights use carousels 5 or 6.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Woman) I received the samples of the new packaging designs. What did you think?
(Man) I liked Option B the best. The colors are bold, and the logo stands out more.
(Woman) I agree. Option A was a bit too plain. Should we go ahead and place the order for Option B then?
(Man) Yes, let's order 5,000 units to start. Please send the final design file to the printing company today.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Man) Hi, I'd like to book a taxi to the airport for tomorrow morning.
(Woman) Okay. What time do you need to be picked up, and from what address?
(Man) I need to be picked up at 5:30 AM from 120 Maple Street. My flight is at 8:00 AM.
(Woman) 5:30 AM... Maple Street... Got it. That should give you plenty of time. Your taxi is booked.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Woman) The printer on the third floor is making a strange noise again.
(Man) Didn't we just have it repaired last month?
(Woman) Yes, but the noise is back. It sounds like something is grinding inside.
(Man) Okay, I'll put in another service request with the maintenance company. In the meantime, maybe use the printer on the fourth floor?
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Man) How was the conference in Chicago? Was Dr. Evans' keynote speech good?
(Woman) It was fantastic! Very inspiring. She talked about the future of renewable energy.
(Man) I wish I could have gone. Did you get a copy of her presentation slides?
(Woman) Yes, they e-mailed a link to all attendees this morning. I can forward it to you if you'd like.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Woman) We need to order more supplies for the break room. We're almost out of coffee and sugar.
(Man) Okay. Should I add anything else to the list? How are we doing on paper cups and stirrers?
(Woman) We seem to have plenty of those. Just coffee and sugar for now. Can you place the order today?
(Man) Sure, I'll do it right after lunch using our usual supplier website.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Man) Hi, I'm interested in renting meeting Room C for a client presentation next Tuesday afternoon.
(Woman) Okay, let me check the availability for Room C... It looks like it's already booked from 1 PM to 3 PM.
(Man) Oh. My meeting is supposed to be from 2 PM to 4 PM. What about Room B? Is that free?
(Woman) Yes, Room B is available all afternoon. It's slightly smaller, but it still has a projector. Would you like to book that one?
---
**Meeting Room Schedule - Tuesday**
- Room A: 9 AM - 12 PM (Booked), 1 PM - 5 PM (Available)
- Room B: 9 AM - 12 PM (Available), **1 PM - 5 PM** (Available)
- Room C: 9 AM - 12 PM (Available), **1 PM - 3 PM** (Booked), 3 PM - 5 PM (Available)
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Woman) I just saw the announcement about the office renovation starting next month.
(Man) Me too. It says our department will have to temporarily relocate to the 5th floor.
(Woman) The 5th floor? Isn't that where the marketing team is? It's going to be crowded.
(Man) I know. But the memo said it's only for three weeks while they replace the carpeting on our floor.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Man) Good morning, Central Bank. How may I help you?
(Woman) Hello, I'd like to report a lost credit card. I think I may have left it at a restaurant last night.
(Man) Okay, I can help you with that. I need to ask you a few security questions first to verify your identity. Can you please provide your full name and date of birth?
(Woman) Yes, it's Laura Chen, and my date of birth is May 15, 1985.
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Woman) We need to finalize the advertising budget for next quarter. Have you reviewed the proposal from the agency?
(Man) Yes, I looked it over this morning. Their proposed spending on social media ads seems very high compared to last quarter.
(Woman) I agree. I think we should allocate more funds to television commercials instead. Our target audience responds well to those.
(Man) Okay, let's adjust the figures and send the revised budget back to them for discussion.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Man) My flight is delayed by two hours. I'm going to miss my connecting flight in Dallas.
(Woman) Oh no, that's terrible. Have you spoken to the airline agent?
(Man) Yes, they said they will automatically rebook me on the next available flight to Seattle once I arrive in Dallas.
(Woman) Okay, that's good at least. Do you need me to call the hotel in Seattle and let them know you'll be arriving much later?
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "What is the man interested in?",
      'options': [
        "Buying a camera",
        "Taking a beginner's course",
        "Attending an advanced workshop",
        "Visiting on Wednesday",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'I'd like to sign up for the advanced photography workshop...'",
    },
    {
      'question': "Why might the advanced workshop be unsuitable for the man?",
      'options': [
        "It is too expensive.",
        "It is on a Saturday.",
        "He lacks prior knowledge.",
        "It is already full.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The woman mentions the workshop 'assumes some prior knowledge,' and the man confirms he is new to digital cameras.",
    },
    {
      'question': "What does the woman recommend?",
      'options': [
        "Buying a different camera",
        "Reading the camera manual",
        "Taking an introductory course",
        "Waiting until next month",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I'd strongly recommend starting with our 'Introduction to Digital Photography' course.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A project report deadline",
        "Feedback from a client",
        "The legal department's comments",
        "Working late",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript35_37 \n\n=> The woman informs the man that the client needs 'the final project report by tomorrow morning, not Friday.'",
    },
    {
      'question': "Why is the new deadline difficult to meet?",
      'options': [
        "The client insisted.",
        "They need feedback first.",
        "The report is very long.",
        "The man is busy.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'We still need to incorporate the feedback from the legal team.'",
    },
    {
      'question': "What will the woman do?",
      'options': [
        "Revise the report",
        "Contact the legal team",
        "Call the client",
        "Work late tonight",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man asks, 'Can you chase the legal team for their comments?'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "Where most likely are the speakers?",
      'options': [
        "On an airplane",
        "At a train station",
        "At an airport",
        "At a hotel",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man asks for 'baggage claim area for flight 405', mentions 'carousel', indicating an airport.",
    },
    {
      'question': "What information does the man want?",
      'options': [
        "Directions to Baggage Claim B",
        "The flight number",
        "Which carousel to use",
        "The location of the monitors",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The man asks, 'Do you know which carousel the luggage will be on?'",
    },
    {
      'question': "What does the woman suggest the man do?",
      'options': [
        "Follow the signs",
        "Go to carousel 5 or 6",
        "Look at the monitors",
        "Ask another agent",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The woman says information 'should be displayed on the monitors above the carousels'.",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "Packaging designs",
        "Product samples",
        "A printing company",
        "A logo",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'I received the samples of the new packaging designs.'",
    },
    {
      'question': "Which option does the man prefer?",
      'options': ["Option A", "Option B", "A plainer design", "A bolder logo"],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The man states, 'I liked Option B the best.'",
    },
    {
      'question': "What will the woman likely do today?",
      'options': [
        "Order 5,000 units",
        "Revise Option A",
        "Send a file to the printer",
        "Compare the options again",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The man requests, 'Please send the final design file to the printing company today.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What service is the man booking?",
      'options': ["A hotel room", "A flight", "A rental car", "A taxi"],
      'correctIndex': 3,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'Hi, I'd like to book a taxi...'",
    },
    {
      'question': "When does the man need the service?",
      'options': ["This afternoon", "Tomorrow morning", "8:00 AM", "5:30 PM"],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> He needs it 'for tomorrow morning' at '5:30 AM'.",
    },
    {
      'question': "What information does the man provide?",
      'options': [
        "His flight number",
        "His destination address",
        "His pickup address",
        "His phone number",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> He gives the pickup time and 'from 120 Maple Street.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What problem are the speakers discussing?",
      'options': [
        "A broken printer",
        "A strange noise",
        "A recent repair",
        "The fourth floor printer",
      ],
      'correctIndex': 1, // Focus is the noise
      'explain':
          "$transcript47_49 \n\n=> The woman says the printer 'is making a strange noise again,' and it sounds like 'something is grinding'.",
    },
    {
      'question': "When was the printer last repaired?",
      'options': ["Today", "Yesterday", "Last week", "Last month"],
      'correctIndex': 3,
      'explain':
          "$transcript47_49 \n\n=> The man asks, 'Didn't we just have it repaired last month?'",
    },
    {
      'question': "What will the man do?",
      'options': [
        "Fix the printer himself",
        "Use the fourth floor printer",
        "Request a repair service",
        "Buy a new printer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'Okay, I'll put in another service request...'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What event did the woman attend?",
      'options': [
        "A lecture on energy",
        "A meeting in Chicago",
        "A conference",
        "A presentation by Dr. Evans",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man asks 'How was the conference in Chicago?'",
    },
    {
      'question': "What was the topic of Dr. Evans' speech?",
      'options': [
        "Renewable energy",
        "Chicago",
        "Presentation slides",
        "Future conferences",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'She talked about the future of renewable energy.'",
    },
    {
      'question': "What does the woman offer to do?",
      'options': [
        "Go to Chicago",
        "Give a presentation",
        "Send the man a link",
        "E-mail Dr. Evans",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> After mentioning the link was e-mailed, she says, 'I can forward it to you if you'd like.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What supplies are needed for the break room?",
      'options': [
        "Paper cups and stirrers",
        "Coffee and sugar",
        "Snacks and drinks",
        "Cleaning supplies",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The woman says, 'We're almost out of coffee and sugar.'",
    },
    {
      'question': "What does the man ask about?",
      'options': [
        "The budget for supplies",
        "The usual supplier",
        "Other needed items",
        "When to place the order",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> The man asks, 'Should I add anything else to the list? How are we doing on paper cups and stirrers?'",
    },
    {
      'question': "When will the man likely place the order?",
      'options': ["This morning", "This afternoon", "Tomorrow", "Next week"],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'Sure, I'll do it right after lunch...'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "Look at the graphic. What is Room C used for?",
      'options': [
        "Client presentations",
        "Meetings",
        "Interviews",
        "Training sessions",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The graphic is titled 'Meeting Room Schedule'.",
    },
    {
      'question': "Look at the graphic. Why can't the man use Room C at 2 PM?",
      'options': [
        "It is too small.",
        "It does not have a projector.",
        "It is already booked.",
        "It is undergoing maintenance.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The woman says, 'It looks like it's already booked from 1 PM to 3 PM.' The graphic confirms this.",
    },
    {
      'question': "Look at the graphic. What is true about Room B?",
      'options': [
        "It is larger than Room C.",
        "It is booked in the morning.",
        "It does not have a projector.",
        "It is available from 1 PM to 5 PM.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript56_58 \n\n=> The woman says 'Room B is available all afternoon.' The graphic confirms '1 PM - 5 PM (Available)'.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A new office location",
        "An office renovation",
        "The marketing team",
        "Replacing carpeting",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The woman saw 'the announcement about the office renovation'.",
    },
    {
      'question': "Where will the speakers' department temporarily relocate?",
      'options': [
        "To marketing",
        "To the 1st floor",
        "To the 5th floor",
        "To a temporary building",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The man read that 'our department will have to temporarily relocate to the 5th floor.'",
    },
    {
      'question': "How long will the relocation last?",
      'options': ["One week", "Three weeks", "One month", "Six weeks"],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man says the memo stated 'it's only for three weeks'.",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "What service is the woman calling about?",
      'options': [
        "Credit card services",
        "Loan applications",
        "Checking accounts",
        "Investment advice",
      ],
      'correctIndex': 0, // Specifically lost credit card
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'Hello, I'd like to report a lost credit card.'",
    },
    {
      'question': "What information does the man ask for first?",
      'options': [
        "Her account number",
        "Her address",
        "Her name and date of birth",
        "Where she lost the card",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'Can you please provide your full name and date of birth?'",
    },
    {
      'question': "Where does the woman think she lost the card?",
      'options': ["At the bank", "At home", "At a restaurant", "In a taxi"],
      'correctIndex': 2,
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'I think I may have left it at a restaurant last night.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "Next quarter's sales",
        "An advertising budget",
        "A proposal from an agency",
        "Television commercials",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'We need to finalize the advertising budget for next quarter.'",
    },
    {
      'question': "What is the man's concern about the proposal?",
      'options': [
        "The total cost is too high.",
        "The social media spending is too high.",
        "The agency is not experienced.",
        "The television ad budget is too low.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript65_67 \n\n=> The man says, 'Their proposed spending on social media ads seems very high...'",
    },
    {
      'question': "What do the speakers agree to do?",
      'options': [
        "Approve the proposal",
        "Find a new agency",
        "Increase social media spending",
        "Adjust the budget allocation",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript65_67 \n\n=> The woman suggests allocating more to TV. The man agrees ('Okay') and says 'let's adjust the figures'.",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the man's problem?",
      'options': [
        "His flight was canceled.",
        "He missed his flight.",
        "He will miss a connecting flight.",
        "He needs to rebook his flight.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'My flight is delayed... I'm going to miss my connecting flight in Dallas.'",
    },
    {
      'question': "What did the airline agent tell the man?",
      'options': [
        "He needs to pay a fee.",
        "He will be rebooked automatically.",
        "He should call the hotel.",
        "The next flight is full.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> The man relays, 'they said they will automatically rebook me on the next available flight...'",
    },
    {
      'question': "What does the woman offer to do?",
      'options': [
        "Rebook the flight",
        "Contact the airline",
        "Meet the man in Dallas",
        "Call the man's hotel",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript68_70 \n\n=> The woman asks, 'Do you need me to call the hotel in Seattle and let them know...?'",
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
        'audioPath': 'LR_practice_tests/$testId/part3/LR_test9_part3.wav',
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
Tired of cooking dinner every night? Let 'Meals Made Easy' help! We deliver fresh, delicious, ready-to-heat meals right to your door. Choose from dozens of menu options each week, including vegetarian and low-calorie choices. Our meals are prepared by professional chefs using high-quality ingredients. Visit mealsmadeeasy.com to view our menu and sign up. New customers get 25% off their first week's order!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
May I have your attention please. Would passenger Laura Chen, traveling on flight 550 to Singapore, please return to the security checkpoint immediately. Passenger Laura Chen, please return to the security checkpoint. An item requiring your attention was left behind. Thank you.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
So, to summarize the feedback from the focus group, consumers generally liked the new product design, but many felt the proposed price point of \$99 was too high. They compared it unfavorably to competitor products priced around \$70. This suggests we either need to lower our price or do a better job of communicating the product's unique value proposition to justify the higher cost. Let's discuss which approach is more viable.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling 'Franklin Furniture'. Our showroom is open Monday through Saturday, 10 AM to 8 PM, and Sunday, 11 AM to 6 PM. For questions about an existing order or delivery status, please press one. To speak with a sales associate about our products, press two. For directions to our showroom or information about our financing options, press three. For all other inquiries, please stay on the line.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome everyone to the City Zoo! My name is Ken, and I'll be your guide for this special 'Behind the Scenes' tour of our big cat enclosure. We'll get a close-up look at the lions and tigers and learn about their care from one of our zookeepers. This tour will last about 30 minutes. Please stay with me at all times and do not attempt to feed or touch the animals. Flash photography is also prohibited as it can startle them. Let's head this way.
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
This chart shows our company's progress towards our sustainability goals over the past year. As you can see, we successfully reduced our energy consumption by 10%, exceeding our target of 8%. We also increased our recycling rate to 60%. However, we fell short of our goal to reduce water usage, which actually increased slightly. We need to investigate the reasons for this and implement stricter water conservation measures in the coming year.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
And in transportation news, the City Transit Authority has announced that the new light rail line connecting downtown to the airport will officially open for service next Monday, September 16. The project, which took three years to complete, is expected to significantly reduce traffic congestion and provide a faster commute for travelers. Fares will be \$3 per ride. A launch ceremony will be held at the airport station next Monday morning.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
It is my distinct pleasure to introduce our guest speaker this evening, Dr. Maria Garcia. Dr. Garcia is a leading researcher in the field of artificial intelligence and the head of the AI Ethics Lab at National University. Her groundbreaking work on responsible AI development has been published in numerous academic journals. Tonight, she will be discussing the societal implications of rapidly advancing AI. Please give a warm welcome to Dr. Maria Garcia.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Welcome to the employee wellness fair! Please take a look at the schedule of events. We have various information booths and activities throughout the day. Right now, at 10:00 AM, the 'Healthy Cooking' demonstration is starting in the Cafeteria Annex. Also, flu shots are available in the Nurse's Office until noon. Later this afternoon, don't miss the stress management workshop. Enjoy the fair!
---
**Wellness Fair Schedule**
- 9:00 AM: Fair Opens (Main Hall)
- 10:00 AM: **Healthy Cooking Demo** (Cafeteria Annex)
- 10:00 AM - 12:00 PM: Flu Shots (Nurse's Office)
- 11:00 AM: Yoga Session (Gymnasium)
- 1:00 PM: Nutrition Talk (Room 101)
- 2:30 PM: Stress Management Workshop (Room 101)
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention 'StyleFirst' shoppers. We are pleased to announce that our annual summer clearance sale begins today! Find incredible savings throughout the store, with discounts up to 70% off original prices on spring and summer apparel, shoes, and accessories. Hurry in for the best selection! The sale runs through this Sunday. Thank you for shopping at StyleFirst.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What service is being advertised?",
      'options': [
        "Grocery delivery",
        "Meal delivery",
        "Restaurant catering",
        "Cooking classes",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Meals Made Easy' và nói 'We deliver fresh, delicious, ready-to-heat meals'.",
    },
    {
      'question': "What is mentioned about the meals?",
      'options': [
        "They are frozen.",
        "They are prepared by chefs.",
        "They are delivered daily.",
        "They require cooking.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'Our meals are prepared by professional chefs'.",
    },
    {
      'question': "What offer is available for new customers?",
      'options': [
        "Free delivery",
        "A free meal",
        "25% off their first week",
        "A vegetarian option",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'New customers get 25% off their first week's order!'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "Who is this announcement for?",
      'options': [
        "Airline staff",
        "All passengers",
        "A specific passenger",
        "Security personnel",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Thông báo gọi tên cụ thể 'passenger Laura Chen'.",
    },
    {
      'question': "Where should Laura Chen go?",
      'options': [
        "To Gate 550",
        "To the baggage claim",
        "To the security checkpoint",
        "To the airline counter",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Thông báo yêu cầu cô ấy 'please return to the security checkpoint immediately.'",
    },
    {
      'question': "Why is Laura Chen being asked to return?",
      'options': [
        "Her flight is boarding.",
        "She left something behind.",
        "There is a problem with her ticket.",
        "She needs additional screening.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Lý do được nêu là 'An item requiring your attention was left behind.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the topic of discussion?",
      'options': [
        "A new product design",
        "Competitor pricing",
        "Focus group feedback",
        "A launch date",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói đang tóm tắt 'the feedback from the recent focus group'.",
    },
    {
      'question': "What did consumers think about the product's price?",
      'options': [
        "It was reasonable.",
        "It was too high.",
        "It was lower than competitors'.",
        "It was not mentioned.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Người nói báo cáo 'many felt the proposed price point of \$99 was too high.'",
    },
    {
      'question': "What is one possible action the speaker suggests?",
      'options': [
        "Redesign the product",
        "Launch the product immediately",
        "Ignore the feedback",
        "Lower the price",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript77_79 \n\n=> Người nói đề xuất 'we either need to lower our price or do a better job of communicating the product's unique value'.",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is this?",
      'options': [
        "A bank",
        "A furniture store",
        "An electronics shop",
        "A delivery service",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn là của ''Franklin Furniture'' và đề cập đến 'showroom'.",
    },
    {
      'question': "When is the showroom open on Sundays?",
      'options': [
        "10 AM to 8 PM",
        "11 AM to 6 PM",
        "9 AM to 5 PM",
        "It is closed",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói giờ mở cửa 'Sunday, 11 AM to 6 PM.'",
    },
    {
      'question': "What should a caller press to ask about financing?",
      'options': ["One", "Two", "Three", "Stay on the line"],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn hướng dẫn 'For... information about our financing options, press three.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': [
        "A zoo enclosure",
        "A museum",
        "An animal hospital",
        "A zookeeper's office",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript83_85 \n\n=> Người nói chào mừng đến 'the City Zoo!' và giới thiệu tour 'of our big cat enclosure.'",
    },
    {
      'question': "How long will the tour last?",
      'options': ["30 minutes", "45 minutes", "60 minutes", "90 minutes"],
      'correctIndex': 0,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'This tour will last about 30 minutes.'",
    },
    {
      'question': "What are listeners forbidden from doing?",
      'options': [
        "Asking questions",
        "Taking photos",
        "Feeding the animals",
        "Staying with the group",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói yêu cầu 'do not attempt to feed or touch the animals.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the main topic of this part of the presentation?",
      'options': [
        "Energy consumption",
        "Recycling rates",
        "Water usage",
        "Sustainability goals progress",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Người nói giới thiệu 'This slide shows our company's progress towards our sustainability goals...'",
    },
    {
      'question': "In which area did the company exceed its target?",
      'options': [
        "Energy reduction",
        "Recycling rate",
        "Water conservation",
        "Overall sustainability",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói 'we successfully reduced our energy consumption by 10%, exceeding our target of 8%.'",
    },
    {
      'question': "What happened with water usage?",
      'options': [
        "It decreased slightly.",
        "It increased slightly.",
        "It met the target.",
        "It was not measured.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói 'we fell short of our goal to reduce water usage, which actually increased slightly.'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What project is the news report about?",
      'options': [
        "A new airport terminal",
        "A new light rail line",
        "Road repairs",
        "Reduced traffic congestion",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Tin tức thông báo 'the new light rail line connecting downtown to the airport will officially open...'",
    },
    {
      'question': "When will the new service begin?",
      'options': [
        "Hôm nay",
        "Thứ Hai tuần sau",
        "Trong ba năm",
        "Khi lễ khai trương diễn ra",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Tuyến mới 'will officially open for service next Monday, September 16.'",
    },
    {
      'question': "How much will a ride cost?",
      'options': ["\$1", "\$3", "\$5", "Miễn phí"],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Người nói nói, 'Fares will be \$3 per ride.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Dr. Garcia's field?",
      'options': [
        "Sociology",
        "Computer Science",
        "Artificial Intelligence",
        "Academic Publishing",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu cô ấy là 'a leading researcher in the field of artificial intelligence'.",
    },
    {
      'question': "Where does Dr. Garcia work?",
      'options': [
        "At a private company",
        "For an academic journal",
        "At National University",
        "In AI development",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Cô ấy là 'head of the AI Ethics Lab at National University.'",
    },
    {
      'question': "What will Dr. Garcia discuss tonight?",
      'options': [
        "Her research methods",
        "Responsible AI development",
        "The societal impact of AI",
        "Her academic publications",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói, 'Tonight, she will be discussing the societal implications of rapidly advancing AI.'",
    },
    // Talk 9 (Q95-97)
    {
      'question': "Look at the graphic. What event is happening at 10:00 AM?",
      'options': [
        "Yoga Session",
        "Flu Shots",
        "Healthy Cooking Demo",
        "Fair Opening",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói 'Right now, at 10:00 AM, the 'Healthy Cooking' demonstration is starting...'. Lịch trình cũng xác nhận điều này.",
    },
    {
      'question': "Look at the graphic. Where can employees get flu shots?",
      'options': [
        "Main Hall",
        "Cafeteria Annex",
        "Nurse's Office",
        "Gymnasium",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói đề cập 'flu shots are available in the Nurse's Office'. Lịch trình cũng xác nhận điều này.",
    },
    {
      'question': "Look at the graphic. What is scheduled for 2:30 PM?",
      'options': [
        "Nutrition Talk",
        "Yoga Session",
        "Stress Management Workshop",
        "Healthy Cooking Demo",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Lịch trình ghi '2:30 PM: Stress Management Workshop (Room 101)'. Người nói cũng đề cập đến nó.",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What event is being announced?",
      'options': [
        "A store closing",
        "A clearance sale",
        "A new product arrival",
        "Extended store hours",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Thông báo về 'annual summer clearance sale begins today!'",
    },
    {
      'question': "What items are mentioned as being discounted?",
      'options': [
        "All items in the store",
        "Only shoes and accessories",
        "Spring and summer clothing", // Includes shoes and accessories
        "Only items with original prices",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Giảm giá 'up to 70% off original prices on spring and summer apparel, shoes, and accessories.'",
    },
    {
      'question': "How long will the sale last?",
      'options': ["Hôm nay", "Đến Chủ Nhật", "Cả mùa hè", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'The sale runs through this Sunday.'",
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
        'audioPath': 'LR_practice_tests/$testId/part4/LR_test9_part4.wav',
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
          "The report highlights several ______ for improving efficiency.",
      'options': ['suggest', 'suggests', 'suggested', 'suggestions'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "several" cần một danh từ số nhiều (suggestions - đề xuất).',
    },
    {
      'question': "Ms. Ito will ______ the workshop on project management.",
      'options': ['facilitate', 'facility', 'facilitator', 'facilitation'],
      'correctIndex': 0,
      'explain':
          'Sau động từ khuyết thiếu "will" cần một động từ nguyên mẫu (facilitate - điều phối).',
    },
    {
      'question':
          "Please submit your expense reports ______ than usual this month.",
      'options': ['early', 'earlier', 'earliest', 'earliness'],
      'correctIndex': 1,
      'explain':
          'Cần dạng so sánh hơn (earlier - sớm hơn) của trạng từ "early" vì có "than usual".',
    },
    {
      'question':
          "The company ______ offers employees opportunities for training.",
      'options': ['regular', 'regularly', 'regularity', 'regulate'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (regularly - thường xuyên) để bổ nghĩa cho động từ "offers".',
    },
    {
      'question':
          "______ the product launch was successful, sales have been slow.",
      'options': ['Since', 'Because', 'Therefore', 'Although'],
      'correctIndex': 3,
      'explain': '"Although" (mặc dù) là liên từ chỉ sự tương phản.',
    },
    {
      'question': "The new software is ______ with most operating systems.",
      'options': ['compatible', 'compatibility', 'compatibly', 'compete'],
      'correctIndex': 0,
      'explain': 'Cần một tính từ (compatible - tương thích) sau động từ "is".',
    },
    {
      'question':
          "All visitors must ______ a security badge at the front desk.",
      'options': ['obtain', 'obtains', 'obtaining', 'obtainable'],
      'correctIndex': 0,
      'explain':
          'Sau động từ khuyết thiếu "must" cần một động từ nguyên mẫu (obtain - nhận).',
    },
    {
      'question':
          "The marketing team is ______ for creating promotional materials.",
      'options': ['response', 'responsible', 'respond', 'responsibly'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (responsible - chịu trách nhiệm) sau động từ "is".',
    },
    {
      'question': "The ______ of the new CEO was announced yesterday.",
      'options': ['appoint', 'appointed', 'appointing', 'appointment'],
      'correctIndex': 3,
      'explain':
          'Sau mạo từ "The" cần một danh từ (appointment - sự bổ nhiệm).',
    },
    {
      'question': "The meeting scheduled for tomorrow has been ______.",
      'options': ['cancel', 'cancels', 'canceled', 'canceling'],
      'correctIndex': 2,
      'explain':
          'Cần một quá khứ phân từ (canceled) để tạo thành thể bị động (has been canceled - đã bị hủy).',
    },
    {
      'question': "Our goal is to provide ______ customer service.",
      'options': ['except', 'exception', 'exceptional', 'exceptionally'],
      'correctIndex': 2,
      'explain':
          'Cần một tính từ (exceptional - xuất sắc) để bổ nghĩa cho cụm danh từ "customer service".',
    },
    {
      'question': "Please review the document ______ for any errors.",
      'options': ['careful', 'carefully', 'carefulness', 'caring'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (carefully - cẩn thận) để bổ nghĩa cho động từ "review".',
    },
    {
      'question':
          "The company plans to ______ its operations into Asia next year.",
      'options': ['expand', 'expansion', 'expanded', 'expansive'],
      'correctIndex': 0,
      'explain':
          'Sau "plans to" cần một động từ nguyên mẫu (expand - mở rộng).',
    },
    {
      'question': "Employees are ______ to take a 30-minute lunch break.",
      'options': ['entitle', 'entitles', 'entitled', 'entitlement'],
      'correctIndex': 2,
      'explain': 'Cấu trúc bị động "are entitled to" (có quyền) + V.',
    },
    {
      'question':
          "The ______ demand for organic products has led to increased production.",
      'options': ['grow', 'grew', 'growing', 'growth'],
      'correctIndex': 2,
      'explain':
          'Cần một hiện tại phân từ dùng như tính từ (growing - đang tăng) để bổ nghĩa cho danh từ "demand".',
    },
    {
      'question': "______ Mr. Kim nor Ms. Lee could attend the meeting.",
      'options': ['Either', 'Both', 'Neither', 'Also'],
      'correctIndex': 2,
      'explain': 'Cấu trúc "Neither... nor..." (Không... cũng không...).',
    },
    {
      'question':
          "The new system will ______ employees to access information more easily.",
      'options': ['able', 'enable', 'ability', 'unable'],
      'correctIndex': 1,
      'explain':
          'Cần một động từ (enable - cho phép) sau "will". Cấu trúc "enable someone to do something".',
    },
    {
      'question': "Please make sure your workspace is ______ before you leave.",
      'options': ['organize', 'organized', 'organizing', 'organization'],
      'correctIndex': 1,
      'explain': 'Sau động từ "is" cần một tính từ (organized - ngăn nắp).',
    },
    {
      'question':
          "The ______ of the project depends on securing adequate funding.",
      'options': ['succeed', 'success', 'successful', 'successfully'],
      'correctIndex': 1,
      'explain':
          'Sau mạo từ "The" cần một danh từ (success - sự thành công) để làm chủ ngữ.',
    },
    {
      'question':
          "The workshop is ______ for employees with less than one year of experience.",
      'options': ['intend', 'intended', 'intending', 'intention'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (intended - được dành cho) sau động từ "is" (thể bị động).',
    },
    {
      'question':
          "The manager is ______ reviewing applications for the position.",
      'options': ['current', 'currently', 'currency', 'currentness'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (currently - hiện tại) để bổ nghĩa cho động từ "is reviewing".',
    },
    {
      'question': "All ______ must be submitted through the online portal.",
      'options': ['apply', 'applying', 'applicant', 'applications'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "All" cần một danh từ số nhiều (applications - đơn ứng tuyển).',
    },
    {
      'question':
          "The new regulations will have a significant ______ on our industry.",
      'options': ['impact', 'impacted', 'impactful', 'impacting'],
      'correctIndex': 0,
      'explain':
          'Sau tính từ "significant" cần một danh từ (impact - ảnh hưởng).',
    },
    {
      'question': "The details of the plan are still ______ confidential.",
      'options': ['strict', 'strictly', 'strictness', 'stricter'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (strictly - tuyệt đối) để bổ nghĩa cho tính từ "confidential".',
    },
    {
      'question':
          "The company ______ provides transportation for employees working late.",
      'options': ['routinely', 'routine', 'route', 'routing'],
      'correctIndex': 0,
      'explain':
          'Cần một trạng từ (routinely - thường lệ) để bổ nghĩa cho động từ "provides".',
    },
    {
      'question':
          "______ participant will receive a certificate upon completion.",
      'options': ['All', 'Several', 'Each', 'Many'],
      'correctIndex': 2,
      'explain':
          '"Each" (Mỗi) đi với danh từ số ít ("participant") và động từ số ít ("will receive").',
    },
    {
      'question': "The product demonstration was ______ informative.",
      'options': ['high', 'higher', 'highly', 'height'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (highly - rất) để bổ nghĩa cho tính từ "informative".',
    },
    {
      'question': "The hotel offers several dining ______ for its guests.",
      'options': ['option', 'options', 'optional', 'optionally'],
      'correctIndex': 1,
      'explain':
          'Sau tính từ "several" cần một danh từ số nhiều (options - lựa chọn).',
    },
    {
      'question':
          "______ the contract has been signed, work can begin immediately.",
      'options': ['Despite', 'Unless', 'Now that', 'Whereas'],
      'correctIndex': 2,
      'explain':
          '"Now that" (Bởi vì bây giờ) là liên từ chỉ nguyên nhân - kết quả phù hợp.',
    },
    {
      'question':
          "The ______ of the two candidates will be announced tomorrow.",
      'options': ['choose', 'chose', 'chosen', 'choice'],
      'correctIndex': 3,
      'explain': 'Sau mạo từ "The" cần một danh từ (choice - sự lựa chọn).',
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
To: Project Team <project.delta@company.com>
From: Kenji Tanaka <k.tanaka@company.com>
Subject: Meeting Cancelled - Project Delta
Date: November 5

Hi Team,
Please note that our weekly Project Delta status meeting scheduled for tomorrow morning, November 6, at 10:00 A.M. has been ____(131)____.

I need to attend an urgent, unexpected meeting with the client at that time. ____(132)____.

I will send out a new meeting invitation shortly for sometime later in the week, ____(133)____ Thursday or Friday afternoon. ____(134)____ keep an eye on your calendars. In the meantime, please continue working on your assigned tasks.
""";
  // --- Passage 2: Questions 135-138 (Advertisement) ---
  final passage135_138 = """
**Central Perk Coffee - Now Hiring Baristas!**

Central Perk Coffee is looking for friendly and energetic individuals to join our team as baristas. ____(135)____ candidates should have excellent customer service skills and a passion for coffee.

Previous barista experience is preferred, but not ____(136)____. We provide comprehensive training. Responsibilities include preparing beverages, ____(137)____ the cash register, and maintaining store cleanliness.

We offer flexible schedules and competitive wages. ____(138)____. Apply online at centralperk.com/careers or pick up an application in store.
""";
  // --- Passage 3: Questions 139-142 (Notice) ---
  final passage139_142 = """
**Attention Gym Members: Locker Room Maintenance**

Please be aware that the men's locker room will be temporarily closed for plumbing repairs from 8:00 A.M. to 12:00 P.M. this Wednesday, April 10.

During this ____(139)____, members needing to use locker room facilities are advised to use the family changing room located near the pool area. ____(140)____ changing room is unisex.

The women's locker room will not be affected. We apologize for the ____(141)____ and appreciate your  ____(142)____ and understanding as we work to maintain our facilities.
""";
  // --- Passage 4: Questions 143-146 (Article) ---
  final passage143_146 = """
**Innovatech Launches New Software**

(August 22) – Innovatech Corporation today released 'ConnectPro 2.0', the latest version of its popular project management software. This major ____(143)____ includes a redesigned user interface, enhanced collaboration tools, and improved mobile compatibility.

"We listened carefully to customer feedback when developing this new version," said CEO David Chen. "Our goal was to make ConnectPro more intuitive ____(144)____ powerful."

____(145)____. The software is available now ____(146)____ purchase or upgrade through the company's website. Existing users can upgrade at a discounted price for a limited time.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["cancel", "cancels", "canceled", "canceling"],
      'correctIndex': 2,
      'explain':
          "Cần một quá khứ phân từ (canceled) để tạo thành thể bị động (has been canceled).",
    },
    {
      'question': "",
      'options': [
        "Please prepare your updates anyway.",
        "The client meeting is mandatory.",
        "I apologize for the short notice.",
        "The project is ahead of schedule.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này là một lời xin lỗi phù hợp sau khi thông báo hủy họp đột ngột ('urgent, unexpected meeting').",
    },
    {
      'question': "",
      'options': ["probable", "probabilistic", "probably", "probability"],
      'correctIndex': 2,
      'explain':
          "Cần một trạng từ (probably - có lẽ) để chỉ khả năng về thời gian ('Thursday or Friday').",
    },
    {
      'question': "",
      'options': ["But", "So", "Or", "If"],
      'correctIndex': 1,
      'explain':
          "Liên từ 'So' (Vì vậy) được dùng để chỉ kết quả hoặc hành động tiếp theo cần làm.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["Ideal", "Ideally", "Idealist", "Idealize"],
      'correctIndex': 0,
      'explain':
          "Cần một tính từ (Ideal - lý tưởng) để bổ nghĩa cho danh từ 'candidates'.",
    },
    {
      'question': "",
      'options': ["required", "requiring", "requires", "requirement"],
      'correctIndex': 0,
      'explain': "Cần một tính từ (required - bắt buộc) sau 'not'.",
    },
    {
      'question': "",
      'options': ["operate", "operated", "operating", "operational"],
      'correctIndex': 2,
      'explain':
          "Danh sách các trách nhiệm được nối bằng 'and'. Sau 'preparing' (V-ing), cần một V-ing khác (operating).",
    },
    {
      'question': "",
      'options': [
        "Training takes two weeks.",
        "Customer service skills are essential.",
        "Benefits include health insurance and paid time off.",
        "Our store is located downtown.",
      ],
      'correctIndex': 2,
      'explain':
          "Câu này cung cấp thông tin hấp dẫn (phúc lợi) cho ứng viên tiềm năng, phù hợp với quảng cáo tuyển dụng.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["period", "periodic", "periodical", "periodically"],
      'correctIndex': 0,
      'explain':
          "Sau tính từ 'this' cần một danh từ (period - khoảng thời gian).",
    },
    {
      'question': "",
      'options': ["This", "That", "These", "Those"],
      'correctIndex': 0,
      'explain':
          "Đại từ chỉ định 'This' (này) thay thế cho 'family changing room' vừa được nhắc đến.",
    },
    {
      'question': "",
      'options': ["inconvenience", "inconvenient", "inconveniently", "convene"],
      'correctIndex': 0,
      'explain':
          "Sau mạo từ 'the' cần một danh từ (inconvenience - sự bất tiện).",
    },
    {
      'question': "", // "We appreciate your ____(142)____ and understanding."
      'options': ["patient", "patients", "patience", "patiently"],
      'correctIndex': 2,
      'explain':
          "Sau tính từ sở hữu 'your' cần một danh từ (patience - sự kiên nhẫn).",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["upgrade", "upgraded", "upgrading", "upgrades"],
      'correctIndex': 0,
      'explain': "Sau tính từ 'major' cần một danh từ (upgrade - sự nâng cấp).",
    },
    {
      'question': "",
      'options': ["and", "or", "but", "so"],
      'correctIndex': 0,
      'explain':
          "Liên từ 'and' được dùng để nối hai tính từ bổ nghĩa cho ConnectPro (intuitive and powerful).",
    },
    {
      'question': "",
      'options': [
        "Customer feedback was very positive.",
        "This version addresses several known bugs.",
        "The development process took two years.",
        "Training sessions will be offered next month.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này cung cấp thêm thông tin về lợi ích của phiên bản mới, phù hợp với ngữ cảnh giới thiệu sản phẩm.",
    },
    {
      'question': "",
      'options': ["to", "for", "with", "by"],
      'correctIndex': 1,
      'explain':
          "Giới từ 'for' được dùng để chỉ mục đích (available for purchase - có sẵn để mua).",
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
**Downtown Parking Garage - Monthly Rates**

Convenient and secure parking available now!
Located at 250 Central Avenue, entrance on Elm Street.

* **Monthly Permit (Standard)**: \$150/month
  * Access 6 AM - 10 PM, Mon-Fri
* **Monthly Permit (24/7 Access)**: \$200/month
  * Unlimited access, 7 days a week
* **Reserved Spot Option**: Add \$50/month to either permit.

Visit the garage office (Level 1) or cityparking.org to purchase your permit. Limited permits available.
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: Marketing Team <marketing@greentech.com>
From: Sarah Chen <s.chen@greentech.com>
Subject: Brainstorming Session - New Campaign
Date: June 11

Hi Team,
Let's schedule a brainstorming session to generate ideas for the Q4 advertising campaign for our 'EcoPure' water filter.
Please send me your availability for next Tuesday afternoon (June 18). I'm hoping we can find a 90-minute slot that works for everyone.
I'll book a conference room once we have a time. Come prepared with initial concepts!
Best,
Sarah
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**David (1:55 PM)**: Hi Kenji, quick question. Do you have the final attendance number for tomorrow's workshop? I need to confirm the catering order.
**Kenji (1:56 PM)**: Let me check the registration list... Looks like we have 32 confirmed attendees.
**David (1:57 PM)**: Okay, great. The caterer needed the final count by 2 PM. Thanks!
**Kenji (1:58 PM)**: No problem.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**'TechGadget' Magazine Reviews New 'SoundWave' Speaker**

(August 8) – The latest portable Bluetooth speaker from AudioCorp, the 'SoundWave Mini', hits stores this week, and TechGadget has put it to the test. Priced competitively at \$79, the Mini boasts impressive sound quality for its compact size.

Its key features include a 12-hour battery life, waterproof design (IPX7 rated), and the ability to pair with a second Mini speaker for stereo sound. Setup was straightforward via Bluetooth.

While the bass response won't shake the room, the audio is clear and balanced. For anyone seeking a durable, portable speaker for travel or outdoor use, the SoundWave Mini is an excellent option.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Attention Conference Attendees:**
**Session Room Change**

Please note that the workshop "Advanced Project Management," originally scheduled for Room 201 at 1:30 PM today, has been moved to **Room 305**.

This change was made to provide a larger space. All other details remain the same. Please proceed to Room 305 for this session. We apologize for any confusion.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Employees
**From**: Human Resources
**Date**: January 8
**Subject**: Inclement Weather Policy Reminder

With winter weather approaching, please take a moment to review the company's inclement weather policy, available on the intranet under HR Policies.

In the event of severe weather impacting commutes, the company may announce a delayed opening, early closure, or full closure. Official announcements will be made via company-wide e-mail and the employee hotline (555-SNOW) by 6:00 AM.

Unless an official closure is announced, employees are expected to report to work as scheduled. Please prioritize your safety when making travel decisions.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Kenji Tanaka <ktanaka@clientmail.com>
From: Sarah Evans, Apex Consulting <s.evans@apexconsult.com>
Subject: Project Proposal Attached
Date: November 1

Dear Mr. Tanaka,
It was a pleasure speaking with you yesterday about Apex Consulting's services.
As discussed, I have attached our detailed proposal outlining how we can assist your company with its upcoming market research project. The proposal includes project scope, methodology, timeline, and estimated costs.
Please review the document at your convenience. I would be happy to schedule a follow-up call next week to answer any questions you may have.
Sincerely,
Sarah Evans
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**'City Bistro' - Online Reservations**

Book your table online! Please select your preferred date, time, and party size.
* **Date**: [ Calendar Dropdown ]
* **Time**: [ Time Dropdown (5:00 PM - 9:30 PM, increments of 15 min) ]
* **Party Size**: [ 1-8+ ] -> **4 selected**

**Availability for Friday, October 18, Party of 4:**
* 5:00 PM - Available
* 5:15 PM - Available
* ...
* 7:00 PM - **Not Available**
* 7:15 PM - **Not Available**
* 7:30 PM - Available
* 7:45 PM - Available
* ...

Please note: For parties larger than 8, please call the restaurant directly at 555-BISTRO. We require a credit card to hold reservations for parties of 6 or more.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**'Office Pro' - Supply Order Form**

**Company**: Apex Corporation
**Department**: Marketing (Attn: David Chen)
**Date**: Sep 10

| Item Code | Description              | Unit   | Qty | Unit Price | Total    |
|-----------|--------------------------|--------|-----|------------|----------|
| P101      | Copy Paper, 8.5x11, White| Ream   | 20  | \$4.00     | \$80.00  |
| P105      | Copy Paper, 8.5x14, White| Ream   | 5   | \$5.00     | \$25.00  |
| B220      | Pens, Ballpoint, Black   | Box(12)| 10  | \$8.00     | \$80.00  |
| E300      | Envelopes, #10           | Box(500)| 2   | \$15.00    | \$30.00  |
|           |                          |        |     | Subtotal   | \$215.00 |
|           | **Rush Order Requested**: [X] Yes [ ] No |     | Rush Fee   | \$25.00  |
|           |                          |        |     | Tax        | \$14.40  |
|           |                          |        |     | **TOTAL** | **\$254.40** |

**Requested Delivery**: Sep 11 (Tomorrow)
""";
  // Q172-175 (Article)
  final passage172_175 = """
**'Global Motors' Unveils Electric SUV**

(November 12) – 'Global Motors' unveiled its first all-electric SUV, the 'Voltara', at the International Auto Show today. The vehicle boasts a range of over 300 miles on a single charge and features cutting-edge autonomous driving capabilities.

CEO Mark Stevens stated that the Voltara represents a major step in the company's commitment to sustainable transportation. "We believe electric vehicles are the future, and the Voltara sets a new standard for performance and technology in its class," Stevens said.

Pre-orders for the Voltara will begin next month, with the first deliveries expected in the second half of next year. Pricing details have not yet been released.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (New Double Passage: Ad + E-mail)
  final passage176_180_1 = """
To: service@techrepairpros.com
From: david.lee@email.com
Subject: Repair Status Inquiry - Ticket #TRP-1050
Date: June 5

Hello,
I dropped off my laptop (Model XYZ) for screen repair last Monday (May 29). My repair ticket number is TRP-1050.
The initial estimate was that the repair would take 3-5 business days. It has now been over a week, and I haven't received any updates.
Could you please provide an update on the status of my repair and an estimated completion date? I need the laptop back urgently for work.
Thank you,
David Lee
""";
  final passage176_180_2 = """
To: david.lee@email.com
From: service@techrepairpros.com
Subject: Re: Repair Status Inquiry - Ticket #TRP-1050
Date: June 6

Dear Mr. Lee,
Thank you for your inquiry regarding repair ticket #TRP-1050. We apologize for the delay and the lack of communication.
We experienced an unexpected delay in receiving the necessary replacement screen for your specific laptop model (XYZ) from our supplier. The part arrived yesterday afternoon.
Our technician began the repair this morning, and we now estimate it will be completed by the end of the day tomorrow, June 7. We will call you as soon as it is ready for pickup.
We apologize again for the inconvenience.
Sincerely,
Tech Repair Pros Customer Service
""";
  // Q181-185 (New Double Passage: Article + E-mail)
  final passage181_185_1 = """
**Notice: Apex Corporation Cafeteria**

**New Hours Effective October 1**
Please note that the company cafeteria will have new operating hours starting next Monday, October 1.
* Breakfast: 7:00 AM - 9:30 AM (Previously 7:30 AM - 10:00 AM)
* Lunch: 11:30 AM - 1:30 PM (No change)
* Coffee & Snacks: Available 7:00 AM - 3:00 PM (Previously until 4:00 PM)

These changes are being made based on usage patterns and to optimize staffing. We appreciate your understanding.
- Cafeteria Management
""";
  final passage181_185_2 = """
To: Cafeteria Management
From: Kenji Tanaka (Accounting Dept.)
Subject: Cafeteria Hours Change
Date: September 28

Hello,
I saw the notice about the new cafeteria hours starting October 1. I usually take a late lunch break and often grab a coffee around 3:30 PM.

With the coffee service ending at 3:00 PM under the new schedule, will there be any other options for getting coffee in the building after that time? The vending machine coffee isn't very good.

Just wondering if this was considered.
Thanks,
Kenji Tanaka
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (New Triple Passage: Notice + E-mail + E-mail)
  final passage186_190_1 = """
**Westwood Library Website - Room Booking**

**Study Room Policy:**
* Study rooms can be booked by library cardholders only.
* Bookings can be made online up to 7 days in advance.
* Maximum booking duration: 2 hours per day per person.
* Rooms are equipped with table, chairs, power outlets, and Wi-Fi. Projectors available upon request (subject to availability).
* Please cancel your booking online if your plans change. No-shows may result in temporary suspension of booking privileges.
""";
  final passage186_190_2 = """
**To**: studyrooms@westlib.org
**From**: mark.davis@email.com
**Subject**: Study Room Booking - June 12
**Date**: June 10

Hello,
I need to book a study room for a small group meeting (4 people) this Wednesday, June 12, from 1:00 PM to 3:00 PM.
Could you please book a suitable room for me? My library card number is WPL-5509.
Also, we will need a projector for a presentation. Could you confirm if one will be available?
Thank you,
Mark Davis
""";
  final passage186_190_3 = """
**To**: mark.davis@email.com
**From**: studyrooms@westlib.org
**Subject**: Re: Study Room Booking - June 12
**Date**: June 11

Dear Mr. Davis,
We have booked Study Room 3 for you on Wednesday, June 12, from 1:00 PM to 3:00 PM. Room 3 seats up to 6 people.
We have also reserved a projector for you. Please pick it up from the main circulation desk when you arrive.
Remember to cancel online if your plans change.
Sincerely,
Westwood Library Staff
""";
  // Q191-195 (New Triple Passage: Article + E-mail + Review)
  final passage191_195_1 = """
**To**: project_managers@globaltech.com
**From**: Training Department <training@globaltech.com>
**Subject**: Upcoming Workshop: Advanced Project Scheduling
**Date**: October 1

Dear Project Managers,
We are pleased to offer an advanced workshop focused on project scheduling techniques using our new 'PlanPro' software. This 1-day workshop will cover critical path analysis, resource allocation, and risk management features within the software.
The workshop will be led by external consultant, Ms. Jane Evans. See attached for her bio.
Date: Friday, October 18
Time: 9:00 AM - 5:00 PM
Location: Training Center - Room 5
Please register via the employee portal by October 11.
""";
  final passage191_195_2 = """
**To**: Training Department <training@globaltech.com>
**From**: Kenji Tanaka <k.tanaka@globaltech.com>
**Subject**: Re: Upcoming Workshop: Advanced Project Scheduling
**Date**: October 9

Hello Training Team,
I would like to register for the 'Advanced Project Scheduling' workshop on October 18. However, I have a mandatory client call that morning from 9:00 AM to 10:00 AM.
Would it be acceptable if I join the workshop approximately one hour late, around 10:00 AM? Please let me know if this is possible.
Thanks,
Kenji Tanaka
""";
  final passage191_195_3 = """
**Advanced Project Scheduling Workshop - Oct 18 - Agenda**
**Location**: Training Center - Room 5

* 9:00 AM - 9:15 AM: Welcome & Introductions
* 9:15 AM - 10:30 AM: PlanPro Overview & Interface Navigation
* 10:30 AM - 10:45 AM: Coffee Break
* 10:45 AM - 12:00 PM: Critical Path Analysis Techniques
* 12:00 PM - 1:00 PM: Lunch (Provided)
* 1:00 PM - 2:30 PM: Resource Allocation & Leveling
* 2:30 PM - 2:45 PM: Break
* 2:45 PM - 4:00 PM: Risk Management Features
* 4:00 PM - 5:00 PM: Q&A and Wrap-up
""";
  // Q196-200 (New Triple Passage: E-mail + E-mail + Invoice)
  final passage196_200_1 = """
**To**: reservations@parklanehotel.com
**From**: david.miller@innovate.com
**Subject**: Conference Room Booking Request
**Date**: April 8

Dear Reservations Team,
I would like to book the 'Maple' conference room for a full-day meeting on Tuesday, April 23. We expect approximately 15 attendees.
We will require the standard setup with a projector, screen, and whiteboard. We would also like to arrange for coffee/tea service in the morning and afternoon.
Please confirm availability and provide a quote for the room rental and beverage service.
Thank you,
David Miller
""";
  final passage196_200_2 = """
**To**: david.miller@innovate.com
**From**: reservations@parklanehotel.com
**Subject**: Re: Conference Room Booking Request
**Date**: April 9

Dear Mr. Miller,
Thank you for your inquiry. The 'Maple' room is available on Tuesday, April 23.
* Room Rental (Full Day): \$400
* Projector/Screen/Whiteboard: Included
* Beverage Service (Morning & Afternoon): \$10 per person x 15 people = \$150
* **Total Estimated Cost**: **\$550** + tax

Please reply to this e-mail to confirm your booking. We require a credit card guarantee.
Sincerely,
Park Lane Hotel Reservations
""";
  final passage196_200_3 = """
**To**: reservations@parklanehotel.com
**From**: david.miller@innovate.com
**Subject**: Re: Conference Room Booking Request - CONFIRMED
**Date**: April 9

Dear Reservations,
Thank you for the prompt quote. Please proceed with booking the 'Maple' room and beverage service for 15 people on April 23.
Please use the corporate credit card already on file for Innovatech Corporation (Attn: D. Miller).
Please send a final confirmation.
Thanks,
David Miller
""";

  final part7Questions = [
    // Q147-148 (Advertisement) - New
    {
      'question':
          passage147_148 +
          "\n\n147. What service does the advertisement promote?",
      'options': [
        "Office cleaning",
        "Dry cleaning",
        "Parking permits",
        "Car washing",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) là về 'Downtown Parking Garage - Monthly Rates'.",
    },
    {
      'question':
          passage147_148 +
          "\n\n148. What is the cost difference per month between standard and 24/7 access?",
      'options': ["\$50", "\$100", "\$150", "\$200"],
      'correctIndex': 0,
      'explain':
          "Gói Standard là \$150/tháng, gói 24/7 là \$200/tháng. Chênh lệch là \$50.",
    },
    // Q149-150 (E-mail) - New
    {
      'question':
          passage149_150 +
          "\n\n149. What is the purpose of Sarah Chen's e-mail?",
      'options': [
        "To present campaign ideas",
        "To book a conference room",
        "To schedule a brainstorming meeting",
        "To request availability",
      ],
      'correctIndex': 2, // Also D, but C is the main goal
      'explain':
          "Sarah (Passage 2) viết 'Let's schedule a brainstorming session' và yêu cầu mọi người gửi 'your availability'.",
    },
    {
      'question': passage149_150 + "\n\n150. What product is the campaign for?",
      'options': [
        "EcoPure water filter",
        "GreenTech services",
        "Q4 advertisements",
        "Conference rooms",
      ],
      'correctIndex': 0,
      'explain':
          "Sarah (Passage 2) đề cập đến 'the Q4 advertising campaign for our 'EcoPure' water filter'.",
    },
    // Q151-152 (Text Message Chain) - New
    {
      'question':
          passage151_152 + "\n\n151. Why did David send the first message?",
      'options': [
        "To schedule a meeting",
        "To ask about Kenji's availability",
        "To confirm a catering order",
        "To get an attendance number",
      ],
      'correctIndex': 3,
      'explain':
          "David (Passage 3) hỏi 'Do you have the final attendance number for tomorrow's workshop?'",
    },
    {
      'question':
          passage151_152 +
          "\n\n152. How many people are confirmed for the workshop?",
      'options': ["2", "15", "30", "32"],
      'correctIndex': 3,
      'explain':
          "Kenji (Passage 3) trả lời 'Looks like we have 32 confirmed attendees.'",
    },
    // Q153-155 (Article) - New
    {
      'question':
          passage151_152 + "\n\n153. What product did TechGadget review?",
      'options': [
        "A smartphone",
        "A portable speaker",
        "Headphones",
        "A stereo system",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) đánh giá 'The latest portable Bluetooth speaker... the 'SoundWave Mini''.",
    },
    {
      'question':
          passage153_155 + "\n\n154. What is mentioned as a key feature?",
      'options': [
        "Low price",
        "Excellent bass",
        "Waterproof design",
        "Long setup time",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) liệt kê 'waterproof design (IPX7 rated)' là một 'key feature'.",
    },
    {
      'question':
          passage153_155 +
          "\n\n155. Who might find this product particularly useful?",
      'options': [
        "Audiophiles",
        "People who travel",
        "Home theater enthusiasts",
        "Professional musicians",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) kết luận 'For anyone seeking a durable, portable speaker for travel or outdoor use...'",
    },
    // Q156-157 (Notice) - New
    {
      'question': passage156_157 + "\n\n156. What change is being announced?",
      'options': [
        "New cafeteria location",
        "New breakfast menu",
        "Shorter lunch hours",
        "Reduced breakfast service",
      ],
      'correctIndex': 3,
      'explain':
          "Thông báo (Passage 5) nói 'the cafeteria will no longer be serving hot breakfast items' và sẽ chuyển sang 'only continental breakfast options'.",
    },
    {
      'question': passage156_157 + "\n\n157. When will the change take effect?",
      'options': ["Tuần này", "Thứ Hai tuần sau", "Tháng sau", "Ngay lập tức"],
      'correctIndex': 1,
      'explain': "Thông báo (Passage 5) ghi 'starting next Monday, April 22'.",
    },
    // Q158-160 (Memo) - New
    {
      'question': passage158_160 + "\n\n158. What is the purpose of the memo?",
      'options': [
        "To remind employees about payroll",
        "To announce an emergency",
        "To ask employees to verify information",
        "To explain benefit changes",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 6) yêu cầu nhân viên 'verify that your contact information... is up to date.'",
    },
    {
      'question':
          passage158_160 +
          "\n\n159. Where can employees update their information?",
      'options': [
        "By e-mailing HR",
        "On the company intranet",
        "In the employee self-service portal",
        "By contacting their manager",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 6) hướng dẫn 'log in to the employee self-service portal'.",
    },
    {
      'question': passage158_160 + "\n\n160. What is the deadline?",
      'options': ["Tuần này", "Thứ Sáu", "Cuối tháng", "Không có hạn chót"],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) yêu cầu 'Please complete this by Friday, June 29.'",
    },
    // Q161-163 (E-mail) - New
    {
      'question':
          passage161_163 + "\n\n161. Why did Laura Chen send the e-mail?",
      'options': [
        "To order a sweater",
        "To track a shipment",
        "To request a refund for an item",
        "To complain about service",
      ],
      'correctIndex': 2,
      'explain':
          "Chủ đề (Passage 7) là 'Return Request' và Laura viết 'I would like to return this item for a full refund.'",
    },
    {
      'question': passage161_163 + "\n\n162. What is the item number?",
      'options': ["SM-901", "BL-100", "Không rõ", "30"],
      'correctIndex': 1,
      'explain': "Laura (Passage 7) đề cập '(a blue sweater, item #BL-100)'.",
    },
    {
      'question':
          passage161_163 + "\n\n163. What does Laura need from the company?",
      'options': [
        "A refund confirmation",
        "A smaller size",
        "Return instructions and a label",
        "A discount code",
      ],
      'correctIndex': 2,
      'explain':
          "Laura (Passage 7) hỏi, 'Could you please provide instructions and a return shipping label?'",
    },
    // Q164-167 (Webpage) - New
    {
      'question':
          passage164_167 +
          "\n\n164. What type of event is happening on October 22?",
      'options': [
        "A book signing",
        "A workshop",
        "An author talk",
        "A story time",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) liệt kê 'Author Talk: Maria Garcia' vào 'Tuesday, October 22'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n165. What is the topic of the October 26 workshop?",
      'options': [
        "Local history",
        "Family history research",
        "Using library computers",
        "Online resources",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) mô tả hội thảo 'Introduction to Genealogy' là 'Learn how to... research your family history'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n166. Which event has a limited number of participants?",
      'options': [
        "Author Talk",
        "Genealogy Workshop",
        "Children's Story Time",
        "Tất cả các sự kiện",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) ghi chú cho Genealogy Workshop: 'Registration required (limit 15 participants)'.",
    },
    {
      'question': passage164_167 + "\n\n167. Who is presenting the workshop?",
      'options': [
        "Maria Garcia",
        "A librarian",
        "The Oakwood Historical Society",
        "Không rõ",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) ghi 'Presented by the Oakwood Historical Society'.",
    },
    // Q168-171 (Form) - New
    {
      'question': passage168_171 + "\n\n168. What did Kenji Tanaka order?",
      'options': [
        "Một cái cưa",
        "Dụng cụ điện",
        "Vật tư xây dựng",
        "Phần cứng",
      ],
      'correctIndex': 0,
      'explain': "Form (Passage 9) mô tả 'Heavy-Duty Rotary Saw'.",
    },
    {
      'question': passage168_171 + "\n\n169. What is the manufacturer's name?",
      'options': ["Pro Hardware", "XZ-500", "M. Evans", "PowerTool Inc."],
      'correctIndex': 3,
      'explain': "Form (Passage 9) ghi 'Manufacturer: 'PowerTool Inc.''.",
    },
    {
      'question':
          passage168_171 +
          "\n\n170. When is the item expected to arrive at the store?",
      'options': ["April 5", "April 12", "Khi khách hàng đến", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "Mục 'Store Use Only' (Passage 9) ghi 'Supplier ETA: April 12'.",
    },
    {
      'question':
          passage168_171 +
          "\n\n171. What should the store do when the item arrives?",
      'options': [
        "Call the customer",
        "E-mail the customer",
        "Ship it to the customer",
        "Hold it for pickup",
      ],
      'correctIndex': 0,
      'explain':
          "Ghi chú của khách hàng (Passage 9) yêu cầu 'Call me when it arrives.'",
    },
    // Q172-175 (Article) - New
    {
      'question':
          passage172_175 +
          "\n\n172. What product drove Innovate Tech's revenue growth?",
      'options': [
        "New products",
        "A wireless router",
        "R&D services",
        "Company stock",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nói 'growth was largely driven by strong sales of its flagship product, the 'ConnectPro' wireless router'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n173. What happened to the company's net profit?",
      'options': ["Nó tăng 12%", "Nó giảm 3%", "Nó không đổi", "Nó tăng 5%"],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nói 'net profit saw a slight decline of 3%'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n174. According to the CEO, what is the company focusing on?",
      'options': [
        "Cutting costs",
        "Increasing router sales",
        "Long-term growth through innovation",
        "Improving stock price",
      ],
      'correctIndex': 2,
      'explain':
          "Ông Chen (Passage 10) nói, 'We are investing heavily in innovation to ensure our long-term growth.'",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. What does Innovate Tech plan to do later in the year?",
      'options': [
        "Release financial results",
        "Increase R&D spending",
        "Launch new products",
        "Buy back stock",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) kết luận 'Innovate Tech plans to launch two new products in the fourth quarter.'",
    },

    // --- Double Passages ---

    // Q176-180 (New Double Passage: E-mail + E-mail)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. Why did David Lee send the first e-mail?",
      'options': [
        "To check on a repair",
        "To order a new screen",
        "To complain about service",
        "To drop off his laptop",
      ],
      'correctIndex': 0,
      'explain':
          "David (Passage 1) viết, 'I dropped off my laptop... Could you please provide an update on the status of my repair...?'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. What caused the delay in the repair?",
      'options': [
        "The technician was busy.",
        "The wrong part was ordered.",
        "The supplier shipped the part late.",
        "The laptop model was old.",
      ],
      'correctIndex': 2,
      'explain':
          "Phản hồi (Passage 2) giải thích, 'We experienced an unexpected delay in receiving the necessary replacement screen... from our supplier.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. When did the replacement part arrive?",
      'options': ["May 29", "June 5", "June 6", "June 7"],
      'correctIndex': 1, // Arrived yesterday afternoon (June 5)
      'explain':
          "E-mail phản hồi (Passage 2) được viết vào 'June 6' và nói 'The part arrived yesterday afternoon.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. What is the new estimated completion date?",
      'options': ["June 6", "June 7", "June 8", "Trong 3-5 ngày"],
      'correctIndex': 1,
      'explain':
          "E-mail phản hồi (Passage 2) nói, 'we now estimate it will be completed by the end of the day tomorrow, June 7.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. How will Mr. Lee be notified when the repair is done?",
      'options': [
        "By e-mail",
        "By text message",
        "By phone call",
        "He needs to check back",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail phản hồi (Passage 2) nói, 'We will call you as soon as it is ready for pickup.'",
    },
    // Q181-185 (New Double Passage: Notice + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What change is announced in the notice?",
      'options': [
        "New cafeteria location",
        "New menu items",
        "New operating hours",
        "New staffing schedule",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 1) có tiêu đề 'New Hours Effective October 1' và liệt kê giờ mới.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. Which service's hours remain unchanged?",
      'options': [
        "Breakfast",
        "Lunch",
        "Coffee & Snacks",
        "Tất cả đều thay đổi",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 1) ghi 'Lunch: 11:30 AM - 1:30 PM (No change)'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What time will coffee service end starting October 1?",
      'options': ["1:30 PM", "3:00 PM", "3:30 PM", "4:00 PM"],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 1) ghi giờ mới cho 'Coffee & Snacks: Available 7:00 AM - 3:00 PM'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Why did Kenji Tanaka write the e-mail?",
      'options': [
        "To complain about the food",
        "To suggest new hours",
        "To ask about coffee availability",
        "To praise the cafeteria staff",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 2) lo lắng về việc dịch vụ cà phê kết thúc lúc 3:00 PM và hỏi 'will there be any other options for getting coffee... after that time?'",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What does Kenji Tanaka think about the vending machine coffee?",
      'options': [
        "It is convenient.",
        "It is inexpensive.",
        "It tastes good.",
        "It does not taste good.",
      ],
      'correctIndex': 3,
      'explain':
          "Kenji (Passage 2) nói, 'The vending machine coffee isn't very good.'",
    },

    // --- Triple Passages ---

    // Q186-190 (New Triple Passage: Webpage + E-mail + E-mail)
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n186. According to the webpage, what is the maximum booking time per day?",
      'options': ["1 giờ", "2 giờ", "3 giờ", "Không giới hạn"],
      'correctIndex': 1,
      'explain':
          "Chính sách (Passage 1) ghi 'Maximum booking duration: 2 hours per day per person'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. What equipment did Mark Davis request?",
      'options': [
        "Wi-Fi access",
        "Power outlets",
        "A whiteboard",
        "A projector",
      ],
      'correctIndex': 3,
      'explain':
          "Trong e-mail (Passage 2), Mark viết 'Also, we will need a projector'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. In the second e-mail, what room was booked for Mr. Davis?",
      'options': ["Study Room 1", "Study Room 3", "Study Room 6", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "E-mail phản hồi (Passage 3) nói 'We have booked Study Room 3 for you'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. Where should Mr. Davis pick up the projector?",
      'options': [
        "In Study Room 3",
        "At the circulation desk",
        "From the library staff",
        "Online",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail phản hồi (Passage 3) hướng dẫn 'Please pick it up from the main circulation desk'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What might happen if Mr. Davis doesn't show up?",
      'options': [
        "He will be charged a fee.",
        "His booking privileges may be suspended.",
        "The room will be given to someone else.",
        "The projector will be put away.",
      ],
      'correctIndex': 1,
      'explain':
          "Chính sách (Passage 1) cảnh báo 'No-shows may result in temporary suspension of booking privileges'.",
    },
    // Q191-195 (New Triple Passage: E-mail + E-mail + Schedule)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. What is the subject of the first e-mail?",
      'options': [
        "A workshop registration",
        "An introduction to PlanPro",
        "A request for project managers",
        "Information about an upcoming workshop",
      ],
      'correctIndex': 3,
      'explain':
          "E-mail đầu tiên (Passage 1) từ bộ phận Đào tạo, thông báo về 'Upcoming Workshop: Advanced Project Scheduling'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. Who is leading the workshop?",
      'options': [
        "Kenji Tanaka",
        "The Training Department",
        "Jane Evans",
        "Không rõ",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail đầu tiên (Passage 1) nói 'The workshop will be led by external consultant, Ms. Jane Evans.'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. Why did Kenji Tanaka write the second e-mail?",
      'options': [
        "To register for the workshop",
        "To ask about the workshop content",
        "To inquire about joining late",
        "To cancel his registration",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 2) giải thích anh ấy có cuộc gọi từ 9-10 AM và hỏi 'Would it be acceptable if I join the workshop approximately one hour late...?'",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. According to the agenda, what topic will be covered at 10:45 AM?",
      'options': [
        "PlanPro Overview",
        "Coffee Break",
        "Critical Path Analysis",
        "Resource Allocation",
      ],
      'correctIndex': 2,
      'explain':
          "Lịch trình (Passage 3) ghi '10:45 AM - 12:00 PM: Critical Path Analysis Techniques'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. If Kenji Tanaka joins at 10:00 AM, what will he miss?",
      'options': [
        "Welcome & Introductions only",
        "Part of the PlanPro Overview",
        "The entire PlanPro Overview",
        "The Coffee Break",
      ],
      'correctIndex': 1,
      'explain':
          "Lịch trình (Passage 3) cho thấy phần 'PlanPro Overview & Interface Navigation' diễn ra từ 9:15 AM đến 10:30 AM. Nếu anh ấy tham gia lúc 10:00 AM, anh ấy sẽ bỏ lỡ phần đầu của mục này.",
    },
    // Q196-200 (New Triple Passage: E-mail + Reply + Confirmation)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. What did David Miller request in his first e-mail?",
      'options': [
        "A quote for catering",
        "Availability and quote for a room and beverage service",
        "Booking for 15 executives",
        "Information about the Maple room",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) yêu cầu 'confirm availability and provide a quote for the room rental and beverage service.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the hotel's reply, what is the cost of the beverage service?",
      'options': ["\$10", "\$15", "\$150", "\$550"],
      'correctIndex': 2,
      'explain':
          "E-mail phản hồi (Passage 2) tính toán 'Beverage Service... \$10 per person x 15 people = \$150'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. What is included in the room rental fee?",
      'options': [
        "Beverage service",
        "Catering",
        "Projector and screen",
        "Tax",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail phản hồi (Passage 2) liệt kê 'Projector/Screen/Whiteboard: Included' riêng biệt với 'Room Rental'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What action did David Miller take in the third e-mail?",
      'options': [
        "He asked for a discount.",
        "He changed the number of attendees.",
        "He confirmed the booking.",
        "He provided credit card details.",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail thứ ba (Passage 3) có chủ đề '- CONFIRMED' và nói 'Please proceed with booking...'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. How will the booking be guaranteed?",
      'options': [
        "By paying a deposit",
        "Using a corporate credit card on file",
        "By signing a contract",
        "By confirming via e-mail",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail phản hồi (Passage 2) yêu cầu 'a credit card guarantee'. David (Passage 3) hướng dẫn 'Please use the corporate credit card already on file...'",
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
