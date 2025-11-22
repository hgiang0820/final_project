// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRTest08() async {
  final db = FirebaseFirestore.instance;
  // ID cho bài test mới này
  final testId = 'testLR_full_08';

  // Firestore: Create test document
  await db
      .collection('practice_tests')
      .doc('LR_practice_tests')
      .collection('test_number')
      .doc(testId)
      .set({
        'title': 'Full TOEIC Listening & Reading Practice Test 08',
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
        'order': 8,
      });

  // =======================================================================
  // ========================== LISTENING SECTION ==========================
  // =======================================================================

  // // === PART 1: Photographs === (6 Questions)
  final part1Questions = [
    {
      // Image Description: Một người đàn ông đang xem xét bản thiết kế tại công trường.
      // Transcript:
      // (A) He's operating heavy machinery.
      // (B) He's reviewing blueprints at a construction site.
      // (C) He's climbing a ladder.
      // (D) He's mixing cement.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người đàn ông đội mũ cứng, đang xem giấy tờ (blueprints - bản thiết kế) tại một nơi đang xây dựng (construction site).',
    },
    {
      // Image Description: Một người phụ nữ đang sắp xếp hoa quả trên quầy hàng ở chợ.
      // Transcript:
      // (A) She's weighing produce on a scale.
      // (B) She's arranging fruit in a display.
      // (C) She's paying for groceries.
      // (D) She's talking to a customer.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain':
          'Người phụ nữ đang sắp xếp (arranging) các loại trái cây (fruit) trên một quầy trưng bày (display).',
    },
    {
      // Image Description: Một phòng họp trống với bàn dài và nhiều ghế.
      // Transcript:
      // (A) A meeting is in progress.
      // (B) The chairs have been stacked against the wall.
      // (C) The conference room is empty.
      // (D) A presentation is being set up.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 2,
      'explain':
          'Bức tranh cho thấy một phòng họp (conference room) không có người (empty).',
    },
    {
      // Image Description: Một người đang đeo tai nghe và nhìn vào màn hình máy tính.
      // Transcript:
      // (A) He's typing on a keyboard.
      // (B) He's talking on the phone.
      // (C) He's listening to music.
      // (D) He's wearing headphones and looking at a screen.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 3,
      'explain':
          'Người này đang đeo tai nghe (wearing headphones) và nhìn vào màn hình (looking at a screen).',
    },
    {
      // Image Description: Xe đạp đậu thành hàng dài trên vỉa hè.
      // Transcript:
      // (A) Bicycles are parked in a row.
      // (B) People are riding bicycles in a race.
      // (C) A bicycle is being repaired.
      // (D) Bicycles are loaded onto a truck.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Nhiều chiếc xe đạp (bicycles) đang được đậu (parked) thành một hàng (in a row).',
    },
    {
      // Image Description: Một người pha chế đang rót đồ uống vào ly sau quầy bar.
      // Transcript:
      // (A) A bartender is pouring a drink.
      // (B) A customer is ordering a beverage.
      // (C) Glasses are being washed in a sink.
      // (D) Bottles are stacked on shelves.
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          'Người pha chế (bartender) đang rót (pouring) một thứ đồ uống (drink) vào ly.',
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
      // Where did you leave the keys?
      // (A) I left at 5 PM.
      // (B) They're on the kitchen counter.
      // (C) No, I didn't lock it.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Where". (B) provides a location.',
    },
    {
      // Q8
      // When does the store open?
      // (A) It's open until 9 PM.
      // (B) Usually at 10 AM.
      // (C) I bought it at the store.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "When". (B) provides a time.',
    },
    {
      // Q9
      // Who approved the budget change?
      // (A) The budget is very tight.
      // (B) I think the finance director did.
      // (C) It was changed last week.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "Who". (B) names a person/title.',
    },
    {
      // Q10
      // Why is the printer offline?
      // (A) It ran out of paper.
      // (B) Put it on the line.
      // (C) Yes, it's a new printer.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Question asks "Why". (A) provides a reason.',
    },
    {
      // Q11
      // How do I operate this coffee machine?
      // (A) It makes great coffee.
      // (B) I operate a small business.
      // (C) Just press the green button.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "How". (C) explains the method.',
    },
    {
      // Q12
      // Is the meeting scheduled for 2 PM or 3 PM?
      // (A) Yes, it is scheduled.
      // (B) It's at 3 PM in Room 5.
      // (C) The schedule is on the wall.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Alternative question ("or"). (B) chooses one option and adds detail.',
    },
    {
      // Q13
      // Would you like me to reserve a taxi for you?
      // (A) No thanks, I'm driving myself.
      // (B) The reservation is confirmed.
      // (C) I prefer the window seat.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Offer of help. (A) politely declines.',
    },
    {
      // Q14
      // What's the status of the Henderson project?
      // (A) Mr. Henderson is the client.
      // (B) It's on track to finish next month.
      // (C) The project requires more funding.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Question asks "What\'s the status". (B) describes the current progress.',
    },
    {
      // Q15
      // You've met our new colleague, haven't you?
      // (A) The meeting is at 10.
      // (B) Yes, I introduced myself this morning.
      // (C) He's working on a new project.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Tag question. (B) answers "Yes" and provides context.',
    },
    {
      // Q16
      // How many people signed up for the tour?
      // (A) The sign is over there.
      // (B) It's a two-hour tour.
      // (C) Let me check the list.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain':
          'Question asks "How many". (C) is an indirect answer, indicating the speaker will find out.',
    },
    {
      // Q17
      // Why don't we leave a little early to avoid traffic?
      // (A) The traffic report is on the radio.
      // (B) I left it on your desk.
      // (C) Good idea, let's go now.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain':
          'Suggestion ("Why don\'t we...?"). (C) agrees and suggests immediate action.',
    },
    {
      // Q18
      // Has the shipment arrived from the warehouse?
      // (A) No, it's expected this afternoon.
      // (B) The warehouse is very large.
      // (C) Please ship it soon.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Yes/No question. (A) answers "No" and provides expected time.',
    },
    {
      // Q19
      // Could you please send me the link to the article?
      // (A) I linked them together.
      // (B) Sure, I'll forward it right now.
      // (C) The article was very interesting.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Request. (B) agrees ("Sure") and states when.',
    },
    {
      // Q20
      // This laptop battery doesn't last very long.
      // (A) It was the last one in stock.
      // (B) Maybe you should get a new one.
      // (C) No, it wasn't very long ago.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Statement of a problem. (B) offers a suggestion.',
    },
    {
      // Q21
      // What time is the award ceremony?
      // (A) It's being held at the Grand Hotel.
      // (B) The award is well-deserved.
      // (C) It starts at 7 PM.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "What time". (C) gives the start time.',
    },
    {
      // Q22
      // Didn't you like the movie?
      // (A) I moved it to the shelf.
      // (B) No, it wasn't very interesting.
      // (C) Yes, I like movies.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Negative Yes/No question asking for opinion. (B) answers "No" and gives reason.',
    },
    {
      // Q23
      // Whose presentation is scheduled next?
      // (A) It's scheduled for 11 AM.
      // (B) It's about market trends.
      // (C) I believe it's Mr. Kim's.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain': 'Question asks "Whose". (C) names the presenter.',
    },
    {
      // Q24
      // How far is the hotel from the city center?
      // (A) It's a five-star hotel.
      // (B) About 15 minutes by taxi.
      // (C) The city center is very crowded.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain':
          'Question asks "How far". (B) gives distance in terms of travel time.',
    },
    {
      // Q25
      // Should I turn left or right at the next corner?
      // (A) Turn right, then it's on your left.
      // (B) Yes, you should turn.
      // (C) It's around the corner.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Alternative question ("or"). (A) chooses one option and adds further direction.',
    },
    {
      // Q26
      // When will the new employees start?
      // (A) They are starting next Monday.
      // (B) We hired three new people.
      // (C) At the main entrance.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Question asks "When". (A) gives the start date.',
    },
    {
      // Q27
      // I can't access my voicemail.
      // (A) I'll leave you a message.
      // (B) Maybe the system is down.
      // (C) The access code is 1234.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Statement of a problem. (B) suggests a possible reason.',
    },
    {
      // Q28
      // How often do you visit the dentist?
      // (A) My appointment is tomorrow.
      // (B) Twice a year for a check-up.
      // (C) The dentist's office is nearby.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 1,
      'explain': 'Question asks "How often". (B) gives the frequency.',
    },
    {
      // Q29
      // Would you mind if I close the blinds? The sun is bright.
      // (A) Please go ahead.
      // (B) I don't mind the sun.
      // (C) The blinds are broken.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain':
          'Request ("Would you mind if...?"). (A) is a polite way to agree.',
    },
    {
      // Q30
      // What kind of business are you planning to start?
      // (A) It's a risky plan.
      // (B) I'm starting it next year.
      // (C) A small online bookstore.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 2,
      'explain':
          'Question asks "What kind". (C) describes the type of business.',
    },
    {
      // Q31
      // Have you received the payment for invoice #506?
      // (A) Yes, it arrived this morning.
      // (B) The invoice is overdue.
      // (C) I'll pay it tomorrow.
      'question': "", 'options': ['A', 'B', 'C'], 'correctIndex': 0,
      'explain': 'Yes/No question. (A) answers "Yes" and gives time.',
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
(Woman) Hello, City Library Information Desk. How can I help you?
(Man) Hi, I'd like to reserve a meeting room for a study group this Thursday afternoon.
(Woman) Okay, let me check the schedule. We have Room A available from 2 PM to 4 PM, or Room B available from 3 PM to 5 PM.
(Man) Room A from 2 to 4 sounds perfect. How many people does it hold? We'll have about six people.
(Woman) Room A holds up to eight people, so that will be fine. I'll just need your library card number to make the reservation.
""";

  // --- Conversation 2: Questions 35-37 ---
  final transcript35_37 = """
(Man) Ms. Evans, do you have a moment to approve this purchase order for the new monitors?
(Woman) Sure, Kenji. Let me take a look. Hmm, this total is higher than we discussed in the budget meeting.
(Man) Yes, the price for the model we wanted went up slightly since then. It's only a 5% increase.
(Woman) Okay, 5% is acceptable. I'll sign it now. Please make sure to keep the finance department updated.
""";

  // --- Conversation 3: Questions 38-40 ---
  final transcript38_40 = """
(Woman) Excuse me, I think I left my scarf on the train. I just got off the 10:15 from Springfield.
(Man) Okay, let me check our lost and found log for that train. What color is the scarf?
(Woman) It's dark blue, wool, with a small white flower pattern near the end.
(Man) Ah, yes! Someone turned in a scarf matching that description just a few minutes ago. You're in luck. Let me get it for you.
""";

  // --- Conversation 4: Questions 41-43 ---
  final transcript41_43 = """
(Man) I've drafted the agenda for the project kickoff meeting next week.
(Woman) Great. Does it include time for introductions and a Q&A session at the end?
(Man) Yes, I've allocated 15 minutes for introductions and 30 minutes for Q&A. The main part will be discussing the project scope and timeline.
(Woman) Perfect. Please send it out to the whole project team by the end of today.
""";

  // --- Conversation 5: Questions 44-46 ---
  final transcript44_46 = """
(Woman) We need to book flights for the conference in Singapore. Should we fly 'Global Air' or 'Pacific Wings'?
(Man) Pacific Wings is usually cheaper, but their flights often have long layovers. Global Air is more expensive but usually direct.
(Woman) Let's check Global Air first then. We don't want to waste too much time traveling. What dates do we need?
(Man) We need to arrive by May 5th and return on May 9th.
""";

  // --- Conversation 6: Questions 47-49 ---
  final transcript47_49 = """
(Man) Hi, I'm calling to inquire about membership at your fitness center.
(Woman) Hello! We offer several plans. Our most popular is the 'All Access' membership for \$60 per month, which includes gym equipment, group classes, and pool access.
(Man) That sounds good. Do you have childcare services available?
(Woman) Yes, we do. Childcare is available for children aged 6 months to 10 years for an additional \$10 per visit, or \$40 per month for unlimited use.
""";

  // --- Conversation 7: Questions 50-52 ---
  final transcript50_52 = """
(Woman) David, the client called and asked if we could move the deadline for the proposal forward by two days.
(Man) Two days earlier? That's going to be tight. We're still waiting for the market research data.
(Woman) I know. I told her it might be difficult, but I said I'd check with the team. When is the research data due?
(Man) It's supposed to arrive tomorrow. If we get it on time, maybe we can finish the proposal two days early, but it will require working late.
""";

  // --- Conversation 8: Questions 53-55 ---
  final transcript53_55 = """
(Man) I just finished interviewing the final candidate for the administrative assistant position.
(Woman) Oh, great. What did you think? Did anyone stand out?
(Man) Yes, the last candidate, Maria Garcia, was very impressive. She has excellent qualifications and seemed very professional.
(Woman) I agree, I interviewed her yesterday. I think she's the strongest candidate. Let's make her an offer.
""";

  // --- Conversation 9: Questions 56-58 (with Graphic) ---
  final transcript56_58 = """
(Woman) Excuse me, I'd like to buy tickets for the 7:00 PM showing of 'Mountain Adventure'.
(Man) Okay. How many tickets?
(Woman) Two adults, please. And I saw on the sign that you have a combo deal?
(Man) Yes, Combo 2 comes with two large drinks and one large popcorn for \$15, which saves you a few dollars. Would you like to add that?
---
**Movie Theater Concessions**
- Combo 1: 1 Med Drink, 1 Med Popcorn - \$12
- Combo 2: 2 Lg Drinks, 1 Lg Popcorn - \$15
- Combo 3: 2 Lg Drinks, 2 Lg Popcorn - \$18
- Large Drink: \$6
- Large Popcorn: \$8
""";

  // --- Conversation 10: Questions 59-61 ---
  final transcript59_61 = """
(Man) The lights in the hallway outside my office keep flickering. It's quite distracting.
(Woman) Oh, I noticed that too. I think a few bulbs might need replacing.
(Man) Should we report it to maintenance?
(Woman) Yes, definitely. I can submit a work order through the online portal right now.
""";

  // --- Conversation 11: Questions 62-64 ---
  final transcript62_64 = """
(Woman) Hi, I have a reservation under the name Chen for 6:30 PM.
(Man) Welcome, Ms. Chen. Yes, right this way. Your table is ready by the window.
(Woman) Thank you. Could we also get a high chair for a baby?
(Man) Of course. I'll bring one right over for you. Can I get you started with some drinks while you look at the menu?
""";

  // --- Conversation 12: Questions 65-67 ---
  final transcript65_67 = """
(Man) I'm trying to figure out the new expense reporting software. It's quite different.
(Woman) I know, it took me a while too. Did you watch the tutorial video HR sent out?
(Man) No, I didn't see that e-mail. Was it helpful?
(Woman) Very. It walks you through step-by-step how to submit expenses and upload receipts. I can forward you the link if you'd like.
""";

  // --- Conversation 13: Questions 68-70 ---
  final transcript68_70 = """
(Woman) Mr. Kim called while you were out. He wants to reschedule your meeting for tomorrow.
(Man) Oh? Did he say why? We were supposed to finalize the contract.
(Woman) He said something came up, but he's free anytime after 1 PM tomorrow.
(Man) Okay, please call him back and confirm for 2 PM. And book the small conference room for us then.
""";

  final part3Questions = [
    // Conversation 1 (Q32-34)
    {
      'question': "What is the man trying to do?",
      'options': [
        "Find a study group",
        "Reserve a meeting room",
        "Check out a book",
        "Get a library card",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript32_34 \n\n=> The man says, 'I'd like to reserve a meeting room...'",
    },
    {
      'question': "What time slot does the man choose?",
      'options': ["2 PM to 4 PM", "3 PM to 5 PM", "This afternoon", "Thursday"],
      'correctIndex': 0,
      'explain':
          "$transcript32_34 \n\n=> After hearing the options, the man says, 'Room A from 2 to 4 sounds perfect.'",
    },
    {
      'question': "What information does the woman need?",
      'options': [
        "The man's name",
        "The number of people",
        "The topic of study",
        "The man's library card number",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript32_34 \n\n=> The woman says, 'I'll just need your library card number to make the reservation.'",
    },
    // Conversation 2 (Q35-37)
    {
      'question': "What does the man ask Ms. Evans to do?",
      'options': [
        "Attend a meeting",
        "Sign a purchase order",
        "Update the budget",
        "Contact the finance department",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript35_37 \n\n=> The man asks, 'do you have a moment to approve this purchase order...?' which requires a signature.",
    },
    {
      'question': "What is Ms. Evans' initial concern?",
      'options': [
        "The items are not needed.",
        "The order is incomplete.",
        "The price is higher than expected.",
        "The delivery date is too late.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript35_37 \n\n=> Ms. Evans says, 'this total is higher than we discussed in the budget meeting.'",
    },
    {
      'question': "What does Ms. Evans tell Kenji to do?",
      'options': [
        "Find a cheaper model",
        "Cancel the order",
        "Get approval from finance",
        "Keep finance informed",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript35_37 \n\n=> After agreeing to sign, Ms. Evans says, 'Please make sure to keep the finance department updated.'",
    },
    // Conversation 3 (Q38-40)
    {
      'question': "Where most likely are the speakers?",
      'options': [
        "On a train",
        "At a lost and found office",
        "At a train station",
        "In a clothing store",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The woman mentions getting off a train and looking for a lost item. The man checks a 'lost and found log', typical for a station.",
    },
    {
      'question': "What did the woman lose?",
      'options': ["Her ticket", "Her wallet", "Her scarf", "Her luggage"],
      'correctIndex': 2,
      'explain':
          "$transcript38_40 \n\n=> The woman says, 'I think I left my scarf on the train.'",
    },
    {
      'question': "What does the man say about the lost item?",
      'options': [
        "He hasn't seen it.",
        "It was just turned in.",
        "It's probably still on the train.",
        "He needs more description.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript38_40 \n\n=> After checking, the man says, 'Someone turned in a scarf matching that description just a few minutes ago.'",
    },
    // Conversation 4 (Q41-43)
    {
      'question': "What document has the man drafted?",
      'options': [
        "A project timeline",
        "A meeting agenda",
        "A client contract",
        "A newsletter",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The man says, 'I've drafted the agenda for the project kickoff meeting...'",
    },
    {
      'question': "What elements does the woman ask about?",
      'options': [
        "Project scope and timeline",
        "Introductions and Q&A",
        "Marketing images",
        "Legal review",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript41_43 \n\n=> The woman asks, 'Does it include time for introductions and a Q&A session...?'",
    },
    {
      'question': "When should the man send the document?",
      'options': [
        "Now",
        "After the meeting",
        "By the end of today",
        "Next week",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript41_43 \n\n=> The woman requests, 'Please send it out... by the end of today.'",
    },
    // Conversation 5 (Q44-46)
    {
      'question': "What are the speakers trying to book?",
      'options': [
        "Hotel rooms",
        "Train tickets",
        "Flights",
        "A conference venue",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript44_46 \n\n=> The woman says, 'We need to book flights for the conference in Singapore.'",
    },
    {
      'question': "What is a potential disadvantage of Pacific Wings?",
      'options': [
        "It is more expensive.",
        "It does not fly direct.",
        "It has poor service.",
        "It does not fly to Singapore.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man says Pacific Wings 'flights often have long layovers,' implying they are not direct.",
    },
    {
      'question': "When does the man need to return?",
      'options': ["May 5th", "May 9th", "May 10th", "The date is flexible"],
      'correctIndex': 1,
      'explain':
          "$transcript44_46 \n\n=> The man specifies the dates: 'arrive by May 5th and return on May 9th.'",
    },
    // Conversation 6 (Q47-49)
    {
      'question': "What is the man interested in?",
      'options': [
        "A gym membership",
        "Group classes",
        "Pool access",
        "Childcare services",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript47_49 \n\n=> The man says, 'I'm calling to inquire about membership at your fitness center.'",
    },
    {
      'question': "How much does the 'All Access' membership cost per month?",
      'options': ["\$10", "\$40", "\$60", "\$70"],
      'correctIndex': 2,
      'explain':
          "$transcript47_49 \n\n=> The woman says the 'All Access' membership is '\$60 per month'.",
    },
    {
      'question': "What is the monthly cost for unlimited childcare?",
      'options': ["\$10", "\$40", "\$50", "\$60"],
      'correctIndex': 1,
      'explain':
          "$transcript47_49 \n\n=> The woman says childcare is '\$40 per month for unlimited use.'",
    },
    // Conversation 7 (Q50-52)
    {
      'question': "What deadline are the speakers discussing?",
      'options': [
        "A project proposal",
        "Market research data",
        "A client meeting",
        "Next quarter",
      ],
      'correctIndex': 0,
      'explain':
          "$transcript50_52 \n\n=> The woman mentions the client asked to 'move the deadline for the proposal forward'.",
    },
    {
      'question': "What are the speakers waiting for?",
      'options': [
        "Client approval",
        "Market research data",
        "Team feedback",
        "The end of the day",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript50_52 \n\n=> The man says the tight deadline is because 'We're still waiting for the market research data.'",
    },
    {
      'question': "What might be required to meet the new deadline?",
      'options': [
        "Hiring more staff",
        "Getting an extension",
        "Working late",
        "Skipping the research",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript50_52 \n\n=> The man says if they get the data on time, 'maybe we can finish... early, but it will require working late.'",
    },
    // Conversation 8 (Q53-55)
    {
      'question': "What did the man just finish doing?",
      'options': [
        "Hiring an assistant",
        "Interviewing candidates",
        "Reviewing qualifications",
        "Meeting Maria Garcia",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript53_55 \n\n=> The man says, 'I just finished interviewing the final candidate...'",
    },
    {
      'question': "What position are they discussing?",
      'options': [
        "Manager",
        "Accountant",
        "Administrative assistant",
        "Interviewer",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> The man mentions interviewing for 'the administrative assistant position.'",
    },
    {
      'question': "What do the speakers decide to do?",
      'options': [
        "Interview more candidates",
        "Check Maria Garcia's references",
        "Offer Maria Garcia the job",
        "Discuss other candidates",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript53_55 \n\n=> Both speakers agree Maria is impressive and the strongest candidate. The woman concludes, 'Let's make her an offer.'",
    },
    // Conversation 9 (Q56-58)
    {
      'question': "Look at the graphic. What does Combo 2 include?",
      'options': [
        "One medium drink and popcorn",
        "Two large drinks and popcorn",
        "Two large drinks and two popcorns",
        "One large drink and one large popcorn",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man says, 'Combo 2 comes with two large drinks and one large popcorn'. The graphic confirms this.",
    },
    {
      'question': "Look at the graphic. How much does Combo 2 cost?",
      'options': ["\$12", "\$15", "\$18", "\$20"],
      'correctIndex': 1,
      'explain':
          "$transcript56_58 \n\n=> The man quotes '\$15' for Combo 2. The graphic confirms this.",
    },
    {
      'question':
          "How much would two large drinks and one large popcorn cost if purchased separately?",
      'options': ["\$14", "\$18", "\$20", "\$22"],
      'correctIndex': 2,
      'explain':
          "$transcript56_58 \n\n=> The graphic lists Large Drink: \$6 and Large Popcorn: \$8. Two large drinks (\$6 x 2 = \$12) plus one large popcorn (\$8) equals \$20.",
    },
    // Conversation 10 (Q59-61)
    {
      'question': "What is the topic of the conversation?",
      'options': [
        "Office lighting",
        "Elevator maintenance",
        "A crowded hallway",
        "A completion date",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript59_61 \n\n=> The man complains about the slow elevator, and the woman explains 'they're doing some maintenance work on one of the other elevators'.",
    },
    {
      'question': "Why is the elevator slow and crowded?",
      'options': [
        "It is old.",
        "It is peak hour.",
        "Another elevator is out of service.",
        "There is a sign posted.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman says, 'I heard they're doing some maintenance work on one of the other elevators, so everyone is using this one.'",
    },
    {
      'question': "When is the maintenance expected to finish?",
      'options': [
        "This afternoon",
        "Tonight",
        "Tomorrow afternoon",
        "Next week",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript59_61 \n\n=> The woman mentions, 'The sign said the work should be completed by tomorrow afternoon.'",
    },
    // Conversation 11 (Q62-64)
    {
      'question': "Why is the woman calling?",
      'options': [
        "To place an order",
        "To check on an order's status",
        "To change her address",
        "To return an item",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The woman says, 'I'm calling about an order I placed online... It was supposed to arrive yesterday...'",
    },
    {
      'question': "What problem occurred with the delivery?",
      'options': [
        "The item was wrong.",
        "The package was damaged.",
        "The courier couldn't find the address.",
        "No one was home to receive it.",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript62_64 \n\n=> The man checks and says, 'the courier attempted delivery yesterday afternoon, but no one was home.'",
    },
    {
      'question': "What will happen today?",
      'options': [
        "The woman needs to reschedule.",
        "The courier will try to deliver again.",
        "The woman needs to pick up the package.",
        "The man will call the courier.",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript62_64 \n\n=> The man says, 'They will try again today.'",
    },
    // Conversation 12 (Q65-67)
    {
      'question': "What event are the speakers planning?",
      'options': [
        "A weekly meeting",
        "A product launch",
        "An employee orientation",
        "An awards banquet",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man mentions finalizing the 'schedule for the new employee orientation'.",
    },
    {
      'question': "What task was forgotten?",
      'options': [
        "Booking a room",
        "Scheduling IT",
        "Ordering lunch",
        "Inviting new employees",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The man asks 'What about lunch?'. The woman replies, 'Right, I forgot about that.'",
    },
    {
      'question': "How many people does the woman need to order food for?",
      'options': ["9", "12", "15", "Không rõ"],
      'correctIndex': 2,
      'explain':
          "$transcript65_67 \n\n=> The woman says, 'I'll call the usual place now and order sandwiches and salads for 15 people.'",
    },
    // Conversation 13 (Q68-70)
    {
      'question': "What is the woman trying to do?",
      'options': [
        "Log in to her computer",
        "Find the HR department",
        "Update her contact information",
        "Request a new ID card",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The woman says, 'I'm trying to update my contact information on the company directory...'",
    },
    {
      'question': "What does the man say the woman needs to do?",
      'options': [
        "Update it herself online",
        "Call the IT department",
        "Ask the receptionist",
        "Fill out a form",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript68_70 \n\n=> The man explains, 'You need to fill out a 'Change of Information' form.'",
    },
    {
      'question': "Where can the woman get the form?",
      'options': [
        "From the man",
        "From her manager",
        "From the intranet or the receptionist",
        "From the IT department",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript68_70 \n\n=> The man says the forms 'are available on the HR section of the intranet, or you can just ask the receptionist'.",
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
Is your computer running slow? Does it crash often? Bring it to 'Computer Rescue'! Our certified technicians can diagnose and repair all types of computer problems, often on the same day. We handle virus removal, hardware upgrades, data recovery, and more. We offer fair, upfront pricing. Visit our convenient location at 55 Pine Street, next to the library. Mention this ad and get a free system check-up!
""";

  // --- Talk 2: Questions 74-76 (Airport Announcement) ---
  final transcript74_76 = """
Ladies and gentlemen, may I have your attention? We are looking for volunteers for flight 902 to Denver. This flight is currently overbooked. We are offering a \$300 travel voucher and a confirmed seat on the next available flight, departing at 6 PM, to any passengers willing to give up their seat on flight 902. If you are interested, please see the agent at the gate desk.
""";

  // --- Talk 3: Questions 77-79 (Excerpt from a Meeting) ---
  final transcript77_79 = """
Okay, the next item is planning our annual company retreat. This year, the planning committee has proposed three potential dates in September: the 7th, the 14th, or the 21st. Before we proceed further, I need everyone to check their calendars and let me know if any of these dates pose a major conflict. Please e-mail me your availability by the end of the day tomorrow.
""";

  // --- Talk 4: Questions 80-82 (Recorded Phone Message) ---
  final transcript80_82 = """
Thank you for calling the Springfield Department of Public Works. Our office hours are Monday through Friday, 8:30 AM to 4:30 PM. To report a non-emergency issue such as a pothole or a broken streetlight, please press one. For questions regarding trash and recycling pickup schedules, press two. To speak to someone about water billing, press three. For all other inquiries, please stay on the line.
""";

  // --- Talk 5: Questions 83-85 (Tour Guide) ---
  final transcript83_85 = """
Welcome, everyone, to the historic Grand Theater. Built in 1925, this theater was recently restored to its original splendor. My name is Linda, and I'll be leading your backstage tour today. We'll visit the dressing rooms, the orchestra pit, and even step out onto the stage itself. The tour will last about one hour. Please stay together, and no food or drink is allowed backstage. Let's start this way.
""";

  // --- Talk 6: Questions 86-88 (Business Presentation) ---
  final transcript86_88 = """
This slide shows the results of our recent advertising campaign analysis. We tested three different ad versions across various online platforms. Ad Version A, which featured customer testimonials, had the highest click-through rate, especially on social media. Version B, focusing on product features, performed moderately well. Version C, which used animated graphics, had the lowest engagement. Therefore, we recommend focusing future campaigns on customer testimonials.
""";

  // --- Talk 7: Questions 89-91 (News Report) ---
  final transcript89_91 = """
And now for your regional weather update. A heat advisory is in effect for our area through tomorrow evening. High temperatures are expected to reach the upper 90s, with high humidity making it feel even hotter. Residents are advised to stay indoors in air-conditioned spaces if possible, drink plenty of water, and check on elderly neighbors. Cooling centers have been opened at the community center and the public library.
""";

  // --- Talk 8: Questions 92-94 (Introduction of a Speaker) ---
  final transcript92_94 = """
It's my privilege to introduce our next speaker, Mr. David Miller. Mr. Miller is the Chief Financial Officer at Innovatech Corporation, where he has overseen a period of unprecedented growth. He has over 25 years of experience in corporate finance and strategy. Today, he will be sharing his perspective on 'Financial Strategies for a Changing Economy'. Please welcome David Miller.
""";

  // --- Talk 9: Questions 95-97 (with Graphic) ---
  final transcript95_97 = """
Welcome to the employee benefits information session. Please take a look at the comparison chart in your handout. Today we'll be discussing the three different health insurance plans available to you during open enrollment. I'll start by explaining Plan A, the 'Basic Coverage' option, which has the lowest monthly premium but the highest deductible. We'll then discuss Plans B and C. Please save your questions for the end.
---
**Health Plan Comparison**
| Feature           | Plan A (Basic) | Plan B (Standard) | Plan C (Premium) |
|-------------------|----------------|-------------------|------------------|
| Monthly Premium   | \$100          | \$200             | \$300            |
| Annual Deductible | \$3000         | \$1500            | \$500            |
| Doctor Visit Copay| \$40           | \$25              | \$15             |
| Prescription Copay| \$15/\$30/\$50 | \$10/\$25/\$40    | \$5/\$15/\$30    |
""";

  // --- Talk 10: Questions 98-100 (Store Announcement) ---
  final transcript98_100 = """
Attention, customers on the second floor. Our home goods department is having a special demonstration of the new 'BlendMaster Pro' blender. Come see how easy it is to make delicious smoothies and soups. The demonstration is taking place near the kitchenware section and will begin in five minutes. Free samples will be provided! Don't miss it!
""";

  final part4Questions = [
    // Talk 1 (Q71-73)
    {
      'question': "What service is being advertised?",
      'options': [
        "Home repair",
        "Packing and moving",
        "Storage rental",
        "Shipping services",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript71_73 \n\n=> Quảng cáo dành cho 'City Movers' và đề cập đến 'packing, moving, and storage services'.",
    },
    {
      'question': "What is offered for free?",
      'options': [
        "Packing supplies",
        "Storage for one month",
        "A price quote",
        "Insurance",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói đề cập 'We provide free, no-obligation quotes.'",
    },
    {
      'question': "How can customers get a discount?",
      'options': [
        "By booking online",
        "By moving in May",
        "By mentioning the ad",
        "By getting a quote",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript71_73 \n\n=> Người nói nói, 'For the month of May, mention this ad and get 15% off...'",
    },
    // Talk 2 (Q74-76)
    {
      'question': "What is the problem with flight 902?",
      'options': [
        "It is delayed.",
        "It is canceled.",
        "It is overbooked.",
        "It has changed gates.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói thông báo, 'This flight is currently overbooked.'",
    },
    {
      'question': "What are volunteers being offered?",
      'options': [
        "A free meal",
        "A seat on the 6 PM flight",
        "An upgrade",
        "\$300 cash",
      ],
      'correctIndex': 1, // Voucher + Confirmed Seat
      'explain':
          "$transcript74_76 \n\n=> Người nói đề nghị 'a \$300 travel voucher and a confirmed seat on the next available flight, departing at 6 PM'.",
    },
    {
      'question': "Who should interested passengers see?",
      'options': [
        "The pilot",
        "The flight attendant",
        "The gate agent",
        "Customer service",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript74_76 \n\n=> Người nói hướng dẫn, 'If you are interested, please see the agent at the gate desk.'",
    },
    // Talk 3 (Q77-79)
    {
      'question': "What is the main topic of the meeting excerpt?",
      'options': [
        "Employee survey results",
        "Choosing a date for an event",
        "Planning committee members",
        "Picnic area rental costs",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript77_79 \n\n=> Người nói tập trung vào việc chọn ngày ('choose a location... proposed three potential dates') cho 'annual company retreat'.",
    },
    {
      'question': "What event is being planned?",
      'options': [
        "A company picnic",
        "A planning meeting",
        "A budget review",
        "A company retreat", // Changed from picnic
      ],
      'correctIndex': 3,
      'explain':
          "$transcript77_79 \n\n=> Người nói đề cập đến 'our annual company retreat'.",
    },
    {
      'question': "What are listeners asked to do?",
      'options': [
        "Vote on a location",
        "Suggest other dates",
        "Check their calendars",
        "Contact the planning committee",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript77_79 \n\n=> Người nói yêu cầu, 'I need everyone to check their calendars and let me know if any of these dates pose a major conflict.'",
    },
    // Talk 4 (Q80-82)
    {
      'question': "What organization can callers reach?",
      'options': [
        "An electric company",
        "A water company",
        "A city government office",
        "A public works department",
      ],
      'correctIndex': 3,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'Thank you for calling the Springfield Department of Public Works.'",
    },
    {
      'question': "What should someone press to ask about recycling pickup?",
      'options': ["One", "Two", "Three", "Nine"],
      'correctIndex': 1,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'For questions regarding trash and recycling pickup schedules, press two.'",
    },
    {
      'question': "What is option one used for?",
      'options': [
        "Reporting emergencies",
        "Paying water bills",
        "Reporting non-emergency issues",
        "Checking office hours",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript80_82 \n\n=> Tin nhắn nói, 'To report a non-emergency issue such as a pothole or a broken streetlight, please press one.'",
    },
    // Talk 5 (Q83-85)
    {
      'question': "Where is the tour taking place?",
      'options': [
        "An opera house",
        "A historic theater",
        "A movie set",
        "A concert hall",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript83_85 \n\n=> Người nói chào mừng mọi người đến 'the historic Grand Theater.'",
    },
    {
      'question': "What areas will the tour include?",
      'options': [
        "The lobby",
        "The balcony seats",
        "The dressing rooms",
        "The box office",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói nói, 'We'll visit the dressing rooms, the orchestra pit, and even step out onto the stage itself.'",
    },
    {
      'question': "What are listeners asked NOT to do?",
      'options': [
        "Take photos",
        "Ask questions",
        "Bring food or drink",
        "Stay together",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript83_85 \n\n=> Người nói yêu cầu, 'no food or drink is allowed backstage.'",
    },
    // Talk 6 (Q86-88)
    {
      'question': "What is the speaker discussing?",
      'options': [
        "Advertising costs",
        "Market share trends",
        "Product innovation",
        "Competitor A's strategy",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript86_88 \n\n=> Người nói đang trình bày về 'our market share over the past five years compared to our top two competitors.'",
    },
    {
      'question': "What has happened to Competitor B's market share?",
      'options': [
        "It has remained stable.",
        "It has slightly declined.",
        "It has significantly increased.",
        "It has matched Competitor A.",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói nói, 'Competitor B has gained significant ground...'",
    },
    {
      'question': "What will the speaker likely discuss next?",
      'options': [
        "Competitor A's products",
        "Past advertising campaigns",
        "A proposed strategy",
        "Market share definitions",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript86_88 \n\n=> Người nói kết luận, 'I'll now discuss our proposed strategy for doing just that [innovating and differentiating].'",
    },
    // Talk 7 (Q89-91)
    {
      'question': "What is the main topic of the weather report?",
      'options': [
        "High humidity",
        "A heat advisory",
        "Cooling centers",
        "Weekend forecast",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript89_91 \n\n=> Bản tin bắt đầu 'A heat advisory is in effect...' (Cảnh báo nắng nóng).",
    },
    {
      'question': "What are residents advised to do?",
      'options': [
        "Open windows",
        "Go to the library",
        "Drink plenty of water",
        "Avoid air conditioning",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Người nói khuyên 'drink plenty of water'.",
    },
    {
      'question': "Where have cooling centers been opened?",
      'options': [
        "At hospitals",
        "At all public buildings",
        "At the community center and library",
        "At Northwood Industrial Park",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript89_91 \n\n=> Người nói đề cập 'Cooling centers have been opened at the community center and the public library.'",
    },
    // Talk 8 (Q92-94)
    {
      'question': "What is Mr. Miller's job title?",
      'options': [
        "CEO",
        "Author",
        "Chief Financial Officer",
        "Strategy Consultant",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Người nói giới thiệu ông ấy là 'the Chief Financial Officer at Innovatech Corporation'.",
    },
    {
      'question': "How long has Mr. Miller worked in finance?",
      'options': ["5 years", "15 years", "20 years", "Over 25 years"],
      'correctIndex': 3,
      'explain':
          "$transcript92_94 \n\n=> Người nói nói ông ấy có 'over 25 years of experience in corporate finance'.",
    },
    {
      'question': "What will Mr. Miller talk about?",
      'options': [
        "Innovatech's growth",
        "His career path",
        "Financial strategies",
        "The changing economy",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript92_94 \n\n=> Chủ đề bài nói của ông ấy là 'Financial Strategies for a Changing Economy'.",
    },
    // Talk 9 (Q95-97)
    {
      'question':
          "Look at the graphic. What session is scheduled at 1:30 PM in Room A?",
      'options': [
        "Effective Communication",
        "Project Management Basics",
        "Advanced Excel",
        "Presentation Skills",
      ],
      'correctIndex': 0, // Also Presentation Skills at 3 PM
      'explain':
          "$transcript95_97 \n\n=> Lịch trình hiển thị '1:30 PM: Effective Communication (Room A)'.",
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
          "$transcript95_97 \n\n=> Người nói đề cập 'Advanced Excel' và nói 'this session requires pre-registration'. Lịch trình cũng ghi chú điều này.",
    },
    {
      'question':
          "What should people do if they want to attend the Advanced Excel session but haven't registered?",
      'options': [
        "Go to Room C",
        "Ask the instructor",
        "Check at the registration desk",
        "Attend a different session",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript95_97 \n\n=> Người nói hướng dẫn, 'If you haven't registered, you can check with the staff at the registration desk...'",
    },
    // Talk 10 (Q98-100)
    {
      'question': "What event is being announced?",
      'options': [
        "A store closing",
        "Free samples",
        "A product demonstration",
        "A new blender model",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Thông báo về 'a special demonstration of the new 'BlendMaster Pro' blender.'",
    },
    {
      'question': "Where is the event taking place?",
      'options': [
        "On the first floor",
        "Near the entrance",
        "In the home goods department",
        "At the customer service desk",
      ],
      'correctIndex': 2,
      'explain':
          "$transcript98_100 \n\n=> Người nói nói 'Our home goods department...' và 'The demonstration is taking place near the kitchenware section'.",
    },
    {
      'question': "What will be provided at the event?",
      'options': [
        "Discount coupons",
        "Free samples",
        "Recipe books",
        "Blenders",
      ],
      'correctIndex': 1,
      'explain':
          "$transcript98_100 \n\n=> Người nói đề cập 'Free samples will be provided!'",
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
          "The meeting is scheduled ______ 10:00 A.M. in the main conference room.",
      'options': ['on', 'at', 'in', 'for'],
      'correctIndex': 3, // scheduled for a time
      'explain': 'Cấu trúc "scheduled for" (được lên lịch vào) + thời gian.',
    },
    {
      'question':
          "Ms. Lee ______ presented the quarterly results to the board.",
      'options': ['clear', 'clearly', 'clarity', 'clearness'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (clearly - rõ ràng) để bổ nghĩa cho động từ "presented".',
    },
    {
      'question':
          "Please complete the attached form and return it ______ Friday.",
      'options': ['by', 'on', 'at', 'in'],
      'correctIndex': 0,
      'explain': '"By" (trước, hoặc chậm nhất là) được dùng để chỉ hạn chót.',
    },
    {
      'question':
          "The company offers ______ opportunities for professional development.",
      'options': ['plenty', 'plentiful', 'plentifully', 'plenteous'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (plentiful - nhiều) để bổ nghĩa cho danh từ "opportunities".',
    },
    {
      'question':
          "The new software update is designed ______ user productivity.",
      'options': ['improve', 'improves', 'to improve', 'improving'],
      'correctIndex': 2,
      'explain':
          'Cấu trúc "designed to do something" yêu cầu động từ nguyên mẫu có "to".',
    },
    {
      'question':
          "______ arriving early, Mr. Kim was able to find a good seat.",
      'options': ['Because', 'By', 'Since', 'Despite'],
      'correctIndex': 1,
      'explain':
          '"By" + V-ing (Bằng cách) chỉ phương tiện hoặc cách thức đạt được kết quả.',
    },
    {
      'question':
          "The manager asked the team to work ______ to meet the deadline.",
      'options': [
        'collaborate',
        'collaborative',
        'collaboratively',
        'collaboration',
      ],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (collaboratively - một cách hợp tác) để bổ nghĩa cho động từ "work".',
    },
    {
      'question':
          "The ______ of the new factory is expected to begin next spring.",
      'options': ['construct', 'construction', 'constructed', 'constructive'],
      'correctIndex': 1,
      'explain':
          'Sau mạo từ "The" cần một danh từ (construction - việc xây dựng).',
    },
    {
      'question': "This coupon is ______ for 20% off any single item.",
      'options': ['value', 'valid', 'validate', 'validity'],
      'correctIndex': 1,
      'explain': 'Cần một tính từ (valid - có hiệu lực) sau động từ "is".',
    },
    {
      'question':
          "Ms. Tanaka is responsible ______ overseeing the entire project.",
      'options': ['of', 'with', 'for', 'at'],
      'correctIndex': 2,
      'explain': 'Cấu trúc "responsible for" + V-ing.',
    },
    {
      'question':
          "The workshop was ______ attended by employees from all departments.",
      'options': ['good', 'well', 'better', 'best'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (well - tốt, đông) để bổ nghĩa cho động từ "attended".',
    },
    {
      'question':
          "Please refer ______ the user manual for detailed instructions.",
      'options': ['at', 'on', 'to', 'with'],
      'correctIndex': 2,
      'explain': 'Cấu trúc "refer to" (tham khảo) là một cụm động từ cố định.',
    },
    {
      'question':
          "The company experienced a ______ increase in profits last year.",
      'options': ['substance', 'substantial', 'substantiate', 'substantially'],
      'correctIndex': 1,
      'explain':
          'Cần một tính từ (substantial - đáng kể) để bổ nghĩa cho danh từ "increase".',
    },
    {
      'question':
          "______ the two options, the first one seems more cost-effective.",
      'options': ['Among', 'With', 'Between', 'Of'],
      'correctIndex': 3, // "Of the two" when comparing two specific items.
      'explain':
          'Giới từ "Of" (Trong số) được dùng khi so sánh một nhóm cụ thể (hai lựa chọn).',
    },
    {
      'question': "The CEO ______ announced the company's expansion plans.",
      'options': ['person', 'personal', 'personnel', 'personally'],
      'correctIndex': 3,
      'explain':
          'Cần một trạng từ (personally - đích thân) để bổ nghĩa cho động từ "announced".',
    },
    {
      'question':
          "The success of the marketing campaign ______ all expectations.",
      'options': ['exceed', 'exceeds', 'exceeded', 'exceeding'],
      'correctIndex': 2,
      'explain':
          'Cần một động từ ở thì quá khứ đơn (exceeded - đã vượt) vì chiến dịch đã diễn ra.',
    },
    {
      'question':
          "Employees are required ______ safety goggles in the laboratory.",
      'options': ['wear', 'wore', 'to wear', 'wearing'],
      'correctIndex': 2,
      'explain':
          'Cấu trúc bị động "are required to do something" yêu cầu động từ nguyên mẫu có "to".',
    },
    {
      'question': "The ______ for the management position closes next Friday.",
      'options': ['apply', 'applying', 'applicant', 'application'],
      'correctIndex': 3,
      'explain':
          'Sau mạo từ "The" cần một danh từ (application - đơn ứng tuyển, hoặc quá trình ứng tuyển).',
    },
    {
      'question':
          "The terms of the contract are clearly ______ in the document.",
      'options': ['state', 'stated', 'stating', 'statement'],
      'correctIndex': 1,
      'explain':
          'Cần một quá khứ phân từ (stated - được nêu rõ) để tạo thành thể bị động (are stated).',
    },
    {
      'question':
          "The company offers ______ opportunities for career advancement.",
      'options': ['ample', 'amply', 'amplify', 'amplitude'],
      'correctIndex': 0,
      'explain':
          'Cần một tính từ (ample - nhiều) để bổ nghĩa cho danh từ "opportunities".',
    },
    {
      'question':
          "______ the audit is complete, the final report will be issued.",
      'options': ['Yet', 'Still', 'While', 'Once'],
      'correctIndex': 3,
      'explain': '"Once" (Một khi) là liên từ chỉ thời gian phù hợp nhất.',
    },
    {
      'question': "The manager expressed ______ for the team's dedication.",
      'options': ['appreciate', 'appreciative', 'appreciation', 'appreciated'],
      'correctIndex': 2,
      'explain':
          'Sau động từ "expressed" cần một danh từ (appreciation - sự cảm kích).',
    },
    {
      'question':
          "The hotel is ______ located near the airport and train station.",
      'options': ['strategy', 'strategic', 'strategically', 'strategies'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (strategically - có vị trí chiến lược) để bổ nghĩa cho động từ "located".',
    },
    {
      'question': "Ms. Ito reviewed the document ______ before submitting it.",
      'options': ['thorough', 'thoroughly', 'thoroughness', 'through'],
      'correctIndex': 1,
      'explain':
          'Cần một trạng từ (thoroughly - kỹ lưỡng) để bổ nghĩa cho động từ "reviewed".',
    },
    {
      'question': "The restaurant requires reservations, ______ on weekends.",
      'options': ['special', 'specialty', 'specialize', 'especially'],
      'correctIndex': 3,
      'explain': 'Cần một trạng từ (especially - đặc biệt là) để nhấn mạnh.',
    },
    {
      'question':
          "______ candidate meets all the qualifications will be invited for an interview.",
      'options': ['Whoever', 'Whatever', 'Whichever', 'Wherever'],
      'correctIndex': 0, // "Whoever meets..." (Bất cứ ai đáp ứng...)
      'explain':
          'Đại từ "Whoever" (Bất cứ ai) đóng vai trò làm chủ ngữ của mệnh đề phụ.',
    },
    {
      'question':
          "The company implemented new measures to improve workplace ______.",
      'options': ['safe', 'safely', 'safer', 'safety'],
      'correctIndex': 3,
      'explain':
          'Sau tính từ "workplace" (đóng vai trò như tính từ) cần một danh từ (safety - sự an toàn).',
    },
    {
      'question': "Please forward this e-mail to the ______ department.",
      'options': [
        'appropriation',
        'appropriately',
        'appropriate',
        'appropriated',
      ],
      'correctIndex': 2,
      'explain':
          'Cần một tính từ (appropriate - phù hợp) để bổ nghĩa cho danh từ "department".',
    },
    {
      'question': "The client was ______ satisfied with the final product.",
      'options': ['complete', 'completed', 'completely', 'completion'],
      'correctIndex': 2,
      'explain':
          'Cần một trạng từ (completely - hoàn toàn) để bổ nghĩa cho tính từ "satisfied".',
    },
    {
      'question': "______ you finish the report, please send me a copy.",
      'options': ['When', 'While', 'Unless', 'Despite'],
      'correctIndex': 0,
      'explain': '"When" (Khi) là liên từ chỉ thời gian phù hợp nhất.',
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
**Office Kitchen Etiquette Reminder**

This is a friendly reminder to all employees about maintaining cleanliness in our shared kitchen space. Recently, there has been an ____(131)____ in leftover food being left in the refrigerator for extended periods.

Please label all personal food items with your name and the date. Any unlabeled or expired items will be ____(132)____ every Friday afternoon during the weekly cleaning.

____(133)____, please ensure you wash your own dishes promptly and wipe down the counters after use. Let's work together to keep this area clean and pleasant ____(134)____ everyone.
""";
  // --- Passage 2: Questions 135-138 (E-mail) ---
  final passage135_138 = """
To: Conference Attendees
From: Event Organizers
Subject: Important: Conference Schedule Update
Date: July 20

Dear Attendees,
Please note a change to the conference schedule for tomorrow, July 21. The keynote address by Dr. Evans, ____(135)____ scheduled for 9:00 A.M., has been moved to 1:00 P.M.

This change was necessary due to an unforeseen travel delay affecting Dr. Evans. The morning workshop sessions will proceed as planned. ____(136)____.

An updated schedule has been posted on the conference website. ____(137)____ will also be available at the registration desk. We ____(138)____ for any inconvenience this change may cause.
""";
  // --- Passage 3: Questions 139-142 (Advertisement) ---
  final passage139_142 = """
**'ProFit' Sportswear - Performance Meets Style!**

Upgrade your workout gear with ProFit! Our innovative sportswear is designed for maximum comfort and ____(139)____. Made with breathable, moisture-wicking fabrics, ProFit clothing keeps you cool and dry during any activity.

We offer a full range of athletic apparel, including shorts, leggings, t-shirts, and jackets. ____(140)____.

Visit our store at the City Mall or shop online at profitwear.com. For a limited time, get free shipping ____(141)____ all orders ____(142)____ \$75. Stay active, stay stylish with ProFit!
""";
  // --- Passage 4: Questions 143-146 (Memo) ---
  final passage143_146 = """
**MEMORANDUM**
To: All Department Heads
From: Kenji Tanaka, VP Operations
Subject: Energy Conservation Efforts
Date: June 5

As you know, reducing operational costs is a key priority this year. One significant area for potential savings is energy ____(143)____.

I am asking each department to make a conscious effort to conserve electricity. This includes turning off lights and computers when not in use, and ensuring printers and copiers are set to energy-saving modes. ____(144)____.

Please discuss this ____(145)____ your teams and encourage participation. Small changes by everyone can add up to significant savings for the company. We will review energy usage reports at the end of the quarter.
""";

  final part6Questions = [
    // Passage 1 (Q131-134)
    {
      'question': passage131_134,
      'options': ["increase", "increased", "increasing", "increasingly"],
      'correctIndex': 0, // "an increase in..."
      'explain': "Sau mạo từ 'an' cần một danh từ (increase - sự gia tăng).",
    },
    {
      'question': "",
      'options': ["discard", "discarded", "discarding", "discardable"],
      'correctIndex': 1,
      'explain':
          "Cần một quá khứ phân từ (discarded - bị vứt bỏ) để tạo thành thể bị động (will be discarded).",
    },
    {
      'question': "",
      'options': [
        "The refrigerator is too small.",
        "Additionally", // Furthermore, Moreover
        "However",
        "Therefore",
      ],
      'correctIndex': 1,
      'explain':
          "'Additionally' (Ngoài ra) được dùng để thêm một yêu cầu khác (rửa bát đĩa).",
    },
    {
      'question': "",
      'options': ["at", "for", "with", "to"],
      'correctIndex': 1,
      'explain':
          "Tính từ 'pleasant' thường đi với giới từ 'for' (dễ chịu cho ai).",
    },

    // Passage 2 (Q135-138)
    {
      'question': passage135_138,
      'options': ["origin", "original", "originally", "originate"],
      'correctIndex': 2,
      'explain':
          "Cần một trạng từ (originally - ban đầu) để bổ nghĩa cho động từ 'scheduled'.",
    },
    {
      'question': "",
      'options': [
        "Dr. Evans sends her apologies.",
        "Please check the website for room assignments.",
        "Lunch will be served at noon as usual.",
        "The registration desk opens at 8 AM.",
      ],
      'correctIndex': 0, // Changed sentence
      'explain':
          "Câu này cung cấp một lời xin lỗi hợp lý từ người bị ảnh hưởng bởi sự thay đổi lịch trình.",
    },
    {
      'question': "",
      'options': ["They", "It", "Copies", "Which"],
      'correctIndex':
          1, // "It" refers to the updated schedule. "Copies" would also work grammatically but "It" is smoother.
      'explain': "Đại từ 'It' thay thế cho 'An updated schedule' ở câu trước.",
    },
    {
      'question': "",
      'options': ["apologize", "apology", "apologies", "apologetic"],
      'correctIndex': 0,
      'explain':
          "Chủ ngữ là 'We', nên cần động từ nguyên mẫu (apologize - xin lỗi).",
    },

    // Passage 3 (Q139-142)
    {
      'question': passage139_142,
      'options': ["perform", "performed", "performing", "performance"],
      'correctIndex': 3,
      'explain':
          "Sau tính từ 'maximum' cần một danh từ (performance - hiệu suất).",
    },
    {
      'question': "",
      'options': [
        "Check our website for the latest arrivals.",
        "Our fabrics are sourced sustainably.",
        "These items are machine washable.",
        "Our design team is based locally.",
      ],
      'correctIndex': 0,
      'explain':
          "Câu này khuyến khích khách hàng xem thêm sản phẩm mới, phù hợp với mục đích quảng cáo.",
    },
    {
      'question': "",
      'options': ["at", "on", "for", "with"],
      'correctIndex': 1,
      'explain': "Cụm 'free shipping on orders' là cách diễn đạt phổ biến.",
    },
    {
      'question': "",
      'options': ["at", "over", "within", "from"],
      'correctIndex': 1,
      'explain':
          "Giới từ 'over' (trên) được dùng để chỉ giá trị tối thiểu (\$75).",
    },

    // Passage 4 (Q143-146)
    {
      'question': passage143_146,
      'options': ["consume", "consumed", "consumer", "consumption"],
      'correctIndex': 3,
      'explain':
          "Sau tính từ 'energy' cần một danh từ (consumption - sự tiêu thụ).",
    },
    {
      'question': "",
      'options': [
        "Please submit your suggestions to me.",
        "These small actions can make a big difference.",
        "The cost savings will be significant.",
        "We will install new meters soon.",
      ],
      'correctIndex':
          1, // This sentence emphasizes the collective impact, fitting the context.
      'explain':
          "Câu này nhấn mạnh tác động của những hành động nhỏ được đề cập ở câu trước ('turning off lights...').",
    },
    {
      'question': "",
      'options': ["at", "on", "by", "with"],
      'correctIndex': 3,
      'explain':
          "Cấu trúc 'discuss something with someone' (thảo luận điều gì với ai).",
    },
    {
      'question': "",
      'options': ["comply", "complied", "compliant", "compliance"],
      'correctIndex':
          3, // Changed from previous test to reuse passage structure.
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
**'Quick Fix' Smartphone Repair**

Cracked screen? Battery dying fast? Visit Quick Fix! We offer expert repairs for all major smartphone brands.
* **Fast Service**: Most screen replacements done in under an hour!
* **Affordable Prices**: Screen repair starts at \$79. Free diagnostics.
* **Quality Parts**: We use high-quality replacement parts.
* **Warranty**: 90-day warranty on all repairs.

Located at 200 Main Street, next to the post office. Open 7 days a week!
""";
  // Q149-150 (E-mail)
  final passage149_150 = """
To: Sarah Evans <s.evans@company.com>
From: David Miller <d.miller@company.com>
Subject: Tomorrow's Meeting
Date: September 12

Hi Sarah,
Could you please print 10 copies of the attached presentation for our client meeting tomorrow morning at 9 AM?
Also, could you make sure the conference room projector is working beforehand? We had issues with it last week.
Thanks for your help!
David
""";
  // Q151-152 (Text Message Chain)
  final passage151_152 = """
**Mark (10:00 AM)**: Hi Anna, are you free for a quick call? I have a question about the budget report.
**Anna (10:01 AM)**: In a meeting until 10:30. Can I call you back then?
**Mark (10:02 AM)**: Sure, that works. Just need to clarify the Q3 marketing expenses.
**Anna (10:31 AM)**: Okay, meeting over. Calling you now.
""";
  // Q153-155 (Article)
  final passage153_155 = """
**Global Airways Adds New Routes**

(July 18) – Global Airways announced today the addition of three new non-stop routes from its hub in Chicago. Starting November 1, the airline will offer daily flights to Dublin, Ireland, and Lisbon, Portugal. A new route to Reykjavik, Iceland, will operate three times per week.

"We are excited to offer our customers more direct access to these popular European destinations," said airline spokesperson Anna Chen.

Tickets for the new routes are available for purchase immediately on the airline's website. To celebrate the launch, Global Airways is offering introductory fares starting at \$499 round trip for a limited time.
""";
  // Q156-157 (Notice)
  final passage156_157 = """
**Company Cafeteria - Menu Change**

Please note that starting next Monday, April 22, the cafeteria will no longer be serving hot breakfast items.

Due to low demand, we will transition to offering only continental breakfast options, including pastries, fruit, yogurt, and coffee.

The full hot lunch service will continue as usual from 11:30 AM to 1:30 PM. We apologize for any inconvenience.
""";
  // Q158-160 (Memo)
  final passage158_160 = """
**MEMORANDUM**
**To**: All Employees
**From**: Human Resources
**Date**: June 25
**Subject**: Update Your Contact Information

Please take a moment this week to log in to the employee self-service portal and verify that your contact information (address, phone number, emergency contact) is up to date.

Accurate information is crucial for payroll, benefits administration, and emergency communications.

Instructions for accessing the portal and updating your information can be found on the HR section of the company intranet. Please complete this by Friday, June 29.
""";
  // Q161-163 (E-mail)
  final passage161_163 = """
To: Customer Service <service@stylemaven.com>
From: laura.c@email.com
Subject: Return Request - Order #SM-901
Date: March 8

Hello,
I received my order today (a blue sweater, item #BL-100), but unfortunately, it doesn't fit correctly. The sleeves are too long.
I would like to return this item for a full refund. According to your website, returns are accepted within 30 days.
Could you please provide instructions and a return shipping label? My order number is SM-901.
Thank you,
Laura Chen
""";
  // Q164-167 (Webpage)
  final passage164_167 = """
**Oakwood City Library - Upcoming Events**

**Author Talk: Maria Garcia**
* *Date*: Tuesday, October 22, 7:00 PM
* *Location*: Main Reading Room
* Local author Maria Garcia discusses her new historical novel set in Oakwood. Book signing to follow. Free admission.

**Workshop: Introduction to Genealogy**
* *Date*: Saturday, October 26, 1:00 PM - 3:00 PM
* *Location*: Computer Lab
* Learn how to use online resources to research your family history. Presented by the Oakwood Historical Society. Registration required (limit 15 participants). \$10 fee.

**Children's Story Time**
* Every Wednesday at 10:30 AM in the Children's Section. Ages 2-5.
""";
  // Q168-171 (Form)
  final passage168_171 = """
**'Pro Hardware' - Special Order Form**

**Customer Name**: Kenji Tanaka
**Date**: April 5
**Contact**: 555-8899

**Item Requested**:
* Manufacturer: **'PowerTool Inc.'**
* Model Number: **XZ-500**
* Description: Heavy-Duty Rotary Saw
* Quantity: **1**

**Customer Notes**: This model is not currently in stock. Please order it for me. Call me when it arrives.

**Store Use Only**:
* Order Placed By: M. Evans (April 5)
* Supplier ETA: April 12
* Customer Notified: ______ (Date: ______)
* Item Picked Up: ______ (Date: ______)
""";
  // Q172-175 (Article)
  final passage172_175 = """
**'Innovate Tech' Announces Quarterly Earnings**

(July 28) – 'Innovate Tech' reported its financial results for the second quarter today, showing a 12% increase in revenue compared to the same period last year. The growth was largely driven by strong sales of its flagship product, the 'ConnectPro' wireless router.

However, net profit saw a slight decline of 3%, which CEO David Chen attributed to increased spending on research and development for upcoming products. "We are investing heavily in innovation to ensure our long-term growth," Chen stated in a press release.

Despite the dip in profit, the company's stock price remained stable in after-hours trading. Innovate Tech plans to launch two new products in the fourth quarter.
""";

  // --- Double Passages (Q176-185) ---

  // Q176-180 (E-mail + Webpage)
  final passage176_180_1 = """
**Advertisement: Franklin Language Institute**

**Learn Spanish This Summer!**
Our intensive 4-week summer Spanish course is perfect for beginners.
* **Dates**: July 8 - August 2
* **Schedule**: Monday - Friday, 9:00 AM - 12:00 PM
* **Location**: Franklin Language Institute, 15 Main St.
* **Cost**: \$600 (includes textbook)
* **Instructor**: Dr. Maria Rossi

Small class sizes ensure personalized attention. Focus on conversational skills. Register by June 15! Visit franklinlanguage.com.
""";
  final passage176_180_2 = """
To: admissions@franklinlanguage.com
From: kevin.b@email.com
Subject: Question about Summer Spanish Course
Date: June 18

Hello,
I am interested in the intensive summer Spanish course advertised on your website (July 8 - Aug 2). However, I see that the registration deadline was June 15.

Is it still possible to register for the course? I was traveling and missed the deadline. I am a complete beginner but very motivated to learn.

Please let me know if there are any spots still available or if there is a waiting list.

Thank you,
Kevin Brown
""";
  // Q181-185 (Memo + E-mail)
  final passage181_185_1 = """
**City News: Museum Extends 'Ancient World' Exhibit**

(August 10) – Due to popular demand, the City History Museum announced today that its special exhibit, "Treasures of the Ancient World," will be extended for two additional weeks. Originally scheduled to close on August 20, the exhibit will now remain open to the public until September 3.

The exhibit features over 150 artifacts from ancient Egypt, Greece, and Rome, including pottery, sculptures, and jewelry. "The response from the community has been overwhelming," said museum director David Wu.

The museum is open Tuesday-Sunday, 10 AM - 5 PM. Exhibit tickets are \$15 for adults.
""";
  final passage181_185_2 = """
To: Members <list@cityhistorymuseum.org>
From: City History Museum <info@cityhistorymuseum.org>
Subject: Member-Only Event - Ancient World Exhibit
Date: August 22

Dear Valued Member,
As a thank you for your support, we invite you to a special member-only evening viewing of the extended "Treasures of the Ancient World" exhibit.

Join us on **Friday, August 30**, from 6:00 PM to 8:00 PM for exclusive access to the exhibit after regular museum hours. Light refreshments will be served.

Please RSVP by August 28 by replying to this e-mail. This event is free for members (plus one guest). We look forward to seeing you!
""";

  // --- Triple Passages (Q186-200) ---

  // Q186-190 (Ad + E-mail + E-mail)
  final passage186_190_1 = """
**Building Notice - 100 Main Street**
**Date**: May 1
**Subject**: Elevator Maintenance

Please be advised that Elevator #2 (the west elevator) will be out of service for scheduled maintenance from **Monday, May 6, through Friday, May 10**.

During this period, please use Elevator #1 (the east elevator) or the stairs. We expect increased wait times for Elevator #1, especially during peak hours (8-9 AM and 4-5 PM).

We apologize for the inconvenience and appreciate your patience.
- Building Management
""";
  final passage186_190_2 = """
**To**: Building Management <manager@100main.com>
**From**: Sarah Chen (Apex Corp, Suite 300) <s.chen@apexcorp.com>
**Subject**: Elevator Maintenance & Delivery
**Date**: May 3

Hello,
I saw the notice about Elevator #2 being out of service next week.
Apex Corp is expecting a large delivery of office furniture on **Wednesday, May 8**. Our delivery company will need exclusive access to the freight elevator (Elevator #1, the east elevator?) for approximately 2 hours, likely between 10 AM and 12 PM.

Could you please confirm if Elevator #1 is indeed the freight elevator and if we can reserve it during that time on May 8?

Thank you,
Sarah Chen
""";
  final passage186_190_3 = """
**To**: Sarah Chen <s.chen@apexcorp.com>
**From**: Building Management <manager@100main.com>
**Subject**: Re: Elevator Maintenance & Delivery
**Date**: May 3

Dear Ms. Chen,
Thank you for your inquiry. Yes, Elevator #1 (east) is our freight elevator.
Unfortunately, due to Elevator #2 being out of service all week, we cannot grant exclusive access to Elevator #1 during regular business hours, as it will be the only one available for all tenants.
We recommend scheduling your furniture delivery either before 8 AM or after 5 PM on May 8 to minimize disruption. Please let us know if you can arrange this with your delivery company.
Sincerely,
Building Management
""";
  // Q191-195 (Article + E-mail + Schedule)
  final passage191_195_1 = """
**City Gazette: 'The Corner Bistro' Under New Ownership**
(April 2) – Local restaurateur David Miller has purchased 'The Corner Bistro' on Elm Street. Miller, who also owns the popular 'Pasta Place' downtown, plans a minor renovation and menu update for the Bistro.
"We want to keep the neighborhood feel but elevate the food," Miller said. The Bistro will close for one week, starting April 15, for the renovations. It is expected to reopen on April 22 with a new menu focusing on seasonal ingredients and French influences. The current staff will be retained.
""";
  final passage191_195_2 = """
**To**: friends_list@email.com
**From**: laura.c@email.com
**Subject**: Dinner next week?
**Date**: April 25

Hi everyone,
Now that 'The Corner Bistro' has reopened after its renovation, I was thinking we should try it out. I heard the new menu is fantastic.
How about dinner there next Friday, May 3, around 7:00 PM? Let me know if that works for you by the end of this week so I can make a reservation.
Best,
Laura
""";
  final passage191_195_3 = """
**Online Review: The Corner Bistro (Posted May 4 by Mark P.)**
**Rating**: 4/5 Stars
Went here last night (May 3) with a group of friends. The renovation looks great - much brighter and more modern. The new menu is definitely a step up. I had the pan-seared salmon, which was excellent. My friends enjoyed their dishes too (steak frites, mushroom risotto). Service was a bit slow, maybe because it was a busy Friday night, but our server was very friendly. Overall, a great improvement. Will definitely be back.
""";
  // Q196-200 (E-mail + Invoice + E-mail)
  final passage196_200_1 = """
**To**: Global Airways Customer Care <care@globalair.com>
**From**: Kenji Tanaka <k.tanaka@email.com>
**Subject**: Damaged Luggage - Flight GA 405 (Aug 10)
**Date**: August 11

Dear Customer Care,
I flew on GA 405 from Tokyo to Los Angeles yesterday (August 10). Upon arrival, I discovered that my checked suitcase (Tag # GA12345) was severely damaged. One of the wheels is broken off, and there is a large crack in the hard shell.
I reported this at the baggage service desk at LAX and received a preliminary report (File # LAX-987). I would like to file a formal claim for repair or replacement of the suitcase. It is a 'TravelPro' brand suitcase, purchased 6 months ago.
Please advise on the next steps.
""";
  final passage196_200_2 = """
**To**: Kenji Tanaka <k.tanaka@email.com>
**From**: Global Airways Customer Care <care@globalair.com>
**Subject**: Re: Damaged Luggage - Flight GA 405 (Aug 10) - Claim # DL-500
**Date**: August 12

Dear Mr. Tanaka,
We sincerely apologize for the damage to your luggage. We have opened Claim # DL-500 based on your report (LAX-987).
To proceed, please take your damaged suitcase to an authorized luggage repair shop. A list of shops in the Los Angeles area is attached. Obtain a repair estimate.
If the shop deems the suitcase irreparable, please obtain a statement from them confirming this, along with an estimate of the replacement cost for a similar suitcase.
Submit the estimate (or statement and replacement cost) along with a copy of your original purchase receipt for the suitcase via the online claim portal (link provided below) using claim # DL-500.
""";
  final passage196_200_3 = """
**'Luggage MD' Repair Shop - REPAIR ESTIMATE**
**Date**: August 15
**Customer**: Kenji Tanaka
**Claim Ref**: Global Airways DL-500

**Item**: TravelPro Hardshell Suitcase (Approx. 6 months old)
**Damage**: Broken wheel assembly, cracked shell near wheel housing.

**Assessment**: Due to the cracked shell, a simple wheel replacement is not possible. The damage affects the structural integrity. **Repair is not recommended / possible.**

**Estimated Replacement Cost (Similar Model)**: TravelPro MaxLite Spinner 25" - **\$180.00** + tax.

**Technician**: R. Davis
""";

  final part7Questions = [
    // Q147-148 (Advertisement) - New
    {
      'question':
          passage147_148 +
          "\n\n147. What service does 'Quick Fix' primarily offer?",
      'options': [
        "Selling new smartphones",
        "Repairing smartphones",
        "Offering phone plans",
        "Diagnosing computer problems",
      ],
      'correctIndex': 1,
      'explain':
          "Quảng cáo (Passage 1) là về 'Smartphone Repair' và liệt kê các dịch vụ sửa chữa.",
    },
    {
      'question':
          passage147_148 +
          "\n\n148. What is mentioned about screen replacements?",
      'options': [
        "They cost \$79.",
        "They are guaranteed for 90 days.",
        "They use original parts.",
        "They are often done in under an hour.",
      ],
      'correctIndex': 3,
      'explain':
          "Quảng cáo (Passage 1) nói 'Most screen replacements done in under an hour!'",
    },
    // Q149-150 (E-mail) - New
    {
      'question':
          passage149_150 + "\n\n149. What equipment does David Miller mention?",
      'options': ["A printer", "A laptop", "A conference phone", "A projector"],
      'correctIndex': 3,
      'explain':
          "David (Passage 2) viết, 'could you make sure the conference room projector is working beforehand?'",
    },
    {
      'question': passage149_150 + "\n\n150. When is the client meeting?",
      'options': ["Sáng nay", "Chiều nay", "Sáng mai", "Tuần sau"],
      'correctIndex': 2,
      'explain':
          "David (Passage 2) đề cập đến 'our client meeting tomorrow morning at 9 AM'.",
    },
    // Q151-152 (Text Message Chain) - New
    {
      'question': passage151_152 + "\n\n151. Why can't Anna talk at 10:01 AM?",
      'options': [
        "She is busy with a report.",
        "She is in a meeting.",
        "She needs to make a call.",
        "She is out of the office.",
      ],
      'correctIndex': 1,
      'explain': "Anna (Passage 3) trả lời, 'In a meeting until 10:30.'",
    },
    {
      'question': passage151_152 + "\n\n152. What does Mark want to discuss?",
      'options': [
        "A phone call",
        "A meeting schedule",
        "Marketing expenses",
        "The budget report deadline",
      ],
      'correctIndex': 2,
      'explain':
          "Mark (Passage 3) nói, 'Just need to clarify the Q3 marketing expenses.'",
    },
    // Q153-155 (Article) - New
    {
      'question': passage153_155 + "\n\n153. What did Global Airways announce?",
      'options': [
        "Lower ticket prices",
        "A new hub in Chicago",
        "New flights to Europe",
        "A partnership with another airline",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 4) thông báo 'the addition of three new non-stop routes... to Dublin, Ireland, and Lisbon, Portugal... Reykjavik, Iceland'.",
    },
    {
      'question':
          passage153_155 +
          "\n\n154. Which destination will have fewer flights per week?",
      'options': ["Chicago", "Dublin", "Lisbon", "Reykjavik"],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 4) nói chuyến bay đến Dublin và Lisbon là 'daily' (hàng ngày), còn Reykjavik là 'three times per week' (ba lần một tuần).",
    },
    {
      'question': passage153_155 + "\n\n155. What special offer is mentioned?",
      'options': [
        "Free checked bags",
        "Discounted round-trip fares",
        "Upgrades to business class",
        "Frequent flyer miles",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 4) nói công ty đang 'offering introductory fares starting at \$499 round trip'.",
    },
    // Q156-157 (Notice) - New
    {
      'question':
          passage156_157 + "\n\n156. What change will happen next Monday?",
      'options': [
        "The cafeteria will close.",
        "Hot breakfast will no longer be served.",
        "Lunch hours will be extended.",
        "New menu items will be added.",
      ],
      'correctIndex': 1,
      'explain':
          "Thông báo (Passage 5) nói 'starting next Monday... the cafeteria will no longer be serving hot breakfast items.'",
    },
    {
      'question':
          passage156_157 + "\n\n157. What is the reason for the change?",
      'options': [
        "High cost",
        "Staff shortage",
        "Low demand",
        "Upcoming renovation",
      ],
      'correctIndex': 2,
      'explain': "Thông báo (Passage 5) giải thích 'Due to low demand...'.",
    },
    // Q158-160 (Memo) - New
    {
      'question': passage158_160 + "\n\n158. What are employees asked to do?",
      'options': [
        "Change their password",
        "Update their contact information",
        "Complete their benefits enrollment",
        "Provide emergency contacts",
      ],
      'correctIndex': 1,
      'explain':
          "Memo (Passage 6) yêu cầu nhân viên 'verify that your contact information... is up to date.'",
    },
    {
      'question':
          passage158_160 + "\n\n159. Why is accurate information needed?",
      'options': [
        "For security updates",
        "For performance reviews",
        "For payroll and emergencies",
        "For accessing the intranet",
      ],
      'correctIndex': 2,
      'explain':
          "Memo (Passage 6) nói thông tin chính xác 'is crucial for payroll, benefits administration, and emergency communications.'",
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
          passage161_163 + "\n\n161. Why did Laura Chen write the e-mail?",
      'options': [
        "To order a sweater",
        "To complain about delivery",
        "To request a return",
        "To ask for an exchange",
      ],
      'correctIndex': 2,
      'explain':
          "Chủ đề (Passage 7) là 'Return Request' và Laura viết 'I would like to return this item for a full refund.'",
    },
    {
      'question':
          passage161_163 + "\n\n162. What is the problem with the item?",
      'options': [
        "It is the wrong color.",
        "It is damaged.",
        "It does not fit properly.",
        "It arrived too late.",
      ],
      'correctIndex': 2,
      'explain':
          "Laura (Passage 7) viết 'it doesn't fit correctly. The sleeves are too long.'",
    },
    {
      'question':
          passage161_163 +
          "\n\n163. What does Laura ask the company to provide?",
      'options': [
        "A refund confirmation",
        "A different size",
        "A return shipping label",
        "The return policy",
      ],
      'correctIndex': 2,
      'explain':
          "Laura (Passage 7) hỏi, 'Could you please provide instructions and a return shipping label?'",
    },
    // Q164-167 (Webpage) - New
    {
      'question': passage164_167 + "\n\n164. What event features Maria Garcia?",
      'options': [
        "Author Talk",
        "Genealogy Workshop",
        "Children's Story Time",
        "Historical Society Meeting",
      ],
      'correctIndex': 0,
      'explain': "Trang web (Passage 8) liệt kê 'Author Talk: Maria Garcia'.",
    },
    {
      'question': passage164_167 + "\n\n165. When is the Genealogy Workshop?",
      'options': [
        "Tuesday evening",
        "Wednesday morning",
        "Saturday afternoon",
        "Không xác định",
      ],
      'correctIndex': 2,
      'explain':
          "Trang web (Passage 8) ghi 'Workshop: Introduction to Genealogy... Saturday, October 26, 1:00 PM - 3:00 PM'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n166. Which event requires registration and a fee?",
      'options': [
        "Author Talk",
        "Genealogy Workshop",
        "Children's Story Time",
        "Tất cả các sự kiện",
      ],
      'correctIndex': 1,
      'explain':
          "Trang web (Passage 8) ghi chú cho Genealogy Workshop: 'Registration required... \$10 fee'.",
    },
    {
      'question':
          passage164_167 +
          "\n\n167. Who is the genealogy workshop designed for?",
      'options': [
        "Authors",
        "Children",
        "Historians",
        "People researching family history", // Implied by the topic
      ],
      'correctIndex': 3,
      'explain':
          "Chủ đề (Passage 8) là 'Introduction to Genealogy' (Nhập môn Gia phả học) và mô tả 'Learn how to use online resources to research your family history'.",
    },
    // Q168-171 (Form) - New
    {
      'question': passage168_171 + "\n\n168. What item did Kenji Tanaka order?",
      'options': [
        "A hardware component",
        "A rotary saw",
        "Safety equipment",
        "Building supplies",
      ],
      'correctIndex': 1,
      'explain': "Form (Passage 9) mô tả 'Heavy-Duty Rotary Saw'.",
    },
    {
      'question':
          passage168_171 + "\n\n169. What is the model number of the item?",
      'options': ["PowerTool Inc.", "XZ-500", "April 5", "M. Evans"],
      'correctIndex': 1,
      'explain': "Form (Passage 9) ghi 'Model Number: XZ-500'.",
    },
    {
      'question': passage168_171 + "\n\n170. Why was the order placed?",
      'options': [
        "The item was on sale.",
        "The customer needed it urgently.",
        "The item was not in stock.",
        "It was a large quantity.",
      ],
      'correctIndex': 2,
      'explain':
          "Ghi chú của khách hàng (Passage 9) nói 'This model is not currently in stock. Please order it for me.'",
    },
    {
      'question':
          passage168_171 + "\n\n171. What does ETA stand for in this context?",
      'options': [
        "Estimated Time of Arrival",
        "Electronic Technical Assistance",
        "Extra Tax Added",
        "Equipment Tracking Asset",
      ],
      'correctIndex': 0,
      'explain':
          "ETA là viết tắt phổ biến của 'Estimated Time of Arrival' (Thời gian dự kiến đến), trong ngữ cảnh nhà cung cấp ('Supplier ETA').",
    },
    // Q172-175 (Article) - New
    {
      'question':
          passage172_175 + "\n\n172. What is the main topic of the article?",
      'options': [
        "Innovate Tech's new products",
        "The ConnectPro router",
        "A company's quarterly financial results",
        "Stock market performance",
      ],
      'correctIndex': 2,
      'explain':
          "Tiêu đề và câu đầu tiên (Passage 10) nói ''Innovate Tech' reported its financial results for the second quarter'.",
    },
    {
      'question':
          passage172_175 + "\n\n173. What happened to Innovate Tech's revenue?",
      'options': ["Nó giảm 3%", "Nó tăng 12%", "Nó không đổi", "Nó tăng 15%"],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) nói công ty báo cáo 'a 12% increase in revenue'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n174. According to the CEO, why did net profit decline slightly?",
      'options': [
        "Lower sales of ConnectPro",
        "Increased competition",
        "Higher taxes",
        "Increased spending on R&D",
      ],
      'correctIndex': 3,
      'explain':
          "CEO David Chen (Passage 10) 'attributed to increased spending on research and development'.",
    },
    {
      'question':
          passage172_175 +
          "\n\n175. What does Innovate Tech plan to do in the fourth quarter?",
      'options': [
        "Report earnings again",
        "Launch new products",
        "Increase R&D spending",
        "Buy back stock",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 10) kết luận 'Innovate Tech plans to launch two new products in the fourth quarter.'",
    },

    // --- Double Passages ---

    // Q176-180 (New Double Passage: Ad + E-mail)
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n176. What course is advertised?",
      'options': [
        "Beginner Spanish",
        "Advanced Spanish",
        "Summer Tutoring",
        "Online Language Learning",
      ],
      'correctIndex': 0,
      'explain':
          "Quảng cáo (Passage 1) là về 'intensive 4-week summer Spanish course... perfect for beginners'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n177. What is included in the course fee?",
      'options': [
        "Giáo viên",
        "Tài liệu trực tuyến",
        "Sách giáo trình",
        "Chứng chỉ",
      ],
      'correctIndex': 2,
      'explain': "Quảng cáo (Passage 1) ghi 'Cost: \$600 (includes textbook)'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n178. What was the registration deadline?",
      'options': ["June 15", "June 18", "July 8", "August 2"],
      'correctIndex': 0,
      'explain':
          "Quảng cáo (Passage 1) nói 'Register by June 15!'. Kevin (Passage 2) cũng xác nhận 'the registration deadline was June 15'.",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n179. Why did Kevin Brown miss the deadline?",
      'options': [
        "He didn't have the fee.",
        "He was unsure about the course.",
        "He was traveling.",
        "He is not a beginner.",
      ],
      'correctIndex': 2,
      'explain':
          "Kevin (Passage 2) viết, 'I was traveling and missed the deadline.'",
    },
    {
      'question':
          passage176_180_1 +
          "\n\n---\n\n" +
          passage176_180_2 +
          "\n\n180. What does Kevin Brown ask about?",
      'options': [
        "A discount on the fee",
        "The instructor's qualifications",
        "The possibility of late registration",
        "The course schedule",
      ],
      'correctIndex': 2,
      'explain':
          "Kevin (Passage 2) hỏi, 'Is it still possible to register for the course?' và 'Please let me know if there are any spots still available'.",
    },
    // Q181-185 (New Double Passage: Article + E-mail)
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n181. What is the subject of the article?",
      'options': [
        "A museum director's retirement",
        "An upcoming member event",
        "The extension of an exhibit",
        "Ancient World artifacts",
      ],
      'correctIndex': 2,
      'explain':
          "Tiêu đề và nội dung bài báo (Passage 1) thông báo triển lãm 'Treasures of the Ancient World' 'will be extended'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n182. Until what date will the exhibit now be open?",
      'options': ["August 10", "August 20", "August 30", "September 3"],
      'correctIndex': 3,
      'explain':
          "Bài báo (Passage 1) nói triển lãm 'will now remain open... until September 3'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n183. What is the purpose of the e-mail?",
      'options': [
        "To thank members for their support",
        "To invite members to a special event",
        "To announce the exhibit extension",
        "To ask members to RSVP",
      ],
      'correctIndex': 1,
      'explain':
          "E-mail (Passage 2) nói 'we invite you to a special member-only evening viewing'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n184. When is the member-only event?",
      'options': ["August 20", "August 22", "August 28", "August 30"],
      'correctIndex': 3,
      'explain':
          "E-mail (Passage 2) mời thành viên tham gia 'on Friday, August 30'.",
    },
    {
      'question':
          passage181_185_1 +
          "\n\n---\n\n" +
          passage181_185_2 +
          "\n\n185. What is offered at the member event?",
      'options': [
        "A lecture by David Wu",
        "Discounted tickets",
        "Light refreshments",
        "Early access to the museum",
      ],
      'correctIndex': 2,
      'explain': "E-mail (Passage 2) nói 'Light refreshments will be served.'",
    },

    // --- Triple Passages ---

    // Q186-190 (New Triple Passage: Notice + E-mail + E-mail)
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n186. According to the notice, which elevator will be out of service?",
      'options': [
        "Elevator #1",
        "The east elevator",
        "Elevator #2",
        "The freight elevator",
      ],
      'correctIndex': 2,
      'explain':
          "Thông báo (Passage 1) nói 'Elevator #2 (the west elevator) will be out of service'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n187. What does Sarah Chen need the elevator for?",
      'options': [
        "Regular passenger use",
        "A furniture delivery",
        "Maintenance access",
        "An emergency evacuation",
      ],
      'correctIndex': 1,
      'explain':
          "Sarah (Passage 2) viết 'Apex Corp is expecting a large delivery of office furniture'.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n188. What does Sarah Chen ask Building Management?",
      'options': [
        "If Elevator #1 is the freight elevator",
        "If the maintenance can be postponed",
        "If her delivery can use Elevator #2",
        "If she can reserve Elevator #1",
      ],
      'correctIndex': 3, // Both A and D are asked, but D is the main request.
      'explain':
          "Sarah (Passage 2) hỏi 'Could you please confirm if Elevator #1 is indeed the freight elevator and if we can reserve it during that time...?' Yêu cầu chính là đặt chỗ thang máy.",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n189. Why is Sarah's request denied?",
      'options': [
        "Elevator #1 is not the freight elevator.",
        "The delivery company canceled.",
        "Elevator #1 needs repairs too.",
        "Elevator #1 is needed by other tenants.",
      ],
      'correctIndex': 3,
      'explain':
          "Quản lý tòa nhà (Passage 3) trả lời 'we cannot grant exclusive access to Elevator #1 during regular business hours, as it will be the only one available for all tenants.'",
    },
    {
      'question':
          passage186_190_1 +
          "\n\n---\n\n" +
          passage186_190_2 +
          "\n\n---\n\n" +
          passage186_190_3 +
          "\n\n190. What solution does Building Management suggest?",
      'options': [
        "Using the stairs",
        "Rescheduling the maintenance",
        "Scheduling the delivery outside business hours",
        "Using Elevator #2 after 5 PM",
      ],
      'correctIndex': 2,
      'explain':
          "Quản lý tòa nhà (Passage 3) đề nghị 'scheduling your furniture delivery either before 8 AM or after 5 PM'.",
    },
    // Q191-195 (New Triple Passage: Article + E-mail + Review)
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n191. According to the article, what happened to 'The Corner Bistro'?",
      'options': [
        "It closed permanently.",
        "It was purchased by David Miller.",
        "It moved to a new location.",
        "It hired a new chef.",
      ],
      'correctIndex': 1,
      'explain':
          "Bài báo (Passage 1) nói 'Local restaurateur David Miller has purchased 'The Corner Bistro''.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n192. What change was planned for the restaurant?",
      'options': [
        "A name change",
        "A focus on pasta",
        "A minor renovation and menu update",
        "Hiring new staff",
      ],
      'correctIndex': 2,
      'explain':
          "Bài báo (Passage 1) nói Miller 'plans a minor renovation and menu update'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n193. Why did Laura C. write the e-mail?",
      'options': [
        "To make a reservation",
        "To review the restaurant",
        "To suggest a dinner outing",
        "To ask about the renovation",
      ],
      'correctIndex': 2,
      'explain':
          "Laura (Passage 2) viết, 'I was thinking we should try it out. How about dinner there next Friday...?' Đây là một lời đề nghị đi ăn tối.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n194. According to the review, what did Mark P. think of the food?",
      'options': [
        "Nó quá đắt",
        "Nó rất tuyệt vời",
        "Phần ăn quá nhỏ",
        "Nó không ngon",
      ],
      'correctIndex': 1,
      'explain':
          "Mark P. (Passage 3) viết 'The new menu is definitely a step up. I had the pan-seared salmon, which was excellent. My friends enjoyed their dishes too'.",
    },
    {
      'question':
          passage191_195_1 +
          "\n\n---\n\n" +
          passage191_195_2 +
          "\n\n---\n\n" +
          passage191_195_3 +
          "\n\n195. What negative point was mentioned in the review?",
      'options': [
        "The renovation",
        "The menu choices",
        "The slow service",
        "The friendly server",
      ],
      'correctIndex': 2,
      'explain': "Mark P. (Passage 3) viết, 'Service was a bit slow...'",
    },
    // Q196-200 (New Triple Passage: E-mail + E-mail + Invoice)
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n196. Why did Kenji Tanaka send the first e-mail?",
      'options': [
        "To order a suitcase",
        "To complain about a flight",
        "To report damaged luggage",
        "To request a repair estimate",
      ],
      'correctIndex': 2,
      'explain':
          "E-mail đầu tiên (Passage 1) có chủ đề 'Damaged Luggage' và mô tả chiếc vali bị hỏng.",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n197. What information did Mr. Tanaka receive at the airport?",
      'options': [
        "A claim number",
        "A repair estimate",
        "A preliminary report file number",
        "A list of repair shops",
      ],
      'correctIndex': 2,
      'explain':
          "Anh ấy (Passage 1) nói 'I reported this... and received a preliminary report (File # LAX-987).'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n198. According to the second e-mail, what should Mr. Tanaka do first?",
      'options': [
        "Submit his purchase receipt",
        "Go to an authorized repair shop",
        "Use the online claim portal",
        "Contact Global Airways again",
      ],
      'correctIndex': 1,
      'explain':
          "Hãng hàng không (Passage 2) hướng dẫn 'To proceed, please take your damaged suitcase to an authorized luggage repair shop.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n199. What did 'Luggage MD' determine about the suitcase?",
      'options': [
        "It could be repaired for \$180.",
        "It was older than 6 months.",
        "The wheel could be replaced.",
        "It could not be repaired.",
      ],
      'correctIndex': 3,
      'explain':
          "Báo giá sửa chữa (Passage 3) ghi 'Repair is not recommended / possible.'",
    },
    {
      'question':
          passage196_200_1 +
          "\n\n---\n\n" +
          passage196_200_2 +
          "\n\n---\n\n" +
          passage196_200_3 +
          "\n\n200. What document(s) will Mr. Tanaka likely submit to Global Airways?",
      'options': [
        "The repair estimate only",
        "The statement from Luggage MD and a purchase receipt",
        "The purchase receipt only",
        "The estimate and the replacement cost", // This refers to the same document in this case. B is more complete.
      ],
      'correctIndex': 1,
      'explain':
          "Hãng hàng không (Passage 2) yêu cầu, nếu không sửa được, nộp 'a statement... confirming this' và 'a copy of your original purchase receipt'. Báo giá của Luggage MD (Passage 3) đóng vai trò là statement.",
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
