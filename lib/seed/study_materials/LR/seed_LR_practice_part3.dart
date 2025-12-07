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
      'question': "What is the man offering?",
      'options': ['A medium blue shirt.', 'A large green shirt.', 'A discount coupon.', 'Home delivery.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Do you have this shirt in medium?\nMan: Let me check... Yes, but only in blue.\n\n“Yes, but only in blue” → size medium, màu xanh.',
    },
    {
      'question': "What does the woman say is required?",
      'options': ['A receipt.', 'A membership card.', 'An ID photo.', 'Cash payment.'],
      'correctIndex': 0,
      'explain': '“\nMan: Can I return this jacket?\nWoman: Sure, with the receipt.\n\nPhải có hóa đơn.',
    },
    {
      'question': "What is the promotion?",
      'options': ['Mua 1 tặng 1 nửa giá.', 'Giảm 50% mọi mặt hàng.', 'Miễn phí giao hàng.', 'Tặng voucher 10\$.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is there a sale on shoes?\nMan: Buy one, get the second half off.\n\n“second half off” = đôi thứ hai giảm 50%.',
    },
    {
      'question': "What product type has a warranty?",
      'options': ['Electronics.', 'Clothing.', 'Groceries.', 'Furniture only.'],
      'correctIndex': 0,
      'explain': '“\nMan: Does this come with a warranty?\nWoman: One year for electronics.\n\nBảo hành 1 năm cho đồ điện tử.',
    },
    {
      'question': "What should the woman do?",
      'options': ['Go to the demo table.', 'Pay at the cashier.', 'Ask for a refund.', 'Order online.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Where can I try these headphones?\nMan: The demo table over there.\n\nHướng dẫn tới bàn trải nghiệm.',
    },
    {
      'question': "What is implied about the apples?",
      'options': ['They are fresh.', 'They are discounted.', 'They are imported.', 'They are out of stock.'],
      'correctIndex': 0,
      'explain': '“\nMan: Are these apples fresh?\nWoman: They arrived this morning.\n\nVừa về sáng nay → tươi.',
    },
    {
      'question': "What is true?",
      'options': ['They accept multiple payment methods.', 'They only take cash.', 'They charge extra for cards.', 'They don’t accept mobile pay.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Do you take credit cards?\nMan: Yes, and mobile payments, too.\n\nChấp nhận thẻ và ví điện tử.',
    },
    {
      'question': "What is the condition?",
      'options': ['Spend more than \$30.', 'Buy two items.', 'Join membership.', 'Use cash only.'],
      'correctIndex': 0,
      'explain': '“\nMan: I need gift wrapping.\nWoman: It’s free for purchases over \$30.\n\nGói quà miễn phí nếu > \$30.',
    },
    {
      'question': "Where should she go?",
      'options': ['To the fitting area.', 'To the cashier.', 'To the info desk.', 'To the exit.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can I try these shoes on?\nMan: Sure, the fitting area is in the back.\n\nĐi khu thử đồ.',
    },
    {
      'question': "What is required for price match?",
      'options': ['A competitor’s advertisement.', 'A loyalty card.', 'A manager’s approval.', 'Online order number.'],
      'correctIndex': 0,
      'explain': '“\nMan: Do you price-match?\nWoman: Yes, if you show the competitor’s ad.\n\nCần bằng chứng giá từ đối thủ.',
    },
  ];

  // Lesson 2 — Travel/Hotel (time, location, service)
  final p3Lv300L2 = <Map<String, dynamic>>[
    {
      'question': "When can guests check in?",
      'options': ['After 2 p.m.', 'Before noon.', 'Any time.', 'Only at 6 p.m.'],
      'correctIndex': 0,
      'explain': '“\nMan: What time is check-in?\nWoman: After 2 p.m.\n\nCheck-in sau 2 giờ chiều.',
    },
    {
      'question': "What is true about breakfast?",
      'options': ['It’s included, 6–9 a.m.', 'Not included.', 'Available all day.', 'Starts at 9 p.m.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is breakfast included?\nMan: Yes, from 6 to 9.\n\nBao gồm và khung giờ 6–9.',
    },
    {
      'question': "Where should the man go?",
      'options': ['Platform 3.', 'Gate C.', 'Platform 1.', 'Counter 3.'],
      'correctIndex': 0,
      'explain': '“\nMan: Which platform for the airport train?\nWoman: Platform 3.\n\nĐi sân ga số 3.',
    },
    {
      'question': "What will the man do?",
      'options': ['Rebook the flight.', 'Refund the ticket.', 'Upgrade the seat.', 'Provide a taxi.'],
      'correctIndex': 0,
      'explain': '“\nWoman: My flight was canceled.\nMan: We can rebook you for tomorrow morning.\n\nĐặt lại vé cho sáng hôm sau.',
    },
    {
      'question': "How often does the shuttle run?",
      'options': ['Every 30 minutes.', 'Once a day.', 'Every 3 hours.', 'It’s not available.'],
      'correctIndex': 0,
      'explain': '“\nMan: Is there a shuttle to downtown?\nWoman: Every 30 minutes.\n\nTần suất 30 phút/chuyến.',
    },
    {
      'question': "What is true?",
      'options': ['Late checkout is possible with a fee.', 'Late checkout is free.', 'Checkout only at noon.', 'Checkout not allowed.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can I get a late checkout?\nMan: Until 1 p.m. for a small fee.\n\nĐược trễ tới 1 giờ chiều, có phí.',
    },
    {
      'question': "Where is the rental desk?",
      'options': ['Next to baggage claim.', 'Across the street.', 'At platform 3.', 'In the city center.'],
      'correctIndex': 0,
      'explain': '“\nMan: Where can I rent a car?\nWoman: The rental desk next to baggage claim.\n\nNgay cạnh khu lấy hành lý.',
    },
    {
      'question': "How do guests access Wi-Fi?",
      'options': ['Use the room number.', 'Pay at reception.', 'Ask for a paper code.', 'Call support only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is Wi-Fi free here?\nMan: Yes, just log in with your room number.\n\nĐăng nhập bằng số phòng.',
    },
    {
      'question': "When do passengers board?",
      'options': ['10:25.', '12:10.', '10:52.', 'Gate 25.'],
      'correctIndex': 0,
      'explain': '“\nMan: What time is boarding?\nWoman: At 10:25, Gate 12.\n\nBoarding lúc 10:25.',
    },
    {
      'question': "Where can luggage be stored?",
      'options': ['Behind the front desk.', 'Inside the room.', 'At platform 2.', 'No storage available.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is there a luggage storage?\nMan: Yes, behind the front desk.\n\nCó chỗ gửi sau quầy lễ tân.',
    },
  ];

  // Lesson 3 — Food & Restaurant (menu, order, bill)
  final p3Lv300L3 = <Map<String, dynamic>>[
    {
      'question': "What does the waiter suggest?",
      'options': ['Grilled salmon.', 'Fried chicken.', 'Vegan salad.', 'Pasta only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: What do you recommend?\nMan: The grilled salmon is popular.\n\nMón gợi ý: cá hồi nướng.',
    },
    {
      'question': "What will the server do?",
      'options': ['Provide two checks.', 'Offer a discount.', 'Add a service fee.', 'Refuse the request.'],
      'correctIndex': 0,
      'explain': '“\nMan: Can we split the bill?\nWoman: Sure, two separate checks.\n\nTách hóa đơn.',
    },
    {
      'question': "What is true about the soup?",
      'options': ['It’s vegetarian.', 'It contains meat.', 'It has cheese.', 'It’s spicy beef.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is the soup vegetarian?\nMan: Yes, no meat or dairy.\n\nKhông thịt, không sữa.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Correct the order.', 'Cancel the bill.', 'Offer free dessert only.', 'Ask him to wait until tomorrow.'],
      'correctIndex': 0,
      'explain': '“\nMan: I ordered a sandwich, not a burger.\nWoman: I’m sorry, I’ll fix it right away.\n\nSửa món ngay.',
    },
    {
      'question': "What is the man asking?",
      'options': ['Water type preference.', 'Number of glasses.', 'Add ice.', 'Extra napkins.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could we get some water?\nMan: Still or sparkling?\n\nHỏi loại nước: thường hay có gas.',
    },
    {
      'question': "What suits the man’s diet?",
      'options': ['Mushroom risotto.', 'Beef stew.', 'Cheese pizza.', 'Chicken curry.'],
      'correctIndex': 0,
      'explain': '“\nMan: Do you have any vegan options?\nWoman: Yes, the mushroom risotto.\n\nMón thuần chay gợi ý.',
    },
    {
      'question': "What did the man say?",
      'options': ['15 minutes.', '50 minutes.', '5 minutes.', 'No waiting.'],
      'correctIndex': 0,
      'explain': '“\nWoman: How long is the wait?\nMan: About fifteen minutes.\n\nThời gian chờ ~ 15’.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Bring the menu.', 'Take payment.', 'Refuse the request.', 'Offer a discount.'],
      'correctIndex': 0,
      'explain': '“\nMan: Can I see the dessert menu?\nWoman: I’ll bring it right away.\n\nMang menu tráng miệng.',
    },
    {
      'question': "What is true about the bill?",
      'options': ['Includes a 10% service charge.', 'No tax included.', 'Tip is mandatory 20%.', 'It’s cash-only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Is service included?\nMan: A 10% service charge is added.\n\nCó phụ phí 10%.',
    },
    {
      'question': "What will happen?",
      'options': ['The order will be prepared faster.', 'They must leave.', 'They get a refund.', 'They will wait longer.'],
      'correctIndex': 0,
      'explain': '“\nMan: We’re in a hurry.\nWoman: I’ll have your order prioritized.\n\nƯu tiên món → ra nhanh hơn.',
    },
  ];

  // Lesson 4 — Identify who/where/what
  final p3Lv300L4 = <Map<String, dynamic>>[
    {
      'question': "Who is the woman likely to be?",
      'options': ['A clerk.', 'A delivery driver.', 'A customer.', 'A security guard.'],
      'correctIndex': 0,
      'explain': '“\nMan: I’ll pick up the package at the counter.\nWoman: Bring your ID, please.\n\nYêu cầu ID → nhân viên quầy.',
    },
    {
      'question': "Where are they?",
      'options': ['On a train.', 'At a bank.', 'In a hotel.', 'In a classroom.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The next stop is Central Station.\nMan: Great, that’s my stop.\n\nCó “next stop” → tàu/xe.',
    },
    {
      'question': "What are they talking about?",
      'options': ['Paying at a store.', 'Booking a room.', 'Scheduling a meeting.', 'Repairing a phone.'],
      'correctIndex': 0,
      'explain': '“\nMan: Your total is \$24.50. Do you need a bag?\nWoman: Yes, please.\n\nTổng tiền & túi → thu ngân.',
    },
    {
      'question': "Where are they?",
      'options': ['At a hotel.', 'At a clinic.', 'At an office.', 'At a school.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Your room includes breakfast and Wi-Fi.\nMan: What time is checkout?\n\nNhắc “room, checkout”.',
    },
    {
      'question': "What are they discussing?",
      'options': ['A schedule change.', 'A product price.', 'A food order.', 'Travel insurance.'],
      'correctIndex': 0,
      'explain': '“\nMan: The meeting’s moved to 3 p.m.\nWoman: I’ll update the team.\n\nĐổi giờ họp.',
    },
    {
      'question': "Who is the man likely to be?",
      'options': ['A recipient.', 'A chef.', 'A driver instructor.', 'A cashier.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you sign here?\nMan: Sure. Do I get a copy?\n\nKý & nhận bản sao → người nhận hàng/tài liệu.',
    },
    {
      'question': "Where are they?",
      'options': ['At a restaurant.', 'At a cinema.', 'At a bank.', 'At a hospital.'],
      'correctIndex': 0,
      'explain': '“\nMan: Your table will be ready in five minutes.\nWoman: We’ll wait at the bar.\n\nBàn sẽ sẵn sàng → nhà hàng.',
    },
    {
      'question': "What are they talking about?",
      'options': ['Air travel.', 'Car rental.', 'Hotel check-in.', 'Job interview.'],
      'correctIndex': 0,
      'explain': '“\nWoman: You can board through Gate 7.\nMan: Thanks, I’ll head there now.\n\nBoarding & Gate.',
    },
    {
      'question': "Who is the woman likely to be?",
      'options': ['IT support.', 'Cashier.', 'Nurse.', 'Tour guide.'],
      'correctIndex': 0,
      'explain': '“\nMan: Could you replace the ink cartridge?\nWoman: I’ll send a technician.\n\nCử kỹ thuật viên → IT/support.',
    },
    {
      'question': "What are they talking about?",
      'options': ['A delivery.', 'A medical test.', 'A class schedule.', 'A hotel upgrade.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Your parcel will arrive by Friday.\nMan: Great, I need it for the event.\n\nParcel & arrive.',
    },
  ];

  // Lesson 5 — Mixed (shopping + travel + restaurant)
  final p3Lv300L5 = <Map<String, dynamic>>[
    {
      'question': "What are they talking about?",
      'options': ['A menu choice.', 'Flight options.', 'Refund process.', 'Job duties.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Do you have vegetarian dishes?\nMan: Yes, the tofu curry.\n\nChọn món chay.',
    },
    {
      'question': "Where are they?",
      'options': ['At an airport gate.', 'At a supermarket.', 'At a bank.', 'At a theater.'],
      'correctIndex': 0,
      'explain': '“\nMan: Is this the line for boarding?\nWoman: Yes, have your passport ready.\n\nPassport + boarding.',
    },
    {
      'question': "What’s required for the return?",
      'options': ['Receipt.', 'Membership.', 'Cash only.', 'Original box not needed.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can I return this within 14 days?\nMan: Yes, with the receipt.\n\nCần hóa đơn.',
    },
    {
      'question': "What is the time frame?",
      'options': ['6–9 a.m.', '9–6 p.m.', '7–10 p.m.', 'All day.'],
      'correctIndex': 0,
      'explain': '“\nMan: What time is breakfast served?\nWoman: From 6 to 9.\n\nKhung giờ ăn sáng.',
    },
    {
      'question': "What will the man do?",
      'options': ['Bring the check.', 'Offer dessert.', 'Change the table.', 'Refuse the request.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could we get the bill?\nMan: I’ll bring it right over.\n\nMang hóa đơn.',
    },
    {
      'question': "What should the man do?",
      'options': ['Go left outside.', 'Go to platform 3.', 'Wait inside.', 'Call customer service.'],
      'correctIndex': 0,
      'explain': '“\nMan: Where’s the taxi stand?\nWoman: Outside, to the left.\n\nĐi ra ngoài, rẽ trái.',
    },
    {
      'question': "What is true about delivery?",
      'options': ['Free if over \$50.', 'Only in-store pickup.', 'No deliveries today.', 'Express only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Do you deliver?\nMan: Yes, free over \$50.\n\nMiễn phí nếu đơn > \$50.',
    },
    {
      'question': "What seat is available?",
      'options': ['Aisle seat.', 'Window seat.', 'Middle seat.', 'No seats.'],
      'correctIndex': 0,
      'explain': '“\nMan: Any seats near the window?\nWoman: Sorry, aisle only.\n\nChỉ còn ghế lối đi.',
    },
    {
      'question': "Where should she go?",
      'options': ['To the fitting rooms.', 'To the cashier.', 'To the exit.', 'To the info desk.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can I try this coat?\nMan: Fitting rooms are down the hall.\n\nĐi phòng thử đồ.',
    },
    {
      'question': "What does the woman mean?",
      'options': ['It opens at 7.', 'It is open now.', 'It closes at 7.', 'It is closed for the day.'],
      'correctIndex': 0,
      'explain': '“\nMan: Is the pool open now?\nWoman: It opens at 7.\n\nMở lúc 7 giờ.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // Lesson 1 — Work/Meeting (schedule, tasks, deadline)
  final p3Lv600L1 = <Map<String, dynamic>>[
    {
      'question': "What will the man do?",
      'options': ['Notify the team.', 'Cancel the meeting.', 'Book a venue.', 'Prepare lunch.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can we move the meeting to 3?\nMan: Fine, I’ll inform the team.\n\nAnh sẽ thông báo.',
    },
    {
      'question': "What does the woman promise?",
      'options': ['Send the draft tonight.', 'Finish the final report.', 'Print copies now.', 'Delay the deadline.'],
      'correctIndex': 0,
      'explain': '“\nMan: The draft is due tomorrow.\nWoman: I’ll send you the latest tonight.\n\nGửi bản mới tối nay.',
    },
    {
      'question': "What does the man volunteer to do?",
      'options': ['Take minutes.', 'Lead the meeting.', 'Reschedule.', 'Book a room.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Who can take minutes?\nMan: I’ll do it this time.\n\nXung phong ghi biên bản.',
    },
    {
      'question': "When will she send the slides?",
      'options': ['By noon.', 'By 5 p.m.', 'Tomorrow.', 'Next week.'],
      'correctIndex': 0,
      'explain': '“\nMan: Could you share the slides by noon?\nWoman: Sure, I’m almost done.\n\nĐồng ý gửi trước trưa.',
    },
    {
      'question': "What does the man offer?",
      'options': ['Work the morning shift.', 'Hire a temp.', 'Close the store.', 'Cancel shifts.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’re short on staff Friday.\nMan: I can cover the morning shift.\n\nNhận ca sáng.',
    },
    {
      'question': "What do they decide?",
      'options': ['Accelerate the schedule.', 'Cancel the order.', 'Ignore the request.', 'Change the product.'],
      'correctIndex': 0,
      'explain': '“\nMan: The client wants an earlier delivery.\nWoman: Then we must move up the timeline.\n\nĐẩy tiến độ lên.',
    },
    {
      'question': "What will the man do?",
      'options': ['Adjust access rights.', 'Send a new laptop.', 'Call the client.', 'Print the files.'],
      'correctIndex': 0,
      'explain': '“\nWoman: I can’t access the shared folder.\nMan: I’ll reset your permissions.\n\nReset quyền truy cập.',
    },
    {
      'question': "What is suggested?",
      'options': ['Cut optional items.', 'Ask for more funds.', 'Delay payment.', 'Change supplier.'],
      'correctIndex': 0,
      'explain': '“\nMan: The budget is over by 8%.\nWoman: Let’s remove optional items.\n\nGiảm hạng mục không bắt buộc.',
    },
    {
      'question': "What will the man do?",
      'options': ['Lead the kickoff.', 'Cancel the meeting.', 'Email minutes.', 'Order lunch.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you lead the kickoff tomorrow?\nMan: Sure, I’ll prepare an outline.\n\nĐồng ý lead buổi khởi động.',
    },
    {
      'question': "What does the woman mean by COB?",
      'options': ['End of business day Wednesday.', 'Start of day Wednesday.', 'Close of bank Friday.', 'Conference on Wednesday.'],
      'correctIndex': 0,
      'explain': '“\nMan: When is the deadline?\nWoman: COB Wednesday.\n\nCOB = close of business.',
    },
  ];

  // Lesson 2 — Customer Service (complaint, solution)
  final p3Lv600L2 = <Map<String, dynamic>>[
    {
      'question': "What will the man do?",
      'options': ['Send a replacement.', 'Issue a coupon.', 'Cancel the account.', 'Ignore the issue.'],
      'correctIndex': 0,
      'explain': '“\nWoman: My order arrived damaged.\nMan: I’m sorry. I’ll arrange a replacement.\n\nXử lý thay thế.',
    },
    {
      'question': "What is the solution?",
      'options': ['Refund the difference.', 'Free shipping.', 'Gift points.', 'Store credit only.'],
      'correctIndex': 0,
      'explain': '“\nMan: I was overcharged.\nWoman: Let me refund the difference.\n\nHoàn tiền phần chênh lệch.',
    },
    {
      'question': "What will happen?",
      'options': ['A technician visit.', 'A router replacement by mail.', 'A plan upgrade.', 'No action.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The internet keeps dropping.\nMan: I’ll send a technician this afternoon.\n\nCử kỹ thuật viên đến.',
    },
    {
      'question': "What does the woman suggest?",
      'options': ['Update the app.', 'Change the phone.', 'Create a new account.', 'Turn off Wi-Fi.'],
      'correctIndex': 0,
      'explain': '“\nMan: The app crashes on login.\nWoman: Please update to the latest version.\n\nCập nhật ứng dụng.',
    },
    {
      'question': "What will the man do?",
      'options': ['Check tracking and follow up.', 'Send a courier immediately.', 'Cancel the shipment.', 'Offer a coupon only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: My package is late.\nMan: I’ll check the tracking and call you back.\n\nKiểm tra & gọi lại.',
    },
    {
      'question': "What does the woman request?",
      'options': ['A restock notification.', 'A refund.', 'A substitute item now.', 'A manager call.'],
      'correctIndex': 0,
      'explain': '“\nMan: The item is out of stock.\nWoman: Could you notify me when it’s back?\n\nYêu cầu báo khi có hàng.',
    },
    {
      'question': "What will the company do?",
      'options': ['Repair for free.', 'Replace with fee.', 'Decline service.', 'Offer accessories.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The device is still under warranty.\nMan: Then we’ll repair it for free.\n\nBảo hành → sửa miễn phí.',
    },
    {
      'question': "What is offered?",
      'options': ['A different seat.', 'A free meal.', 'A refund.', 'A pillow only.'],
      'correctIndex': 0,
      'explain': '“\nMan: My seat won’t recline.\nWoman: I can move you to row 12.\n\nĐổi chỗ ngồi.',
    },
    {
      'question': "What will the man do?",
      'options': ['Resend the email.', 'Cancel the booking.', 'Change the address.', 'Issue a refund.'],
      'correctIndex': 0,
      'explain': '“\nWoman: I never got the confirmation email.\nMan: I’ll resend it now.\n\nGửi lại email xác nhận.',
    },
    {
      'question': "What is the resolution?",
      'options': ['Ship the missing part.', 'Collect the product.', 'Issue store credit.', 'Offer a discount code.'],
      'correctIndex': 0,
      'explain': '“\nMan: The product is missing a part.\nWoman: We’ll ship the missing piece today.\n\nGửi bổ sung linh kiện.',
    },
  ];

  // Lesson 3 — Requests & Suggestions (“Could you…”, “Why don’t we…”)
  final p3Lv600L3 = <Map<String, dynamic>>[
    {
      'question': "What will the man do?",
      'options': ['Review and comment.', 'Print the slides.', 'Lead the talk.', 'Cancel the review.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you review my slides?\nMan: Sure, I’ll send comments by 5.\n\nNhận xem & góp ý.',
    },
    {
      'question': "What do they agree to do?",
      'options': ['Choose a smaller venue.', 'Delay the event.', 'Invite more people.', 'Change the topic.'],
      'correctIndex': 0,
      'explain': '“\nMan: Why don’t we try a smaller venue?\nWoman: Good idea, it’ll save costs.\n\nĐồng ý địa điểm nhỏ hơn.',
    },
    {
      'question': "When will he call?",
      'options': ['After lunch.', 'Now.', 'Tomorrow.', 'Next week.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you call the vendor?\nMan: I’ll do it after lunch.\n\nSau bữa trưa.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Draft the agenda.', 'Cancel the email.', 'Schedule a meeting.', 'Print brochures.'],
      'correctIndex': 0,
      'explain': '“\nMan: Let’s send out the agenda today.\nWoman: I’ll draft it now.\n\nSoạn agenda.',
    },
    {
      'question': "What will the man do?",
      'options': ['Reserve a projector.', 'Fix the projector.', 'Buy a projector.', 'Borrow slides.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you reserve a projector?\nMan: I’ll book one online.\n\nĐặt máy chiếu.',
    },
    {
      'question': "What does the woman offer?",
      'options': ['Drive two coworkers.', 'Pay for gas.', 'Cancel attendance.', 'Rent a van.'],
      'correctIndex': 0,
      'explain': '“\nMan: Why don’t we share rides to the event?\nWoman: I can drive two people.\n\nĐề nghị chở 2 người.',
    },
    {
      'question': "What will the man do?",
      'options': ['Extend by two days.', 'Reject the request.', 'Assign more tasks.', 'Close the project.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you extend the deadline?\nMan: I can give you two more days.\n\nGia hạn 2 ngày.',
    },
    {
      'question': "When will they meet?",
      'options': ['At 9 a.m. tomorrow.', 'At 9 p.m. today.', 'At noon today.', 'Next week.'],
      'correctIndex': 0,
      'explain': '“\nMan: Let’s meet first thing tomorrow.\nWoman: I’ll book a room at nine.\n\nĐặt phòng lúc 9 sáng.',
    },
    {
      'question': "What will the man do?",
      'options': ['Forward the invoice.', 'Print the invoice.', 'Pay the invoice.', 'Reject the invoice.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you send the invoice to Accounts?\nMan: I’ll forward it now.\n\nChuyển tiếp hóa đơn.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Prepare a survey.', 'Call all users.', 'Stop the release.', 'Raise the price.'],
      'correctIndex': 0,
      'explain': '“\nMan: Why don’t we ask for user feedback?\nWoman: I’ll prepare a short survey.\n\nSoạn khảo sát.',
    },
  ];

  // Lesson 4 — Main idea vs detail
  final p3Lv600L4 = <Map<String, dynamic>>[
    {
      'question': "What is the main change?",
      'options': ['Room change.', 'Time change.', 'Speaker change.', 'Topic change.'],
      'correctIndex': 0,
      'explain': '“\nMan: The workshop is moved to Room B.\nWoman: Okay, do we still start at ten?\n\nĐổi phòng, không đổi giờ.',
    },
    {
      'question': "What detail is asked?",
      'options': ['Quantity.', 'Destination.', 'Price.', 'Color.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The shipment arrives on Friday.\nMan: Good. How many units?\n\nHỏi số lượng.',
    },
    {
      'question': "What detail is the woman asking for?",
      'options': ['Dietary options.', 'Ticket price.', 'Seat location.', 'Parking fee.'],
      'correctIndex': 0,
      'explain': '“\nMan: We’ll serve coffee and snacks.\nWoman: Any vegan options?\n\nChi tiết chế độ ăn.',
    },
    {
      'question': "What detail does the man want?",
      'options': ['Who will introduce.', 'The venue size.', 'The agenda order.', 'The coffee break time.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The keynote starts at 9.\nMan: Who’s introducing the speaker?\n\nHỏi người giới thiệu.',
    },
    {
      'question': "What is the woman confirming?",
      'options': ['Whether marketing is included.', 'Exact date.', 'Payment method.', 'Travel plan.'],
      'correctIndex': 0,
      'explain': '“\nMan: The budget increased by 5%.\nWoman: Is marketing included?\n\nXác nhận hạng mục.',
    },
    {
      'question': "What is the man’s request?",
      'options': ['CC Maria.', 'Delay the email.', 'Print copies.', 'Change the format.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’ll email the report tonight.\nMan: Could you CC Maria?\n\nYêu cầu CC.',
    },
    {
      'question': "What detail does the woman ask?",
      'options': ['Whether there is Q&A.', 'The speaker fee.', 'Venue address.', 'Attendee list.'],
      'correctIndex': 0,
      'explain': '“\nMan: The demo lasts thirty minutes.\nWoman: Do we have Q&A?\n\nHỏi phần hỏi đáp.',
    },
    {
      'question': "What is the man concerned about?",
      'options': ['Power supply.', 'Staff count.', 'Poster size.', 'Ticket price.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Our stand is near Entrance A.\nMan: Do we have power outlets?\n\nỔ điện cho gian hàng.',
    },
    {
      'question': "What detail is needed?",
      'options': ['Tracking number.', 'Courier name.', 'Weight.', 'Color.'],
      'correctIndex': 0,
      'explain': '“\nMan: I’ll send the contract by courier.\nWoman: What’s the tracking number?\n\nHỏi mã theo dõi.',
    },
    {
      'question': "What detail is asked?",
      'options': ['Equipment requirement.', 'Parking info.', 'Dress code.', 'Lunch menu.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The training is on Tuesday.\nMan: Do we need laptops?\n\nHỏi cần mang laptop không.',
    },
  ];

  // Lesson 5 — Mixed (review)
  final p3Lv600L5 = <Map<String, dynamic>>[
    {
      'question': "What will they do?",
      'options': ['Reschedule.', 'Cancel.', 'Extend the call.', 'Hire a translator.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The client wants to push back the call.\nMan: Let’s reschedule for Thursday.\n\nĐổi lịch sang thứ Năm.',
    },
    {
      'question': "What is the solution?",
      'options': ['Update firmware.', 'Replace battery.', 'Stop using it.', 'Add a case.'],
      'correctIndex': 0,
      'explain': '“\nMan: The device overheats.\nWoman: Use the latest firmware.\n\nCập nhật phần mềm máy.',
    },
    {
      'question': "What has the man done?",
      'options': ['Emailed the invoice.', 'Printed the invoice.', 'Paid the invoice.', 'Rejected the invoice.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you send me the invoice?\nMan: I’ve just emailed it.\n\nĐã gửi qua email.',
    },
    {
      'question': "What are they discussing?",
      'options': ['Menu choices.', 'Travel plans.', 'Office rent.', 'Delivery fees.'],
      'correctIndex': 0,
      'explain': '“\nMan: Any vegetarian options?\nWoman: Yes, a quinoa salad.\n\nChọn món ăn.',
    },
    {
      'question': "Where should they go?",
      'options': ['Counter C.', 'Gate C.', 'Platform C.', 'Counter A.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Where do we check in?\nMan: Counter C for domestic flights.\n\nQuầy C cho nội địa.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Call to speed up.', 'Find a new supplier.', 'Cancel the order.', 'Send an email only.'],
      'correctIndex': 0,
      'explain': '“\nMan: The supplier is late.\nWoman: I’ll call and expedite.\n\nGọi hối thúc.',
    },
    {
      'question': "What will the man do?",
      'options': ['Book a room.', 'Order lunch.', 'Cancel the meeting.', 'Invite guests.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Could you book a room for 10 a.m.?\nMan: I’ll reserve Meeting B.\n\nĐặt phòng họp.',
    },
    {
      'question': "What is offered?",
      'options': ['Milk with decaf.', 'Tea.', 'A refund.', 'Delivery.'],
      'correctIndex': 0,
      'explain': '“\nMan: Do you have decaf coffee?\nWoman: Yes, would you like milk?\n\nĐề nghị thêm sữa.',
    },
    {
      'question': "What did the woman provide?",
      'options': ['Directions.', 'A discount.', 'A schedule.', 'A ticket.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The taxi stand is across the street.\nMan: Thanks.\n\nChỉ đường.',
    },
    {
      'question': "Where are they most likely?",
      'options': ['At a restaurant.', 'At an office.', 'At a hotel.', 'At a bank.'],
      'correctIndex': 0,
      'explain': '“\nMan: Can we get separate checks?\nWoman: Sure.\n\nTách hóa đơn → nhà hàng.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // Lesson 1 — Long negotiation (deal/contract)
  final p3Lv800L1 = <Map<String, dynamic>>[
    {
      'question': "What condition leads to a discount?",
      'options': ['Ordering 700 units.', 'Paying in cash.', 'Signing a 2-year contract.', 'Local pickup.'],
      'correctIndex': 0,
      'explain': '“\nMan: The price seems high for 500 units.\nWoman: If you increase to 700, we can give 8% off.\nMan: Could you include express shipping?\n\nTăng số lượng lên 700 → giảm 8%.',
    },
    {
      'question': "What will NOT be changed?",
      'options': ['Quality inspection.', 'Delivery date.', 'Price.', 'Quantity.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We need delivery by the 15th.\nMan: That’s tight—unless we cut the inspection stage.\nWoman: Quality is non-negotiable.\n\n“Quality is non-negotiable”.',
    },
    {
      'question': "What is required for longer warranty?",
      'options': ['Premium plan.', 'Advance payment.', 'Bigger order.', 'On-site training.'],
      'correctIndex': 0,
      'explain': '“\nMan: Can you extend the warranty to 18 months?\nWoman: We can, if you choose the premium plan.\n\nCần premium plan.',
    },
    {
      'question': "What will be adjusted?",
      'options': ['The feature set.', 'The tax rate.', 'The delivery address.', 'The payment currency.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Our budget allows \$20,000.\nMan: Then we’ll remove optional features.\n\nCắt tính năng tùy chọn.',
    },
    {
      'question': "What is included?",
      'options': ['Monthly maintenance (year 1).', 'Free spare parts for 5 years.', 'Daily support on site.', 'Lifetime warranty.'],
      'correctIndex': 0,
      'explain': '“\nMan: We require monthly maintenance.\nWoman: That’s included for the first year.\n\nBao gồm bảo trì tháng trong năm đầu.',
    },
    {
      'question': "What is the payment term?",
      'options': ['50/50 (deposit & on delivery).', 'Full upfront.', 'Monthly installments.', 'After 60 days.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can we split the payment?\nMan: 50% upfront, the rest on delivery.\n\nĐiều khoản thanh toán.',
    },
    {
      'question': "What did they agree on?",
      'options': ['Delay penalty of 1%/week.', 'Early payment bonus.', 'Free upgrades.', 'Longer warranty.'],
      'correctIndex': 0,
      'explain': '“\nMan: Let’s add a penalty clause for delays.\nWoman: Reasonable—1% per week.\n\nPhạt trễ tiến độ.',
    },
    {
      'question': "What is the new plan?",
      'options': ['Split delivery into two batches.', 'Cancel the order.', 'Air ship only.', 'Single bulk shipment.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Delivery in batches could help.\nMan: Okay, two shipments: half now, half next month.\n\nChia lô giao hàng.',
    },
    {
      'question': "What will the woman change?",
      'options': ['Quantity.', 'Unit price.', 'Payment term.', 'Warranty.'],
      'correctIndex': 0,
      'explain': '“\nMan: We can’t go below \$27 per unit.\nWoman: Then we’ll reduce the order to 400.\n\nGiảm số lượng đặt.',
    },
    {
      'question': "What condition was added?",
      'options': ['Training sessions included.', 'Free hardware.', 'Extended warranty.', 'Office renovation.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’ll sign if training is included.\nMan: Agreed—two online sessions.\n\nBao gồm 2 khóa huấn luyện online.',
    },
  ];

  // Lesson 2 — Complaint & solution (logic)
  final p3Lv800L2 = <Map<String, dynamic>>[
    {
      'question': "What is the solution?",
      'options': ['Install the new patch and restart.', 'Replace the computer.', 'Change the password.', 'Use offline mode.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The software keeps freezing.\nMan: We released a patch today. Install it and restart.\n\nCài bản vá rồi khởi động lại.',
    },
    {
      'question': "What does the woman offer?",
      'options': ['A different room.', 'A refund.', 'Free breakfast.', 'Late checkout only.'],
      'correctIndex': 0,
      'explain': '“\nMan: The room smells like smoke.\nWoman: I can move you to a non-smoking floor.\n\nChuyển phòng không hút thuốc.',
    },
    {
      'question': "What will the company do?",
      'options': ['Send missing cartons, shipping covered.', 'Cancel the order.', 'Ask for pickup.', 'Charge extra.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The shipment arrived incomplete.\nMan: We’ll send the missing cartons and cover shipping.\n\nGửi bù phần thiếu & chịu phí.',
    },
    {
      'question': "What action will be taken?",
      'options': ['Issue a corrected invoice.', 'Offer a free meal.', 'Provide store credit.', 'Ignore the request.'],
      'correctIndex': 0,
      'explain': '“\nMan: The bill has an extra charge.\nWoman: Sorry—we’ll issue a corrected invoice.\n\nXuất hoá đơn chỉnh sửa.',
    },
    {
      'question': "What are the options?",
      'options': ['Lubricate or replace the fan.', 'Refund immediately.', 'Change the color.', 'Extend the cable.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The device is noisy.\nMan: We can lubricate the fan or replace it.\n\nHai phương án khắc phục.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Change the room and reset router.', 'Provide a new laptop.', 'Cancel the booking.', 'Offer breakfast coupons.'],
      'correctIndex': 0,
      'explain': '“\nMan: Our Wi-Fi is unstable.\nWoman: I’ll move you closer to the router and reset it.\n\nĐổi phòng gần router + reset.',
    },
    {
      'question': "What are the remedies?",
      'options': ['Partial refund or reschedule.', 'Full refund only.', 'Free lunch.', 'Taxi voucher only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The tour was shorter than promised.\nMan: We’ll refund 20% or reschedule you.\n\nHoàn 20% hoặc đổi lịch.',
    },
    {
      'question': "What will the company provide?",
      'options': ['Express shipping for the next order.', 'A free product now.', 'Cancel subscription.', 'Store credit only.'],
      'correctIndex': 0,
      'explain': '“\nMan: My order arrived late.\nWoman: We’ll upgrade you to express shipping next time.\n\nNâng cấp vận chuyển lần tới.',
    },
    {
      'question': "What will the man do?",
      'options': ['Escalate to engineering and follow up.', 'Issue a refund.', 'Replace the phone.', 'Close the ticket.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The app keeps logging me out.\nMan: I’ll escalate to engineering and follow up.\n\nChuyển cấp & cập nhật lại.',
    },
    {
      'question': "What is the resolution?",
      'options': ['Send a replacement printer.', 'Dispatch a cleaning crew.', 'Offer ink discount.', 'Extend warranty only.'],
      'correctIndex': 0,
      'explain': '“\nMan: The printer jams constantly.\nWoman: We’ll send a replacement unit tomorrow.\n\nGửi máy thay thế.',
    },
  ];

  // Lesson 3 — Numbers & conditions (prices, dates, if/when/unless)
  final p3Lv800L3 = <Map<String, dynamic>>[
    {
      'question': "How much with installation?",
      'options': ['550 dollars.', '480 dollars.', '530 dollars.', '505 dollars.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The quote is \$480 including tax.\nMan: If we add installation, what’s the total?\nWoman: \$550.\n\nTổng \$550.',
    },
    {
      'question': "When will it arrive if shipped today?",
      'options': ['On the 13th.', 'On the 14th.', 'On the 15th.', 'Next month.'],
      'correctIndex': 0,
      'explain': '“\nMan: Delivery by the 14th is tough.\nWoman: If we ship today, it’ll arrive on the 13th.\n\nGiao ngày 13.',
    },
    {
      'question': "What triggers the discount?",
      'options': ['Buying ≥ 3 items.', 'Paying cash.', 'Weekend only.', 'Members only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The discount applies when you buy at least three.\nMan: Then I’ll get four.\n\nĐiều kiện mua tối thiểu.',
    },
    {
      'question': "Where will the event likely be held?",
      'options': ['Outdoors.', 'Indoors.', 'Online.', 'Canceled.'],
      'correctIndex': 0,
      'explain': '“\nMan: Unless it rains, the event’s outdoors.\nWoman: Forecast says clear skies.\n\nKhông mưa → ngoài trời.',
    },
    {
      'question': "What is the total fee?",
      'options': ['36 dollars.', '12 dollars.', '24 dollars.', '48 dollars.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The fee is \$12 per hour.\nMan: We’ll need it for 3 hours.\n\n12×3=36.',
    },
    {
      'question': "What is the start date if they sign this week?",
      'options': ['July 1st.', 'June 1st.', 'July 10th.', 'August 1st.'],
      'correctIndex': 0,
      'explain': '“\nMan: When will the contract start?\nWoman: On July 1st if you sign this week.\n\nĐiều kiện → 1/7.',
    },
    {
      'question': "When is the break?",
      'options': ['10:00.', '9:30.', '11:00.', '10:30.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The class runs from 9:30 to 11.\nMan: Is there a break?\nWoman: Ten minutes at ten.\n\nNghỉ 10h.',
    },
    {
      'question': "What is required for Friday delivery?",
      'options': ['Use express shipping.', 'Order 1000 units.', 'Pay extra tax.', 'Change address.'],
      'correctIndex': 0,
      'explain': '“\nMan: If we order now, can you deliver by Friday?\nWoman: Yes, with express shipping.\n\nCần chuyển phát nhanh.',
    },
    {
      'question': "How much in total?",
      'options': ['35 dollars.', '30 dollars.', '25 dollars.', '40 dollars.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Tickets are \$15, students pay \$10.\nMan: We have 2 students and 1 adult.\n\n2×10 + 1×15 = 35.',
    },
    {
      'question': "What clause will be added?",
      'options': ['Switch supplier upon delay.', 'Early payment discount.', 'Free samples.', 'Automatic renewal.'],
      'correctIndex': 0,
      'explain': '“\nMan: If the supplier delays again, we’ll switch.\nWoman: I’ll note that in the contract.\n\nĐiều kiện đổi nhà cung cấp nếu trễ.',
    },
  ];

  // Lesson 4 — Note-taking & paraphrase (keywords → paraphrase)
  final p3Lv800L4 = <Map<String, dynamic>>[
    {
      'question': "What does the woman paraphrase?",
      'options': ['Working together from different places.', 'Office renovation schedule.', 'Budget approval process.', 'On-site training only.'],
      'correctIndex': 0,
      'explain': '“\nMan: The seminar focuses on remote teamwork and time zones.\nWoman: So it’s about collaborating across locations?\n\nParaphrase đúng ý chính.',
    },
    {
      'question': "What is the timeline implied?",
      'options': ['Before October (by Q3).', 'After December.', 'In Q4.', 'No timeline.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’ll phase out the old app by Q3.\nMan: You mean discontinue it before October?\n\nQ3 kết thúc trước tháng 10.',
    },
    {
      'question': "What is the paraphrase?",
      'options': ['Remove optional functions.', 'Increase features.', 'Delay release.', 'Change platform.'],
      'correctIndex': 0,
      'explain': '“\nMan: We need to trim non-essential features.\nWoman: So cut optional functions first?\n\nParaphrase chính xác.',
    },
    {
      'question': "What will they likely do?",
      'options': ['Review pilot results.', 'Launch globally.', 'Cancel the pilot.', 'Hire new staff.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Let’s circle back after the pilot.\nMan: You mean review results next week?\n\n“circle back” = xem lại.',
    },
    {
      'question': "What is suggested?",
      'options': ['Focus on critical tasks.', 'Hire immediately.', 'Stop projects.', 'Extend vacations.'],
      'correctIndex': 0,
      'explain': '“\nMan: We’re short-staffed this quarter.\nWoman: So we should prioritize critical tasks?\n\nƯu tiên việc quan trọng.',
    },
    {
      'question': "What does the man suggest?",
      'options': ['Increase update frequency.', 'Reduce testing.', 'Stop feedback.', 'Cut scope drastically.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The client wants us to iterate faster.\nMan: Do more frequent updates?\n\nParaphrase “iterate faster”.',
    },
    {
      'question': "What is the paraphrase?",
      'options': ['Keep costs low.', 'Increase spending.', 'Delay payments.', 'Change vendors.'],
      'correctIndex': 0,
      'explain': '“\nMan: Let’s allocate a modest budget.\nWoman: You mean keep expenses minimal?\n\nGiữ chi phí thấp.',
    },
    {
      'question': "What must they secure?",
      'options': ['Approval from management.', 'A bigger office.', 'New tools.', 'Extra vacation days.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’ll need stakeholder buy-in.\nMan: So, get management approval first?\n\nBuy-in = đồng thuận/phê duyệt.',
    },
    {
      'question': "What is the key risk?",
      'options': ['Supplier unreliability.', 'Weather delays.', 'Employee turnover.', 'Marketing costs.'],
      'correctIndex': 0,
      'explain': '“\nMan: The plan hinges on supplier reliability.\nWoman: So if they fail, the plan falls apart?\n\nĐiểm mấu chốt là độ tin cậy NCC.',
    },
    {
      'question': "What will they likely do?",
      'options': ['Phase out the old system.', 'Expand the old system.', 'Open-source it now.', 'Hire more admins.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We should sunset the legacy system.\nMan: You mean gradually retire it?\n\n“Sunset” = ngừng dần.',
    },
  ];

  // Lesson 5 — Mixed (advanced review)
  final p3Lv800L5 = <Map<String, dynamic>>[
    {
      'question': "What information is provided?",
      'options': ['Time and place.', 'Only the date.', 'Only the interviewer.', 'Only the topic.'],
      'correctIndex': 0,
      'explain': '“\nMan: Do you know when the interview starts?\nWoman: At 2:30 in Room 5.\n\nGiờ + phòng.',
    },
    {
      'question': "What does the man imply?",
      'options': ['He cannot attend before noon.', 'He will be early.', 'He is on vacation.', 'He forgot the meeting.'],
      'correctIndex': 0,
      'explain': '“\nWoman: Can you make it to the meeting?\nMan: I’m tied up until noon.\n\nBận tới trưa.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Confirm before the deadline.', 'Ask for a new quote.', 'Decline the offer.', 'Delay to next month.'],
      'correctIndex': 0,
      'explain': '“\nMan: The quote is valid through the 30th.\nWoman: We’ll confirm by the 28th.\n\nXác nhận trước hạn.',
    },
    {
      'question': "What is the man asking about?",
      'options': ['Payment method.', 'Departure time.', 'Seat type.', 'Discount.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The fare to downtown is \$18.\nMan: Do you take cards?\n\nHỏi cách thanh toán.',
    },
    {
      'question': "What will happen?",
      'options': ['The repair will be prioritized.', 'They will cancel it.', 'They will ignore it.', 'They will charge extra automatically.'],
      'correctIndex': 0,
      'explain': '“\nMan: Could you expedite the repair?\nWoman: We’ll prioritize your ticket.\n\nƯu tiên xử lý.',
    },
    {
      'question': "What is true?",
      'options': ['The venue is large enough.', 'They need a bigger venue.', 'They will exceed capacity.', 'They must split sessions.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The venue seats fifty.\nMan: We expect around forty-five.\n\n50 > 45 nên đủ chỗ.',
    },
    {
      'question': "What will the woman do?",
      'options': ['Call the supplier again.', 'Postpone immediately.', 'Change supplier now.', 'Cancel the order.'],
      'correctIndex': 0,
      'explain': '“\nMan: Unless the supplier confirms today, we’ll postpone.\nWoman: I’ll call them again.\n\nGọi lại để xác nhận.',
    },
    {
      'question': "What did the man choose?",
      'options': ['Iced tea.', 'Coffee.', 'Orange juice.', 'Water only.'],
      'correctIndex': 0,
      'explain': '“\nWoman: The meal comes with a drink.\nMan: I’ll have iced tea, please.\n\nChọn trà đá.',
    },
    {
      'question': "What can be inferred?",
      'options': ['They won’t wait long.', 'The shuttle is hourly.', 'No shuttles today.', 'They missed the last one.'],
      'correctIndex': 0,
      'explain': '“\nMan: The shuttle runs every twenty minutes.\nWoman: Great, the next one should be soon.\n\nChạy 20 phút/chuyến → sắp có.',
    },
    {
      'question': "What will the man do?",
      'options': ['Pay the deposit today.', 'Cancel the booking.', 'Request a refund.', 'Change the date.'],
      'correctIndex': 0,
      'explain': '“\nWoman: We’ll need a deposit to secure the booking.\nMan: I’ll transfer it today.\n\nThanh toán tiền đặt cọc.',
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
