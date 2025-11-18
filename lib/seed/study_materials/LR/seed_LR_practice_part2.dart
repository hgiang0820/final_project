// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart2() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';
  const audioDemo = 'input_tests/testLR/part2/01%20Test%201_LC_Voca.mp3';

  // Root doc
  await db.collection('study_materials').doc(materialId).set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  // Helper to push 1 lesson
  Future<void> pushLesson({
    required String levelId,
    required String lessonId, // lesson1..lesson5
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc(materialId)
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

  // =========================
  // ===== LEVEL 300+ ========
  // =========================

  // Lesson 1 — Wh-questions (Who/When/Where/What/Why/How)
  final p2Lv300L1 = <Map<String, dynamic>>[
    {
      'question': 'Where is the conference being held?',
      'options': ['At the main hall.', 'On Friday.', 'The manager.'],
      'correctIndex': 0,
      'explain': '“Where” → địa điểm.',
    },
    {
      'question': 'When does the workshop start?',
      'options': ['At 9 a.m.', 'In room A-2.', 'With Mr. Park.'],
      'correctIndex': 0,
      'explain': '“When” → thời gian.',
    },
    {
      'question': 'Who will lead the meeting?',
      'options': ['The sales director.', 'At the cafeteria.', 'At noon.'],
      'correctIndex': 0,
      'explain': '“Who” → người.',
    },
    {
      'question': 'Why was the flight delayed?',
      'options': ['Because of bad weather.', 'At Gate 12.', 'Tomorrow morning.'],
      'correctIndex': 0,
      'explain': '“Why” → lý do.',
    },
    {
      'question': 'How did you get to work today?',
      'options': ['By subway.', 'At 8 o’clock.', 'On the third floor.'],
      'correctIndex': 0,
      'explain': '“How” → cách thức/phương tiện.',
    },
    {
      'question': 'What time is the interview?',
      'options': ['At 3 p.m.', 'In the lobby.', 'The HR manager.'],
      'correctIndex': 0,
      'explain': '“What time” → giờ.',
    },
    {
      'question': 'Which department handles refunds?',
      'options': ['Customer service.', 'Next Monday.', 'At the east exit.'],
      'correctIndex': 0,
      'explain': '“Which” → chọn phòng ban.',
    },
    {
      'question': 'Where should I drop off the package?',
      'options': ['At the reception desk.', 'By 5 p.m.', 'Mr. Lee.'],
      'correctIndex': 0,
      'explain': '“Where” → vị trí.',
    },
    {
      'question': 'When is the deadline for the report?',
      'options': ['This Thursday.', 'At HQ.', 'Mr. Gomez.'],
      'correctIndex': 0,
      'explain': '“When” → hạn.',
    },
    {
      'question': 'Who is responsible for marketing?',
      'options': ['Olivia from Sales.', 'On the first floor.', 'At 10 a.m.'],
      'correctIndex': 0,
      'explain': '“Who” → người phụ trách.',
    },
  ];

  // Lesson 2 — Yes/No questions
  final p2Lv300L2 = <Map<String, dynamic>>[
    {
      'question': 'Do you need any help with the boxes?',
      'options': ['Yes, please. They’re heavy.', 'In the storage room.', 'Tomorrow.'],
      'correctIndex': 0,
      'explain': 'Yes/No → câu trả lời ngắn + chi tiết.',
    },
    {
      'question': 'Is this seat taken?',
      'options': ['No, go ahead.', 'By the window.', 'For the CEO.'],
      'correctIndex': 0,
      'explain': 'Phủ định lịch sự.',
    },
    {
      'question': 'Are you attending the seminar?',
      'options': ['Yes, I registered.', 'In Room B.', 'At 2 p.m.'],
      'correctIndex': 0,
      'explain': 'Khẳng định + thông tin phụ.',
    },
    {
      'question': 'Did you finish the budget?',
      'options': ['Not yet, almost done.', 'By Friday.', 'In Accounting.'],
      'correctIndex': 0,
      'explain': 'No + progress.',
    },
    {
      'question': 'Can I pay by card?',
      'options': ['Sure, we accept it.', 'At the counter.', 'A receipt.'],
      'correctIndex': 0,
      'explain': 'Yes + xác nhận.',
    },
    {
      'question': 'Have you seen Mr. Brown?',
      'options': ['Yes, he’s in a meeting.', 'At the front desk.', 'At 11 o’clock.'],
      'correctIndex': 0,
      'explain': 'Yes + nơi hiện tại.',
    },
    {
      'question': 'Is the printer working now?',
      'options': ['No, it’s still jammed.', 'Next to the copier.', 'A technician.'],
      'correctIndex': 0,
      'explain': 'No + tình trạng.',
    },
    {
      'question': 'Will the store open early?',
      'options': ['Yes, at 8 a.m.', 'On Main Street.', 'The manager.'],
      'correctIndex': 0,
      'explain': 'Yes + giờ.',
    },
    {
      'question': 'Could you send me the file?',
      'options': ['Sure, I’ll email it.', 'On your desk.', 'After lunch.'],
      'correctIndex': 0,
      'explain': 'Đồng ý + hành động.',
    },
    {
      'question': 'Are there any seats left?',
      'options': ['No, it’s full.', 'In Row C.', 'At 7 p.m.'],
      'correctIndex': 0,
      'explain': 'No + trạng thái hết chỗ.',
    },
  ];

  // Lesson 3 — Choice (A or B)
  final p2Lv300L3 = <Map<String, dynamic>>[
    {
      'question': 'Would you like coffee or tea?',
      'options': ['Coffee, please.', 'Yes, I would.', 'At the café.'],
      'correctIndex': 0,
      'explain': 'Chọn A/B.',
    },
    {
      'question': 'Should we meet on Monday or Tuesday?',
      'options': ['Tuesday works.', 'Yes, we should.', 'In the morning.'],
      'correctIndex': 0,
      'explain': 'Chọn ngày.',
    },
    {
      'question': 'Do you prefer email or phone?',
      'options': ['Email is better.', 'Yes, I do.', 'At 9 a.m.'],
      'correctIndex': 0,
      'explain': 'Chọn kênh liên lạc.',
    },
    {
      'question': 'Take the stairs or the elevator?',
      'options': ['The elevator.', 'Yes, take it.', 'On the left.'],
      'correctIndex': 0,
      'explain': 'Chọn phương án.',
    },
    {
      'question': 'Is your office on the first or second floor?',
      'options': ['Second floor.', 'Yes, it is.', 'In Building A.'],
      'correctIndex': 0,
      'explain': 'Chọn tầng.',
    },
    {
      'question': 'Would you like the window seat or the aisle seat?',
      'options': ['Aisle seat.', 'Yes, please.', 'At Row 12.'],
      'correctIndex': 0,
      'explain': 'Chọn chỗ.',
    },
    {
      'question': 'Should I email you or call you?',
      'options': ['Please email me.', 'Yes, please.', 'In the afternoon.'],
      'correctIndex': 0,
      'explain': 'Chọn phương thức.',
    },
    {
      'question': 'Is the meeting at 10 or 10:30?',
      'options': ['At 10:30.', 'Yes, it is.', 'In the big room.'],
      'correctIndex': 0,
      'explain': 'Chọn giờ.',
    },
    {
      'question': 'Do you want standard or express shipping?',
      'options': ['Express, please.', 'Yes, I do.', 'To my office.'],
      'correctIndex': 0,
      'explain': 'Chọn loại giao hàng.',
    },
    {
      'question': 'Should we sit inside or outside?',
      'options': ['Outside is fine.', 'Yes, sure.', 'Near the door.'],
      'correctIndex': 0,
      'explain': 'Chọn vị trí ngồi.',
    },
  ];

  // Lesson 4 — Keyword mapping
  final p2Lv300L4 = <Map<String, dynamic>>[
    {
      'question': 'When does the store close?',
      'options': ['At 9 p.m.', 'At the mall.', 'The manager.'],
      'correctIndex': 0,
      'explain': 'Keyword “close” → giờ đóng cửa.',
    },
    {
      'question': 'Where can I catch a taxi?',
      'options': ['At the main entrance.', 'At 8 a.m.', 'For two people.'],
      'correctIndex': 0,
      'explain': '“Where” → nơi bắt taxi.',
    },
    {
      'question': 'How much is the ticket?',
      'options': ['Ten dollars.', 'At the counter.', 'Next Wednesday.'],
      'correctIndex': 0,
      'explain': '“How much” → giá.',
    },
    {
      'question': 'Who should I contact about repairs?',
      'options': ['The maintenance team.', 'At the lobby.', 'Next month.'],
      'correctIndex': 0,
      'explain': '“Who” → đúng đối tượng.',
    },
    {
      'question': 'When is the next train?',
      'options': ['In ten minutes.', 'On Track 2.', 'A monthly pass.'],
      'correctIndex': 0,
      'explain': 'Thời điểm chuyến kế.',
    },
    {
      'question': 'Where is the nearest ATM?',
      'options': ['Beside the bookstore.', 'After 6 p.m.', 'The bank card.'],
      'correctIndex': 0,
      'explain': 'Địa điểm gần nhất.',
    },
    {
      'question': 'How long is the tour?',
      'options': ['About two hours.', 'At the museum.', 'The guide.'],
      'correctIndex': 0,
      'explain': 'Độ dài thời gian.',
    },
    {
      'question': 'Why is the office closed?',
      'options': ['Due to maintenance.', 'On the second floor.', 'The manager.'],
      'correctIndex': 0,
      'explain': 'Lý do đóng cửa.',
    },
    {
      'question': 'What time does the café open?',
      'options': ['At 7 a.m.', 'Near the station.', 'The owner.'],
      'correctIndex': 0,
      'explain': 'Giờ mở cửa.',
    },
    {
      'question': 'Where do I pick up my badge?',
      'options': ['At the security desk.', 'At 3 p.m.', 'Mr. Harris.'],
      'correctIndex': 0,
      'explain': 'Vị trí lấy thẻ.',
    },
  ];

  // Lesson 5 — Mixed practice
  final p2Lv300L5 = <Map<String, dynamic>>[
    {
      'question': 'Do you mind if I open the window?',
      'options': ['Not at all. Go ahead.', 'At the back.', 'Tomorrow morning.'],
      'correctIndex': 0,
      'explain': 'Yes/No lịch sự → chấp thuận.',
    },
    {
      'question': 'Where should we meet?',
      'options': ['In the lobby.', 'At noon.', 'Mr. Kim.'],
      'correctIndex': 0,
      'explain': 'Wh-question về địa điểm.',
    },
    {
      'question': 'Coffee or tea?',
      'options': ['Tea, please.', 'Yes, please.', 'In the kitchen.'],
      'correctIndex': 0,
      'explain': 'Choice A/B.',
    },
    {
      'question': 'When can you send the invoice?',
      'options': ['By this afternoon.', 'To the office.', 'The accountant.'],
      'correctIndex': 0,
      'explain': 'Thời điểm gửi.',
    },
    {
      'question': 'Is the room available now?',
      'options': ['No, it’s booked.', 'On the left.', 'At 2 p.m.'],
      'correctIndex': 0,
      'explain': 'Yes/No + trạng thái.',
    },
    {
      'question': 'How far is the hotel from here?',
      'options': ['About 2 kilometers.', 'On King Street.', 'Mr. Stone.'],
      'correctIndex': 0,
      'explain': 'Khoảng cách.',
    },
    {
      'question': 'Why did the order arrive late?',
      'options': ['There was heavy traffic.', 'At 6 p.m.', 'At Gate 5.'],
      'correctIndex': 0,
      'explain': 'Lý do.',
    },
    {
      'question': 'Should we take a taxi or a bus?',
      'options': ['Let’s take a bus.', 'Yes, we should.', 'At the stop.'],
      'correctIndex': 0,
      'explain': 'Lựa chọn.',
    },
    {
      'question': 'Can you join us for lunch?',
      'options': ['Sorry, I have a meeting.', 'At the cafeteria.', 'Around 1 p.m.'],
      'correctIndex': 0,
      'explain': 'Yes/No với lý do.',
    },
    {
      'question': 'Where can I get a map of the city?',
      'options': ['At the information desk.', 'Ten dollars.', 'Next week.'],
      'correctIndex': 0,
      'explain': 'Địa điểm lấy map.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // Lesson 1 — Polite requests (Could you..., Would you mind...)
  final p2Lv600L1 = <Map<String, dynamic>>[
    {
      'question': 'Could you forward this email to the team?',
      'options': ['Sure, I’ll do it now.', 'In the inbox.', 'At 5 p.m.'],
      'correctIndex': 0,
      'explain': 'Đồng ý lịch sự.',
    },
    {
      'question': 'Would you mind closing the window?',
      'options': ['Not at all.', 'By the door.', 'Tomorrow morning.'],
      'correctIndex': 0,
      'explain': '“Would you mind…?” → chấp thuận = Not at all.',
    },
    {
      'question': 'Could you speak a little slower?',
      'options': ['Of course.', 'In Room 3.', 'Around noon.'],
      'correctIndex': 0,
      'explain': 'Phản hồi lịch sự phù hợp.',
    },
    {
      'question': 'Would you mind if I use your charger?',
      'options': ['Go ahead.', 'On your desk.', 'After lunch.'],
      'correctIndex': 0,
      'explain': 'Cho phép dùng đồ.',
    },
    {
      'question': 'Could you print two copies of this?',
      'options': ['I’ll print them now.', 'Near the printer.', 'By 3 p.m.'],
      'correctIndex': 0,
      'explain': 'Đồng ý + hành động.',
    },
    {
      'question': 'Would you mind turning down the volume?',
      'options': ['Sorry, I’ll lower it.', 'At the front.', 'On channel five.'],
      'correctIndex': 0,
      'explain': 'Xin lỗi + thực hiện.',
    },
    {
      'question': 'Could you check the projector?',
      'options': ['I’ll take a look.', 'In the cabinet.', 'Next week.'],
      'correctIndex': 0,
      'explain': 'Hứa kiểm tra.',
    },
    {
      'question': 'Would you mind helping me move this table?',
      'options': ['No problem.', 'Beside the wall.', 'After the break.'],
      'correctIndex': 0,
      'explain': 'Chấp thuận.',
    },
    {
      'question': 'Could you sign here, please?',
      'options': ['Sure.', 'On the counter.', 'At 10 a.m.'],
      'correctIndex': 0,
      'explain': 'Đồng ý ngắn gọn.',
    },
    {
      'question': 'Would you mind waiting a moment?',
      'options': ['I can wait.', 'At the lobby.', 'Mr. Tanaka.'],
      'correctIndex': 0,
      'explain': 'Đồng ý chờ.',
    },
  ];

  // Lesson 2 — Multiple-options (loại trừ hợp lý)
  final p2Lv600L2 = <Map<String, dynamic>>[
    {
      'question': 'How would you like to pay?',
      'options': ['By credit card.', 'On Monday.', 'In the meeting room.'],
      'correctIndex': 0,
      'explain': 'Phương thức thanh toán → chọn hợp lý.',
    },
    {
      'question': 'Where should the boxes be delivered?',
      'options': ['To the back entrance.', 'Thirty dollars.', 'The supervisor.'],
      'correctIndex': 0,
      'explain': 'Địa điểm giao.',
    },
    {
      'question': 'When can you start?',
      'options': ['Next week.', 'At the office.', 'Mr. Lee.'],
      'correctIndex': 0,
      'explain': 'Thời điểm bắt đầu.',
    },
    {
      'question': 'Which size do you need?',
      'options': ['Medium, please.', 'At 2 p.m.', 'In the corner.'],
      'correctIndex': 0,
      'explain': 'Kích thước.',
    },
    {
      'question': 'How often do the buses run?',
      'options': ['Every fifteen minutes.', 'At the station.', 'A monthly pass.'],
      'correctIndex': 0,
      'explain': 'Tần suất.',
    },
    {
      'question': 'Where can I leave my suitcase?',
      'options': ['At the luggage room.', 'Twenty kilos.', 'Mr. Carter.'],
      'correctIndex': 0,
      'explain': 'Nơi để hành lý.',
    },
    {
      'question': 'What’s the fee for late return?',
      'options': ['Five dollars per day.', 'On the shelf.', 'At 9 a.m.'],
      'correctIndex': 0,
      'explain': 'Mức phí.',
    },
    {
      'question': 'Which train goes to the airport?',
      'options': ['The express on Track 4.', 'A round-trip ticket.', 'At Gate B.'],
      'correctIndex': 0,
      'explain': 'Tuyến phù hợp.',
    },
    {
      'question': 'How long is the guarantee?',
      'options': ['For one year.', 'In the drawer.', 'Mr. Davis.'],
      'correctIndex': 0,
      'explain': 'Thời hạn bảo hành.',
    },
    {
      'question': 'Where do I submit the application?',
      'options': ['To the HR office.', 'Before Friday.', 'A reference letter.'],
      'correctIndex': 0,
      'explain': 'Nơi nộp hồ sơ.',
    },
  ];

  // Lesson 3 — False friends & distractors
  final p2Lv600L3 = <Map<String, dynamic>>[
    {
      'question': 'Where can I find the rolls?',
      'options': ['In the bakery section.', 'On a rolling chair.', 'At the role desk.'],
      'correctIndex': 0,
      'explain': 'rolls (bánh mì) ≠ role/rolling.',
    },
    {
      'question': 'Do you sell fare cards here?',
      'options': ['Yes, at the counter.', 'It’s a fair price.', 'Fire alarm is over there.'],
      'correctIndex': 0,
      'explain': 'fare (tiền vé) ≠ fair/fire.',
    },
    {
      'question': 'Is the aisle seat available?',
      'options': ['Yes, Row 10.', 'On the island.', 'Eye check first.'],
      'correctIndex': 0,
      'explain': 'aisle ≠ isle/eye.',
    },
    {
      'question': 'Where can I buy stationery?',
      'options': ['At the bookstore.', 'Near the station.', 'By the statue.'],
      'correctIndex': 0,
      'explain': 'stationery (văn phòng phẩm) ≠ station/statue.',
    },
    {
      'question': 'Do you have a spare battery?',
      'options': ['Yes, in the drawer.', 'We sell pears.', 'For the bear toy.'],
      'correctIndex': 0,
      'explain': 'spare ≠ pear/bear.',
    },
    {
      'question': 'What’s the current rate?',
      'options': ['Three percent.', 'The current is strong.', 'On the radio.'],
      'correctIndex': 0,
      'explain': 'rate (tỷ lệ) ≠ current (dòng nước).',
    },
    {
      'question': 'Is parking permitted here?',
      'options': ['No, it’s prohibited.', 'We’re barking here.', 'The park is closed.'],
      'correctIndex': 0,
      'explain': 'parking ≠ barking/park.',
    },
    {
      'question': 'Do you accept coupons?',
      'options': ['Only valid ones.', 'We have a couple.', 'Copper wires only.'],
      'correctIndex': 0,
      'explain': 'coupon ≠ couple/copper.',
    },
    {
      'question': 'Where can I get change?',
      'options': ['At the cashier.', 'A chance later.', 'At the charger.'],
      'correctIndex': 0,
      'explain': 'change ≠ chance/charger.',
    },
    {
      'question': 'Is this model available in gray?',
      'options': ['Yes, in stock.', 'It’s great.', 'It’s a grate.'],
      'correctIndex': 0,
      'explain': 'gray ≠ great/grate.',
    },
  ];

  // Lesson 4 — Shadowing (speed & fluency)
  final p2Lv600L4 = <Map<String, dynamic>>[
    {
      'question': 'Could you repeat that, please?',
      'options': ['Sure, let me say it again.', 'At the back.', 'Around five.'],
      'correctIndex': 0,
      'explain': 'Phản xạ yêu cầu lặp lại.',
    },
    {
      'question': 'What did you say the price was?',
      'options': ['It’s thirty-five.', 'On the shelf.', 'The buyer.'],
      'correctIndex': 0,
      'explain': 'Bắt keyword “price”.',
    },
    {
      'question': 'Where did you park the car?',
      'options': ['On Pine Street.', 'At five.', 'With Mr. Park.'],
      'correctIndex': 0,
      'explain': 'Keyword “Where”.',
    },
    {
      'question': 'When will you get back to me?',
      'options': ['By tomorrow morning.', 'In the inbox.', 'Ms. Beck.'],
      'correctIndex': 0,
      'explain': 'Cam kết thời gian phản hồi.',
    },
    {
      'question': 'How soon can you deliver it?',
      'options': ['Within two days.', 'To the lobby.', 'The driver.'],
      'correctIndex': 0,
      'explain': 'Tốc độ giao.',
    },
    {
      'question': 'What’s the best way to reach you?',
      'options': ['Email works best.', 'At 10 a.m.', 'In Meeting A.'],
      'correctIndex': 0,
      'explain': 'Kênh liên lạc.',
    },
    {
      'question': 'Where should I return the form?',
      'options': ['To HR downstairs.', 'Before noon.', 'My phone number.'],
      'correctIndex': 0,
      'explain': 'Nơi nộp form.',
    },
    {
      'question': 'Why are we moving the date?',
      'options': ['Due to a conflict.', 'At the venue.', 'On Friday.'],
      'correctIndex': 0,
      'explain': 'Lý do thay đổi.',
    },
    {
      'question': 'How many copies do we need?',
      'options': ['Twenty should do.', 'In the office.', 'Mr. Copy.'],
      'correctIndex': 0,
      'explain': 'Số lượng.',
    },
    {
      'question': 'When is the earliest appointment?',
      'options': ['This afternoon at 3.', 'In Room 2.', 'The receptionist.'],
      'correctIndex': 0,
      'explain': 'Slot sớm nhất.',
    },
  ];

  // Lesson 5 — Mixed medium
  final p2Lv600L5 = <Map<String, dynamic>>[
    {
      'question': 'Do you need assistance with your luggage?',
      'options': ['No, I can handle it.', 'At Carousel 2.', 'Thirty kilos.'],
      'correctIndex': 0,
      'explain': 'Yes/No lịch sự.',
    },
    {
      'question': 'Where can I exchange currency?',
      'options': ['At the bank counter.', 'By tomorrow.', 'Mr. Currency.'],
      'correctIndex': 0,
      'explain': 'Địa điểm đổi tiền.',
    },
    {
      'question': 'Coffee or tea?',
      'options': ['Coffee, thanks.', 'Yes, please.', 'In the kitchen.'],
      'correctIndex': 0,
      'explain': 'Choice A/B.',
    },
    {
      'question': 'How late are you open?',
      'options': ['Until 10 p.m.', 'Next to the café.', 'The owner.'],
      'correctIndex': 0,
      'explain': 'Giờ đóng cửa.',
    },
    {
      'question': 'Could you hold the line, please?',
      'options': ['Sure, I’ll wait.', 'On Line 2.', 'In five minutes.'],
      'correctIndex': 0,
      'explain': 'Phản hồi đúng ngữ cảnh điện thoại.',
    },
    {
      'question': 'Which platform is the express train?',
      'options': ['Platform 6.', 'A one-way ticket.', 'At 11 a.m.'],
      'correctIndex': 0,
      'explain': 'Chọn sân ga.',
    },
    {
      'question': 'Why is the store closing early?',
      'options': ['For inventory.', 'At the corner.', 'The manager.'],
      'correctIndex': 0,
      'explain': 'Lý do.',
    },
    {
      'question': 'When is a good time to call you?',
      'options': ['After 4 p.m.', 'At the office.', 'Mr. Goodtime.'],
      'correctIndex': 0,
      'explain': 'Thời điểm gọi.',
    },
    {
      'question': 'Do you prefer morning or afternoon sessions?',
      'options': ['Morning, please.', 'Yes, I do.', 'In Room 5.'],
      'correctIndex': 0,
      'explain': 'Preference.',
    },
    {
      'question': 'How much is the late fee?',
      'options': ['Five dollars.', 'At the counter.', 'Next week.'],
      'correctIndex': 0,
      'explain': 'Chi phí.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // Lesson 1 — Indirect questions & semantic traps
  final p2Lv800L1 = <Map<String, dynamic>>[
    {
      'question': 'Do you know when the meeting starts?',
      'options': ['At 9 sharp.', 'Yes, I know.', 'The manager.'],
      'correctIndex': 0,
      'explain': 'Câu gián tiếp → đáp án là thời gian, không phải “Yes/No”.',
    },
    {
      'question': 'Could you tell me where the lab is?',
      'options': ['On the third floor.', 'Yes, I could.', 'Tomorrow morning.'],
      'correctIndex': 0,
      'explain': 'Trả lời địa điểm cụ thể.',
    },
    {
      'question': 'Do you happen to know who’s in charge?',
      'options': ['Ms. Carter is.', 'Yes, I happen to.', 'In Room C.'],
      'correctIndex': 0,
      'explain': 'Trả lời tên người.',
    },
    {
      'question': 'Any idea why the order was canceled?',
      'options': ['Because of a payment issue.', 'Yes, I have.', 'At 5 p.m.'],
      'correctIndex': 0,
      'explain': 'Lý do cụ thể.',
    },
    {
      'question': 'Could you find out how long it will take?',
      'options': ['Around two hours.', 'Sure I could.', 'At the site.'],
      'correctIndex': 0,
      'explain': 'Thời lượng.',
    },
    {
      'question': 'Do you know where I can park?',
      'options': ['In the underground lot.', 'Yes, I do.', 'The security guard.'],
      'correctIndex': 0,
      'explain': 'Vị trí đỗ xe.',
    },
    {
      'question': 'Would you tell me what the fee includes?',
      'options': ['Breakfast and Wi-Fi.', 'Yes, I would.', 'On the brochure.'],
      'correctIndex': 0,
      'explain': 'Nội dung gói.',
    },
    {
      'question': 'Do you know whether the store is open?',
      'options': ['It closes at 8.', 'Yes, I know.', 'On Friday.'],
      'correctIndex': 0,
      'explain': 'Thông tin trạng thái mở/đóng.',
    },
    {
      'question': 'Could you let me know when the bus arrives?',
      'options': ['In ten minutes.', 'Yes, I could.', 'At Bay 3.'],
      'correctIndex': 0,
      'explain': 'Thời điểm đến.',
    },
    {
      'question': 'Do you know if Mr. Lee approved it?',
      'options': ['He approved it yesterday.', 'Yes, I know it.', 'At the office.'],
      'correctIndex': 0,
      'explain': 'Nội dung phê duyệt cụ thể.',
    },
  ];

  // Lesson 2 — Inference/Implication
  final p2Lv800L2 = <Map<String, dynamic>>[
    {
      'question': 'Is the report finished?',
      'options': ['It should be ready by tomorrow.', 'Yes, finished.', 'On your desk.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: chưa xong, sẽ xong vào ngày mai.',
    },
    {
      'question': 'Can you attend the meeting?',
      'options': ['I’ll be out of town.', 'Yes, I can.', 'In Meeting Room A.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: không tham dự được.',
    },
    {
      'question': 'Do you have time to help?',
      'options': ['I’m swamped this morning.', 'Yes, I have time.', 'In a minute.'],
      'correctIndex': 0,
      'explain': 'Hàm ý từ chối.',
    },
    {
      'question': 'Is the restaurant good?',
      'options': ['There’s always a long line.', 'Yes, it is.', 'It’s nearby.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: đồ ăn ngon → đông.',
    },
    {
      'question': 'Will you finish the task today?',
      'options': ['I’m about halfway.', 'Yes, I will.', 'At my desk.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: có thể không kịp hôm nay.',
    },
    {
      'question': 'Is parking easy there?',
      'options': ['It’s tough at this hour.', 'Yes, easy.', 'On 2nd Street.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: khó đỗ.',
    },
    {
      'question': 'Can I borrow your car?',
      'options': ['I need it this afternoon.', 'Yes, you can.', 'In the garage.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: từ chối lịch sự.',
    },
    {
      'question': 'Is the boss available?',
      'options': ['He just stepped out.', 'Yes, available.', 'At 3 p.m.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: hiện không rảnh.',
    },
    {
      'question': 'Do you like the new policy?',
      'options': ['It’ll take some getting used to.', 'Yes, I do.', 'On Monday.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: không quá thích.',
    },
    {
      'question': 'Is the device working?',
      'options': ['It keeps restarting.', 'Yes, it is.', 'On the bench.'],
      'correctIndex': 0,
      'explain': 'Hàm ý: đang lỗi.',
    },
  ];

  // Lesson 3 — Numbers & details
  final p2Lv800L3 = <Map<String, dynamic>>[
    {
      'question': 'What’s the total cost?',
      'options': ['Fifty dollars.', 'Fifteen seats.', 'Fifteenth floor.'],
      'correctIndex': 0,
      'explain': '50 vs 15/15th.',
    },
    {
      'question': 'When is the appointment?',
      'options': ['On March 30.', 'At room thirty.', 'Thirty items.'],
      'correctIndex': 0,
      'explain': 'Ngày tháng.',
    },
    {
      'question': 'How long is the presentation?',
      'options': ['Thirty minutes.', 'Thirteen minutes.', 'Thirty-third row.'],
      'correctIndex': 0,
      'explain': '30 vs 13 (bẫy phát âm).',
    },
    {
      'question': 'What time does it start?',
      'options': ['At 6:50.', 'At 6:15.', 'On platform six.'],
      'correctIndex': 0,
      'explain': '6:50 vs 6:15.',
    },
    {
      'question': 'How much is the discount?',
      'options': ['Fifteen percent.', 'Fifty items.', 'Fifty-five seats.'],
      'correctIndex': 0,
      'explain': '15% ≠ 50.',
    },
    {
      'question': 'What’s the room number?',
      'options': ['Three-oh-seven.', 'Thirty-seven.', 'Thirteen.'],
      'correctIndex': 0,
      'explain': '307 vs 37/13.',
    },
    {
      'question': 'When does the sale end?',
      'options': ['On the 13th.', 'At 30.', 'Row fifteen.'],
      'correctIndex': 0,
      'explain': 'Ngày 13.',
    },
    {
      'question': 'How many participants are there?',
      'options': ['About thirty.', 'About thirteen.', 'About third.'],
      'correctIndex': 0,
      'explain': '30 vs 13.',
    },
    {
      'question': 'What’s the budget?',
      'options': ['Fifty thousand.', 'Fifteen thousand.', 'Fifty-five.'],
      'correctIndex': 0,
      'explain': '50k vs 15k.',
    },
    {
      'question': 'When is delivery expected?',
      'options': ['By the 15th.', 'At 50.', 'Row fifteen.'],
      'correctIndex': 0,
      'explain': 'Ngày 15.',
    },
  ];

  // Lesson 4 — Double distractors
  final p2Lv800L4 = <Map<String, dynamic>>[
    {
      'question': 'Can you send the signed contract?',
      'options': ['I’ve attached it to the email.', 'I saw the sign.', 'There’s a concert.'],
      'correctIndex': 0,
      'explain': '“signed contract” vs sign/concert (đồng âm/nhiễu).',
    },
    {
      'question': 'Where should I store the files?',
      'options': ['In the shared folder.', 'On the shoulder.', 'At the show.'],
      'correctIndex': 0,
      'explain': 'folder ≠ shoulder/show.',
    },
    {
      'question': 'Did you book the venue?',
      'options': ['Yes, it’s reserved.', 'Yes, I read the menu.', 'Yes, the avenue is busy.'],
      'correctIndex': 0,
      'explain': 'venue ≠ menu/avenue.',
    },
    {
      'question': 'Who will oversee the project?',
      'options': ['Ms. Cho will.', 'Over the sea.', 'Projector room.'],
      'correctIndex': 0,
      'explain': 'oversee ≠ over the sea/projector.',
    },
    {
      'question': 'Is the shipment insured?',
      'options': ['Yes, fully covered.', 'Yes, the shirt mentored.', 'Yes, the ship meant.'],
      'correctIndex': 0,
      'explain': 'insured ≠ shirt/ship meant.',
    },
    {
      'question': 'Where can I access the draft?',
      'options': ['On the shared drive.', 'At the shaft.', 'In the drought.'],
      'correctIndex': 0,
      'explain': 'drive ≠ shaft/drought.',
    },
    {
      'question': 'Will you finalize the layout today?',
      'options': ['I’ll finish it by 6.', 'There’s a loud out.', 'We found a lay out.'],
      'correctIndex': 0,
      'explain': 'finalize layout ≠ loud out/lay out (nhiễu).',
    },
    {
      'question': 'Can we postpone the briefing?',
      'options': ['Let’s move it to Friday.', 'Let’s post a post.', 'Let’s pose tone.'],
      'correctIndex': 0,
      'explain': 'postpone ≠ post/pose tone.',
    },
    {
      'question': 'Is the format acceptable?',
      'options': ['Yes, that works.', 'Yes, farm mat.', 'Yes, form at.'],
      'correctIndex': 0,
      'explain': 'format ≠ farm mat/segmentation.',
    },
    {
      'question': 'Where should I file the receipt?',
      'options': ['Under Expenses 2025.', 'In the recipe book.', 'By the receptionist.'],
      'correctIndex': 0,
      'explain': 'receipt ≠ recipe/receptionist.',
    },
  ];

  // Lesson 5 — Mini Test (tổng hợp)
  final p2Lv800L5 = <Map<String, dynamic>>[
    {
      'question': 'Could you let me know where to check in?',
      'options': ['At counter B.', 'Yes, I could.', 'At 7 p.m.'],
      'correctIndex': 0,
      'explain': 'Indirect + Where.',
    },
    {
      'question': 'Is the conference room free now?',
      'options': ['It’s booked until two.', 'Yes, free.', 'In Building C.'],
      'correctIndex': 0,
      'explain': 'Inference: không rảnh.',
    },
    {
      'question': 'When is the earliest delivery?',
      'options': ['On the 13th.', 'On the third.', 'Thirteen seats.'],
      'correctIndex': 0,
      'explain': 'Numbers trap.',
    },
    {
      'question': 'Would you mind sending the slides?',
      'options': ['I’ll email them right away.', 'In the slideshow.', 'At the side.'],
      'correctIndex': 0,
      'explain': 'Polite request.',
    },
    {
      'question': 'Coffee or tea?',
      'options': ['Tea, thanks.', 'Yes, please.', 'In the café.'],
      'correctIndex': 0,
      'explain': 'Choice A/B.',
    },
    {
      'question': 'Why is the shipment late?',
      'options': ['Customs inspection.', 'At Gate 4.', 'By Friday.'],
      'correctIndex': 0,
      'explain': 'Keyword “Why”.',
    },
    {
      'question': 'Can you join us?',
      'options': ['I’m tied up today.', 'Yes, I can.', 'In Room D.'],
      'correctIndex': 0,
      'explain': 'Inference: từ chối.',
    },
    {
      'question': 'Where do I pick up the badge?',
      'options': ['Security office.', 'Mr. Badge.', 'Before lunch.'],
      'correctIndex': 0,
      'explain': 'Keyword “Where”.',
    },
    {
      'question': 'How much does the tour cost?',
      'options': ['Thirty dollars.', 'Thirty minutes.', 'Room thirty.'],
      'correctIndex': 0,
      'explain': 'Cost vs time/room.',
    },
    {
      'question': 'Do you know if the elevator is fixed?',
      'options': ['It’s still out of order.', 'Yes, I know.', 'On the left.'],
      'correctIndex': 0,
      'explain': 'Indirect + status (not fixed).',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv300
  await pushLesson(levelId: 'lv300', lessonId: 'lesson1', lessonName: 'Bài 1: Wh-questions cơ bản — Time/Place/People', questions: p2Lv300L1);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson2', lessonName: 'Bài 2: Yes/No questions — Basic confirmations', questions: p2Lv300L2);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson3', lessonName: 'Bài 3: Lựa chọn (A or B) — This or that', questions: p2Lv300L3);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson4', lessonName: 'Bài 4: Keyword mapping — Spot the cue', questions: p2Lv300L4);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập hỗn hợp — Mixed practice', questions: p2Lv300L5);

  // lv600
  await pushLesson(levelId: 'lv600', lessonId: 'lesson1', lessonName: 'Bài 1: Câu hỏi gián tiếp & lịch sự — Polite requests', questions: p2Lv600L1);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson2', lessonName: 'Bài 2: Câu hỏi lựa chọn phức tạp — Multiple-options', questions: p2Lv600L2);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson3', lessonName: 'Bài 3: Bẫy từ vựng — False friends & distractors', questions: p2Lv600L3);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson4', lessonName: 'Bài 4: Shadowing phản xạ — Speed & fluency', questions: p2Lv600L4);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập nâng cao — Mixed medium', questions: p2Lv600L5);

  // lv800
  await pushLesson(levelId: 'lv800', lessonId: 'lesson1', lessonName: 'Bài 1: Câu hỏi gián tiếp & bẫy ngữ nghĩa', questions: p2Lv800L1);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson2', lessonName: 'Bài 2: Câu hỏi suy luận & hàm ý (Inference/Implication)', questions: p2Lv800L2);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson3', lessonName: 'Bài 3: Nghe chi tiết & con số', questions: p2Lv800L3);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson4', lessonName: 'Bài 4: Câu hỏi bẫy nhiều tầng (Double distractors)', questions: p2Lv800L4);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp – Mini Test nâng cao', questions: p2Lv800L5);
}
