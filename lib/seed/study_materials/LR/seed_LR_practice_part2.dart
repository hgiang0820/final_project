// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart2() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';
  const audioDemo = 'input_tests/testLR/part2/01%20Test%201_LC_Voca.mp3';

  // Root doc
  await db.collection('study_materials').doc('LRMaterials').set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  // Helper to push 1 lesson
  Future<void> pushLessonLR({
    required String levelId,
    required String lessonId, // lesson1..lesson5
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc('LRMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('part2')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Question & Response',
      'lessonName': lessonName,
      'audioPath': audioDemo,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      await lessonRef.collection('questions').doc(id).set({
        'question': q['question'],
        'imagePath': null,
        'options': q['options'],
        'correctIndex': q['correctIndex'],
        'explain': q['explain'],
        'order': i + 1,
      });
    }
  }

  Future<void> pushLessonFull({
    required String levelId,
    required String lessonId, // lesson1..lesson5
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc('FullMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('lis2')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Question & Response',
      'lessonName': lessonName,
      'audioPath': audioDemo,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      await lessonRef.collection('questions').doc(id).set({
        'question': q['question'],
        'imagePath': null,
        'options': q['options'],
        'correctIndex': q['correctIndex'],
        'explain': q['explain'],
        'order': i + 1,
      });
    }
  }

  // =========================
  // ===== LEVEL 300+ ========
  // =========================

  // Lesson 1 — Wh-questions (Who/When/Where/What/Why/How)
  final p2Lv300L1 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Where is the conference being held?\nA. At the main hall.\nB. On Friday.\nC. The manager.\n\n“Where” → địa điểm.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: When does the workshop start?\nA. At 9 a.m.\nB. In room A-2.\nC. With Mr. Park.\n\n“When” → thời gian.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Who will lead the meeting?\nA. The sales director.\nB. At the cafeteria.\nC. At noon.\n\n“Who” → người.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Why was the flight delayed?\nA. Because of bad weather.\nB. At Gate 12.\nC. Tomorrow morning.\n\n“Why” → lý do.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: How did you get to work today?\nA. By subway.\nB. At 8 o’clock.\nC. On the third floor.\n\n“How” → cách thức/phương tiện.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: What time is the interview?\nA. At 3 p.m.\nB. In the lobby.\nC. The HR manager.\n\n“What time” → giờ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Which department handles refunds?\nA. Customer service.\nB. Next Monday.\nC. At the east exit.\n\n“Which” → chọn phòng ban.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Where should I drop off the package?\nA. At the reception desk.\nB. By 5 p.m.\nC. Mr. Lee.\n\n“Where” → vị trí.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: When is the deadline for the report?\nA. This Thursday.\nB. At HQ.\nC. Mr. Gomez.\n\n“When” → hạn.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Who is responsible for marketing?\nA. Olivia from Sales.\nB. On the first floor.\nC. At 10 a.m.\n\n“Who” → người phụ trách.',
    },
  ];

  // Lesson 2 — Yes/No questions
  final p2Lv300L2 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Do you need any help with the boxes?\nA. Yes, please. They’re heavy.\nB. In the storage room.\nC. Tomorrow.\n\nYes/No → câu trả lời ngắn + chi tiết.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Is this seat taken?\nA. No, go ahead.\nB. By the window.\nC. For the CEO.\n\nPhủ định lịch sự.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Are you attending the seminar?\nA. Yes, I registered.\nB. In Room B.\nC. At 2 p.m.\n\nKhẳng định + thông tin phụ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Did you finish the budget?\nA. Not yet, almost done.\nB. By Friday.\nC. In Accounting.\n\nNo + progress.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Can I pay by card?\nA. Sure, we accept it.\nB. At the counter.\nC. A receipt.\n\nYes + xác nhận.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Have you seen Mr. Brown?\nA. Yes, he’s in a meeting.\nB. At the front desk.\nC. At 11 o’clock.\n\nYes + nơi hiện tại.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Is the printer working now?\nA. No, it’s still jammed.\nB. Next to the copier.\nC. A technician.\n\nNo + tình trạng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Will the store open early?\nA. Yes, at 8 a.m.\nB. On Main Street.\nC. The manager.\n\nYes + giờ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Could you send me the file?\nA. Sure, I’ll email it.\nB. On your desk.\nC. After lunch.\n\nĐồng ý + hành động.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Are there any seats left?\nA. No, it’s full.\nB. In Row C.\nC. At 7 p.m.\n\nNo + trạng thái hết chỗ.',
    },
  ];

  // Lesson 3 — Choice (A or B)
  final p2Lv300L3 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Would you like coffee or tea?\nA. Coffee, please.\nB. Yes, I would.\nC. At the café.\n\nChọn A/B.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Should we meet on Monday or Tuesday?\nA. Tuesday works.\nB. Yes, we should.\nC. In the morning.\n\nChọn ngày.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Do you prefer email or phone?\nA. Email is better.\nB. Yes, I do.\nC. At 9 a.m.\n\nChọn kênh liên lạc.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Take the stairs or the elevator?\nA. The elevator.\nB. Yes, take it.\nC. On the left.\n\nChọn phương án.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Is your office on the first or second floor?\nA. Second floor.\nB. Yes, it is.\nC. In Building A.\n\nChọn tầng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Would you like the window seat or the aisle seat?\nA. Aisle seat.\nB. Yes, please.\nC. At Row 12.\n\nChọn chỗ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Should I email you or call you?\nA. Please email me.\nB. Yes, please.\nC. In the afternoon.\n\nChọn phương thức.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Is the meeting at 10 or 10:30?\nA. At 10:30.\nB. Yes, it is.\nC. In the big room.\n\nChọn giờ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Do you want standard or express shipping?\nA. Express, please.\nB. Yes, I do.\nC. To my office.\n\nChọn loại giao hàng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Should we sit inside or outside?\nA. Outside is fine.\nB. Yes, sure.\nC. Near the door.\n\nChọn vị trí ngồi.',
    },
  ];

  // Lesson 4 — Keyword mapping
  final p2Lv300L4 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: When does the store close?\nA. At 9 p.m.\nB. At the mall.\nC. The manager.\n\nKeyword “close” → giờ đóng cửa.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Where can I catch a taxi?\nA. At the main entrance.\nB. At 8 a.m.\nC. For two people.\n\n“Where” → nơi bắt taxi.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: How much is the ticket?\nA. Ten dollars.\nB. At the counter.\nC. Next Wednesday.\n\n“How much” → giá.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Who should I contact about repairs?\nA. The maintenance team.\nB. At the lobby.\nC. Next month.\n\n“Who” → đúng đối tượng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: When is the next train?\nA. In ten minutes.\nB. On Track 2.\nC. A monthly pass.\n\nThời điểm chuyến kế.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Where is the nearest ATM?\nA. Beside the bookstore.\nB. After 6 p.m.\nC. The bank card.\n\nĐịa điểm gần nhất.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: How long is the tour?\nA. About two hours.\nB. At the museum.\nC. The guide.\n\nĐộ dài thời gian.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Why is the office closed?\nA. Due to maintenance.\nB. On the second floor.\nC. The manager.\n\nLý do đóng cửa.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: What time does the café open?\nA. At 7 a.m.\nB. Near the station.\nC. The owner.\n\nGiờ mở cửa.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Where do I pick up my badge?\nA. At the security desk.\nB. At 3 p.m.\nC. Mr. Harris.\n\nVị trí lấy thẻ.',
    },
  ];

  // Lesson 5 — Mixed practice
  final p2Lv300L5 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Do you mind if I open the window?\nA. Not at all. Go ahead.\nB. At the back.\nC. Tomorrow morning.\n\nYes/No lịch sự → chấp thuận.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Where should we meet?\nA. In the lobby.\nB. At noon.\nC. Mr. Kim.\n\nWh-question về địa điểm.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Coffee or tea?\nA. Tea, please.\nB. Yes, please.\nC. In the kitchen.\n\nChoice A/B.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: When can you send the invoice?\nA. By this afternoon.\nB. To the office.\nC. The accountant.\n\nThời điểm gửi.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Is the room available now?\nA. No, it’s booked.\nB. On the left.\nC. At 2 p.m.\n\nYes/No + trạng thái.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: How far is the hotel from here?\nA. About 2 kilometers.\nB. On King Street.\nC. Mr. Stone.\n\nKhoảng cách.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Why did the order arrive late?\nA. There was heavy traffic.\nB. At 6 p.m.\nC. At Gate 5.\n\nLý do.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Should we take a taxi or a bus?\nA. Let’s take a bus.\nB. Yes, we should.\nC. At the stop.\n\nLựa chọn.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Can you join us for lunch?\nA. Sorry, I have a meeting.\nB. At the cafeteria.\nC. Around 1 p.m.\n\nYes/No với lý do.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Where can I get a map of the city?\nA. At the information desk.\nB. Ten dollars.\nC. Next week.\n\nĐịa điểm lấy map.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // Lesson 1 — Polite requests (Could you..., Would you mind...)
  final p2Lv600L1 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Could you forward this email to the team?\nA. Sure, I’ll do it now.\nB. In the inbox.\nC. At 5 p.m.\n\nĐồng ý lịch sự.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Would you mind closing the window?\nA. Not at all.\nB. By the door.\nC. Tomorrow morning.\n\n“Would you mind…?” → chấp thuận = Not at all.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Could you speak a little slower?\nA. Of course.\nB. In Room 3.\nC. Around noon.\n\nPhản hồi lịch sự phù hợp.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Would you mind if I use your charger?\nA. Go ahead.\nB. On your desk.\nC. After lunch.\n\nCho phép dùng đồ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Could you print two copies of this?\nA. I’ll print them now.\nB. Near the printer.\nC. By 3 p.m.\n\nĐồng ý + hành động.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Would you mind turning down the volume?\nA. Sorry, I’ll lower it.\nB. At the front.\nC. On channel five.\n\nXin lỗi + thực hiện.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Could you check the projector?\nA. I’ll take a look.\nB. In the cabinet.\nC. Next week.\n\nHứa kiểm tra.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Would you mind helping me move this table?\nA. No problem.\nB. Beside the wall.\nC. After the break.\n\nChấp thuận.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Could you sign here, please?\nA. Sure.\nB. On the counter.\nC. At 10 a.m.\n\nĐồng ý ngắn gọn.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Would you mind waiting a moment?\nA. I can wait.\nB. At the lobby.\nC. Mr. Tanaka.\n\nĐồng ý chờ.',
    },
  ];

  // Lesson 2 — Multiple-options (loại trừ hợp lý)
  final p2Lv600L2 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: How would you like to pay?\nA. By credit card.\nB. On Monday.\nC. In the meeting room.\n\nPhương thức thanh toán → chọn hợp lý.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Where should the boxes be delivered?\nA. To the back entrance.\nB. Thirty dollars.\nC. The supervisor.\n\nĐịa điểm giao.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: When can you start?\nA. Next week.\nB. At the office.\nC. Mr. Lee.\n\nThời điểm bắt đầu.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Which size do you need?\nA. Medium, please.\nB. At 2 p.m.\nC. In the corner.\n\nKích thước.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: How often do the buses run?\nA. Every fifteen minutes.\nB. At the station.\nC. A monthly pass.\n\nTần suất.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Where can I leave my suitcase?\nA. At the luggage room.\nB. Twenty kilos.\nC. Mr. Carter.\n\nNơi để hành lý.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: What’s the fee for late return?\nA. Five dollars per day.\nB. On the shelf.\nC. At 9 a.m.\n\nMức phí.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Which train goes to the airport?\nA. The express on Track 4.\nB. A round-trip ticket.\nC. At Gate B.\n\nTuyến phù hợp.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: How long is the guarantee?\nA. For one year.\nB. In the drawer.\nC. Mr. Davis.\n\nThời hạn bảo hành.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Where do I submit the application?\nA. To the HR office.\nB. Before Friday.\nC. A reference letter.\n\nNơi nộp hồ sơ.',
    },
  ];

  // Lesson 3 — False friends & distractors
  final p2Lv600L3 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Where can I find the rolls?\nA. In the bakery section.\nB. On a rolling chair.\nC. At the role desk.\n\nrolls (bánh mì) ≠ role/rolling.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Do you sell fare cards here?\nA. Yes, at the counter.\nB. It’s a fair price.\nC. Fire alarm is over there.\n\nfare (tiền vé) ≠ fair/fire.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Is the aisle seat available?\nA. Yes, Row 10.\nB. On the island.\nC. Eye check first.\n\naisle ≠ isle/eye.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Where can I buy stationery?\nA. At the bookstore.\nB. Near the station.\nC. By the statue.\n\nstationery (văn phòng phẩm) ≠ station/statue.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Do you have a spare battery?\nA. Yes, in the drawer.\nB. We sell pears.\nC. For the bear toy.\n\nspare ≠ pear/bear.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: What’s the current rate?\nA. Three percent.\nB. The current is strong.\nC. On the radio.\n\nrate (tỷ lệ) ≠ current (dòng nước).',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Is parking permitted here?\nA. No, it’s prohibited.\nB. We’re barking here.\nC. The park is closed.\n\nparking ≠ barking/park.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Do you accept coupons?\nA. Only valid ones.\nB. We have a couple.\nC. Copper wires only.\n\ncoupon ≠ couple/copper.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Where can I get change?\nA. At the cashier.\nB. A chance later.\nC. At the charger.\n\nchange ≠ chance/charger.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Is this model available in gray?\nA. Yes, in stock.\nB. It’s great.\nC. It’s a grate.\n\ngray ≠ great/grate.',
    },
  ];

  // Lesson 4 — Shadowing (speed & fluency)
  final p2Lv600L4 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Could you repeat that, please?\nA. Sure, let me say it again.\nB. At the back.\nC. Around five.\n\nPhản xạ yêu cầu lặp lại.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: What did you say the price was?\nA. It’s thirty-five.\nB. On the shelf.\nC. The buyer.\n\nBắt keyword “price”.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Where did you park the car?\nA. On Pine Street.\nB. At five.\nC. With Mr. Park.\n\nKeyword “Where”.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: When will you get back to me?\nA. By tomorrow morning.\nB. In the inbox.\nC. Ms. Beck.\n\nCam kết thời gian phản hồi.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: How soon can you deliver it?\nA. Within two days.\nB. To the lobby.\nC. The driver.\n\nTốc độ giao.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: What’s the best way to reach you?\nA. Email works best.\nB. At 10 a.m.\nC. In Meeting A.\n\nKênh liên lạc.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Where should I return the form?\nA. To HR downstairs.\nB. Before noon.\nC. My phone number.\n\nNơi nộp form.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Why are we moving the date?\nA. Due to a conflict.\nB. At the venue.\nC. On Friday.\n\nLý do thay đổi.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: How many copies do we need?\nA. Twenty should do.\nB. In the office.\nC. Mr. Copy.\n\nSố lượng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: When is the earliest appointment?\nA. This afternoon at 3.\nB. In Room 2.\nC. The receptionist.\n\nSlot sớm nhất.',
    },
  ];

  // Lesson 5 — Mixed medium
  final p2Lv600L5 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Do you need assistance with your luggage?\nA. No, I can handle it.\nB. At Carousel 2.\nC. Thirty kilos.\n\nYes/No lịch sự.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Where can I exchange currency?\nA. At the bank counter.\nB. By tomorrow.\nC. Mr. Currency.\n\nĐịa điểm đổi tiền.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Coffee or tea?\nA. Coffee, thanks.\nB. Yes, please.\nC. In the kitchen.\n\nChoice A/B.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: How late are you open?\nA. Until 10 p.m.\nB. Next to the café.\nC. The owner.\n\nGiờ đóng cửa.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Could you hold the line, please?\nA. Sure, I’ll wait.\nB. On Line 2.\nC. In five minutes.\n\nPhản hồi đúng ngữ cảnh điện thoại.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Which platform is the express train?\nA. Platform 6.\nB. A one-way ticket.\nC. At 11 a.m.\n\nChọn sân ga.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Why is the store closing early?\nA. For inventory.\nB. At the corner.\nC. The manager.\n\nLý do.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: When is a good time to call you?\nA. After 4 p.m.\nB. At the office.\nC. Mr. Goodtime.\n\nThời điểm gọi.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Do you prefer morning or afternoon sessions?\nA. Morning, please.\nB. Yes, I do.\nC. In Room 5.\n\nPreference.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: How much is the late fee?\nA. Five dollars.\nB. At the counter.\nC. Next week.\n\nChi phí.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // Lesson 1 — Indirect questions & semantic traps
  final p2Lv800L1 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Do you know when the meeting starts?\nA. At 9 sharp.\nB. Yes, I know.\nC. The manager.\n\nCâu gián tiếp → đáp án là thời gian, không phải “Yes/No”.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Could you tell me where the lab is?\nA. On the third floor.\nB. Yes, I could.\nC. Tomorrow morning.\n\nTrả lời địa điểm cụ thể.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Do you happen to know who’s in charge?\nA. Ms. Carter is.\nB. Yes, I happen to.\nC. In Room C.\n\nTrả lời tên người.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Any idea why the order was canceled?\nA. Because of a payment issue.\nB. Yes, I have.\nC. At 5 p.m.\n\nLý do cụ thể.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Could you find out how long it will take?\nA. Around two hours.\nB. Sure I could.\nC. At the site.\n\nThời lượng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Do you know where I can park?\nA. In the underground lot.\nB. Yes, I do.\nC. The security guard.\n\nVị trí đỗ xe.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Would you tell me what the fee includes?\nA. Breakfast and Wi-Fi.\nB. Yes, I would.\nC. On the brochure.\n\nNội dung gói.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Do you know whether the store is open?\nA. It closes at 8.\nB. Yes, I know.\nC. On Friday.\n\nThông tin trạng thái mở/đóng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Could you let me know when the bus arrives?\nA. In ten minutes.\nB. Yes, I could.\nC. At Bay 3.\n\nThời điểm đến.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Do you know if Mr. Lee approved it?\nA. He approved it yesterday.\nB. Yes, I know it.\nC. At the office.\n\nNội dung phê duyệt cụ thể.',
    },
  ];

  // Lesson 2 — Inference/Implication
  final p2Lv800L2 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Is the report finished?\nA. It should be ready by tomorrow.\nB. Yes, finished.\nC. On your desk.\n\nHàm ý: chưa xong, sẽ xong vào ngày mai.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Can you attend the meeting?\nA. I’ll be out of town.\nB. Yes, I can.\nC. In Meeting Room A.\n\nHàm ý: không tham dự được.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Do you have time to help?\nA. I’m swamped this morning.\nB. Yes, I have time.\nC. In a minute.\n\nHàm ý từ chối.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Is the restaurant good?\nA. There’s always a long line.\nB. Yes, it is.\nC. It’s nearby.\n\nHàm ý: đồ ăn ngon → đông.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Will you finish the task today?\nA. I’m about halfway.\nB. Yes, I will.\nC. At my desk.\n\nHàm ý: có thể không kịp hôm nay.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Is parking easy there?\nA. It’s tough at this hour.\nB. Yes, easy.\nC. On 2nd Street.\n\nHàm ý: khó đỗ.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Can I borrow your car?\nA. I need it this afternoon.\nB. Yes, you can.\nC. In the garage.\n\nHàm ý: từ chối lịch sự.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Is the boss available?\nA. He just stepped out.\nB. Yes, available.\nC. At 3 p.m.\n\nHàm ý: hiện không rảnh.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Do you like the new policy?\nA. It’ll take some getting used to.\nB. Yes, I do.\nC. On Monday.\n\nHàm ý: không quá thích.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Is the device working?\nA. It keeps restarting.\nB. Yes, it is.\nC. On the bench.\n\nHàm ý: đang lỗi.',
    },
  ];

  // Lesson 3 — Numbers & details
  final p2Lv800L3 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: What’s the total cost?\nA. Fifty dollars.\nB. Fifteen seats.\nC. Fifteenth floor.\n\n50 vs 15/15th.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: When is the appointment?\nA. On March 30.\nB. At room thirty.\nC. Thirty items.\n\nNgày tháng.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: How long is the presentation?\nA. Thirty minutes.\nB. Thirteen minutes.\nC. Thirty-third row.\n\n30 vs 13 (bẫy phát âm).',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: What time does it start?\nA. At 6:50.\nB. At 6:15.\nC. On platform six.\n\n6:50 vs 6:15.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: How much is the discount?\nA. Fifteen percent.\nB. Fifty items.\nC. Fifty-five seats.\n\n15% ≠ 50.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: What’s the room number?\nA. Three-oh-seven.\nB. Thirty-seven.\nC. Thirteen.\n\n307 vs 37/13.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: When does the sale end?\nA. On the 13th.\nB. At 30.\nC. Row fifteen.\n\nNgày 13.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: How many participants are there?\nA. About thirty.\nB. About thirteen.\nC. About third.\n\n30 vs 13.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: What’s the budget?\nA. Fifty thousand.\nB. Fifteen thousand.\nC. Fifty-five.\n\n50k vs 15k.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: When is delivery expected?\nA. By the 15th.\nB. At 50.\nC. Row fifteen.\n\nNgày 15.',
    },
  ];

  // Lesson 4 — Double distractors
  final p2Lv800L4 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Can you send the signed contract?\nA. I’ve attached it to the email.\nB. I saw the sign.\nC. There’s a concert.\n\n“signed contract” vs sign/concert (đồng âm/nhiễu).',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Where should I store the files?\nA. In the shared folder.\nB. On the shoulder.\nC. At the show.\n\nfolder ≠ shoulder/show.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: Did you book the venue?\nA. Yes, it’s reserved.\nB. Yes, I read the menu.\nC. Yes, the avenue is busy.\n\nvenue ≠ menu/avenue.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Who will oversee the project?\nA. Ms. Cho will.\nB. Over the sea.\nC. Projector room.\n\noversee ≠ over the sea/projector.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Is the shipment insured?\nA. Yes, fully covered.\nB. Yes, the shirt mentored.\nC. Yes, the ship meant.\n\ninsured ≠ shirt/ship meant.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Where can I access the draft?\nA. On the shared drive.\nB. At the shaft.\nC. In the drought.\n\ndrive ≠ shaft/drought.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Will you finalize the layout today?\nA. I’ll finish it by 6.\nB. There’s a loud out.\nC. We found a lay out.\n\nfinalize layout ≠ loud out/lay out (nhiễu).',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Can we postpone the briefing?\nA. Let’s move it to Friday.\nB. Let’s post a post.\nC. Let’s pose tone.\n\npostpone ≠ post/pose tone.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: Is the format acceptable?\nA. Yes, that works.\nB. Yes, farm mat.\nC. Yes, form at.\n\nformat ≠ farm mat/segmentation.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Where should I file the receipt?\nA. Under Expenses 2025.\nB. In the recipe book.\nC. By the receptionist.\n\nreceipt ≠ recipe/receptionist.',
    },
  ];

  // Lesson 5 — Mini Test (tổng hợp)
  final p2Lv800L5 = <Map<String, dynamic>>[
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 1: Could you let me know where to check in?\nA. At counter B.\nB. Yes, I could.\nC. At 7 p.m.\n\nIndirect + Where.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 2: Is the conference room free now?\nA. It’s booked until two.\nB. Yes, free.\nC. In Building C.\n\nInference: không rảnh.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 3: When is the earliest delivery?\nA. On the 13th.\nB. On the third.\nC. Thirteen seats.\n\nNumbers trap.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 4: Would you mind sending the slides?\nA. I’ll email them right away.\nB. In the slideshow.\nC. At the side.\n\nPolite request.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 5: Coffee or tea?\nA. Tea, thanks.\nB. Yes, please.\nC. In the café.\n\nChoice A/B.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 6: Why is the shipment late?\nA. Customs inspection.\nB. At Gate 4.\nC. By Friday.\n\nKeyword “Why”.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 7: Can you join us?\nA. I’m tied up today.\nB. Yes, I can.\nC. In Room D.\n\nInference: từ chối.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 8: Where do I pick up the badge?\nA. Security office.\nB. Mr. Badge.\nC. Before lunch.\n\nKeyword “Where”.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 9: How much does the tour cost?\nA. Thirty dollars.\nB. Thirty minutes.\nC. Room thirty.\n\nCost vs time/room.',
    },
    {
      'question': '',
      'options': ['A', 'B', 'C'],
      'correctIndex': 0,
      'explain': '“ Question 10: Do you know if the elevator is fixed?\nA. It’s still out of order.\nB. Yes, I know.\nC. On the left.\n\nIndirect + status (not fixed).',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  /// ===== LRMaterials ========
  // lv300
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Wh-questions cơ bản — Time/Place/People',
    questions: p2Lv300L1,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Yes/No questions — Basic confirmations',
    questions: p2Lv300L2,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Lựa chọn (A or B) — This or that',
    questions: p2Lv300L3,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Keyword mapping — Spot the cue',
    questions: p2Lv300L4,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập hỗn hợp — Mixed practice',
    questions: p2Lv300L5,
  );

  // lv600
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Câu hỏi gián tiếp & lịch sự — Polite requests',
    questions: p2Lv600L1,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Câu hỏi lựa chọn phức tạp — Multiple-options',
    questions: p2Lv600L2,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Bẫy từ vựng — False friends & distractors',
    questions: p2Lv600L3,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Shadowing phản xạ — Speed & fluency',
    questions: p2Lv600L4,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập nâng cao — Mixed medium',
    questions: p2Lv600L5,
  );

  // lv800
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Câu hỏi gián tiếp & bẫy ngữ nghĩa',
    questions: p2Lv800L1,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Câu hỏi suy luận & hàm ý (Inference/Implication)',
    questions: p2Lv800L2,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nghe chi tiết & con số',
    questions: p2Lv800L3,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Câu hỏi bẫy nhiều tầng (Double distractors)',
    questions: p2Lv800L4,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp – Mini Test nâng cao',
    questions: p2Lv800L5,
  );

  /// ===== FullMaterials ========
  // lv300
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Wh-questions cơ bản — Time/Place/People',
    questions: p2Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Yes/No questions — Basic confirmations',
    questions: p2Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Lựa chọn (A or B) — This or that',
    questions: p2Lv300L3,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Keyword mapping — Spot the cue',
    questions: p2Lv300L4,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập hỗn hợp — Mixed practice',
    questions: p2Lv300L5,
  );

  // lv600
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Câu hỏi gián tiếp & lịch sự — Polite requests',
    questions: p2Lv600L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Câu hỏi lựa chọn phức tạp — Multiple-options',
    questions: p2Lv600L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Bẫy từ vựng — False friends & distractors',
    questions: p2Lv600L3,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Shadowing phản xạ — Speed & fluency',
    questions: p2Lv600L4,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập nâng cao — Mixed medium',
    questions: p2Lv600L5,
  );

  // lv800
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Câu hỏi gián tiếp & bẫy ngữ nghĩa',
    questions: p2Lv800L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Câu hỏi suy luận & hàm ý (Inference/Implication)',
    questions: p2Lv800L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nghe chi tiết & con số',
    questions: p2Lv800L3,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Câu hỏi bẫy nhiều tầng (Double distractors)',
    questions: p2Lv800L4,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp – Mini Test nâng cao',
    questions: p2Lv800L5,
  );
}
