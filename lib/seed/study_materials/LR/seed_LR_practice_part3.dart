// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart3() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';
  const audioDemo = 'input_tests/testLR/part3/01%20Test%201_LC_Voca.mp3';

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
        .doc('part3')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Conversations',
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
        .doc('lis3')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Conversations',
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

  // Lesson 1 — Shopping (main idea, short 2–3 turns)
  final p3Lv300L1 = <Map<String, dynamic>>[
    {
      'question':
          "W: Do you have this shirt in medium?\nM: Let me check... Yes, but only in blue.\nQ: What is the man offering?",
      'options': [
        'A medium blue shirt.',
        'A large green shirt.',
        'A discount coupon.',
        'Home delivery.',
      ],
      'correctIndex': 0,
      'explain': '“Yes, but only in blue” → size medium, màu xanh.',
    },
    {
      'question':
          "M: Can I return this jacket?\nW: Sure, with the receipt.\nQ: What does the woman say is required?",
      'options': [
        'A receipt.',
        'A membership card.',
        'An ID photo.',
        'Cash payment.',
      ],
      'correctIndex': 0,
      'explain': 'Phải có hóa đơn.',
    },
    {
      'question':
          "W: Is there a sale on shoes?\nM: Buy one, get the second half off.\nQ: What is the promotion?",
      'options': [
        'Mua 1 tặng 1 nửa giá.',
        'Giảm 50% mọi mặt hàng.',
        'Miễn phí giao hàng.',
        'Tặng voucher 10\$.',
      ],
      'correctIndex': 0,
      'explain': '“second half off” = đôi thứ hai giảm 50%.',
    },
    {
      'question':
          "M: Does this come with a warranty?\nW: One year for electronics.\nQ: What product type has a warranty?",
      'options': ['Electronics.', 'Clothing.', 'Groceries.', 'Furniture only.'],
      'correctIndex': 0,
      'explain': 'Bảo hành 1 năm cho đồ điện tử.',
    },
    {
      'question':
          "W: Where can I try these headphones?\nM: The demo table over there.\nQ: What should the woman do?",
      'options': [
        'Go to the demo table.',
        'Pay at the cashier.',
        'Ask for a refund.',
        'Order online.',
      ],
      'correctIndex': 0,
      'explain': 'Hướng dẫn tới bàn trải nghiệm.',
    },
    {
      'question':
          "M: Are these apples fresh?\nW: They arrived this morning.\nQ: What is implied about the apples?",
      'options': [
        'They are fresh.',
        'They are discounted.',
        'They are imported.',
        'They are out of stock.',
      ],
      'correctIndex': 0,
      'explain': 'Vừa về sáng nay → tươi.',
    },
    {
      'question':
          "W: Do you take credit cards?\nM: Yes, and mobile payments, too.\nQ: What is true?",
      'options': [
        'They accept multiple payment methods.',
        'They only take cash.',
        'They charge extra for cards.',
        'They don’t accept mobile pay.',
      ],
      'correctIndex': 0,
      'explain': 'Chấp nhận thẻ và ví điện tử.',
    },
    {
      'question':
          "M: I need gift wrapping.\nW: It’s free for purchases over \$30.\nQ: What is the condition?",
      'options': [
        'Spend more than \$30.',
        'Buy two items.',
        'Join membership.',
        'Use cash only.',
      ],
      'correctIndex': 0,
      'explain': 'Gói quà miễn phí nếu > \$30.',
    },
    {
      'question':
          "W: Can I try these shoes on?\nM: Sure, the fitting area is in the back.\nQ: Where should she go?",
      'options': [
        'To the fitting area.',
        'To the cashier.',
        'To the info desk.',
        'To the exit.',
      ],
      'correctIndex': 0,
      'explain': 'Đi khu thử đồ.',
    },
    {
      'question':
          "M: Do you price-match?\nW: Yes, if you show the competitor’s ad.\nQ: What is required for price match?",
      'options': [
        'A competitor’s advertisement.',
        'A loyalty card.',
        'A manager’s approval.',
        'Online order number.',
      ],
      'correctIndex': 0,
      'explain': 'Cần bằng chứng giá từ đối thủ.',
    },
  ];

  // Lesson 2 — Travel/Hotel (time, location, service)
  final p3Lv300L2 = <Map<String, dynamic>>[
    {
      'question':
          "M: What time is check-in?\nW: After 2 p.m.\nQ: When can guests check in?",
      'options': [
        'After 2 p.m.',
        'Before noon.',
        'Any time.',
        'Only at 6 p.m.',
      ],
      'correctIndex': 0,
      'explain': 'Check-in sau 2 giờ chiều.',
    },
    {
      'question':
          "W: Is breakfast included?\nM: Yes, from 6 to 9.\nQ: What is true about breakfast?",
      'options': [
        'It’s included, 6–9 a.m.',
        'Not included.',
        'Available all day.',
        'Starts at 9 p.m.',
      ],
      'correctIndex': 0,
      'explain': 'Bao gồm và khung giờ 6–9.',
    },
    {
      'question':
          "M: Which platform for the airport train?\nW: Platform 3.\nQ: Where should the man go?",
      'options': ['Platform 3.', 'Gate C.', 'Platform 1.', 'Counter 3.'],
      'correctIndex': 0,
      'explain': 'Đi sân ga số 3.',
    },
    {
      'question':
          "W: My flight was canceled.\nM: We can rebook you for tomorrow morning.\nQ: What will the man do?",
      'options': [
        'Rebook the flight.',
        'Refund the ticket.',
        'Upgrade the seat.',
        'Provide a taxi.',
      ],
      'correctIndex': 0,
      'explain': 'Đặt lại vé cho sáng hôm sau.',
    },
    {
      'question':
          "M: Is there a shuttle to downtown?\nW: Every 30 minutes.\nQ: How often does the shuttle run?",
      'options': [
        'Every 30 minutes.',
        'Once a day.',
        'Every 3 hours.',
        'It’s not available.',
      ],
      'correctIndex': 0,
      'explain': 'Tần suất 30 phút/chuyến.',
    },
    {
      'question':
          "W: Can I get a late checkout?\nM: Until 1 p.m. for a small fee.\nQ: What is true?",
      'options': [
        'Late checkout is possible with a fee.',
        'Late checkout is free.',
        'Checkout only at noon.',
        'Checkout not allowed.',
      ],
      'correctIndex': 0,
      'explain': 'Được trễ tới 1 giờ chiều, có phí.',
    },
    {
      'question':
          "M: Where can I rent a car?\nW: The rental desk next to baggage claim.\nQ: Where is the rental desk?",
      'options': [
        'Next to baggage claim.',
        'Across the street.',
        'At platform 3.',
        'In the city center.',
      ],
      'correctIndex': 0,
      'explain': 'Ngay cạnh khu lấy hành lý.',
    },
    {
      'question':
          "W: Is Wi-Fi free here?\nM: Yes, just log in with your room number.\nQ: How do guests access Wi-Fi?",
      'options': [
        'Use the room number.',
        'Pay at reception.',
        'Ask for a paper code.',
        'Call support only.',
      ],
      'correctIndex': 0,
      'explain': 'Đăng nhập bằng số phòng.',
    },
    {
      'question':
          "M: What time is boarding?\nW: At 10:25, Gate 12.\nQ: When do passengers board?",
      'options': ['10:25.', '12:10.', '10:52.', 'Gate 25.'],
      'correctIndex': 0,
      'explain': 'Boarding lúc 10:25.',
    },
    {
      'question':
          "W: Is there a luggage storage?\nM: Yes, behind the front desk.\nQ: Where can luggage be stored?",
      'options': [
        'Behind the front desk.',
        'Inside the room.',
        'At platform 2.',
        'No storage available.',
      ],
      'correctIndex': 0,
      'explain': 'Có chỗ gửi sau quầy lễ tân.',
    },
  ];

  // Lesson 3 — Food & Restaurant (menu, order, bill)
  final p3Lv300L3 = <Map<String, dynamic>>[
    {
      'question':
          "W: What do you recommend?\nM: The grilled salmon is popular.\nQ: What does the waiter suggest?",
      'options': [
        'Grilled salmon.',
        'Fried chicken.',
        'Vegan salad.',
        'Pasta only.',
      ],
      'correctIndex': 0,
      'explain': 'Món gợi ý: cá hồi nướng.',
    },
    {
      'question':
          "M: Can we split the bill?\nW: Sure, two separate checks.\nQ: What will the server do?",
      'options': [
        'Provide two checks.',
        'Offer a discount.',
        'Add a service fee.',
        'Refuse the request.',
      ],
      'correctIndex': 0,
      'explain': 'Tách hóa đơn.',
    },
    {
      'question':
          "W: Is the soup vegetarian?\nM: Yes, no meat or dairy.\nQ: What is true about the soup?",
      'options': [
        'It’s vegetarian.',
        'It contains meat.',
        'It has cheese.',
        'It’s spicy beef.',
      ],
      'correctIndex': 0,
      'explain': 'Không thịt, không sữa.',
    },
    {
      'question':
          "M: I ordered a sandwich, not a burger.\nW: I’m sorry, I’ll fix it right away.\nQ: What will the woman do?",
      'options': [
        'Correct the order.',
        'Cancel the bill.',
        'Offer free dessert only.',
        'Ask him to wait until tomorrow.',
      ],
      'correctIndex': 0,
      'explain': 'Sửa món ngay.',
    },
    {
      'question':
          "W: Could we get some water?\nM: Still or sparkling?\nQ: What is the man asking?",
      'options': [
        'Water type preference.',
        'Number of glasses.',
        'Add ice.',
        'Extra napkins.',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi loại nước: thường hay có gas.',
    },
    {
      'question':
          "M: Do you have any vegan options?\nW: Yes, the mushroom risotto.\nQ: What suits the man’s diet?",
      'options': [
        'Mushroom risotto.',
        'Beef stew.',
        'Cheese pizza.',
        'Chicken curry.',
      ],
      'correctIndex': 0,
      'explain': 'Món thuần chay gợi ý.',
    },
    {
      'question':
          "W: How long is the wait?\nM: About fifteen minutes.\nQ: What did the man say?",
      'options': ['15 minutes.', '50 minutes.', '5 minutes.', 'No waiting.'],
      'correctIndex': 0,
      'explain': 'Thời gian chờ ~ 15’.',
    },
    {
      'question':
          "M: Can I see the dessert menu?\nW: I’ll bring it right away.\nQ: What will the woman do?",
      'options': [
        'Bring the menu.',
        'Take payment.',
        'Refuse the request.',
        'Offer a discount.',
      ],
      'correctIndex': 0,
      'explain': 'Mang menu tráng miệng.',
    },
    {
      'question':
          "W: Is service included?\nM: A 10% service charge is added.\nQ: What is true about the bill?",
      'options': [
        'Includes a 10% service charge.',
        'No tax included.',
        'Tip is mandatory 20%.',
        'It’s cash-only.',
      ],
      'correctIndex': 0,
      'explain': 'Có phụ phí 10%.',
    },
    {
      'question':
          "M: We’re in a hurry.\nW: I’ll have your order prioritized.\nQ: What will happen?",
      'options': [
        'The order will be prepared faster.',
        'They must leave.',
        'They get a refund.',
        'They will wait longer.',
      ],
      'correctIndex': 0,
      'explain': 'Ưu tiên món → ra nhanh hơn.',
    },
  ];

  // Lesson 4 — Identify who/where/what
  final p3Lv300L4 = <Map<String, dynamic>>[
    {
      'question':
          "M: I’ll pick up the package at the counter.\nW: Bring your ID, please.\nQ: Who is the woman likely to be?",
      'options': [
        'A clerk.',
        'A delivery driver.',
        'A customer.',
        'A security guard.',
      ],
      'correctIndex': 0,
      'explain': 'Yêu cầu ID → nhân viên quầy.',
    },
    {
      'question':
          "W: The next stop is Central Station.\nM: Great, that’s my stop.\nQ: Where are they?",
      'options': [
        'On a train.',
        'At a bank.',
        'In a hotel.',
        'In a classroom.',
      ],
      'correctIndex': 0,
      'explain': 'Có “next stop” → tàu/xe.',
    },
    {
      'question':
          "M: Your total is \$24.50. Do you need a bag?\nW: Yes, please.\nQ: What are they talking about?",
      'options': [
        'Paying at a store.',
        'Booking a room.',
        'Scheduling a meeting.',
        'Repairing a phone.',
      ],
      'correctIndex': 0,
      'explain': 'Tổng tiền & túi → thu ngân.',
    },
    {
      'question':
          "W: Your room includes breakfast and Wi-Fi.\nM: What time is checkout?\nQ: Where are they?",
      'options': [
        'At a hotel.',
        'At a clinic.',
        'At an office.',
        'At a school.',
      ],
      'correctIndex': 0,
      'explain': 'Nhắc “room, checkout”.',
    },
    {
      'question':
          "M: The meeting’s moved to 3 p.m.\nW: I’ll update the team.\nQ: What are they discussing?",
      'options': [
        'A schedule change.',
        'A product price.',
        'A food order.',
        'Travel insurance.',
      ],
      'correctIndex': 0,
      'explain': 'Đổi giờ họp.',
    },
    {
      'question':
          "W: Could you sign here?\nM: Sure. Do I get a copy?\nQ: Who is the man likely to be?",
      'options': [
        'A recipient.',
        'A chef.',
        'A driver instructor.',
        'A cashier.',
      ],
      'correctIndex': 0,
      'explain': 'Ký & nhận bản sao → người nhận hàng/tài liệu.',
    },
    {
      'question':
          "M: Your table will be ready in five minutes.\nW: We’ll wait at the bar.\nQ: Where are they?",
      'options': [
        'At a restaurant.',
        'At a cinema.',
        'At a bank.',
        'At a hospital.',
      ],
      'correctIndex': 0,
      'explain': 'Bàn sẽ sẵn sàng → nhà hàng.',
    },
    {
      'question':
          "W: You can board through Gate 7.\nM: Thanks, I’ll head there now.\nQ: What are they talking about?",
      'options': [
        'Air travel.',
        'Car rental.',
        'Hotel check-in.',
        'Job interview.',
      ],
      'correctIndex': 0,
      'explain': 'Boarding & Gate.',
    },
    {
      'question':
          "M: Could you replace the ink cartridge?\nW: I’ll send a technician.\nQ: Who is the woman likely to be?",
      'options': ['IT support.', 'Cashier.', 'Nurse.', 'Tour guide.'],
      'correctIndex': 0,
      'explain': 'Cử kỹ thuật viên → IT/support.',
    },
    {
      'question':
          "W: Your parcel will arrive by Friday.\nM: Great, I need it for the event.\nQ: What are they talking about?",
      'options': [
        'A delivery.',
        'A medical test.',
        'A class schedule.',
        'A hotel upgrade.',
      ],
      'correctIndex': 0,
      'explain': 'Parcel & arrive.',
    },
  ];

  // Lesson 5 — Mixed (shopping + travel + restaurant)
  final p3Lv300L5 = <Map<String, dynamic>>[
    {
      'question':
          "W: Do you have vegetarian dishes?\nM: Yes, the tofu curry.\nQ: What are they talking about?",
      'options': [
        'A menu choice.',
        'Flight options.',
        'Refund process.',
        'Job duties.',
      ],
      'correctIndex': 0,
      'explain': 'Chọn món chay.',
    },
    {
      'question':
          "M: Is this the line for boarding?\nW: Yes, have your passport ready.\nQ: Where are they?",
      'options': [
        'At an airport gate.',
        'At a supermarket.',
        'At a bank.',
        'At a theater.',
      ],
      'correctIndex': 0,
      'explain': 'Passport + boarding.',
    },
    {
      'question':
          "W: Can I return this within 14 days?\nM: Yes, with the receipt.\nQ: What’s required for the return?",
      'options': [
        'Receipt.',
        'Membership.',
        'Cash only.',
        'Original box not needed.',
      ],
      'correctIndex': 0,
      'explain': 'Cần hóa đơn.',
    },
    {
      'question':
          "M: What time is breakfast served?\nW: From 6 to 9.\nQ: What is the time frame?",
      'options': ['6–9 a.m.', '9–6 p.m.', '7–10 p.m.', 'All day.'],
      'correctIndex': 0,
      'explain': 'Khung giờ ăn sáng.',
    },
    {
      'question':
          "W: Could we get the bill?\nM: I’ll bring it right over.\nQ: What will the man do?",
      'options': [
        'Bring the check.',
        'Offer dessert.',
        'Change the table.',
        'Refuse the request.',
      ],
      'correctIndex': 0,
      'explain': 'Mang hóa đơn.',
    },
    {
      'question':
          "M: Where’s the taxi stand?\nW: Outside, to the left.\nQ: What should the man do?",
      'options': [
        'Go left outside.',
        'Go to platform 3.',
        'Wait inside.',
        'Call customer service.',
      ],
      'correctIndex': 0,
      'explain': 'Đi ra ngoài, rẽ trái.',
    },
    {
      'question':
          "W: Do you deliver?\nM: Yes, free over \$50.\nQ: What is true about delivery?",
      'options': [
        'Free if over \$50.',
        'Only in-store pickup.',
        'No deliveries today.',
        'Express only.',
      ],
      'correctIndex': 0,
      'explain': 'Miễn phí nếu đơn > \$50.',
    },
    {
      'question':
          "M: Any seats near the window?\nW: Sorry, aisle only.\nQ: What seat is available?",
      'options': ['Aisle seat.', 'Window seat.', 'Middle seat.', 'No seats.'],
      'correctIndex': 0,
      'explain': 'Chỉ còn ghế lối đi.',
    },
    {
      'question':
          "W: Can I try this coat?\nM: Fitting rooms are down the hall.\nQ: Where should she go?",
      'options': [
        'To the fitting rooms.',
        'To the cashier.',
        'To the exit.',
        'To the info desk.',
      ],
      'correctIndex': 0,
      'explain': 'Đi phòng thử đồ.',
    },
    {
      'question':
          "M: Is the pool open now?\nW: It opens at 7.\nQ: What does the woman mean?",
      'options': [
        'It opens at 7.',
        'It is open now.',
        'It closes at 7.',
        'It is closed for the day.',
      ],
      'correctIndex': 0,
      'explain': 'Mở lúc 7 giờ.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // Lesson 1 — Work/Meeting (schedule, tasks, deadline)
  final p3Lv600L1 = <Map<String, dynamic>>[
    {
      'question':
          "W: Can we move the meeting to 3?\nM: Fine, I’ll inform the team.\nQ: What will the man do?",
      'options': [
        'Notify the team.',
        'Cancel the meeting.',
        'Book a venue.',
        'Prepare lunch.',
      ],
      'correctIndex': 0,
      'explain': 'Anh sẽ thông báo.',
    },
    {
      'question':
          "M: The draft is due tomorrow.\nW: I’ll send you the latest tonight.\nQ: What does the woman promise?",
      'options': [
        'Send the draft tonight.',
        'Finish the final report.',
        'Print copies now.',
        'Delay the deadline.',
      ],
      'correctIndex': 0,
      'explain': 'Gửi bản mới tối nay.',
    },
    {
      'question':
          "W: Who can take minutes?\nM: I’ll do it this time.\nQ: What does the man volunteer to do?",
      'options': [
        'Take minutes.',
        'Lead the meeting.',
        'Reschedule.',
        'Book a room.',
      ],
      'correctIndex': 0,
      'explain': 'Xung phong ghi biên bản.',
    },
    {
      'question':
          "M: Could you share the slides by noon?\nW: Sure, I’m almost done.\nQ: When will she send the slides?",
      'options': ['By noon.', 'By 5 p.m.', 'Tomorrow.', 'Next week.'],
      'correctIndex': 0,
      'explain': 'Đồng ý gửi trước trưa.',
    },
    {
      'question':
          "W: We’re short on staff Friday.\nM: I can cover the morning shift.\nQ: What does the man offer?",
      'options': [
        'Work the morning shift.',
        'Hire a temp.',
        'Close the store.',
        'Cancel shifts.',
      ],
      'correctIndex': 0,
      'explain': 'Nhận ca sáng.',
    },
    {
      'question':
          "M: The client wants an earlier delivery.\nW: Then we must move up the timeline.\nQ: What do they decide?",
      'options': [
        'Accelerate the schedule.',
        'Cancel the order.',
        'Ignore the request.',
        'Change the product.',
      ],
      'correctIndex': 0,
      'explain': 'Đẩy tiến độ lên.',
    },
    {
      'question':
          "W: I can’t access the shared folder.\nM: I’ll reset your permissions.\nQ: What will the man do?",
      'options': [
        'Adjust access rights.',
        'Send a new laptop.',
        'Call the client.',
        'Print the files.',
      ],
      'correctIndex': 0,
      'explain': 'Reset quyền truy cập.',
    },
    {
      'question':
          "M: The budget is over by 8%.\nW: Let’s remove optional items.\nQ: What is suggested?",
      'options': [
        'Cut optional items.',
        'Ask for more funds.',
        'Delay payment.',
        'Change supplier.',
      ],
      'correctIndex': 0,
      'explain': 'Giảm hạng mục không bắt buộc.',
    },
    {
      'question':
          "W: Could you lead the kickoff tomorrow?\nM: Sure, I’ll prepare an outline.\nQ: What will the man do?",
      'options': [
        'Lead the kickoff.',
        'Cancel the meeting.',
        'Email minutes.',
        'Order lunch.',
      ],
      'correctIndex': 0,
      'explain': 'Đồng ý lead buổi khởi động.',
    },
    {
      'question':
          "M: When is the deadline?\nW: COB Wednesday.\nQ: What does the woman mean by COB?",
      'options': [
        'End of business day Wednesday.',
        'Start of day Wednesday.',
        'Close of bank Friday.',
        'Conference on Wednesday.',
      ],
      'correctIndex': 0,
      'explain': 'COB = close of business.',
    },
  ];

  // Lesson 2 — Customer Service (complaint, solution)
  final p3Lv600L2 = <Map<String, dynamic>>[
    {
      'question':
          "W: My order arrived damaged.\nM: I’m sorry. I’ll arrange a replacement.\nQ: What will the man do?",
      'options': [
        'Send a replacement.',
        'Issue a coupon.',
        'Cancel the account.',
        'Ignore the issue.',
      ],
      'correctIndex': 0,
      'explain': 'Xử lý thay thế.',
    },
    {
      'question':
          "M: I was overcharged.\nW: Let me refund the difference.\nQ: What is the solution?",
      'options': [
        'Refund the difference.',
        'Free shipping.',
        'Gift points.',
        'Store credit only.',
      ],
      'correctIndex': 0,
      'explain': 'Hoàn tiền phần chênh lệch.',
    },
    {
      'question':
          "W: The internet keeps dropping.\nM: I’ll send a technician this afternoon.\nQ: What will happen?",
      'options': [
        'A technician visit.',
        'A router replacement by mail.',
        'A plan upgrade.',
        'No action.',
      ],
      'correctIndex': 0,
      'explain': 'Cử kỹ thuật viên đến.',
    },
    {
      'question':
          "M: The app crashes on login.\nW: Please update to the latest version.\nQ: What does the woman suggest?",
      'options': [
        'Update the app.',
        'Change the phone.',
        'Create a new account.',
        'Turn off Wi-Fi.',
      ],
      'correctIndex': 0,
      'explain': 'Cập nhật ứng dụng.',
    },
    {
      'question':
          "W: My package is late.\nM: I’ll check the tracking and call you back.\nQ: What will the man do?",
      'options': [
        'Check tracking and follow up.',
        'Send a courier immediately.',
        'Cancel the shipment.',
        'Offer a coupon only.',
      ],
      'correctIndex': 0,
      'explain': 'Kiểm tra & gọi lại.',
    },
    {
      'question':
          "M: The item is out of stock.\nW: Could you notify me when it’s back?\nQ: What does the woman request?",
      'options': [
        'A restock notification.',
        'A refund.',
        'A substitute item now.',
        'A manager call.',
      ],
      'correctIndex': 0,
      'explain': 'Yêu cầu báo khi có hàng.',
    },
    {
      'question':
          "W: The device is still under warranty.\nM: Then we’ll repair it for free.\nQ: What will the company do?",
      'options': [
        'Repair for free.',
        'Replace with fee.',
        'Decline service.',
        'Offer accessories.',
      ],
      'correctIndex': 0,
      'explain': 'Bảo hành → sửa miễn phí.',
    },
    {
      'question':
          "M: My seat won’t recline.\nW: I can move you to row 12.\nQ: What is offered?",
      'options': [
        'A different seat.',
        'A free meal.',
        'A refund.',
        'A pillow only.',
      ],
      'correctIndex': 0,
      'explain': 'Đổi chỗ ngồi.',
    },
    {
      'question':
          "W: I never got the confirmation email.\nM: I’ll resend it now.\nQ: What will the man do?",
      'options': [
        'Resend the email.',
        'Cancel the booking.',
        'Change the address.',
        'Issue a refund.',
      ],
      'correctIndex': 0,
      'explain': 'Gửi lại email xác nhận.',
    },
    {
      'question':
          "M: The product is missing a part.\nW: We’ll ship the missing piece today.\nQ: What is the resolution?",
      'options': [
        'Ship the missing part.',
        'Collect the product.',
        'Issue store credit.',
        'Offer a discount code.',
      ],
      'correctIndex': 0,
      'explain': 'Gửi bổ sung linh kiện.',
    },
  ];

  // Lesson 3 — Requests & Suggestions (“Could you…”, “Why don’t we…”)
  final p3Lv600L3 = <Map<String, dynamic>>[
    {
      'question':
          "W: Could you review my slides?\nM: Sure, I’ll send comments by 5.\nQ: What will the man do?",
      'options': [
        'Review and comment.',
        'Print the slides.',
        'Lead the talk.',
        'Cancel the review.',
      ],
      'correctIndex': 0,
      'explain': 'Nhận xem & góp ý.',
    },
    {
      'question':
          "M: Why don’t we try a smaller venue?\nW: Good idea, it’ll save costs.\nQ: What do they agree to do?",
      'options': [
        'Choose a smaller venue.',
        'Delay the event.',
        'Invite more people.',
        'Change the topic.',
      ],
      'correctIndex': 0,
      'explain': 'Đồng ý địa điểm nhỏ hơn.',
    },
    {
      'question':
          "W: Could you call the vendor?\nM: I’ll do it after lunch.\nQ: When will he call?",
      'options': ['After lunch.', 'Now.', 'Tomorrow.', 'Next week.'],
      'correctIndex': 0,
      'explain': 'Sau bữa trưa.',
    },
    {
      'question':
          "M: Let’s send out the agenda today.\nW: I’ll draft it now.\nQ: What will the woman do?",
      'options': [
        'Draft the agenda.',
        'Cancel the email.',
        'Schedule a meeting.',
        'Print brochures.',
      ],
      'correctIndex': 0,
      'explain': 'Soạn agenda.',
    },
    {
      'question':
          "W: Could you reserve a projector?\nM: I’ll book one online.\nQ: What will the man do?",
      'options': [
        'Reserve a projector.',
        'Fix the projector.',
        'Buy a projector.',
        'Borrow slides.',
      ],
      'correctIndex': 0,
      'explain': 'Đặt máy chiếu.',
    },
    {
      'question':
          "M: Why don’t we share rides to the event?\nW: I can drive two people.\nQ: What does the woman offer?",
      'options': [
        'Drive two coworkers.',
        'Pay for gas.',
        'Cancel attendance.',
        'Rent a van.',
      ],
      'correctIndex': 0,
      'explain': 'Đề nghị chở 2 người.',
    },
    {
      'question':
          "W: Could you extend the deadline?\nM: I can give you two more days.\nQ: What will the man do?",
      'options': [
        'Extend by two days.',
        'Reject the request.',
        'Assign more tasks.',
        'Close the project.',
      ],
      'correctIndex': 0,
      'explain': 'Gia hạn 2 ngày.',
    },
    {
      'question':
          "M: Let’s meet first thing tomorrow.\nW: I’ll book a room at nine.\nQ: When will they meet?",
      'options': [
        'At 9 a.m. tomorrow.',
        'At 9 p.m. today.',
        'At noon today.',
        'Next week.',
      ],
      'correctIndex': 0,
      'explain': 'Đặt phòng lúc 9 sáng.',
    },
    {
      'question':
          "W: Could you send the invoice to Accounts?\nM: I’ll forward it now.\nQ: What will the man do?",
      'options': [
        'Forward the invoice.',
        'Print the invoice.',
        'Pay the invoice.',
        'Reject the invoice.',
      ],
      'correctIndex': 0,
      'explain': 'Chuyển tiếp hóa đơn.',
    },
    {
      'question':
          "M: Why don’t we ask for user feedback?\nW: I’ll prepare a short survey.\nQ: What will the woman do?",
      'options': [
        'Prepare a survey.',
        'Call all users.',
        'Stop the release.',
        'Raise the price.',
      ],
      'correctIndex': 0,
      'explain': 'Soạn khảo sát.',
    },
  ];

  // Lesson 4 — Main idea vs detail
  final p3Lv600L4 = <Map<String, dynamic>>[
    {
      'question':
          "M: The workshop is moved to Room B.\nW: Okay, do we still start at ten?\nQ: What is the main change?",
      'options': [
        'Room change.',
        'Time change.',
        'Speaker change.',
        'Topic change.',
      ],
      'correctIndex': 0,
      'explain': 'Đổi phòng, không đổi giờ.',
    },
    {
      'question':
          "W: The shipment arrives on Friday.\nM: Good. How many units?\nQ: What detail is asked?",
      'options': ['Quantity.', 'Destination.', 'Price.', 'Color.'],
      'correctIndex': 0,
      'explain': 'Hỏi số lượng.',
    },
    {
      'question':
          "M: We’ll serve coffee and snacks.\nW: Any vegan options?\nQ: What detail is the woman asking for?",
      'options': [
        'Dietary options.',
        'Ticket price.',
        'Seat location.',
        'Parking fee.',
      ],
      'correctIndex': 0,
      'explain': 'Chi tiết chế độ ăn.',
    },
    {
      'question':
          "W: The keynote starts at 9.\nM: Who’s introducing the speaker?\nQ: What detail does the man want?",
      'options': [
        'Who will introduce.',
        'The venue size.',
        'The agenda order.',
        'The coffee break time.',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi người giới thiệu.',
    },
    {
      'question':
          "M: The budget increased by 5%.\nW: Is marketing included?\nQ: What is the woman confirming?",
      'options': [
        'Whether marketing is included.',
        'Exact date.',
        'Payment method.',
        'Travel plan.',
      ],
      'correctIndex': 0,
      'explain': 'Xác nhận hạng mục.',
    },
    {
      'question':
          "W: We’ll email the report tonight.\nM: Could you CC Maria?\nQ: What is the man’s request?",
      'options': [
        'CC Maria.',
        'Delay the email.',
        'Print copies.',
        'Change the format.',
      ],
      'correctIndex': 0,
      'explain': 'Yêu cầu CC.',
    },
    {
      'question':
          "M: The demo lasts thirty minutes.\nW: Do we have Q&A?\nQ: What detail does the woman ask?",
      'options': [
        'Whether there is Q&A.',
        'The speaker fee.',
        'Venue address.',
        'Attendee list.',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi phần hỏi đáp.',
    },
    {
      'question':
          "W: Our stand is near Entrance A.\nM: Do we have power outlets?\nQ: What is the man concerned about?",
      'options': [
        'Power supply.',
        'Staff count.',
        'Poster size.',
        'Ticket price.',
      ],
      'correctIndex': 0,
      'explain': 'Ổ điện cho gian hàng.',
    },
    {
      'question':
          "M: I’ll send the contract by courier.\nW: What’s the tracking number?\nQ: What detail is needed?",
      'options': ['Tracking number.', 'Courier name.', 'Weight.', 'Color.'],
      'correctIndex': 0,
      'explain': 'Hỏi mã theo dõi.',
    },
    {
      'question':
          "W: The training is on Tuesday.\nM: Do we need laptops?\nQ: What detail is asked?",
      'options': [
        'Equipment requirement.',
        'Parking info.',
        'Dress code.',
        'Lunch menu.',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi cần mang laptop không.',
    },
  ];

  // Lesson 5 — Mixed (review)
  final p3Lv600L5 = <Map<String, dynamic>>[
    {
      'question':
          "W: The client wants to push back the call.\nM: Let’s reschedule for Thursday.\nQ: What will they do?",
      'options': [
        'Reschedule.',
        'Cancel.',
        'Extend the call.',
        'Hire a translator.',
      ],
      'correctIndex': 0,
      'explain': 'Đổi lịch sang thứ Năm.',
    },
    {
      'question':
          "M: The device overheats.\nW: Use the latest firmware.\nQ: What is the solution?",
      'options': [
        'Update firmware.',
        'Replace battery.',
        'Stop using it.',
        'Add a case.',
      ],
      'correctIndex': 0,
      'explain': 'Cập nhật phần mềm máy.',
    },
    {
      'question':
          "W: Could you send me the invoice?\nM: I’ve just emailed it.\nQ: What has the man done?",
      'options': [
        'Emailed the invoice.',
        'Printed the invoice.',
        'Paid the invoice.',
        'Rejected the invoice.',
      ],
      'correctIndex': 0,
      'explain': 'Đã gửi qua email.',
    },
    {
      'question':
          "M: Any vegetarian options?\nW: Yes, a quinoa salad.\nQ: What are they discussing?",
      'options': [
        'Menu choices.',
        'Travel plans.',
        'Office rent.',
        'Delivery fees.',
      ],
      'correctIndex': 0,
      'explain': 'Chọn món ăn.',
    },
    {
      'question':
          "W: Where do we check in?\nM: Counter C for domestic flights.\nQ: Where should they go?",
      'options': ['Counter C.', 'Gate C.', 'Platform C.', 'Counter A.'],
      'correctIndex': 0,
      'explain': 'Quầy C cho nội địa.',
    },
    {
      'question':
          "M: The supplier is late.\nW: I’ll call and expedite.\nQ: What will the woman do?",
      'options': [
        'Call to speed up.',
        'Find a new supplier.',
        'Cancel the order.',
        'Send an email only.',
      ],
      'correctIndex': 0,
      'explain': 'Gọi hối thúc.',
    },
    {
      'question':
          "W: Could you book a room for 10 a.m.?\nM: I’ll reserve Meeting B.\nQ: What will the man do?",
      'options': [
        'Book a room.',
        'Order lunch.',
        'Cancel the meeting.',
        'Invite guests.',
      ],
      'correctIndex': 0,
      'explain': 'Đặt phòng họp.',
    },
    {
      'question':
          "M: Do you have decaf coffee?\nW: Yes, would you like milk?\nQ: What is offered?",
      'options': ['Milk with decaf.', 'Tea.', 'A refund.', 'Delivery.'],
      'correctIndex': 0,
      'explain': 'Đề nghị thêm sữa.',
    },
    {
      'question':
          "W: The taxi stand is across the street.\nM: Thanks.\nQ: What did the woman provide?",
      'options': ['Directions.', 'A discount.', 'A schedule.', 'A ticket.'],
      'correctIndex': 0,
      'explain': 'Chỉ đường.',
    },
    {
      'question':
          "M: Can we get separate checks?\nW: Sure.\nQ: Where are they most likely?",
      'options': [
        'At a restaurant.',
        'At an office.',
        'At a hotel.',
        'At a bank.',
      ],
      'correctIndex': 0,
      'explain': 'Tách hóa đơn → nhà hàng.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // Lesson 1 — Long negotiation (deal/contract)
  final p3Lv800L1 = <Map<String, dynamic>>[
    {
      'question':
          "M: The price seems high for 500 units.\nW: If you increase to 700, we can give 8% off.\nM: Could you include express shipping?\nQ: What condition leads to a discount?",
      'options': [
        'Ordering 700 units.',
        'Paying in cash.',
        'Signing a 2-year contract.',
        'Local pickup.',
      ],
      'correctIndex': 0,
      'explain': 'Tăng số lượng lên 700 → giảm 8%.',
    },
    {
      'question':
          "W: We need delivery by the 15th.\nM: That’s tight—unless we cut the inspection stage.\nW: Quality is non-negotiable.\nQ: What will NOT be changed?",
      'options': [
        'Quality inspection.',
        'Delivery date.',
        'Price.',
        'Quantity.',
      ],
      'correctIndex': 0,
      'explain': '“Quality is non-negotiable”.',
    },
    {
      'question':
          "M: Can you extend the warranty to 18 months?\nW: We can, if you choose the premium plan.\nQ: What is required for longer warranty?",
      'options': [
        'Premium plan.',
        'Advance payment.',
        'Bigger order.',
        'On-site training.',
      ],
      'correctIndex': 0,
      'explain': 'Cần premium plan.',
    },
    {
      'question':
          "W: Our budget allows \$20,000.\nM: Then we’ll remove optional features.\nQ: What will be adjusted?",
      'options': [
        'The feature set.',
        'The tax rate.',
        'The delivery address.',
        'The payment currency.',
      ],
      'correctIndex': 0,
      'explain': 'Cắt tính năng tùy chọn.',
    },
    {
      'question':
          "M: We require monthly maintenance.\nW: That’s included for the first year.\nQ: What is included?",
      'options': [
        'Monthly maintenance (year 1).',
        'Free spare parts for 5 years.',
        'Daily support on site.',
        'Lifetime warranty.',
      ],
      'correctIndex': 0,
      'explain': 'Bao gồm bảo trì tháng trong năm đầu.',
    },
    {
      'question':
          "W: Can we split the payment?\nM: 50% upfront, the rest on delivery.\nQ: What is the payment term?",
      'options': [
        '50/50 (deposit & on delivery).',
        'Full upfront.',
        'Monthly installments.',
        'After 60 days.',
      ],
      'correctIndex': 0,
      'explain': 'Điều khoản thanh toán.',
    },
    {
      'question':
          "M: Let’s add a penalty clause for delays.\nW: Reasonable—1% per week.\nQ: What did they agree on?",
      'options': [
        'Delay penalty of 1%/week.',
        'Early payment bonus.',
        'Free upgrades.',
        'Longer warranty.',
      ],
      'correctIndex': 0,
      'explain': 'Phạt trễ tiến độ.',
    },
    {
      'question':
          "W: Delivery in batches could help.\nM: Okay, two shipments: half now, half next month.\nQ: What is the new plan?",
      'options': [
        'Split delivery into two batches.',
        'Cancel the order.',
        'Air ship only.',
        'Single bulk shipment.',
      ],
      'correctIndex': 0,
      'explain': 'Chia lô giao hàng.',
    },
    {
      'question':
          "M: We can’t go below \$27 per unit.\nW: Then we’ll reduce the order to 400.\nQ: What will the woman change?",
      'options': ['Quantity.', 'Unit price.', 'Payment term.', 'Warranty.'],
      'correctIndex': 0,
      'explain': 'Giảm số lượng đặt.',
    },
    {
      'question':
          "W: We’ll sign if training is included.\nM: Agreed—two online sessions.\nQ: What condition was added?",
      'options': [
        'Training sessions included.',
        'Free hardware.',
        'Extended warranty.',
        'Office renovation.',
      ],
      'correctIndex': 0,
      'explain': 'Bao gồm 2 khóa huấn luyện online.',
    },
  ];

  // Lesson 2 — Complaint & solution (logic)
  final p3Lv800L2 = <Map<String, dynamic>>[
    {
      'question':
          "W: The software keeps freezing.\nM: We released a patch today. Install it and restart.\nQ: What is the solution?",
      'options': [
        'Install the new patch and restart.',
        'Replace the computer.',
        'Change the password.',
        'Use offline mode.',
      ],
      'correctIndex': 0,
      'explain': 'Cài bản vá rồi khởi động lại.',
    },
    {
      'question':
          "M: The room smells like smoke.\nW: I can move you to a non-smoking floor.\nQ: What does the woman offer?",
      'options': [
        'A different room.',
        'A refund.',
        'Free breakfast.',
        'Late checkout only.',
      ],
      'correctIndex': 0,
      'explain': 'Chuyển phòng không hút thuốc.',
    },
    {
      'question':
          "W: The shipment arrived incomplete.\nM: We’ll send the missing cartons and cover shipping.\nQ: What will the company do?",
      'options': [
        'Send missing cartons, shipping covered.',
        'Cancel the order.',
        'Ask for pickup.',
        'Charge extra.',
      ],
      'correctIndex': 0,
      'explain': 'Gửi bù phần thiếu & chịu phí.',
    },
    {
      'question':
          "M: The bill has an extra charge.\nW: Sorry—we’ll issue a corrected invoice.\nQ: What action will be taken?",
      'options': [
        'Issue a corrected invoice.',
        'Offer a free meal.',
        'Provide store credit.',
        'Ignore the request.',
      ],
      'correctIndex': 0,
      'explain': 'Xuất hoá đơn chỉnh sửa.',
    },
    {
      'question':
          "W: The device is noisy.\nM: We can lubricate the fan or replace it.\nQ: What are the options?",
      'options': [
        'Lubricate or replace the fan.',
        'Refund immediately.',
        'Change the color.',
        'Extend the cable.',
      ],
      'correctIndex': 0,
      'explain': 'Hai phương án khắc phục.',
    },
    {
      'question':
          "M: Our Wi-Fi is unstable.\nW: I’ll move you closer to the router and reset it.\nQ: What will the woman do?",
      'options': [
        'Change the room and reset router.',
        'Provide a new laptop.',
        'Cancel the booking.',
        'Offer breakfast coupons.',
      ],
      'correctIndex': 0,
      'explain': 'Đổi phòng gần router + reset.',
    },
    {
      'question':
          "W: The tour was shorter than promised.\nM: We’ll refund 20% or reschedule you.\nQ: What are the remedies?",
      'options': [
        'Partial refund or reschedule.',
        'Full refund only.',
        'Free lunch.',
        'Taxi voucher only.',
      ],
      'correctIndex': 0,
      'explain': 'Hoàn 20% hoặc đổi lịch.',
    },
    {
      'question':
          "M: My order arrived late.\nW: We’ll upgrade you to express shipping next time.\nQ: What will the company provide?",
      'options': [
        'Express shipping for the next order.',
        'A free product now.',
        'Cancel subscription.',
        'Store credit only.',
      ],
      'correctIndex': 0,
      'explain': 'Nâng cấp vận chuyển lần tới.',
    },
    {
      'question':
          "W: The app keeps logging me out.\nM: I’ll escalate to engineering and follow up.\nQ: What will the man do?",
      'options': [
        'Escalate to engineering and follow up.',
        'Issue a refund.',
        'Replace the phone.',
        'Close the ticket.',
      ],
      'correctIndex': 0,
      'explain': 'Chuyển cấp & cập nhật lại.',
    },
    {
      'question':
          "M: The printer jams constantly.\nW: We’ll send a replacement unit tomorrow.\nQ: What is the resolution?",
      'options': [
        'Send a replacement printer.',
        'Dispatch a cleaning crew.',
        'Offer ink discount.',
        'Extend warranty only.',
      ],
      'correctIndex': 0,
      'explain': 'Gửi máy thay thế.',
    },
  ];

  // Lesson 3 — Numbers & conditions (prices, dates, if/when/unless)
  final p3Lv800L3 = <Map<String, dynamic>>[
    {
      'question':
          "W: The quote is \$480 including tax.\nM: If we add installation, what’s the total?\nW: \$550.\nQ: How much with installation?",
      'options': [
        '550 dollars.',
        '480 dollars.',
        '530 dollars.',
        '505 dollars.',
      ],
      'correctIndex': 0,
      'explain': 'Tổng \$550.',
    },
    {
      'question':
          "M: Delivery by the 14th is tough.\nW: If we ship today, it’ll arrive on the 13th.\nQ: When will it arrive if shipped today?",
      'options': [
        'On the 13th.',
        'On the 14th.',
        'On the 15th.',
        'Next month.',
      ],
      'correctIndex': 0,
      'explain': 'Giao ngày 13.',
    },
    {
      'question':
          "W: The discount applies when you buy at least three.\nM: Then I’ll get four.\nQ: What triggers the discount?",
      'options': [
        'Buying ≥ 3 items.',
        'Paying cash.',
        'Weekend only.',
        'Members only.',
      ],
      'correctIndex': 0,
      'explain': 'Điều kiện mua tối thiểu.',
    },
    {
      'question':
          "M: Unless it rains, the event’s outdoors.\nW: Forecast says clear skies.\nQ: Where will the event likely be held?",
      'options': ['Outdoors.', 'Indoors.', 'Online.', 'Canceled.'],
      'correctIndex': 0,
      'explain': 'Không mưa → ngoài trời.',
    },
    {
      'question':
          "W: The fee is \$12 per hour.\nM: We’ll need it for 3 hours.\nQ: What is the total fee?",
      'options': ['36 dollars.', '12 dollars.', '24 dollars.', '48 dollars.'],
      'correctIndex': 0,
      'explain': '12×3=36.',
    },
    {
      'question':
          "M: When will the contract start?\nW: On July 1st if you sign this week.\nQ: What is the start date if they sign this week?",
      'options': ['July 1st.', 'June 1st.', 'July 10th.', 'August 1st.'],
      'correctIndex': 0,
      'explain': 'Điều kiện → 1/7.',
    },
    {
      'question':
          "W: The class runs from 9:30 to 11.\nM: Is there a break?\nW: Ten minutes at ten.\nQ: When is the break?",
      'options': ['10:00.', '9:30.', '11:00.', '10:30.'],
      'correctIndex': 0,
      'explain': 'Nghỉ 10h.',
    },
    {
      'question':
          "M: If we order now, can you deliver by Friday?\nW: Yes, with express shipping.\nQ: What is required for Friday delivery?",
      'options': [
        'Use express shipping.',
        'Order 1000 units.',
        'Pay extra tax.',
        'Change address.',
      ],
      'correctIndex': 0,
      'explain': 'Cần chuyển phát nhanh.',
    },
    {
      'question':
          "W: Tickets are \$15, students pay \$10.\nM: We have 2 students and 1 adult.\nQ: How much in total?",
      'options': ['35 dollars.', '30 dollars.', '25 dollars.', '40 dollars.'],
      'correctIndex': 0,
      'explain': '2×10 + 1×15 = 35.',
    },
    {
      'question':
          "M: If the supplier delays again, we’ll switch.\nW: I’ll note that in the contract.\nQ: What clause will be added?",
      'options': [
        'Switch supplier upon delay.',
        'Early payment discount.',
        'Free samples.',
        'Automatic renewal.',
      ],
      'correctIndex': 0,
      'explain': 'Điều kiện đổi nhà cung cấp nếu trễ.',
    },
  ];

  // Lesson 4 — Note-taking & paraphrase (keywords → paraphrase)
  final p3Lv800L4 = <Map<String, dynamic>>[
    {
      'question':
          "M: The seminar focuses on remote teamwork and time zones.\nW: So it’s about collaborating across locations?\nQ: What does the woman paraphrase?",
      'options': [
        'Working together from different places.',
        'Office renovation schedule.',
        'Budget approval process.',
        'On-site training only.',
      ],
      'correctIndex': 0,
      'explain': 'Paraphrase đúng ý chính.',
    },
    {
      'question':
          "W: We’ll phase out the old app by Q3.\nM: You mean discontinue it before October?\nQ: What is the timeline implied?",
      'options': [
        'Before October (by Q3).',
        'After December.',
        'In Q4.',
        'No timeline.',
      ],
      'correctIndex': 0,
      'explain': 'Q3 kết thúc trước tháng 10.',
    },
    {
      'question':
          "M: We need to trim non-essential features.\nW: So cut optional functions first?\nQ: What is the paraphrase?",
      'options': [
        'Remove optional functions.',
        'Increase features.',
        'Delay release.',
        'Change platform.',
      ],
      'correctIndex': 0,
      'explain': 'Paraphrase chính xác.',
    },
    {
      'question':
          "W: Let’s circle back after the pilot.\nM: You mean review results next week?\nQ: What will they likely do?",
      'options': [
        'Review pilot results.',
        'Launch globally.',
        'Cancel the pilot.',
        'Hire new staff.',
      ],
      'correctIndex': 0,
      'explain': '“circle back” = xem lại.',
    },
    {
      'question':
          "M: We’re short-staffed this quarter.\nW: So we should prioritize critical tasks?\nQ: What is suggested?",
      'options': [
        'Focus on critical tasks.',
        'Hire immediately.',
        'Stop projects.',
        'Extend vacations.',
      ],
      'correctIndex': 0,
      'explain': 'Ưu tiên việc quan trọng.',
    },
    {
      'question':
          "W: The client wants us to iterate faster.\nM: Do more frequent updates?\nQ: What does the man suggest?",
      'options': [
        'Increase update frequency.',
        'Reduce testing.',
        'Stop feedback.',
        'Cut scope drastically.',
      ],
      'correctIndex': 0,
      'explain': 'Paraphrase “iterate faster”.',
    },
    {
      'question':
          "M: Let’s allocate a modest budget.\nW: You mean keep expenses minimal?\nQ: What is the paraphrase?",
      'options': [
        'Keep costs low.',
        'Increase spending.',
        'Delay payments.',
        'Change vendors.',
      ],
      'correctIndex': 0,
      'explain': 'Giữ chi phí thấp.',
    },
    {
      'question':
          "W: We’ll need stakeholder buy-in.\nM: So, get management approval first?\nQ: What must they secure?",
      'options': [
        'Approval from management.',
        'A bigger office.',
        'New tools.',
        'Extra vacation days.',
      ],
      'correctIndex': 0,
      'explain': 'Buy-in = đồng thuận/phê duyệt.',
    },
    {
      'question':
          "M: The plan hinges on supplier reliability.\nW: So if they fail, the plan falls apart?\nQ: What is the key risk?",
      'options': [
        'Supplier unreliability.',
        'Weather delays.',
        'Employee turnover.',
        'Marketing costs.',
      ],
      'correctIndex': 0,
      'explain': 'Điểm mấu chốt là độ tin cậy NCC.',
    },
    {
      'question':
          "W: We should sunset the legacy system.\nM: You mean gradually retire it?\nQ: What will they likely do?",
      'options': [
        'Phase out the old system.',
        'Expand the old system.',
        'Open-source it now.',
        'Hire more admins.',
      ],
      'correctIndex': 0,
      'explain': '“Sunset” = ngừng dần.',
    },
  ];

  // Lesson 5 — Mixed (advanced review)
  final p3Lv800L5 = <Map<String, dynamic>>[
    {
      'question':
          "M: Do you know when the interview starts?\nW: At 2:30 in Room 5.\nQ: What information is provided?",
      'options': [
        'Time and place.',
        'Only the date.',
        'Only the interviewer.',
        'Only the topic.',
      ],
      'correctIndex': 0,
      'explain': 'Giờ + phòng.',
    },
    {
      'question':
          "W: Can you make it to the meeting?\nM: I’m tied up until noon.\nQ: What does the man imply?",
      'options': [
        'He cannot attend before noon.',
        'He will be early.',
        'He is on vacation.',
        'He forgot the meeting.',
      ],
      'correctIndex': 0,
      'explain': 'Bận tới trưa.',
    },
    {
      'question':
          "M: The quote is valid through the 30th.\nW: We’ll confirm by the 28th.\nQ: What will the woman do?",
      'options': [
        'Confirm before the deadline.',
        'Ask for a new quote.',
        'Decline the offer.',
        'Delay to next month.',
      ],
      'correctIndex': 0,
      'explain': 'Xác nhận trước hạn.',
    },
    {
      'question':
          "W: The fare to downtown is \$18.\nM: Do you take cards?\nQ: What is the man asking about?",
      'options': [
        'Payment method.',
        'Departure time.',
        'Seat type.',
        'Discount.',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi cách thanh toán.',
    },
    {
      'question':
          "M: Could you expedite the repair?\nW: We’ll prioritize your ticket.\nQ: What will happen?",
      'options': [
        'The repair will be prioritized.',
        'They will cancel it.',
        'They will ignore it.',
        'They will charge extra automatically.',
      ],
      'correctIndex': 0,
      'explain': 'Ưu tiên xử lý.',
    },
    {
      'question':
          "W: The venue seats fifty.\nM: We expect around forty-five.\nQ: What is true?",
      'options': [
        'The venue is large enough.',
        'They need a bigger venue.',
        'They will exceed capacity.',
        'They must split sessions.',
      ],
      'correctIndex': 0,
      'explain': '50 > 45 nên đủ chỗ.',
    },
    {
      'question':
          "M: Unless the supplier confirms today, we’ll postpone.\nW: I’ll call them again.\nQ: What will the woman do?",
      'options': [
        'Call the supplier again.',
        'Postpone immediately.',
        'Change supplier now.',
        'Cancel the order.',
      ],
      'correctIndex': 0,
      'explain': 'Gọi lại để xác nhận.',
    },
    {
      'question':
          "W: The meal comes with a drink.\nM: I’ll have iced tea, please.\nQ: What did the man choose?",
      'options': ['Iced tea.', 'Coffee.', 'Orange juice.', 'Water only.'],
      'correctIndex': 0,
      'explain': 'Chọn trà đá.',
    },
    {
      'question':
          "M: The shuttle runs every twenty minutes.\nW: Great, the next one should be soon.\nQ: What can be inferred?",
      'options': [
        'They won’t wait long.',
        'The shuttle is hourly.',
        'No shuttles today.',
        'They missed the last one.',
      ],
      'correctIndex': 0,
      'explain': 'Chạy 20 phút/chuyến → sắp có.',
    },
    {
      'question':
          "W: We’ll need a deposit to secure the booking.\nM: I’ll transfer it today.\nQ: What will the man do?",
      'options': [
        'Pay the deposit today.',
        'Cancel the booking.',
        'Request a refund.',
        'Change the date.',
      ],
      'correctIndex': 0,
      'explain': 'Thanh toán tiền đặt cọc.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  /// ===== LRMaterials ========
  // lv300
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại ngắn – Shopping',
    questions: p3Lv300L1,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại dịch vụ – Travel/Hotel',
    questions: p3Lv300L2,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hội thoại ăn uống – Food & Restaurant',
    questions: p3Lv300L3,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Nhận diện who/where/what',
    questions: p3Lv300L4,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv300L5,
  );

  // lv600
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại công việc – Meeting',
    questions: p3Lv600L1,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại dịch vụ khách hàng',
    questions: p3Lv600L2,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Yêu cầu & đề xuất – Requests & Suggestions',
    questions: p3Lv600L3,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Nghe ý chính & chi tiết',
    questions: p3Lv600L4,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv600L5,
  );

  // lv800
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại dài – Negotiation',
    questions: p3Lv800L1,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại khiếu nại & giải pháp',
    questions: p3Lv800L2,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hội thoại có số liệu & điều kiện',
    questions: p3Lv800L3,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Note-taking & paraphrase',
    questions: p3Lv800L4,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv800L5,
  );

  /// ===== FullMaterials ========
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại ngắn – Shopping',
    questions: p3Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại dịch vụ – Travel/Hotel',
    questions: p3Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hội thoại ăn uống – Food & Restaurant',
    questions: p3Lv300L3,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Nhận diện who/where/what',
    questions: p3Lv300L4,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv300L5,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại công việc – Meeting',
    questions: p3Lv600L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại dịch vụ khách hàng',
    questions: p3Lv600L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Yêu cầu & đề xuất – Requests & Suggestions',
    questions: p3Lv600L3,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Nghe ý chính & chi tiết',
    questions: p3Lv600L4,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv600L5,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hội thoại dài – Negotiation',
    questions: p3Lv800L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Hội thoại khiếu nại & giải pháp',
    questions: p3Lv800L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hội thoại có số liệu & điều kiện',
    questions: p3Lv800L3,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Note-taking & paraphrase',
    questions: p3Lv800L4,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p3Lv800L5,
  );
}
