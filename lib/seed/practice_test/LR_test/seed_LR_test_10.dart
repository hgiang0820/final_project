// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest10() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_10';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 10',
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
        'order': 10,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang lau cửa sổ kính của tòa nhà cao tầng từ bên ngoài.
      // Transcript:
      // (A) He's washing windows on a tall building.
      // (B) He's repairing a window frame.
      // (C) He's painting the exterior of a house.
      // (D) He's installing new glass panes.
      'question': "",
      'options': [
        "He's washing windows on a tall building.",
        "He's repairing a window frame.",
        "He's painting the exterior of a house.",
        "He's installing new glass panes.",
      ],
      'correctIndex': 0,
      'explain':
          'Người đàn ông đang lau (washing) các cửa sổ kính (windows) của một tòa nhà cao tầng.',
    },
    {
      // Image Description: Nhiều loại bánh mì và bánh ngọt được bày trên kệ trong tiệm bánh.
      // Transcript:
      // (A) A baker is kneading dough.
      // (B) Pastries are displayed in a bakery case.
      // (C) Customers are waiting in line.
      // (D) Bread loaves are being sliced.
      'question': "",
      'options': [
        "A baker is kneading dough.",
        "Pastries are displayed in a bakery case.",
        "Customers are waiting in line.",
        "Bread loaves are being sliced.",
      ],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy nhiều loại bánh ngọt (pastries) được trưng bày (displayed) trong tủ kính của tiệm bánh (bakery case).',
    },
    {
      // Image Description: Một người phụ nữ đang cầm ô đi dưới mưa.
      // Transcript:
      // (A) She's opening an umbrella.
      // (B) She's waiting for a bus.
      // (C) She's holding an umbrella in the rain.
      // (D) She's folding an umbrella.
      'question': "",
      'options': [
        "She's opening an umbrella.",
        "She's waiting for a bus.",
        "She's holding an umbrella in the rain.",
        "She's folding an umbrella.",
      ],
      'correctIndex': 2,
      'explain':
          'Người phụ nữ đang cầm (holding) một chiếc ô (umbrella) khi trời đang mưa (in the rain).',
    },
    {
      // Image Description: Một khán phòng trống với các dãy ghế hướng về sân khấu.
      // Transcript:
      // (A) An audience is watching a performance.
      // (B) Musicians are setting up on stage.
      // (C) An auditorium is empty of people.
      // (D) Workers are cleaning the seats.
      'question': "",
      'options': [
        "An audience is watching a performance.",
        "Musicians are setting up on stage.",
        "An auditorium is empty of people.",
        "Workers are cleaning the seats.",
      ],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy một khán phòng (auditorium) không có người (empty of people).',
    },
    {
      // Image Description: Một người đàn ông đang sử dụng máy tính xách tay trên bàn làm việc.
      // Transcript:
      // (A) He's closing his laptop.
      // (B) He's talking on a mobile phone.
      // (C) He's writing in a notebook.
      // (D) He's working on a laptop computer.
      'question': "",
      'options': [
        "He's closing his laptop.",
        "He's talking on a mobile phone.",
        "He's writing in a notebook.",
        "He's working on a laptop computer.",
      ],
      'correctIndex': 3,
      'explain':
          'Người đàn ông đang ngồi trước máy tính xách tay (laptop computer) và có vẻ đang làm việc (working).',
    },
    {
      // Image Description: Máy bay đang đậu trên đường băng gần nhà ga sân bay.
      // Transcript:
      // (A) An airplane is flying overhead.
      // (B) An airplane is parked near a terminal building.
      // (C) Passengers are disembarking from a plane.
      // (D) Luggage is being unloaded from an aircraft.
      'question': "",
      'options': [
        "An airplane is flying overhead.",
        "An airplane is parked near a terminal building.",
        "Passengers are disembarking from a plane.",
        "Luggage is being unloaded from an aircraft.",
      ],
      'correctIndex': 1,
      'explain':
          'Bức tranh cho thấy một chiếc máy bay (airplane) đang đậu (parked) gần một tòa nhà nhà ga (terminal building).',
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
      // Q7
      // Where did you buy that scarf?
      // (A) It was a gift, actually.
      // (B) I bought it last winter.
      // (C) Yes, it's very warm.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Question asks "Where". (A) is an indirect answer explaining the origin without naming a place.',
    },
    {
      // Q8
      // When should we expect the auditors?
      // (A) They're checking the financial records.
      // (B) Sometime next week, I think.
      // (C) At the main entrance.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "When". (B) provides an estimated time frame.',
    },
    {
      // Q9
      // Who can help me install this software?
      // (A) It's the latest version.
      // (B) I installed it yesterday.
      // (C) You should ask someone from IT.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "Who". (C) suggests a relevant department.',
    },
    {
      // Q10
      // Why isn't the air conditioning working?
      // (A) It works very well usually.
      // (B) I think there was a power outage.
      // (C) Please turn it on.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Why". (B) provides a possible reason.',
    },
    {
      // Q11
      // How long will it take to repair the roof?
      // (A) The repair cost is high.
      // (B) It depends on the weather.
      // (C) On top of the building.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Question asks "How long". (B) is an indirect answer indicating uncertainty.',
    },
    {
      // Q12
      // Is there a discount for museum members?
      // (A) Yes, members get 10% off.
      // (B) The museum closes at 5 PM.
      // (C) I became a member last year.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Yes/No question. (A) answers "Yes" and gives details.',
    },
    {
      // Q13
      // Would you prefer coffee or tea with your dessert?
      // (A) The dessert menu looks delicious.
      // (B) Neither, thank you. I'm fine.
      // (C) Yes, I like coffee.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Alternative question ("or"). (B) declines both options.',
    },
    {
      // Q14
      // What's the best way to contact customer service?
      // (A) The service was excellent.
      // (B) I contacted them yesterday.
      // (C) Probably through the online chat.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "What\'s the best way". (C) suggests a method.',
    },
    {
      // Q15
      // You sent the invitation to Mr. Lee, didn't you?
      // (A) I'll invite him now.
      // (B) Yes, earlier this morning.
      // (C) The invention was successful.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Tag question. (B) answers "Yes" and gives time.',
    },
    {
      // Q16
      // How many people are on the project team?
      // (A) It's a very important project.
      // (B) There are six of us.
      // (C) We meet every week.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "How many". (B) provides a number.',
    },
    {
      // Q17
      // Why don't we order lunch now? I'm getting hungry.
      // (A) Okay, what should we get?
      // (B) The order arrived late.
      // (C) I ate lunch already.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Suggestion ("Why don\'t we...?"). (A) agrees ("Okay") and asks a follow-up question.',
    },
    {
      // Q18
      // Has the schedule for the conference been posted online?
      // (A) The conference is in London.
      // (B) Not yet, but it should be up tomorrow.
      // (C) I posted the letter.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Yes/No question. (B) answers "No" ("Not yet") and gives expected time.',
    },
    {
      // Q19
      // Could you show me how to use the new software?
      // (A) The show starts at 8 PM.
      // (B) It's very easy to use.
      // (C) Sure, let's sit down after lunch.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Request. (C) agrees ("Sure") and suggests a time.',
    },
    {
      // Q20
      // It's supposed to rain this afternoon.
      // (A) Yes, I heard the forecast.
      // (B) The train leaves soon.
      // (C) I suppose so.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Statement of information. (A) confirms hearing the same information.',
    },
    {
      // Q21
      // What time does your flight land?
      // (A) I'm flying to Boston.
      // (B) It's scheduled to land at 3:45 PM.
      // (C) On Global Airways.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "What time". (B) gives the landing time.',
    },
    {
      // Q22
      // Didn't you already read this book?
      // (A) Yes, but I want to read it again.
      // (B) I booked the tickets online.
      // (C) The library is closed.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Negative Yes/No question. (A) answers "Yes" and explains why.',
    },
    {
      // Q23
      // Whose coffee cup is this on my desk?
      // (A) I prefer tea.
      // (B) That might be mine, sorry.
      // (C) The coffee is cold.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Whose". (B) identifies the likely owner.',
    },
    {
      // Q24
      // How far is the drive to the client's office?
      // (A) It depends on traffic, maybe 45 minutes.
      // (B) The client is very important.
      // (C) I drove there yesterday.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Question asks "How far". (A) gives distance in terms of travel time and mentions a variable (traffic).',
    },
    {
      // Q25
      // Should I file this report or give it to Mr. Chen?
      // (A) Mr. Chen is out today.
      // (B) Just leave it on my desk for now.
      // (C) The report is very long.
      'question': "",
      'options': ['A', 'B', 'C'],
      'correctIndex':
          1, // Indirect answer, neither option but provides instruction.
      'explain':
          'Alternative question ("or"). (B) provides an alternative instruction.',
    },
    {
      // Q26
      // When are they announcing the contest winner?
      // (A) I hope I win.
      // (B) The announcement is scheduled for Friday.
      // (C) It's a writing contest.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "When". (B) gives the scheduled day.',
    },
    {
      // Q27
      // I don't understand this section of the contract.
      // (A) The contract is legally binding.
      // (B) Let's ask the legal department to clarify it.
      // (C) I understand completely.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Statement of a problem (lack of understanding). (B) suggests a way to get clarification.',
    },
    {
      // Q28
      // How often should the filters be replaced?
      // (A) According to the manual, every six months.
      // (B) I replaced them last week.
      // (C) They filter the air.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Question asks "How often". (A) provides the recommended frequency.',
    },
    {
      // Q29
      // Would you mind if I borrow your phone charger?
      // (A) My phone battery is low.
      // (B) Not at all, it's right here.
      // (C) I charge it overnight.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Request ("Would you mind if...?"). (B) agrees ("Not at all") and indicates location.',
    },
    {
      // Q30
      // What kind of car are you looking to buy?
      // (A) Something fuel-efficient.
      // (B) I'm looking online.
      // (C) The car dealership is nearby.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Question asks "What kind". (A) describes a desired characteristic.',
    },
    {
      // Q31
      // Have you contacted the supplier about the delay?
      // (A) The supplier is based in Germany.
      // (B) Yes, I spoke with them this morning.
      // (C) The delay was unavoidable.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Yes/No question. (B) answers "Yes" and gives time.',
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
(Woman) Hello, Franklin Hotel. How may I help you?
(Man) Hi, I have a reservation for tonight under the name Kenji Tanaka. I'm calling to see if it's possible to get a late check-in. My flight was delayed.
(Woman) Let me check your reservation... Yes, Mr. Tanaka. What time do you expect to arrive?
(Man) Probably around 1 AM.
(Woman) That won't be a problem at all. Our front desk is staffed 24 hours. We'll see you then.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Man) Excuse me, the coffee machine in the break room seems to be broken. It's not dispensing any coffee.
(Woman) Oh dear, again? That machine is always having problems. Did you check if it has water?
(Man) Yes, the water tank is full. The power light is on, but nothing happens when I press the button.
(Woman) Okay, I'll put a sign on it and submit a maintenance request right away. There's another machine on the 5th floor if you need coffee now.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Woman) David, have you finalized the presentation slides for the client meeting this afternoon?
(Man) Almost. I'm just waiting for the latest sales figures from the finance department to add to the last slide.
(Woman) Okay. The meeting starts at 3 PM. Do you think you'll have them ready by then?
(Man) Yes, finance promised to send the figures by 1 PM, so I'll have plenty of time to add them and print copies.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Man) Hi, I'd like to return this jacket. I bought it online, but it's too small.
(Woman) Certainly. Do you have the packing slip or order confirmation e-mail?
(Man) Yes, I have the e-mail on my phone. Order number is JKT-901.
(Woman) Thank you... Okay, I see the order. We can process a full refund to your original payment method. It should appear in 3-5 business days.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Woman) We need to decide on the menu for the company anniversary party.
(Man) Right. The caterer sent three different menu options. Did you have a chance to look at them?
(Woman) I did. I thought Menu B, the Italian buffet, looked the best and was reasonably priced.
(Man) I agree. Menu C was too expensive, and Menu A seemed a bit boring. Let's go with Menu B. I'll let the caterer know.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Man) Hello, I'm calling about the advertisement for the apartment rental on Pine Street.
(Woman) Yes, the one-bedroom? It's still available.
(Man) Great. Could you tell me if pets are allowed? I have a small cat.
(Woman) I'm sorry, but this building has a strict no-pets policy.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Woman) Kenji, did you hear back from the supplier about the delayed shipment of components?
(Man) Yes, I spoke to them this morning. They said the shipment was held up in customs but should be released today.
(Woman) That's cutting it close. We need those components by Friday to meet the production deadline.
(Man) I know. They promised to expedite the delivery as soon as it clears customs. I'll follow up with them again this afternoon.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Man) I've finished setting up the new employee workstations in the expansion wing.
(Woman) Excellent. Did the network cables arrive? We need to get them connected to the network.
(Man) Yes, the box of cables is on my desk. I was planning to run them this afternoon.
(Woman) Great. Let me know if you need any help. We want everything ready for the new hires starting Monday.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Woman) I need to book a flight to Miami for a conference. I need to arrive by Tuesday evening.
(Man) Okay, let me check the flights for Tuesday... There's Flight 101 arriving at 4 PM, or Flight 105 arriving at 8 PM.
(Woman) 4 PM would be ideal. How much is that one?
(Man) Let's see... Flight 101 is \$350. The later flight, 105, is slightly cheaper at \$320.
---
**Flights to Miami - Tuesday**
| Flight | Departs | Arrives | Price  | Status    |
|--------|---------|---------|--------|-----------|
| **101**| 1:00 PM | **4:00 PM** | **\$350**| Available |
| 103    | 3:00 PM | 6:00 PM | \$380  | Available |
| **105**| 5:00 PM | **8:00 PM** | **\$320**| Available |
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Man) I think we should repaint the office lobby. It's looking a bit worn out.
(Woman) I agree. It doesn't make a very good first impression. What color were you thinking?
(Man) Maybe a light blue or green? Something calming but professional.
(Woman) Light blue sounds nice. I'll get some paint samples and request a quote from the painting company we used last time.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Woman) Good afternoon, Dr. Allen's office.
(Man) Hello, I'm calling to reschedule my appointment for tomorrow afternoon. My name is Mark Davis.
(Woman) Okay, Mr. Davis. Let me pull up your file... I see you're scheduled for 2 PM. When would you like to reschedule for?
(Man) Do you have anything available next Monday morning?
(Woman) Let me check... Yes, we have an opening at 9:30 AM next Monday. Does that work?
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Man) The feedback on the latest software update has been very positive overall.
(Woman) That's great to hear. Are there any major bugs reported?
(Man) Just a minor issue with the date format displaying incorrectly for some international users. IT is already working on a patch.
(Woman) Okay, good. Let's make sure we communicate that to the users who reported it.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Woman) I need to arrange transportation from the airport to the hotel for Mr. Tanaka when he arrives next week.
(Man) Okay. Should I book a taxi or arrange for our company car service?
(Woman) Let's use the car service. It's more professional. His flight arrives at 3 PM on Tuesday.
(Man) Got it. I'll book the car service for 3 PM on Tuesday and send Mr. Tanaka the confirmation details.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "Why is the man calling?",
      'options': [
        "To make a reservation",
        "To ask about check-out time",
        "To inquire about late check-in",
        "To report a delayed flight",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'I'm calling to see if it's possible to get a late check-in.'",
    },
    {
      'question': "What time does the man expect to arrive?",
      'options': ["7 PM", "9 PM", "1 AM", "4 PM"],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The man estimates his arrival 'Probably around 1 AM.'",
    },
    {
      'question': "What does the woman say about the front desk?",
      'options': [
        "It closes at midnight.",
        "It is very busy.",
        "It is staffed 24 hours.",
        "It can handle check-ins.", // True but C is more specific
      ],
      'correctIndex': 2,
      'explain':
          "$transcript32_34 \n\n=> The woman assures him, 'Our front desk is staffed 24 hours.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What is the problem?",
      'options': [
        "The break room is messy.",
        "The coffee machine is broken.",
        "There is no water.",
        "The power is out.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man says, 'the coffee machine... seems to be broken. It's not dispensing any coffee.'",
    },
    {
      'question': "What did the man check?",
      'options': [
        "The power light",
        "The coffee beans",
        "The water level",
        "The buttons",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> In response to the woman's question, he says, 'Yes, the water tank is full.'",
    },
    {
      'question': "What will the woman do?",
      'options': [
        "Fix the machine herself",
        "Get coffee from the 5th floor",
        "Submit a maintenance request",
        "Buy a new machine",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> The woman says, 'Okay, I'll put a sign on it and submit a maintenance request right away.'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "What document are the speakers discussing?",
      'options': [
        "An invoice",
        "A budget report",
        "Presentation slides",
        "Sales figures",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The woman asks, 'have you finalized the presentation slides...?'",
    },
    {
      'question': "What information is the man waiting for?",
      'options': [
        "Client approval",
        "Sales figures",
        "Meeting time confirmation",
        "Presentation feedback",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> The man says, 'I'm just waiting for the latest sales figures from the finance department...'",
    },
    {
      'question': "When does the man expect to receive the information?",
      'options': ["Last night", "By 1 PM", "By 3 PM", "Tomorrow"],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> He says, 'finance promised to send the figures by 1 PM...'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "Why does the man want to return the jacket?",
      'options': [
        "It is damaged.",
        "He doesn't like the color.",
        "He received the wrong item.",
        "It is the wrong size.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I bought it online, but it's too small.'",
    },
    {
      'question': "What does the woman ask for?",
      'options': [
        "The jacket",
        "The man's phone",
        "Proof of purchase",
        "The original packaging",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The woman asks, 'Do you have the packing slip or order confirmation e-mail?'",
    },
    {
      'question': "What will the woman do for the man?",
      'options': [
        "Offer store credit",
        "Issue a refund",
        "Exchange it for a different size",
        "Repair the jacket",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman says, 'We can process a full refund to your original payment method.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What event are the speakers planning?",
      'options': [
        "A company anniversary party",
        "A client dinner",
        "A team lunch",
        "A catering tasting",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'We need to decide on the menu for the company anniversary party.'",
    },
    {
      'question': "Which menu option do the speakers prefer?",
      'options': ["Menu A", "Menu B", "Menu C", "A different caterer"],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The woman thought 'Menu B, the Italian buffet, looked the best'. The man agrees.",
    },
    {
      'question': "What was the man's opinion of Menu C?",
      'options': [
        "It was boring.",
        "It looked the best.",
        "It was too expensive.",
        "It was Italian food.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The man says, 'Menu C was too expensive...'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What is the man calling about?",
      'options': [
        "An apartment rental",
        "A house for sale",
        "Pet boarding services",
        "Building policies",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript47_49 \n\n=> The man asks about 'the advertisement for the apartment rental'.",
    },
    {
      'question': "What specific question does the man ask?",
      'options': [
        "If the apartment is available",
        "The size of the apartment",
        "If pets are allowed",
        "The rental price",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The man asks, 'Could you tell me if pets are allowed?'",
    },
    {
      'question': "What does the woman say about the building's policy?",
      'options': [
        "Small pets are allowed.",
        "Cats are permitted.",
        "There is a pet fee.",
        "Pets are not allowed.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript47_49 \n\n=> The woman replies, 'this building has a strict no-pets policy.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "A production deadline",
        "Customs procedures",
        "A delayed shipment",
        "Expedited delivery costs",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The woman asks if the man heard back 'about the delayed shipment of components'.",
    },
    {
      'question': "What caused the delay?",
      'options': [
        "A production issue",
        "A problem at customs",
        "A transportation strike",
        "The supplier was late",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man reports, 'They said the shipment was held up in customs'.",
    },
    {
      'question': "Why is the timing critical?",
      'options': [
        "The client needs them Friday.",
        "They need them for production.",
        "Customs closes on Friday.",
        "The supplier needs confirmation.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The woman says, 'We need those components by Friday to meet the production deadline.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What task did the man just complete?",
      'options': [
        "Hiring new employees",
        "Setting up workstations",
        "Connecting network cables",
        "Meeting new hires",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'I just finished setting up the new employee workstations'.",
    },
    {
      'question': "What needs to be done next?",
      'options': [
        "Order more cables",
        "Test the workstations",
        "Install software",
        "Connect the computers to the network",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript53_55 \n\n=> The woman asks if the 'network cables' arrived because 'We need to get them connected to the network.'",
    },
    {
      'question': "When are the new employees starting?",
      'options': ["Today", "This afternoon", "Friday", "Monday"],
      'correctIndex': 3,
      'explain':
          "$transcript53_55 \n\n=> The woman wants everything ready 'for the new hires starting Monday.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "Look at the graphic. What time does Flight 101 arrive?",
      'options': ["1:00 PM", "4:00 PM", "5:00 PM", "8:00 PM"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man mentions 'Flight 101 arriving at 4 PM'. The graphic confirms this.",
    },
    {
      'question': "Look at the graphic. How much does Flight 105 cost?",
      'options': ["\$320", "\$350", "\$380", "Not specified"],
      'correctIndex': 0,
      'explain':
          "$transcript56_58 \n\n=> The man says Flight 105 is '\$320'. The graphic confirms this price.",
    },
    {
      'question': "Which flight does the woman choose?",
      'options': [
        "Flight 101",
        "Flight 103",
        "Flight 105",
        "She hasn't decided",
      ],
      'correctIndex': 0, // She wants 4 PM arrival, which is 101.
      'explain':
          "$transcript56_58 \n\n=> The woman needs to arrive 'by Tuesday evening'. She says '4 PM would be ideal,' which corresponds to Flight 101.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "Repainting the lobby",
        "Choosing paint colors",
        "Hiring a painting company",
        "Making a good impression",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript59_61 \n\n=> The man suggests 'we should repaint the office lobby.'",
    },
    {
      'question': "What colors does the man suggest?",
      'options': [
        "Blue or gray",
        "Green or yellow",
        "White or beige",
        "Light blue or green",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript59_61 \n\n=> The man suggests 'Maybe a light blue or green?'",
    },
    {
      'question': "What will the woman do?",
      'options': [
        "Paint the lobby herself",
        "Choose the color",
        "Get paint samples and a quote",
        "Ask for opinions",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'I'll get some paint samples and request a quote...'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the man calling?",
      'options': [
        "To make an appointment",
        "To cancel an appointment",
        "To confirm an appointment",
        "To reschedule an appointment",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'I'm calling to reschedule my appointment...'",
    },
    {
      'question': "When was the man's original appointment?",
      'options': [
        "Tomorrow morning",
        "Tomorrow afternoon",
        "Next Monday morning",
        "Next Monday afternoon",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> He wants to reschedule 'my appointment for tomorrow afternoon.' The woman confirms 'you're scheduled for 2 PM.'",
    },
    {
      'question': "When is the new appointment scheduled for?",
      'options': [
        "Tomorrow at 2 PM",
        "Monday at 9:30 AM",
        "Monday afternoon",
        "Not scheduled yet",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The woman offers 'an opening at 9:30 AM next Monday,' and asks 'Does that work?' implying it's being scheduled.",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What are the speakers discussing?",
      'options': [
        "Client complaints",
        "Software bugs",
        "Feedback on a software update",
        "International date formats",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man starts, 'The feedback from the client presentation was mostly positive.' - Wait, wrong conversation context. Should be: 'The feedback on the latest software update has been very positive overall.'",
    },
    {
      'question': "What minor issue was reported?",
      'options': [
        "The software is slow.",
        "It crashes frequently.",
        "The date format is sometimes wrong.",
        "International users cannot log in.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man mentions 'a minor issue with the date format displaying incorrectly for some international users.'",
    },
    {
      'question': "What does the woman suggest?",
      'options': [
        "Ignoring the issue",
        "Waiting for the patch",
        "Offering more training",
        "Informing the affected users about the fix",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript65_67 \n\n=> After hearing IT is working on it, the woman says, 'Let's make sure we communicate that to the users who reported it.'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the man's problem?",
      'options': [
        "His flight is canceled.",
        "He missed his flight.",
        "His flight is delayed.",
        "He lost his connection.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says, 'My flight is delayed by two hours.'",
    },
    {
      'question': "What is the consequence of the delay?",
      'options': [
        "He will be late for a meeting.",
        "He will miss his connecting flight.",
        "He needs to rebook his hotel.",
        "He has to wait in Dallas.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript68_70 \n\n=> He says, 'I'm going to miss my connecting flight in Dallas.'",
    },
    {
      'question': "What does the woman offer to do?",
      'options': [
        "Rebook the connecting flight",
        "Call the airline agent",
        "Contact the man's hotel",
        "Meet the man in Seattle",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman asks, 'Do you need me to call the hotel in Seattle...?'",
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
Planning your next vacation? Book with 'Horizon Travel Agency'! Our experienced agents can help you plan the perfect trip, whether it's a relaxing beach getaway or an adventurous tour. We handle flights, hotels, cruises, and tour packages. We find the best deals to save you money. Visit our office on Maple Street or call us at 555-TRIP for a free consultation. Mention this radio ad and get \$50 off your first booking! Horizon Travel - Your journey starts here.
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
Good evening, ladies and gentlemen. Welcome aboard flight 112 with non-stop service to New York City. Please stow your carry-on luggage either in the overhead compartment or under the seat in front of you. Ensure your seat belts are fastened and your seat backs and tray tables are in their upright position. Please turn off all electronic devices or switch them to airplane mode at this time. We will be departing shortly.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
The main reason for this meeting is to discuss the results of the recent employee engagement survey. While the scores for teamwork and manager support were quite high, the results indicated dissatisfaction with the current process for performance reviews. Many felt it wasn't frequent enough and didn't provide constructive feedback. I want to form a small committee to explore alternative review processes, perhaps moving to quarterly check-ins.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling 'Quick Copy Print Center'. Our hours are Monday through Friday, 9 AM to 6 PM, and Saturday, 10 AM to 4 PM. We are closed on Sundays. To place a new print order online, please visit quickcopy.com. To check the status of an existing order, please press one. To speak with a team member about our services, including copying, printing, binding, and graphic design, please press two.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Hello everyone, and welcome to the Springfield Science Museum. My name is Carlos, and I'll be your guide for the Dinosaur Hall today. This exhibit features fossils and life-size models of dinosaurs that once roamed this region. Our tour will last about 45 minutes. Please stay with the group. You are welcome to take photos, but please, no flash photography as it can damage the delicate fossils over time. Any questions before we begin?
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
This slide shows our quarterly marketing expenses broken down by category. As you can see, the largest portion of our budget, nearly 50%, was spent on television advertising. Online advertising accounted for 30%, with the remainder split between print ads and event sponsorships. While TV ads have a broad reach, our analysis suggests online ads are delivering a better return on investment. Therefore, I propose we shift some budget from TV to online for the next quarter.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
In local news, the City Council voted last night to approve funding for a new downtown park. The park, to be located on the site of the old warehouse on Water Street, will feature walking paths, a playground, and a small amphitheater for community events. Construction is expected to begin this fall and take approximately one year. The project aims to provide more green space for downtown residents and workers.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
It's my pleasure to introduce our workshop leader today, Ms. Anna Petrova. Ms. Petrova is a certified project management professional with over 15 years of experience leading complex projects at major technology firms. She is also a frequent speaker at industry conferences. Today, she will be sharing practical strategies for 'Effective Risk Management in Projects'. Please give a warm welcome to Anna Petrova.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Welcome to the final day of the Global Marketing Summit. Please take a moment to look at the revised schedule for this afternoon. The closing keynote address by Dr. David Chen, originally planned for the Grand Ballroom, has been moved to the Regency Ballroom due to a scheduling conflict with another event. The time, 4:00 PM, remains the same. All other afternoon sessions are proceeding as originally scheduled in their assigned rooms.
---
**GMS - Afternoon Schedule (Revised)**
- 1:30 PM: Workshop A (Room 101)
- 1:30 PM: Workshop B (Room 102)
- 3:00 PM: Networking Break (Lobby)
- 4:00 PM: Closing Keynote - Dr. David Chen (**Regency Ballroom**)
"""; // Grand Ballroom crossed out, Regency added.

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention shoppers! We have a demonstration starting now in our kitchenware department on the third floor. Chef Antonio Rossi will be showing you how to make perfect pasta using our new line of 'Pasta Pro' pasta makers. Come watch the demonstration, ask questions, and enjoy some delicious samples. The demonstration will run for approximately 30 minutes. That's in the kitchenware department, third floor.
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What service is being advertised?",
      'options': [
        "Home cleaning",
        "Travel planning",
        "Financial advising",
        "Moving services",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'Horizon Travel Agency' và giúp 'plan the perfect trip'.",
    },
    {
      'question': "What does the agency handle?",
      'options': [
        "Only flights and hotels",
        "Only cruises",
        "Flights, hotels, cruises, and tours",
        "Only local travel",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói liệt kê, 'We handle flights, hotels, cruises, and tour packages.'",
    },
    {
      'question': "What is offered to listeners who mention the ad?",
      'options': [
        "A free consultation",
        "A travel guide",
        "\$50 off a booking",
        "Discounted flights",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'Mention this radio ad and get \$50 off your first booking!'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "Where is this announcement likely being made?",
      'options': [
        "At a security checkpoint",
        "On an airplane",
        "At a departure gate",
        "In New York City",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Thông báo chào mừng 'aboard flight 112', đề cập đến 'overhead compartment', 'seat belts', 'airplane mode', tất cả đều diễn ra trên máy bay.",
    },
    {
      'question': "What are passengers asked to do with their luggage?",
      'options': [
        "Check it at the gate",
        "Stow it properly",
        "Keep it with them",
        "Put it in the aisle",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript74_76 \n\n=> Người nói yêu cầu 'stow your carry-on luggage either in the overhead compartment or under the seat'.",
    },
    {
      'question': "What should passengers do with electronic devices?",
      'options': [
        "Turn them off or use airplane mode",
        "Put them in airplane mode only",
        "Turn them off completely",
        "Use them only for reading",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript74_76 \n\n=> Yêu cầu là 'turn off all electronic devices or switch them to airplane mode'.",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of this part of the meeting?",
      'options': [
        "Teamwork scores",
        "Manager support",
        "Employee survey results",
        "Performance review frequency",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'The main reason for this meeting is to discuss the results of the recent employee engagement survey.'",
    },
    {
      'question': "What area showed employee dissatisfaction?",
      'options': [
        "Teamwork",
        "Manager support",
        "Overall job satisfaction",
        "Performance review process",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript77_79 \n\n=> Người nói báo cáo 'dissatisfaction with the current process for performance reviews.'",
    },
    {
      'question': "What action will be taken?",
      'options': [
        "A committee will be formed.",
        "HR will offer training.",
        "Reviews will become quarterly.",
        "Managers will get feedback.",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript77_79 \n\n=> Người nói nói, 'I want to form a small committee to explore alternative review processes'.",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What kind of business is this?",
      'options': [
        "A graphic design firm",
        "A copy and print center",
        "An office supply store",
        "A software company",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tên 'Quick Copy Print Center' và các dịch vụ (copying, printing, binding) cho thấy đây là trung tâm in ấn.",
    },
    {
      'question': "When is the business closed?",
      'options': ["Buổi tối", "Thứ Bảy", "Chủ Nhật", "Sáng Thứ Hai"],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'We are closed on Sundays.'",
    },
    {
      'question': "What should a caller press to check an order status?",
      'options': ["One", "Two", "Visit the website", "Stay on the line"],
      'correctIndex': 0,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn hướng dẫn, 'To check the status of an existing order, please press one.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': [
        "A science museum",
        "An art museum",
        "An air and space museum",
        "A natural history museum",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript83_85 \n\n=> Người nói chào mừng mọi người đến 'the Springfield Science Museum.'",
    },
    {
      'question': "What is the focus of the tour?",
      'options': [
        "Life-size models",
        "Regional history",
        "The Dinosaur Hall",
        "Fossil excavation",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'I'll be your guide for the Dinosaur Hall today.'",
    },
    {
      'question': "What are listeners asked NOT to do?",
      'options': [
        "Take photos",
        "Use flash photography",
        "Stay with the group",
        "Ask questions",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> Người nói yêu cầu, 'please, no flash photography'.",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What do the results show about Ad Version A?",
      'options': [
        "It performed poorly.",
        "It focused on product features.",
        "It had the highest click-through rate.",
        "It used animated graphics.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'Ad Version A... had the highest click-through rate'.",
    },
    {
      'question': "Which ad version was least effective?",
      'options': ["Version A", "Version B", "Version C", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'Version C, which used animated graphics, had the lowest engagement.'",
    },
    {
      'question': "What does the speaker recommend for future campaigns?",
      'options': [
        "Using animated graphics",
        "Focusing on product features",
        "Increasing the budget",
        "Using customer testimonials",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript86_88 \n\n=> Sau khi lưu ý Version A (dùng testimonials) hiệu quả nhất, người nói kết luận, 'Therefore, we recommend focusing future campaigns on customer testimonials.'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What project was approved?",
      'options': [
        "A new library",
        "A warehouse renovation",
        "A downtown park",
        "An amphitheater",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Tin tức nói, 'City Council voted last night to approve funding for a new downtown park.'",
    },
    {
      'question': "What will be included in the park?",
      'options': ["A warehouse", "A playground", "A parking lot", "A fountain"],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Công viên sẽ bao gồm 'walking paths, a playground, and a small amphitheater'.",
    },
    {
      'question': "When will construction likely finish?",
      'options': [
        "Mùa thu này",
        "Mùa xuân tới",
        "Trong vòng một năm",
        "Không rõ",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Tin tức nói, 'Construction is expected to begin this fall and take approximately one year.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "Who is Maria Rossi?",
      'options': [
        "A CEO",
        "An author",
        "A marketing executive",
        "An event organizer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu cô ấy là 'the Senior Vice President of Marketing at Global Corp'.",
    },
    {
      'question': "What has Ms. Rossi led?",
      'options': [
        "Global Corp",
        "Award-winning campaigns",
        "Digital transformations",
        "Product development",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript92_94 \n\n=> Người nói đề cập cô ấy 'has led several award-winning international campaigns.'",
    },
    {
      'question': "What is the topic of Ms. Rossi's talk?",
      'options': [
        "Marketing awards",
        "Her career at Global Corp",
        "The digital age",
        "Building a global brand",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Chủ đề bài nói của cô ấy là 'Building a Global Brand in the Digital Age'.",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. Where was the closing keynote originally scheduled?",
      'options': ["Room 101", "Room 102", "Regency Ballroom", "Grand Ballroom"],
      'correctIndex': 3,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói, 'The closing keynote address... originally planned for the Grand Ballroom...'",
    },
    {
      'question':
          "Look at the graphic. Where will the closing keynote be held now?",
      'options': ["Room 101", "Room 102", "Regency Ballroom", "Grand Ballroom"],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói thông báo nó 'has been moved to the Regency Ballroom'. Lịch trình sửa đổi cũng ghi rõ điều này.",
    },
    {
      'question':
          "Look at the graphic. What time does the closing keynote start?",
      'options': ["1:30 PM", "3:00 PM", "4:00 PM", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói nói 'The time, 4:00 PM, remains the same'. Lịch trình cũng ghi '4:00 PM: Closing Keynote'.",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What event is taking place?",
      'options': [
        "A cooking class",
        "A product demonstration",
        "A free sample giveaway",
        "A store closing",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Thông báo về 'a demonstration... of the new 'BlendMaster Pro' blender.'",
    },
    {
      'question': "Where is the event happening?",
      'options': [
        "Near the entrance",
        "On the third floor",
        "At the checkout",
        "In the cafeteria",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói 'in our kitchenware department on the third floor.'",
    },
    {
      'question': "Who is leading the demonstration?",
      'options': [
        "A store manager",
        "A sales associate",
        "Chef Antonio Rossi",
        "Không rõ",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói, 'Chef Antonio Rossi will be showing you...'",
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
      'question': "The report ______ several errors that need to be corrected.",
      'options': ['contain', 'contains', 'contained', 'containing'],
      'correctIndex': 1,
      'explain':
          'Chủ ngữ "The report" (số ít) nên động từ ở thì hiện tại đơn cần thêm "s" (contains).',
    },
    {
      'question':
          "Ms. Lee requested ______ additional information about the project.",
      'options': ['some', 'any', 'few', 'several'],
      'correctIndex': 0,
      'explain':
          '"Some" được dùng trong câu khẳng định để chỉ một lượng không xác định.',
    },
    {
      'question': "The deadline has been ______ to next Friday.",
      'options': ['extend', 'extended', 'extending', 'extension'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (extended - được gia hạn) để tạo thành thể bị động (has been extended).',
    },
    {
      'question': "Please handle this confidential document ______.",
      'options': ['careful', 'carefully', 'carefulness', 'caring'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (carefully - cẩn thận) để bổ nghĩa cho động từ "handle".',
    },
    {
      'question':
          "The company ______ its employees for work-related travel expenses.",
      'options': ['reimburse', 'reimburses', 'reimbursed', 'reimbursement'],
      'correctIndex': 1,
      'explain':
          'Chủ ngữ "The company" (số ít) nên động từ ở thì hiện tại đơn cần thêm "s" (reimburses - hoàn trả).',
    },
    {
      'question':
          "______ the building is old, the offices have been recently renovated.",
      'options': ['Because', 'Since', 'Although', 'Despite'],
      'correctIndex': 2,
      'explain': '"Although" (mặc dù) là liên từ chỉ sự tương phản.',
    },
    {
      'question':
          "Mr. Kim is known for his ______ approach to problem-solving.",
      'options': ['create', 'creative', 'creatively', 'creation'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (creative - sáng tạo) để bổ nghĩa cho danh từ "approach".',
    },
    {
      'question':
          "The new software update will be ______ available next month.",
      'options': ['make', 'made', 'making', 'makes'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (made - được làm cho) để tạo thành thể bị động (will be made available).',
    },
    {
      'question':
          "The ______ department is responsible for hiring new employees.",
      'options': ['person', 'personal', 'personnel', 'personality'],
      'correctIndex': 2,
      'explain':
          '"Personnel" (nhân sự) dùng như tính từ, bổ nghĩa cho "department".',
    },
    {
      'question':
          "Please arrive at least 15 minutes ______ the meeting starts.",
      'options': ['before', 'after', 'while', 'until'],
      'correctIndex': 0,
      'explain': '"Before" (trước khi) là liên từ chỉ thời gian phù hợp.',
    },
    {
      'question':
          "The success of the event was ______ due to careful planning.",
      'options': ['main', 'mainly', 'mainstay', 'mainland'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (mainly - chủ yếu) để bổ nghĩa cho cụm "due to".',
    },
    {
      'question': "The manager asked ______ to submit their reports by Friday.",
      'options': ['everyone', 'everybody', 'anyone', 'someone'],
      'correctIndex': 0, // everyone requires plural verb usually? No, singular.
      'explain':
          'Đại từ "everyone" (mọi người) là phù hợp nhất trong ngữ cảnh yêu cầu chung.',
    },
    {
      'question': "The ______ cost of the project exceeded the initial budget.",
      'options': ['finally', 'final', 'finalize', 'finalist'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (final - cuối cùng) để bổ nghĩa cho danh từ "cost".',
    },
    {
      'question':
          "The training session provided ______ information on the new procedures.",
      'options': ['value', 'valuable', 'valued', 'valuation'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (valuable - giá trị) để bổ nghĩa cho danh từ "information".',
    },
    {
      'question': "______ Ms. Ito nor Mr. Chen could attend the conference.",
      'options': ['Either', 'Both', 'Neither', 'Also'],
      'correctIndex': 2,
      'explain': 'Cấu trúc "Neither... nor..." (Không... cũng không...).',
    },
    {
      'question':
          "The company offers a ______ benefits package to its employees.",
      'options': [
        'comprehend',
        'comprehensive',
        'comprehensively',
        'comprehension',
      ],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (comprehensive - toàn diện) để bổ nghĩa cho cụm danh từ "benefits package".',
    },
    {
      'question':
          "Please ______ from using mobile phones during the presentation.",
      'options': ['refrain', 'prevent', 'avoid', 'stop'],
      'correctIndex': 0,
      'explain': 'Cấu trúc "refrain from" + V-ing (kiềm chế làm gì).',
    },
    {
      'question': "The flight ______ arrives at 9:00 AM has been delayed.",
      'options': ['that', 'who', 'when', 'what'],
      'correctIndex': 0,
      'explain':
          'Đại từ quan hệ "that" (hoặc "which") dùng để chỉ vật ("The flight").',
    },
    {
      'question':
          "The research indicated a ______ preference for online shopping.",
      'options': ['clear', 'clearly', 'clarity', 'clearing'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (clear - rõ ràng) để bổ nghĩa cho danh từ "preference".',
    },
    {
      'question':
          "The new ______ system will improve communication between departments.",
      'options': ['automate', 'automated', 'automatic', 'automation'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (automated - được tự động hóa) để bổ nghĩa cho danh từ "system". "Automatic" cũng có thể đúng nhưng "automated" nhấn mạnh việc được làm cho tự động.',
    },
    {
      'question':
          "______ the high demand, the concert tickets sold out quickly.",
      'options': ['Because', 'Despite', 'Owing to', 'Unless'],
      'correctIndex': 2,
      'explain':
          '"Owing to" (do) là cụm giới từ, theo sau là cụm danh từ ("the high demand").',
    },
    {
      'question':
          "The manager is ______ that the project will be completed on time.",
      'options': ['confide', 'confident', 'confidential', 'confidence'],
      'correctIndex': 1,
      'explain': 'Cần một tính từ (confident - tự tin) sau động từ "is".',
    },
    {
      'question': "The ______ of the product will begin next month.",
      'options': ['produce', 'produced', 'producing', 'production'],
      'correctIndex': 3,
      'explain': 'Sau mạo từ "The" cần một danh từ (production - sự sản xuất).',
    },
    {
      'question':
          "Employees are encouraged ______ in the company wellness program.",
      'options': [
        'participate',
        'to participate',
        'participating',
        'participation',
      ],
      'correctIndex': 1,
      'explain':
          'Cấu trúc bị động "are encouraged to do something" yêu cầu động từ nguyên mẫu có "to".',
    },
    {
      'question': "The ______ economic conditions have affected sales.",
      'options': ['challenge', 'challenged', 'challenging', 'challenges'],
      'correctIndex': 2,
      'explain':
          'Cần một hiện tại phân từ dùng như tính từ (challenging - đầy thách thức) để bổ nghĩa cho danh từ "conditions".',
    },
    {
      'question':
          "Please send the contract ______ Mr. Tanaka for his signature.",
      'options': ['at', 'for', 'to', 'with'],
      'correctIndex': 2,
      'explain': 'Cấu trúc "send something to someone" (gửi cái gì cho ai).',
    },
    {
      'question': "The workshop was ______ organized and very informative.",
      'options': ['good', 'better', 'best', 'well'],
      'correctIndex': 3,
      'explain':
          'Cần một trạng từ (well - tốt) để bổ nghĩa cho động từ "organized".',
    },
    {
      'question': "The company is committed to environmental ______.",
      'options': ['sustain', 'sustainable', 'sustainability', 'sustainably'],
      'correctIndex': 2,
      'explain':
          'Sau tính từ "environmental" cần một danh từ (sustainability - sự bền vững).',
    },
    {
      'question':
          "Further details ______ the new policy will be announced soon.",
      'options': ['regard', 'regarded', 'regarding', 'regardless'],
      'correctIndex': 2,
      'explain':
          'Giới từ "regarding" (liên quan đến) được dùng để giới thiệu chủ đề.',
    },
    {
      'question': "The team worked ______ to overcome the challenges.",
      'options': ['together', 'joint', 'mutual', 'common'],
      'correctIndex': 0,
      'explain':
          'Trạng từ "together" (cùng nhau) bổ nghĩa cho động từ "worked".',
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
**Library Book Return Reminder**

This is a reminder to all library patrons that the book drop located outside the main entrance will be temporarily ____(131)____ from Friday evening, May 10, until Monday morning, May 13. This closure is necessary due to the annual street fair taking place in the plaza.

Please return all library materials inside the library during regular operating hours before Friday evening, or hold onto them until the book drop reopens on Monday. ____(132)____. Fines will not ____(133)____ for items due during the closure period if they are returned on Monday.

____(134)____ appreciate your understanding.
""";
  // --- Passage 2: Questions 135-138 (E-mail) ---
  final passage135_138 = """
To: Department Managers
From: Kenji Tanaka, IT Manager
Subject: New Antivirus Software Installation
Date: July 29

Starting next Monday, August 5, the IT department will begin installing new antivirus software on all company computers. This upgrade provides ____(135)____ protection against the latest online threats.

The installation process takes approximately 30 minutes. An IT technician will visit each department according to the schedule ____(136)____ below. Please ensure all computers in your department are turned on during your scheduled time. ____(137)____. A technician will need access to each computer. ____(138)____.

Schedule:
* August 5: Sales & Marketing
* August 6: Finance & Accounting
* August 7: Human Resources & Operations

Thank you for your cooperation.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**'Global Connect' Mobile - Stay Connected Anywhere!**

Traveling internationally? Don't pay expensive roaming charges! Get a Global Connect SIM card ____(139)____ affordable data and calling rates in over 150 countries.

Simply replace your regular SIM card with ours upon arrival at your destination. ____(140)____. Choose from various prepaid data packages to suit your needs.

Our SIM cards can be ordered online and delivered to your home before your trip. ____(141)____, they are also available for purchase at major international airports. Stay connected ____(142)____ ease with Global Connect!
""";
  // --- Passage 4: Questions 143-146 (Memo) ---
  final passage143_146 = """
**MEMORANDUM**
To: All Employees
From: Building Security
Subject: Updated Security Badge Policy
Date: March 1

Effective immediately, all employees must visibly wear their company-issued security badge ____(143)____ all times while inside the building. This includes offices, hallways, break rooms, and the cafeteria.

This policy is being strictly ____(144)____ to enhance workplace security. Security personnel will be conducting random checks. Employees found without a visible badge will be reminded of the policy. ____(145)____ failure to comply may result in disciplinary action.

If you have lost your badge, please report it to HR immediately to obtain a ____(146)____.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["available", "repaired", "closed", "emptied"],
      'correctIndex': 2,
      'explain':
          "'Closed' (đóng cửa) là từ phù hợp nhất để mô tả tình trạng của book drop.",
    },
    {
      'question': "",
      'options': [
        "The street fair is a popular event.",
        "Do not leave items outside the book drop.",
        "The library recently updated its hours.",
        "Fines can be paid online.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này đưa ra một cảnh báo hợp lý ('không để sách bên ngoài') khi book drop bị đóng.",
    },
    {
      'question': "",
      'options': ["accrue", "accrued", "accruing", "accrual"],
      'correctIndex': 0, // "will not accrue"
      'explain':
          "Sau 'will not' cần động từ nguyên mẫu (accrue - tích lũy, phát sinh).",
    },
    {
      'question': "",
      'options': ["We", "They", "You", "It"],
      'correctIndex': 0,
      'explain':
          "Chủ ngữ 'We' (Chúng tôi - đại diện thư viện) là chủ thể của hành động 'appreciate'.",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["improve", "improves", "improved", "improving"],
      'correctIndex': 2,
      'explain':
          "Cần một tính từ (improved - được cải thiện) để bổ nghĩa cho danh từ 'protection'.",
    },
    {
      'question': "",
      'options': ["attach", "attaching", "attached", "attachment"],
      'correctIndex': 2,
      'explain':
          "Cần một quá khứ phân từ (attached - được đính kèm) dùng như tính từ, bổ nghĩa cho 'schedule'.",
    },
    {
      'question': "",
      'options': [
        "This is a mandatory update.",
        "The old software will be removed.",
        "A technician will need access to each computer.",
        "Please save your work beforehand.",
      ],
      'correctIndex': 2, // Changed sentence
      'explain':
          "Câu này cung cấp thông tin thực tế về quy trình cài đặt ('technician will visit').",
    },
    {
      'question': "",
      'options': [
        "The process is automatic.",
        "Please back up important files beforehand.", // Better advice
        "Do not turn off your computer.",
        "The schedule is firm.",
      ],
      'correctIndex': 1,
      'explain':
          "Câu này đưa ra một lời khuyên phòng ngừa hợp lý ('sao lưu file') trước khi cài đặt phần mềm mới.",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["by", "with", "for", "at"],
      'correctIndex': 2,
      'explain':
          "Giới từ 'for' được dùng để chỉ mục đích (affordable rates for data...).",
    },
    {
      'question': "",
      'options': [
        "It activates automatically.",
        "You may need to restart your phone.",
        "Keep your regular SIM card safe.",
        "Check your balance online.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này cung cấp thông tin hữu ích về cách thẻ SIM hoạt động sau khi lắp vào.",
    },
    {
      'question': "",
      'options': ["Therefore", "However", "Alternatively", "For example"],
      'correctIndex': 2,
      'explain':
          "'Alternatively' (Hoặc là) đưa ra một phương án mua hàng khác (tại sân bay) so với phương án trước (online).",
    },
    {
      'question': "",
      'options': ["easy", "eased", "easily", "ease"],
      'correctIndex': 3, // "with ease"
      'explain':
          "Cụm giới từ 'with ease' (một cách dễ dàng) là một cụm cố định.",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["at", "on", "in", "by"],
      'correctIndex': 0,
      'explain': "Cụm từ 'at all times' (mọi lúc) là một cụm cố định.",
    },
    {
      'question': "",
      'options': ["enforce", "enforced", "enforcing", "enforcement"],
      'correctIndex': 1,
      'explain':
          "Cần một quá khứ phân từ (enforced - được thi hành) để tạo thành thể bị động (is being enforced).",
    },
    {
      'question': "",
      'options': [
        "Security is our top priority.",
        "Please report any suspicious activity.",
        "Repeated", // Or "Further"
        "Accidental",
      ],
      'correctIndex': 2,
      'explain':
          "Tính từ 'Repeated' (Lặp lại) hoặc 'Further' (Tiếp tục) bổ nghĩa cho 'failure' (việc không tuân thủ).",
    },
    {
      'question': "",
      'options': ["replace", "replaced", "replacing", "replacement"],
      'correctIndex': 3,
      'explain': "Sau mạo từ 'a' cần một danh từ (replacement - vật thay thế).",
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

  // Q147-148 (New Advertisement)
  final passage147_148 = """
**'WriteWell' Pens - Special Offer!**

Experience smooth, effortless writing with WriteWell pens. Our advanced ink technology ensures consistent flow and quick drying.

Perfect for office, school, or personal use. Available in black, blue, and red.

**Limited Time Offer:** Buy any pack of 12 WriteWell pens and get a second pack of the same color **FREE!**

Offer valid through November 30 at participating retailers. Look for the special display!
""";
  // Q149-150 (New E-mail)
  final passage149_150 = """
To: David Lee <d.lee@techsolutions.com>
From: Maria Garcia <m.garcia@techsolutions.com>
Subject: Project Alpha - Client Feedback
Date: October 28

Hi David,
I just got off the phone with the client regarding the Project Alpha prototype. They are generally very pleased with the progress!
They had only minor feedback, mostly related to the color scheme of the user interface. They felt it was a bit too dark.
Could you ask the design team to prepare two alternative color palettes for the client to review by Wednesday?
Thanks,
Maria
""";
  // Q151-152 (New Text Message Chain)
  final passage151_152 = """
**Sarah (1:15 PM)**: Kenji, did you remember to book the conference room for our 3 PM client meeting?
**Kenji (1:16 PM)**: Oh no, I completely forgot! Let me do it right now. Which room do we need?
**Sarah (1:17 PM)**: Try to get the Maple Room on the 5th floor. It has the best projector.
**Kenji (1:19 PM)**: Okay, just booked it. Maple Room, 3 PM to 4 PM. All set.
**Sarah (1:20 PM)**: Phew! Thanks, Kenji.
""";
  // Q153-155 (New Article)
  final passage153_155 = """
**City Library Launches E-Book Service**

(June 1) – The Springfield City Library today launched its new e-book and digital audiobook lending service, 'LibriDigital'. Library cardholders can now borrow thousands of popular titles electronically through the LibriDigital website or mobile app.

The service is compatible with most e-readers, tablets, and smartphones. Users can borrow up to 10 titles at a time for a 21-day period.

"We are thrilled to offer this convenient service to our patrons," said Library Director David Wu. "It allows access to our collection anytime, anywhere." The library will host introductory workshops on how to use LibriDigital next week.
""";
  // Q156-157 (New Notice)
  final passage156_157 = """
**Office Printer Maintenance - 3rd Floor**

Please be advised that the main printer/copier on the 3rd floor (near the elevators) will be undergoing scheduled maintenance tomorrow, **Wednesday, October 16, from 9:00 AM to approximately 11:00 AM**.

During this time, the machine will be unavailable. Please use the printer located in the 3rd-floor copy room or the main printer on the 4th floor if needed.

Thank you for your patience.
- IT Department
""";
  // Q158-160 (New Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Sales Staff
**From**: Maria Garcia, Sales Manager
**Date**: July 2
**Subject**: Q3 Sales Targets

The sales targets for the third quarter (July 1 - September 30) have now been finalized and are available on the sales portal.

Please review your individual and team targets carefully. Note that there is a new bonus structure in place this quarter rewarding exceeding targets by more than 15%.

We will discuss these targets and strategies for achieving them during our team meeting this Friday, July 6. Please come prepared with any questions.
""";
  // Q161-163 (New E-mail)
  final passage161_163 = """
To: David Miller <d.miller@clientcorp.com>
From: Kenji Tanaka <k.tanaka@designpros.com>
Subject: Draft Website Design
Date: May 13

Dear David,
Attached, please find the first draft of the homepage design for your new company website.
We've incorporated the branding elements and key content areas we discussed in our meeting last week. Please pay particular attention to the navigation structure and the overall layout.
We welcome your feedback. Please send any comments or requested revisions by this Friday, May 17, so we can stay on schedule.
Best regards,
Kenji Tanaka
""";
  // Q164-167 (New Webpage)
  final passage164_167 = """
**Franklin Hotel - Amenities & Services**

Enjoy your stay at the Franklin Hotel! We offer a range of amenities for your comfort and convenience:
* **Complimentary Wi-Fi**: Available throughout the hotel.
* **Fitness Center**: Open 24/7, located on the 2nd floor. Features cardio machines and free weights.
* **Business Center**: Located in the lobby. Computer access, printing, and copying services available (fees apply for printing/copying).
* **On-Site Restaurant**: 'The Oak Grill', open for breakfast (7-10 AM) and dinner (5-10 PM). Room service available during restaurant hours.
* **Airport Shuttle**: Runs every 30 minutes from 5 AM to 11 PM. Please reserve your spot at the front desk. \$15 per person.
""";
  // Q168-171 (New Form)
  final passage168_171 = """
**Innovate Tech Conference - Registration Form**

**Attendee Information:**
* Name: **Sarah Chen**
* Company: **Apex Solutions**
* E-mail: **s.chen@apex.com**

**Registration Type:**
[X] Full Conference Pass (3 Days) - \$500
[ ] Single Day Pass (Specify Date: ______) - \$200/day

**Workshop Selection (Optional - Included with Full Pass):**
*(Please select up to two)*
[X] Workshop A: AI Trends (Monday PM)
[ ] Workshop B: Cloud Security (Tuesday AM)
[X] Workshop C: Marketing Analytics (Tuesday PM)
[ ] Workshop D: Project Management (Wednesday AM)

**Payment**: Credit Card ending in 1234. **Total Paid: \$500**
""";
  // Q172-175 (New Article)
  final passage172_175 = """
**Study Shows Benefits of Flexible Work Schedules**

(May 22) – A new study published by the National Bureau of Workplace Research suggests that offering employees flexible work schedules can lead to increased productivity and higher job satisfaction. The year-long study tracked 500 employees across various industries.

Employees who had control over their start and end times reported lower stress levels and fewer sick days compared to those with fixed schedules. Furthermore, the study found no significant decrease in overall output; in fact, some measures of productivity slightly increased.

"Allowing flexibility demonstrates trust and can boost morale," commented Dr. Anna Petrova, the lead researcher. The full study is available on the Bureau's website.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (New Double Passage: E-mail + E-mail)
  final passage176_180_1 = """
**Advertisement: City Art Museum - Membership**

Become a Member Today! Enjoy exclusive benefits:
* Free unlimited admission for one year
* Invitations to member-only exhibition previews
* 10% discount at the Museum Shop and Cafe
* Subscription to our quarterly member magazine

**Membership Levels:**
* Individual: \$60
* Dual (2 adults at same address): \$90
* Family (2 adults + children under 18): \$120

Join online at cityartmuseum.org/membership or at the admissions desk.
""";
  final passage176_180_2 = """
To: membership@cityartmuseum.org
From: laura.fernandez@email.com
Subject: Membership Question
Date: July 10

Hello,
I am considering purchasing a Dual membership for myself and my husband.
We often visit the museum with our 10-year-old daughter. Does the Dual membership allow free admission for children as well, or would we need to purchase a Family membership for that?
Please clarify.
Thank you,
Laura Fernandez
""";
  // Q181-185 (New Double Passage: Notice + E-mail)
  final passage181_185_1 = """
**Springfield News: Library Book Sale Success**

(September 10) – The Friends of the Springfield Library reported a successful annual book sale held this past weekend. Over \$5,000 was raised from the sale of donated used books, DVDs, and CDs.
"We are thrilled with the community support," said Friends president, Maria Garcia. "The proceeds will be used to fund new children's programs and purchase large-print books for seniors."
The Friends group is already accepting donations for next year's sale. Books can be dropped off at the library's circulation desk during regular hours.
""";
  final passage181_185_2 = """
To: friends@springfieldlib.org
From: john.davis@email.com
Subject: Book Donation Question
Date: September 12

Hello Friends of the Library,
I read the article about the success of your recent book sale - congratulations!
I have several boxes of books (mostly novels and history books) that I would like to donate for next year's sale. The article mentioned dropping them off at the circulation desk.
Is there a limit to how many boxes I can bring at once? And are there any types of books you do *not* accept (e.g., textbooks, magazines)?
Thanks,
John Davis
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (New Triple Passage: Webpage + E-mail + E-mail)
  final passage186_190_1 = """
**To**: Alan Brody <a.brody@univ.edu>
**From**: Event Coordinator, City Books <events@citybooks.com>
**Subject**: Book Signing Event - October 15
**Date**: September 20

Dear Dr. Brody,
We are excited to host the book signing event for your new novel, "River's Edge," on Tuesday, October 15, at 7:00 PM.
Could you please confirm the following details:
* You will arrive around 6:30 PM?
* You will give a short reading (approx. 15 min) before the signing?
* We should order 100 copies of "River's Edge" for sale?
Please let us know if these arrangements work for you.
""";
  final passage186_190_2 = """
**To**: Event Coordinator, City Books <events@citybooks.com>
**From**: Alan Brody <a.brody@univ.edu>
**Subject**: Re: Book Signing Event - October 15
**Date**: September 21

Hello Coordinator,
Thank you for organizing the event. Yes, arriving at 6:30 PM and doing a short reading are both fine.
Regarding the book order, 100 copies sounds about right based on past events. However, my publisher, Apex Books, handles the book sales directly with bookstores. Please coordinate the order with my contact there, Ms. Sarah Chen (s.chen@apexbooks.com). She will ensure the books arrive on time.
Looking forward to it,
Alan Brody
""";
  final passage186_190_3 = """
**To**: Sarah Chen <s.chen@apexbooks.com>
**From**: Event Coordinator, City Books <events@citybooks.com>
**Subject**: Book Order for Alan Brody Signing - Oct 15
**Date**: September 22

Dear Ms. Chen,
As per Dr. Alan Brody's instruction, I am writing to coordinate the book order for his signing event at our store on October 15. We anticipate needing approximately 100 copies of his new novel, "River's Edge."
Could you please confirm the ordering process and ensure the books will be delivered to City Books before the event date?
Thank you,
Event Coordinator, City Books
""";
  // Q191-195 (New Triple Passage: E-mail + E-mail + Schedule)
  final passage191_195_1 = """
**City Gazette: 'The Grand Oak Hotel' Completes Renovations**
(June 1) – The historic Grand Oak Hotel officially unveiled its newly renovated guest rooms and lobby today after a six-month closure. The \$10 million project updated all 150 guest rooms with modern amenities while preserving the building's classic architectural details.
The hotel's popular rooftop restaurant, 'The Sky Room', also received a facelift and now features an expanded outdoor seating area with stunning city views.
"We are thrilled to welcome guests back," said manager Kenji Tanaka. The hotel is offering special reopening rates through the end of June.
""";
  final passage191_195_2 = """
**To**: reservations@grandoakhotel.com
**From**: laura.c@email.com
**Subject**: Reservation Inquiry - July 12-14
**Date**: June 15

Hello,
I read about your recent renovations and would like to book a standard king room for two nights, checking in on Friday, July 12, and checking out on Sunday, July 14.
Could you please let me know the rate for those dates? Also, I saw mention of special reopening rates in June – does that offer extend into July by any chance?
Finally, is the rooftop restaurant, 'The Sky Room', open for dinner on Sunday evenings?
Thank you,
Laura Chen
""";
  final passage191_195_3 = """
**From**: reservations@grandoakhotel.com
**To**: laura.c@email.com
**Subject**: Re: Reservation Inquiry - July 12-14
**Date**: June 16

Dear Ms. Chen,
Thank you for your interest in the Grand Oak Hotel!
Yes, we have king rooms available for July 12-14. The rate is \$250 per night plus tax.
Unfortunately, the special reopening rates are only valid for stays completed by June 30.
'The Sky Room' restaurant is open for dinner nightly, including Sundays, from 5 PM to 10 PM. Reservations are recommended.
Would you like me to proceed with booking the room for you?
""";
  // Q196-200 (New Triple Passage: E-mail + Reply + Confirmation)
  final passage196_200_1 = """
**'Pro Electronics' - Online Return Form**

**Order Number**: PE-6543
**Order Date**: Nov 5
**Customer**: Maria Garcia <m.garcia@email.com>

**Item Being Returned**:
* Product: 'SoundWave' Bluetooth Speaker (Model SW-100)
* Reason: [X] Did not meet expectations
* Comment: Sound quality is poor, much tinnier than described online.

**Desired Action**: [X] Refund [ ] Exchange

**Return Submitted**: Nov 10
""";
  final passage196_200_2 = """
**To**: Maria Garcia <m.garcia@email.com>
**From**: Pro Electronics Returns <returns@proelectronics.com>
**Subject**: Return Authorization #RA-1122 for Order PE-6543
**Date**: Nov 11

Dear Ms. Garcia,
We have received your return request for the 'SoundWave' Bluetooth Speaker. We are sorry to hear it did not meet your expectations.
Your return authorization number is RA-1122. Please write this number clearly on the outside of your return package.
A prepaid return shipping label is attached to this e-mail. Please print it and affix it to your package. Drop the package off at any postal service location within 14 days.
Your refund will be processed to your original payment method once the item is received and inspected at our warehouse (usually within 5-7 business days of receipt).
""";
  final passage196_200_3 = """
**To**: Pro Electronics Returns <returns@proelectronics.com>
**From**: Maria Garcia <m.garcia@email.com>
**Subject**: Re: Return Authorization #RA-1122 for Order PE-6543
**Date**: Nov 18

Hello,
Just confirming that I dropped off the return package for the speaker (RA-1122) at the post office this morning, November 18.
The tracking number on the prepaid label is 9400 1000 0000 0000 0000 00.
Could you please confirm when the refund is processed?
Thank you,
Maria Garcia
""";

  final part7Questions = [
    // Q147-148 (New Ad)
    {
      'question': passage147_148 + "\n\n147. What product is being advertised?",
      'options': ["Writing paper", "Pens", "Office supplies", "Notebooks"],
      'correctIndex': 1,
      'explain': "Quảng cáo (Passage 1) là về 'WriteWell' Pens.",
    },
    {
      'question': passage147_148 + "\n\n148. What is the special offer?",
      'options': [
        "A discount on 12-packs",
        "Free shipping",
        "A free second pack with purchase",
        "A free pen with purchase",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) ghi 'Buy any pack of 12... and get a second pack... FREE!'",
    },
    // Q149-150 (New E-mail)
    {
      'question':
          passage149_150 + "\n\n149. What is the purpose of the e-mail?",
      'options': [
        "To review a prototype",
        "To share client feedback",
        "To assign design tasks",
        "To request alternative palettes",
      ],
      'correctIndex': 1, // Also C and D, but B is the main purpose.
      'explain':
          "Maria (Passage 2) viết để thông báo 'client feedback' về mẫu thử nghiệm.",
    },
    {
      'question': passage149_150 + "\n\n150. What did the client dislike?",
      'options': [
        "The project progress",
        "The prototype functionality",
        "The user interface colors",
        "The project timeline",
      ],
      'correctIndex': 2,
      'explain':
          "Maria (Passage 2) nói phản hồi liên quan đến 'the color scheme of the user interface. They felt it was a bit too dark.'",
    },
    // Q151-152 (New Text Message Chain)
    {
      'question':
          passage151_152 + "\n\n151. Why does Kenji need to book a room?",
      'options': [
        "For a presentation",
        "For a client meeting",
        "For a team lunch",
        "For Sarah",
      ],
      'correctIndex': 1,
      'explain':
          "Sarah (Passage 3) hỏi Kenji có nhớ đặt phòng cho 'our 3 PM client meeting' không.",
    },
    {
      'question': passage151_152 + "\n\n152. Which room did Kenji book?",
      'options': [
        "Phòng họp chính",
        "Phòng ở tầng 5",
        "Phòng Maple",
        "Phòng có máy chiếu",
      ],
      'correctIndex': 2,
      'explain':
          "Kenji (Passage 3) xác nhận 'Okay, just booked it. Maple Room...'",
    },
    // Q153-155 (New Article)
    {
      'question':
          passage153_155 + "\n\n153. What service did the library launch?",
      'options': [
        "A mobile app",
        "An online catalog",
        "E-book lending",
        "Computer workshops",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) thông báo thư viện 'launched its new e-book and digital audiobook lending service'.",
    },
    {
      'question':
          passage153_155 +
          "\n\n154. How many items can patrons borrow at once?",
      'options': ["1", "5", "10", "21"],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) nói 'Users can borrow up to 10 titles at a time'.",
    },
    {
      'question':
          passage153_155 + "\n\n155. What will the library offer next week?",
      'options': [
        "More e-book titles",
        "Access to the collection",
        "Workshops on the new service",
        "Mobile app downloads",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) nói 'The library will host introductory workshops on how to use LibriDigital next week.'",
    },
    // Q156-157 (New Notice)
    {
      'question':
          passage156_157 + "\n\n156. What equipment will be unavailable?",
      'options': [
        "The elevators",
        "The 4th floor printer",
        "The 3rd floor copier", // The machine is likely both
        "The copy room",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) nói 'the main printer/copier on the 3rd floor... will be undergoing scheduled maintenance'.",
    },
    {
      'question':
          passage156_157 + "\n\n157. How long will the maintenance last?",
      'options': ["Cả ngày", "Một giờ", "Hai giờ", "Ba giờ"],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 5) ghi thời gian từ '9:00 AM to approximately 11:00 AM', tức là khoảng 2 tiếng.",
    },
    // Q158-160 (New Memo)
    {
      'question': passage158_160 + "\n\n158. What is the purpose of the memo?",
      'options': [
        "To announce new sales targets",
        "To introduce a bonus structure",
        "To schedule a team meeting",
        "To ask for sales strategies",
      ],
      'correctIndex': 0, // Also B, but A is the primary announcement
      'explain':
          "Memo (Passage 6) có chủ đề 'Q3 Sales Targets' và thông báo 'The sales targets... have now been finalized'.",
    },
    {
      'question': passage158_160 + "\n\n159. What reward is mentioned?",
      'options': [
        "A higher commission rate",
        "A quarterly bonus for top sellers", // This wasn't in the new memo. Error.
        "A bonus for exceeding targets by 15%",
        "Individual recognition",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 6) nói 'there is a new bonus structure in place this quarter rewarding exceeding targets by more than 15%'.",
    },
    {
      'question': passage158_160 + "\n\n160. What will happen on Friday?",
      'options': [
        "The quarter ends.",
        "New targets take effect.",
        "The sales manager will be out.",
        "The team will discuss the targets.",
      ],
      'correctIndex': 3,
      'explain':
          "Memo (Passage 6) nói 'We will discuss these targets... during our team meeting this Friday'.",
    },
    // Q161-163 (New E-mail)
    {
      'question':
          passage161_163 + "\n\n161. What is the purpose of the e-mail?",
      'options': [
        "To schedule a meeting",
        "To request market research",
        "To ask for client feedback",
        "To share a draft design",
      ],
      'correctIndex': 3,
      'explain':
          "Kenji (Passage 7) viết, 'Attached, please find the first draft of the homepage design'.",
    },
    {
      'question':
          passage161_163 +
          "\n\n162. What does Kenji ask David to review specifically?",
      'options': [
        "Branding elements",
        "Navigation and layout",
        "Project timeline",
        "Estimated costs",
      ],
      'correctIndex': 1,
      'explain':
          "Kenji (Passage 7) yêu cầu 'Please pay particular attention to the navigation structure and the overall layout.'",
    },
    {
      'question':
          passage161_163 + "\n\n163. What is the deadline for feedback?",
      'options': ["Hôm qua", "Thứ Sáu", "Tuần sau", "Không có hạn chót"],
      'correctIndex': 1,
      'explain':
          "Kenji (Passage 7) yêu cầu 'Please send any comments or requested revisions by this Friday, May 17'.",
    },
    // Q164-167 (New Webpage)
    {
      'question':
          passage164_167 + "\n\n164. What service is NOT explicitly listed?",
      'options': [
        "Free Wi-Fi",
        "Fitness Center",
        "Business Center",
        "Swimming Pool",
      ],
      'correctIndex': 3,
      'explain':
          "Trang web (Passage 8) liệt kê Wi-Fi, Fitness Center, Business Center, và Restaurant/Room Service. Swimming Pool không được đề cập.",
    },
    {
      'question': passage164_167 + "\n\n165. When is the Fitness Center open?",
      'options': ["Chỉ buổi sáng", "Chỉ buổi tối", "Giờ hành chính", "24/7"],
      'correctIndex': 3,
      'explain': "Trang web (Passage 8) ghi 'Fitness Center: Open 24/7'.",
    },
    {
      'question':
          passage164_167 + "\n\n166. Which service incurs additional fees?",
      'options': [
        "Wi-Fi access",
        "Using the Fitness Center",
        "Printing in the Business Center",
        "Eating breakfast", // Assuming breakfast isn't free
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) nói về Business Center: 'printing, and copying services available (fees apply...)'.",
    },
    {
      'question':
          passage164_167 + "\n\n167. How much does the airport shuttle cost?",
      'options': ["Miễn phí", "\$15", "\$30", "Phụ thuộc thời gian"],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) ghi 'Airport Shuttle:... \$15 per person.'",
    },
    // Q168-171 (New Form - Conference Registration)
    {
      'question':
          passage168_171 +
          "\n\n168. What type of registration did Sarah Chen purchase?",
      'options': [
        "Single Day Pass",
        "Full Conference Pass",
        "Workshop Pass",
        "Student Pass",
      ],
      'correctIndex': 1,
      'explain':
          "Form (Passage 9) có dấu '[X]' bên cạnh 'Full Conference Pass'.",
    },
    {
      'question':
          passage168_171 + "\n\n169. How much did the registration cost?",
      'options': ["\$200", "\$400", "\$500", "\$700"],
      'correctIndex': 2,
      'explain':
          "Form (Passage 9) ghi 'Total Paid: \$500', tương ứng với giá 'Full Conference Pass'.",
    },
    {
      'question':
          passage168_171 + "\n\n170. Which workshops did Sarah Chen select?",
      'options': [
        "AI Trends and Cloud Security",
        "Cloud Security and Marketing Analytics",
        "AI Trends and Marketing Analytics",
        "Marketing Analytics and Project Management",
      ],
      'correctIndex': 2,
      'explain':
          "Form (Passage 9) có dấu '[X]' bên cạnh 'Workshop A: AI Trends' và 'Workshop C: Marketing Analytics'.",
    },
    {
      'question':
          passage168_171 + "\n\n171. What can be inferred about Workshop B?",
      'options': [
        "It is mandatory.",
        "It is held on Tuesday morning.",
        "Sarah Chen did not select it.",
        "It costs extra.",
      ],
      'correctIndex':
          2, // Also B is explicitly stated. But C is the action taken.
      'explain':
          "Form (Passage 9) liệt kê 'Workshop B: Cloud Security (Tuesday AM)' nhưng không có dấu X bên cạnh, nghĩa là Sarah Chen không chọn nó.",
    },
    // Q172-175 (New Article)
    {
      'question':
          passage172_175 +
          "\n\n172. What does the study suggest about flexible schedules?",
      'options': [
        "They decrease productivity.",
        "They increase sick days.",
        "They reduce stress.",
        "They are difficult to manage.",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) nói 'Employees who had control over their start and end times reported lower stress levels'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n173. What effect did flexibility have on productivity?",
      'options': [
        "It decreased significantly.",
        "It decreased slightly.",
        "It stayed the same or increased slightly.",
        "It increased significantly.",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) nói 'study found no significant decrease in overall output; in fact, some measures of productivity slightly increased.'",
    },
    {
      'question': passage172_175 + "\n\n174. Who is Dr. Anna Petrova?",
      'options': [
        "A company CEO",
        "An employee in the study",
        "The lead researcher",
        "A journalist",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 10) trích lời 'Dr. Anna Petrova, the lead researcher'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. According to Dr. Petrova, what does offering flexibility demonstrate?",
      'options': ["Trust", "Control", "Generosity", "Inefficiency"],
      'correctIndex': 0,
      'explain':
          "Dr. Petrova (Passage 10) bình luận '\"Allowing flexibility demonstrates trust...\".",
    },

    // --- Double Passages ---

    // Q176-180 (New Double Passage: Ad + E-mail)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. What is advertised on the museum website?",
      'options': [
        "Free admission",
        "Exhibition previews",
        "Membership benefits",
        "A quarterly magazine",
      ],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) mô tả các lợi ích của việc trở thành hội viên ('Become a Member Today! Enjoy exclusive benefits...').",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. How much does a Family membership cost?",
      'options': ["\$60", "\$90", "\$120", "\$150"],
      'correctIndex': 2,
      'explain': "Quảng cáo (Passage 1) ghi 'Family...: \$120'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. Why did Laura Fernandez write the e-mail?",
      'options': [
        "To purchase a membership",
        "To ask about admission for her child",
        "To inquire about member events",
        "To get a discount",
      ],
      'correctIndex': 1,
      'explain':
          "Laura (Passage 2) đang cân nhắc mua 'Dual membership' và hỏi 'Does the Dual membership allow free admission for children as well...?'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. How old is Laura Fernandez's daughter?",
      'options': ["Dưới 10", "10", "Trên 10", "Không rõ"],
      'correctIndex': 1,
      'explain': "Laura (Passage 2) đề cập đến 'our 10-year-old daughter'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. Based on the advertisement, which membership does Laura Fernandez likely need?",
      'options': ["Individual", "Dual", "Family", "Student"],
      'correctIndex': 2,
      'explain':
          "Quảng cáo (Passage 1) mô tả gói 'Dual' cho '2 adults' và 'Family' cho '2 adults + children under 18'. Vì con gái cô ấy 10 tuổi, cô ấy cần gói Family để con được vào cửa miễn phí.",
    },
    // Q181-185 (New Double Passage: Article + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What did the Friends of the Library recently hold?",
      'options': [
        "A fundraiser",
        "A book sale",
        "A children's program",
        "A donation drive",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) nói về 'successful annual book sale held this past weekend'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. How will the money raised be used?",
      'options': [
        "To buy new computers",
        "To fund children's programs",
        "To pay library staff",
        "To renovate the library",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) trích lời chủ tịch nói tiền 'will be used to fund new children's programs and purchase large-print books'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. Why did John Davis write the e-mail?",
      'options': [
        "To congratulate the Friends group",
        "To ask how to donate books",
        "To volunteer for the next sale",
        "To request large-print books",
      ],
      'correctIndex': 1,
      'explain':
          "John (Passage 2) nói anh ấy có 'several boxes of books... I would like to donate' và hỏi về quy trình ('limit', 'types of books you do not accept').",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. Where can donations be dropped off?",
      'options': [
        "At Maria Garcia's house",
        "At the circulation desk",
        "At the Friends group office",
        "During the book sale",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) nói 'Books can be dropped off at the library's circulation desk'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What types of books does John Davis have?",
      'options': [
        "Textbooks and magazines",
        "Novels and history books",
        "Children's books",
        "DVDs and CDs",
      ],
      'correctIndex': 1,
      'explain': "John (Passage 2) đề cập 'mostly novels and history books'.",
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
          "\n\n186. According to the webpage, how long can a study room be booked per day?",
      'options': ["1 giờ", "2 giờ", "4 giờ", "Cả ngày"],
      'correctIndex': 1,
      'explain':
          "Chính sách (Passage 1) ghi 'Maximum booking duration: 2 hours per day'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. What equipment is available upon request?",
      'options': ["Bàn ghế", "Ổ cắm điện", "Wi-Fi", "Máy chiếu"],
      'correctIndex': 3,
      'explain':
          "Chính sách (Passage 1) nói 'Projectors available upon request'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What information did Mark Davis provide in his request?",
      'options': [
        "The number of attendees",
        "The room number",
        "His credit card number",
        "The topic of the meeting",
      ],
      'correctIndex': 0,
      'explain': "Mark (Passage 2) viết 'a small group meeting (4 people)'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. What is confirmed in the third e-mail?",
      'options': [
        "The room booking and projector reservation",
        "The library card number",
        "The cancellation policy",
        "The room capacity",
      ],
      'correctIndex': 0,
      'explain':
          "Thư viện (Passage 3) xác nhận 'We have booked Study Room 3 for you' và 'We have also reserved a projector for you.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. How far in advance did Mark Davis book the room?",
      'options': ["1 ngày", "2 ngày", "3 ngày", "7 ngày"],
      'correctIndex': 1,
      'explain':
          "Anh ấy gửi yêu cầu (Passage 2) vào 'June 10' cho ngày 'June 12', tức là 2 ngày trước.",
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
        "Jane Evans' bio",
        "Workshop registration details",
        "PlanPro software features",
        "An upcoming training workshop",
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
          "\n\n192. What software will the workshop focus on?",
      'options': ["PlanPro", "Excel", "Risk Management Suite", "Không rõ"],
      'correctIndex': 0,
      'explain':
          "E-mail đầu tiên (Passage 1) nói hội thảo tập trung vào 'project scheduling techniques using our new 'PlanPro' software'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. What problem does Kenji Tanaka have?",
      'options': [
        "He missed the registration deadline.",
        "He cannot attend the full workshop.",
        "He does not understand PlanPro.",
        "He did not receive the e-mail.",
      ],
      'correctIndex': 1,
      'explain':
          "Kenji (Passage 2) nói anh ấy có cuộc gọi từ 9-10 AM và hỏi liệu có thể tham gia muộn không.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. According to the agenda, what happens at 1:00 PM?",
      'options': [
        "Critical Path Analysis",
        "Lunch",
        "Resource Allocation",
        "Coffee Break",
      ],
      'correctIndex': 1,
      'explain':
          "Lịch trình (Passage 3) ghi '12:00 PM - 1:00 PM: Lunch (Provided)' và '1:00 PM - 2:30 PM: Resource Allocation & Leveling'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What content section will Kenji Tanaka miss part of if he arrives at 10:00 AM?",
      'options': [
        "Welcome & Introductions",
        "PlanPro Overview & Interface Navigation",
        "Critical Path Analysis Techniques",
        "Resource Allocation & Leveling",
      ],
      'correctIndex': 1,
      'explain':
          "Lịch trình (Passage 3) cho thấy phần 'PlanPro Overview & Interface Navigation' diễn ra từ 9:15 AM đến 10:30 AM. Nếu anh ấy đến lúc 10:00 AM, anh ấy sẽ bỏ lỡ 45 phút đầu của phần này.",
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
        "Beverage service only",
        "A quote for a room and services",
        "Availability for 15 rooms",
        "The standard room setup",
      ],
      'correctIndex': 1,
      'explain':
          "David (Passage 1) yêu cầu 'confirm availability and provide a quote for the room rental and beverage service.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. According to the hotel's reply, what is the cost of the room rental?",
      'options': ["\$10", "\$150", "\$400", "\$550"],
      'correctIndex': 2,
      'explain':
          "E-mail phản hồi (Passage 2) ghi 'Room Rental (Full Day): \$400'.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. How many people is the beverage service for?",
      'options': ["10", "15", "23", "Không rõ"],
      'correctIndex': 1,
      'explain':
          "E-mail đầu tiên (Passage 1) nói 'We expect approximately 15 attendees'. E-mail phản hồi (Passage 2) tính phí cho '15 people'.",
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
        "He cancelled the booking.",
        "He asked for a discount.",
        "He confirmed the booking.",
        "He changed the date.",
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
          "\n\n200. How will the booking be paid for or guaranteed?",
      'options': [
        "David Miller's personal card",
        "A corporate credit card on file",
        "An invoice sent later",
        "A check",
      ],
      'correctIndex': 1,
      'explain':
          "David (Passage 3) hướng dẫn 'Please use the corporate credit card already on file for Innovatech Corporation'.",
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
