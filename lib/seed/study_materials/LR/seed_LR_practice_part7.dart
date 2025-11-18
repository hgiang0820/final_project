// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart');

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart7() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';

  await db.collection('study_materials').doc(materialId).set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> pushLesson({
    required String levelId,
    required String lessonId,
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('part7')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Reading comprehension',
      'lessonName': lessonName,
      'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
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

  // L1 — Đọc hiểu đoạn văn ngắn (Skimming: ý chính)
  final p7Lv300L1 = <Map<String, dynamic>>[
    {
      'question':
          "Passage:\nGreen Bistro opened a new branch downtown last week. It serves breakfast and lunch with vegetarian options.\nQuestion: What is the main idea?",
      'options': [
        'A restaurant opened a new location with veg options.',
        'The bistro only serves dinner.',
        'The bistro is closing soon.',
        'The bistro sells kitchen equipment.',
      ],
      'correctIndex': 0,
      'explain': 'Ý chính: chi nhánh mới + phục vụ sáng/trưa có món chay.',
    },
    {
      'question':
          "Passage:\nCity Gym will renovate the locker rooms next month. Members can use temporary lockers on the second floor.\nQuestion: What is the notice mainly about?",
      'options': [
        'Locker room renovation and temporary arrangements.',
        'A new swimming pool.',
        'Membership fee increase.',
        'Hiring new trainers.',
      ],
      'correctIndex': 0,
      'explain': 'Skim keywords: renovate, temporary lockers.',
    },
    {
      'question':
          "Passage:\nThe museum will host a photography workshop this Saturday. Registration is required due to limited seats.\nQuestion: What should readers do to attend?",
      'options': [
        'Register in advance.',
        'Arrive without tickets.',
        'Bring cameras only.',
        'Pay at the exit.',
      ],
      'correctIndex': 0,
      'explain': '“Registration is required”.',
    },
    {
      'question':
          "Passage:\nTechCare fixed my phone in two hours and offered a 30-day warranty.\nQuestion: What is highlighted about TechCare?",
      'options': [
        'Fast service and warranty.',
        'Free accessories.',
        '24/7 hotline.',
        'Home delivery.',
      ],
      'correctIndex': 0,
      'explain': 'Ý chính: nhanh + bảo hành 30 ngày.',
    },
    {
      'question':
          "Passage:\nThe library will extend weekend hours during exams.\nQuestion: Why is the schedule changing?",
      'options': [
        'Because of exam period.',
        'Due to renovations.',
        'Because of staff shortage.',
        'For a private event.',
      ],
      'correctIndex': 0,
      'explain': 'Reason given: exam period.',
    },
    {
      'question':
          "Passage:\nSun Travel offers a day tour to the waterfalls including lunch and transport.\nQuestion: What is included?",
      'options': [
        'Lunch and transport.',
        'Hotel stay.',
        'Flight tickets.',
        'Car rental only.',
      ],
      'correctIndex': 0,
      'explain': 'Skim: including lunch and transport.',
    },
    {
      'question':
          "Passage:\nA new coworking space opened near Central Station with flexible monthly plans.\nQuestion: What is emphasized?",
      'options': [
        'Flexible plans and location near station.',
        'Free parking guaranteed.',
        'Private offices only.',
        'Open 24 hours daily.',
      ],
      'correctIndex': 0,
      'explain': 'Main idea: vị trí + gói linh hoạt.',
    },
    {
      'question':
          "Passage:\nThe bakery will close early on Friday for equipment maintenance.\nQuestion: What will happen on Friday?",
      'options': [
        'It will close early.',
        'It will open late.',
        'It will be closed all day.',
        'It will have a sale.',
      ],
      'correctIndex': 0,
      'explain': 'Close early is stated.',
    },
    {
      'question':
          "Passage:\nAn art fair will take place in the city plaza with local artists and live music.\nQuestion: What event is described?",
      'options': [
        'An art fair.',
        'A sports meet.',
        'A book club.',
        'A job fair.',
      ],
      'correctIndex': 0,
      'explain': 'Keywords: art fair, artists, music.',
    },
    {
      'question':
          "Passage:\nEcoClean now offers home pickup for dry-cleaning orders.\nQuestion: What new service is added?",
      'options': [
        'Home pickup.',
        'Overnight tailoring.',
        'Shoe repair.',
        'Laundry discount.',
      ],
      'correctIndex': 0,
      'explain': 'Main point: home pickup.',
    },
  ];

  // L2 — Quảng cáo & Thông báo
  final p7Lv300L2 = <Map<String, dynamic>>[
    {
      'question':
          "Ad:\nBuy 1 latte, get 50% off the second from 2–5 p.m., weekdays only.\nQuestion: When is the offer valid?",
      'options': [
        'Weekdays, 2–5 p.m.',
        'Weekends only',
        'All day',
        'Mornings only',
      ],
      'correctIndex': 0,
      'explain': 'Offer window được nêu rõ.',
    },
    {
      'question':
          "Notice:\nParking on Oak Street is closed this Sunday due to the marathon. Use Pine Garage instead.\nQuestion: Where should drivers park?",
      'options': [
        'Pine Garage',
        'Oak Street',
        'City Hall',
        'Downtown curbside',
      ],
      'correctIndex': 0,
      'explain': 'Replacement: Pine Garage.',
    },
    {
      'question':
          "Ad:\nSpring sale: Up to 40% off on jackets. Members get extra 10%.\nQuestion: Who gets additional discount?",
      'options': ['Members', 'New visitors', 'Students', 'Staff'],
      'correctIndex': 0,
      'explain': 'Members get extra 10%.',
    },
    {
      'question':
          "Notice:\nElevator 2 will be inspected on Oct 21 from 9–12. Use Elevator 1.\nQuestion: What should users do during inspection?",
      'options': [
        'Use Elevator 1',
        'Use stairs only',
        'Wait until 5 p.m.',
        'Call maintenance',
      ],
      'correctIndex': 0,
      'explain': 'Instruction: Use Elevator 1.',
    },
    {
      'question':
          "Ad:\nFree delivery for orders over \$30 within 5 km.\nQuestion: What qualifies for free delivery?",
      'options': [
        'Over \$30 and within 5 km',
        'Any order',
        'Pickup orders',
        'Over \$50 only',
      ],
      'correctIndex': 0,
      'explain': 'Threshold + radius.',
    },
    {
      'question':
          "Notice:\nCafé closed on Monday for staff training; reopening Tuesday at 8.\nQuestion: When will it reopen?",
      'options': [
        'Tuesday 8:00',
        'Monday 8:00',
        'Wednesday 8:00',
        'Tuesday 10:00',
      ],
      'correctIndex': 0,
      'explain': 'Reopen Tuesday 8:00.',
    },
    {
      'question':
          "Ad:\nYoga Studio: First class free for new students this month.\nQuestion: Who gets a free class?",
      'options': [
        'New students',
        'All members',
        'Visitors on weekends',
        'Annual members only',
      ],
      'correctIndex': 0,
      'explain': 'New students only.',
    },
    {
      'question':
          "Notice:\nBus 15 will not stop at Market Square due to roadworks.\nQuestion: What change occurs?",
      'options': [
        'Skip Market Square stop',
        'Free tickets',
        'New timetable',
        'Night service added',
      ],
      'correctIndex': 0,
      'explain': 'Skip stop.',
    },
    {
      'question':
          "Ad:\nJoin Coding 101 workshop—limited seats; register online.\nQuestion: How to join?",
      'options': [
        'Register online',
        'Pay at door',
        'Call hotline only',
        'Walk-in anytime',
      ],
      'correctIndex': 0,
      'explain': 'Register online stated.',
    },
    {
      'question':
          "Notice:\nThe pharmacy will move to 24 River Road next week.\nQuestion: What will happen next week?",
      'options': [
        'Store relocation',
        'Grand opening sale',
        'Temporary closure',
        'New owner announced',
      ],
      'correctIndex': 0,
      'explain': 'Relocation info.',
    },
  ];

  // L3 — Email đơn giản (50–70 từ)
  final p7Lv300L3 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nHi team, our client moved tomorrow’s call to 3:30 p.m. Please update your calendars. I’ll send the slide deck by noon.\n—Linh\nQuestion: What changed?",
      'options': [
        'The call time',
        'The call platform',
        'The slide owner',
        'The meeting location',
      ],
      'correctIndex': 0,
      'explain': 'Moved to 3:30 p.m.',
    },
    {
      'question':
          "Email:\nHello Mai, the printer in Room 204 is jammed again. Could you ask IT to check it this afternoon? Thanks.\n—Quang\nQuestion: What does Quang request?",
      'options': [
        'IT support for a printer',
        'New printer purchase',
        'Paper delivery',
        'Change of room',
      ],
      'correctIndex': 0,
      'explain': 'Ask IT to check.',
    },
    {
      'question':
          "Email:\nDear Ms. Park, I attached the revised invoice. Please confirm if the billing address is correct.\nBest,\nHoa\nQuestion: What is Hoa asking for?",
      'options': [
        'Address confirmation',
        'New discount',
        'Delivery date',
        'Tax exemption',
      ],
      'correctIndex': 0,
      'explain': 'Confirm billing address.',
    },
    {
      'question':
          "Email:\nTeam, the office will host a charity bake sale Friday morning. Volunteers needed for setup at 8 a.m.\n—HR\nQuestion: What help is needed?",
      'options': ['Setup volunteers', 'Cashiers', 'Bakers only', 'Security'],
      'correctIndex': 0,
      'explain': 'Volunteers for setup 8 a.m.',
    },
    {
      'question':
          "Email:\nHi Duy, thanks for the draft. Could you shorten the intro and add the chart to page 2?\n—An\nQuestion: What edits are requested?",
      'options': [
        'Shorter intro; add chart',
        'Longer intro; remove chart',
        'Translate to English',
        'Add references only',
      ],
      'correctIndex': 0,
      'explain': 'Shorten + add chart.',
    },
    {
      'question':
          "Email:\nHello team, we’ll switch to Zoom for tomorrow’s training. The link is below.\n—Trainer\nQuestion: What tool will be used?",
      'options': ['Zoom', 'Google Meet', 'Teams', 'Webex'],
      'correctIndex': 0,
      'explain': 'Switch to Zoom.',
    },
    {
      'question':
          "Email:\nHi Khanh, your order ships today. Estimated delivery: Thursday. Tracking will be sent tonight.\n—Sales\nQuestion: When is delivery expected?",
      'options': ['Thursday', 'Today', 'Friday', 'Next Monday'],
      'correctIndex': 0,
      'explain': 'ETA: Thursday.',
    },
    {
      'question':
          "Email:\nDear all, we will clean the pantry at 5 p.m. Please remove personal items before then.\n—Facility\nQuestion: What should employees do?",
      'options': [
        'Remove personal items',
        'Lock the pantry',
        'Report to HR',
        'Bring new cups',
      ],
      'correctIndex': 0,
      'explain': 'Remove items before 5 p.m.',
    },
    {
      'question':
          "Email:\nHi, the vendor can meet either Tuesday morning or Wednesday afternoon. Which do you prefer?\n—Procurement\nQuestion: What is being asked?",
      'options': [
        'Preferred meeting time',
        'Budget approval',
        'Venue choice',
        'Contract length',
      ],
      'correctIndex': 0,
      'explain': 'Choose between two slots.',
    },
    {
      'question':
          "Email:\nHi Phuc, I’ll be on leave next Monday. Ngoc will cover client emails.\n—Lan\nQuestion: Who will handle client emails next Monday?",
      'options': ['Ngoc', 'Lan', 'Phuc', 'HR'],
      'correctIndex': 0,
      'explain': 'Ngoc covers.',
    },
  ];

  // L4 — Bảng biểu & thời gian biểu
  final p7Lv300L4 = <Map<String, dynamic>>[
    {
      'question':
          "Table (Train A): Departs 08:10 — Arrives 09:05 — Platform 3.\nQuestion: What is the platform?",
      'options': ['3', '2', '1', '5'],
      'correctIndex': 0,
      'explain': 'Platform shown: 3.',
    },
    {
      'question':
          "Schedule:\nWorkshop: 10:00–11:30; Break: 11:30–11:45; Panel: 11:45–12:30.\nQuestion: How long is the break?",
      'options': ['15 minutes', '30 minutes', '45 minutes', '60 minutes'],
      'correctIndex': 0,
      'explain': '11:30 → 11:45 = 15’.',
    },
    {
      'question':
          "Price List:\nCoffee \$3; Tea \$2.5; Pastry \$4.\nQuestion: How much for tea and pastry?",
      'options': ['\$6.5', '\$7', '\$5.5', '\$6'],
      'correctIndex': 0,
      'explain': '2.5 + 4 = 6.5.',
    },
    {
      'question':
          "Calendar:\nTeam meeting moved from Thu to Fri at 2 p.m.\nQuestion: When is the meeting now?",
      'options': [
        'Friday 2 p.m.',
        'Thursday 2 p.m.',
        'Friday 10 a.m.',
        'Thursday 10 a.m.',
      ],
      'correctIndex': 0,
      'explain': 'Moved to Fri 2 p.m.',
    },
    {
      'question':
          "Menu Board:\nLunch sets served 11:30–14:00 only.\nQuestion: At what time are lunch sets unavailable?",
      'options': ['15:00', '12:00', '13:30', '11:45'],
      'correctIndex': 0,
      'explain': 'After 14:00 → 15:00 không phục vụ.',
    },
    {
      'question':
          "Timetable:\nBus 8:20 (On time), 8:40 (Delayed), 9:00 (Cancelled).\nQuestion: Which bus will not run?",
      'options': ['9:00', '8:20', '8:40', 'All buses'],
      'correctIndex': 0,
      'explain': 'Cancelled = không chạy.',
    },
    {
      'question':
          "Roster:\nCashier: Minh (Mon–Wed), Thu (Thu–Fri).\nQuestion: Who is cashier on Friday?",
      'options': ['Thu', 'Minh', 'Both', 'None'],
      'correctIndex': 0,
      'explain': 'Thu phụ trách Thu–Fri.',
    },
    {
      'question':
          "Event Slots:\nRegistration closes at 5 p.m. on May 12.\nQuestion: After 5 p.m. May 12, you can…",
      'options': [
        'No longer register',
        'Register with fee',
        'Register by phone',
        'Register anytime',
      ],
      'correctIndex': 0,
      'explain': 'Cửa đăng ký đóng.',
    },
    {
      'question':
          "Shipping Table:\nStandard: 3–5 days; Express: 1–2 days.\nQuestion: Which is fastest?",
      'options': ['Express', 'Standard', 'Same', 'None'],
      'correctIndex': 0,
      'explain': 'Express nhanh nhất.',
    },
    {
      'question':
          "Gym Classes:\nYoga 7:00; Spin 7:45; Pilates 8:30.\nQuestion: Which class is second?",
      'options': ['Spin', 'Yoga', 'Pilates', 'None'],
      'correctIndex': 0,
      'explain': 'Thứ tự thời gian.',
    },
  ];

  // L5 — Ôn tập tổng hợp (ads + email + bảng)
  final p7Lv300L5 = <Map<String, dynamic>>[
    {
      'question':
          "Ad:\nBuy 2 get 1 free on notebooks this weekend only.\nQuestion: How many notebooks for the promo?",
      'options': [
        '3 notebooks total',
        '2 notebooks total',
        '1 notebook',
        '4 notebooks',
      ],
      'correctIndex': 0,
      'explain': 'Mua 2 tặng 1 → nhận 3.',
    },
    {
      'question':
          "Email:\nHi, I’ll arrive at 10:15. Could you reserve a seat near the window?\n—Kim\nQuestion: What does Kim want?",
      'options': [
        'A window seat',
        'A parking spot',
        'A meal plan',
        'A discount',
      ],
      'correctIndex': 0,
      'explain': 'Reserve window seat.',
    },
    {
      'question':
          "Table:\nRoom 201: Projector ✓; Whiteboard ✓; Seats 10.\nQuestion: What equipment is available?",
      'options': [
        'Projector and whiteboard',
        'Only projector',
        'Only whiteboard',
        'None',
      ],
      'correctIndex': 0,
      'explain': 'Cả hai có dấu ✓.',
    },
    {
      'question':
          "Notice:\nStore opens at 9 a.m. during holidays.\nQuestion: When does it open on holidays?",
      'options': ['9 a.m.', '8 a.m.', '10 a.m.', 'All day'],
      'correctIndex': 0,
      'explain': 'Nêu rõ 9 a.m.',
    },
    {
      'question':
          "Email:\nHello, the invoice is overdue. Please pay by Friday.\nQuestion: What is requested?",
      'options': [
        'Payment by Friday',
        'Product return',
        'Meeting schedule',
        'Address update',
      ],
      'correctIndex': 0,
      'explain': 'Thanh toán trước hạn.',
    },
    {
      'question':
          "Ad:\nFree trial for 14 days—cancel anytime.\nQuestion: What is free?",
      'options': ['Trial period', 'Shipping', 'Consultation', 'Upgrade'],
      'correctIndex': 0,
      'explain': 'Free trial 14 ngày.',
    },
    {
      'question':
          "Schedule:\nLunch break 12:00–12:45.\nQuestion: How long is lunch?",
      'options': ['45 minutes', '30 minutes', '60 minutes', '15 minutes'],
      'correctIndex': 0,
      'explain': '12:00 → 12:45 = 45’.',
    },
    {
      'question':
          "Email:\nWe’ll use Room 305 today since 302 is under repair.\nQuestion: Why change rooms?",
      'options': [
        '302 under repair',
        '305 is larger',
        'Heat issue',
        'Noise in hallway',
      ],
      'correctIndex': 0,
      'explain': 'Under repair.',
    },
    {
      'question':
          "Notice:\nFrom June 1, bus fare increases by \$0.25.\nQuestion: What changes June 1?",
      'options': [
        'Fare increases',
        'New route',
        'More buses',
        'Fare decreases',
      ],
      'correctIndex': 0,
      'explain': 'Price increase.',
    },
    {
      'question':
          "Ad:\nWeekend workshop: materials included.\nQuestion: What is included?",
      'options': ['Materials', 'Lunch', 'Hotel', 'Transport'],
      'correctIndex': 0,
      'explain': 'Materials included.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // L1 — Email công việc (mục đích: request/confirm…)
  final p7Lv600L1 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nDear Mr. Ito, could you confirm the delivery address and preferred time window for tomorrow? We can arrange 9–11 a.m. or 2–4 p.m.\nQuestion: What is the purpose?",
      'options': [
        'Confirm address/time window',
        'Request payment',
        'Announce delay',
        'Cancel order',
      ],
      'correctIndex': 0,
      'explain': 'Xác nhận địa chỉ & khung giờ.',
    },
    {
      'question':
          "Email:\nHi Linh, we approved your budget request. Please proceed with the purchase and send the receipt.\nQuestion: What happened?",
      'options': [
        'Budget approved',
        'Budget rejected',
        'Project canceled',
        'Receipt lost',
      ],
      'correctIndex': 0,
      'explain': 'Approved & proceed.',
    },
    {
      'question':
          "Email:\nTeam, the client needs a proposal by Friday. Assign sections today and share a draft tomorrow.\nQuestion: What is the deadline?",
      'options': ['Friday', 'Today', 'Tomorrow', 'Next Monday'],
      'correctIndex': 0,
      'explain': 'Proposal due Friday.',
    },
    {
      'question':
          "Email:\nHi Joy, attached are meeting minutes. Let me know if any corrections are needed.\nQuestion: What does the sender ask for?",
      'options': [
        'Corrections if needed',
        'Signatures',
        'Payment',
        'Reschedule',
      ],
      'correctIndex': 0,
      'explain': 'Feedback/corrections.',
    },
    {
      'question':
          "Email:\nDear all, the office move is on Oct 28. Pack personal items by Oct 25.\nQuestion: What must employees do by Oct 25?",
      'options': [
        'Pack personal items',
        'Return keys',
        'Update address',
        'Book movers',
      ],
      'correctIndex': 0,
      'explain': 'Pack items.',
    },
    {
      'question':
          "Email:\nHello, due to a supplier delay, shipment will arrive two days late. We will upgrade to express at no cost.\nQuestion: What is offered?",
      'options': [
        'Free express shipping',
        'Refund',
        'Voucher',
        'Partial order',
      ],
      'correctIndex': 0,
      'explain': 'Compensation: express free.',
    },
    {
      'question':
          "Email:\nHi team, please complete the security training by Sunday. Access will be limited afterward.\nQuestion: What happens after Sunday?",
      'options': [
        'Access limited',
        'Fee charged',
        'Course removed',
        'Bonus granted',
      ],
      'correctIndex': 0,
      'explain': 'Hạn hoàn thành.',
    },
    {
      'question':
          "Email:\nHi An, can you join a quick call at 10:00 or 10:30 a.m.?\nQuestion: What does the sender ask?",
      'options': [
        'Pick a call time',
        'Share a report',
        'Approve budget',
        'Extend a deadline',
      ],
      'correctIndex': 0,
      'explain': 'Choose slot.',
    },
    {
      'question':
          "Email:\nDear HR, I’ll be out on Nov 2–3 for a conference. Please advise on leave procedure.\nQuestion: What does the writer request?",
      'options': [
        'Leave procedure info',
        'Travel booking',
        'Expense approval',
        'Conference pass',
      ],
      'correctIndex': 0,
      'explain': 'Hỏi quy trình nghỉ.',
    },
    {
      'question':
          "Email:\nHi, attached is the signed contract. Please countersign and return a copy.\nQuestion: What action is requested?",
      'options': [
        'Countersign and return',
        'Print for records',
        'Transfer payment',
        'Schedule meeting',
      ],
      'correctIndex': 0,
      'explain': 'Countersign.',
    },
  ];

  // L2 — Bài báo & tin tức ngắn
  final p7Lv600L2 = <Map<String, dynamic>>[
    {
      'question':
          "News:\nThe city launched a bike-sharing program with 300 bikes at 25 stations to reduce traffic.\nQuestion: What is the goal?",
      'options': [
        'Reduce traffic',
        'Increase car sales',
        'Close stations',
        'Build highways',
      ],
      'correctIndex': 0,
      'explain': 'Purpose stated.',
    },
    {
      'question':
          "News:\nA local startup raised \$2M to expand its delivery network across three provinces.\nQuestion: What will the funds support?",
      'options': [
        'Network expansion',
        'Office rent',
        'Scholarships',
        'Concerts',
      ],
      'correctIndex': 0,
      'explain': 'Expand delivery network.',
    },
    {
      'question':
          "News:\nHeavy rain caused flight delays at Riverside Airport; airlines advised travelers to check updates.\nQuestion: What should travelers do?",
      'options': [
        'Check updates',
        'Go to the station',
        'Cancel trips',
        'Ignore news',
      ],
      'correctIndex': 0,
      'explain': 'Advice given.',
    },
    {
      'question':
          "News:\nThe university opened a new research center focusing on renewable energy.\nQuestion: What is the focus?",
      'options': ['Renewable energy', 'Medicine', 'Tourism', 'Finance'],
      'correctIndex': 0,
      'explain': 'Focus specified.',
    },
    {
      'question':
          "News:\nFarmers’ market will operate year-round after strong demand during the pilot.\nQuestion: Why continue year-round?",
      'options': [
        'Strong demand',
        'Government rule',
        'Free rent',
        'Weather only',
      ],
      'correctIndex': 0,
      'explain': 'Reason: demand.',
    },
    {
      'question':
          "News:\nCity buses will add late-night service on weekends starting next month.\nQuestion: What changes next month?",
      'options': [
        'Late-night service on weekends',
        'Fare cuts',
        'New routes weekday',
        'No service',
      ],
      'correctIndex': 0,
      'explain': 'Added service.',
    },
    {
      'question':
          "News:\nA tech firm introduced an AI tool to summarize long documents for users.\nQuestion: What does the tool do?",
      'options': [
        'Summarize documents',
        'Translate audio',
        'Design graphics',
        'Scan viruses',
      ],
      'correctIndex': 0,
      'explain': 'Summarization.',
    },
    {
      'question':
          "News:\nThe council approved a park renovation including lighting and playground upgrades.\nQuestion: What was approved?",
      'options': [
        'Park renovation',
        'New stadium',
        'Road tolls',
        'Library closure',
      ],
      'correctIndex': 0,
      'explain': 'Renovation approved.',
    },
    {
      'question':
          "News:\nAn exhibition will feature local designers and free evening talks.\nQuestion: What extra activity is offered?",
      'options': [
        'Free talks',
        'Cooking class',
        'Morning yoga',
        'Work-from-home tips',
      ],
      'correctIndex': 0,
      'explain': 'Free evening talks.',
    },
    {
      'question':
          "News:\nFuel prices dropped for the second week, easing transport costs.\nQuestion: What effect is mentioned?",
      'options': [
        'Transport costs eased',
        'More flights added',
        'Car sales doubled',
        'Roads closed',
      ],
      'correctIndex': 0,
      'explain': 'Effect: eased costs.',
    },
  ];

  // L3 — Thư từ công việc (formal letters)
  final p7Lv600L3 = <Map<String, dynamic>>[
    {
      'question':
          "Letter:\nWe acknowledge receipt of your complaint and will respond within five business days.\nQuestion: What is promised?",
      'options': [
        'Response within 5 days',
        'Immediate refund',
        'Replacement shipped',
        'Free upgrade',
      ],
      'correctIndex': 0,
      'explain': 'Promise timeline.',
    },
    {
      'question':
          "Letter:\nPlease be advised that your warranty expires on Dec 31. Extend now to avoid interruption.\nQuestion: What advice is given?",
      'options': [
        'Extend the warranty',
        'Cancel the plan',
        'Replace device',
        'Change address',
      ],
      'correctIndex': 0,
      'explain': 'Extend to avoid gap.',
    },
    {
      'question':
          "Letter:\nWe regret to inform you that your application was not successful.\nQuestion: What is the result?",
      'options': [
        'Application rejected',
        'Application approved',
        'Interview scheduled',
        'Offer made',
      ],
      'correctIndex': 0,
      'explain': 'Not successful = rejected.',
    },
    {
      'question':
          "Letter:\nYour subscription will renew automatically unless canceled by the 20th.\nQuestion: By when should you cancel?",
      'options': ['By the 20th', 'By the 1st', 'After renewal', 'No deadline'],
      'correctIndex': 0,
      'explain': 'Deadline stated.',
    },
    {
      'question':
          "Letter:\nWe are pleased to offer you the position starting May 3, pending background check.\nQuestion: What condition applies?",
      'options': [
        'Background check',
        'Medical exam',
        'Relocation',
        'Language test',
      ],
      'correctIndex': 0,
      'explain': 'Pending background check.',
    },
    {
      'question':
          "Letter:\nThis is a reminder of your outstanding balance of \$120 due by Friday.\nQuestion: What is the amount due?",
      'options': ['\$120', '\$100', '\$20', '\$220'],
      'correctIndex': 0,
      'explain': 'Amount stated.',
    },
    {
      'question':
          "Letter:\nPlease submit the signed NDA before accessing the files.\nQuestion: What must be submitted first?",
      'options': ['Signed NDA', 'Photo ID', 'Invoice', 'Timesheet'],
      'correctIndex': 0,
      'explain': 'Requirement.',
    },
    {
      'question':
          "Letter:\nWe will relocate our headquarters to 55 Lake Ave on August 1.\nQuestion: What happens on August 1?",
      'options': [
        'Headquarters relocation',
        'New product launch',
        'Holiday',
        'Hiring event',
      ],
      'correctIndex': 0,
      'explain': 'Relocation date.',
    },
    {
      'question':
          "Letter:\nYour refund has been processed and should appear within 5–7 business days.\nQuestion: When should the refund appear?",
      'options': [
        'In 5–7 business days',
        'Today',
        'In 30 days',
        'Next quarter',
      ],
      'correctIndex': 0,
      'explain': 'Timeline given.',
    },
    {
      'question':
          "Letter:\nWe request your attendance at the compliance briefing next Thursday at 3 p.m.\nQuestion: What is requested?",
      'options': [
        'Attend a briefing',
        'Submit receipts',
        'Ship a package',
        'Approve a design',
      ],
      'correctIndex': 0,
      'explain': 'Attendance.',
    },
  ];

  // L4 — Double passage (đọc nhanh 2 đoạn liên quan)
  final p7Lv600L4 = <Map<String, dynamic>>[
    {
      'question':
          "Post:\n(1) Event Page: Workshop starts 10 a.m., venue: Hall B. Bring ID.\n(2) Email: Your seat is reserved in Hall B; arrive by 9:45.\nQuestion: Where and when should you arrive?",
      'options': [
        'Hall B by 9:45',
        'Hall A by 10:00',
        'Hall B by 10:30',
        'Hall C by 9:30',
      ],
      'correctIndex': 0,
      'explain': 'Cross-match venue/time.',
    },
    {
      'question':
          "Post:\n(1) Notice: Elevator 1 out of service.\n(2) Email: Meeting moved to Room 402 (near Elevator 2).\nQuestion: Why Room 402?",
      'options': [
        'Close to Elevator 2',
        'Bigger capacity',
        'Better projector',
        'Quieter',
      ],
      'correctIndex': 0,
      'explain': 'Linked reason.',
    },
    {
      'question':
          "Post:\n(1) Ad: Free parking on weekends only.\n(2) Receipt: Visit date—Sunday.\nQuestion: Parking fee for this visit?",
      'options': ['Free', '\$5', '\$10', 'Half price'],
      'correctIndex': 0,
      'explain': 'Sunday is weekend → free.',
    },
    {
      'question':
          "Post:\n(1) Newsletter: Store opens at 10.\n(2) Sign: Early shopping 9–10 for members.\nQuestion: When can members shop early?",
      'options': ['9–10', '10–11', '8–9', 'All day'],
      'correctIndex': 0,
      'explain': 'Members’ early slot.',
    },
    {
      'question':
          "Post:\n(1) Email: Delivery window 2–4 p.m.\n(2) Note on door: Away until 3 p.m.\nQuestion: What is the risk?",
      'options': [
        'Missed delivery before 3',
        'Extra fee',
        'Wrong address',
        'Lost package',
      ],
      'correctIndex': 0,
      'explain': '2–4 window vs away until 3.',
    },
    {
      'question':
          "Post:\n(1) HR Memo: Submit timesheets by 5 p.m. Fri.\n(2) Staff Email: On leave Fri afternoon.\nQuestion: What should the staff do?",
      'options': [
        'Submit before leave',
        'Ignore deadline',
        'Ask for paper',
        'Call IT',
      ],
      'correctIndex': 0,
      'explain': 'Submit sớm.',
    },
    {
      'question':
          "Post:\n(1) Promo: Free drink with lunch set.\n(2) Order: Lunch set x1.\nQuestion: What else is included?",
      'options': ['A free drink', 'Dessert', 'Extra fries', 'Coupon'],
      'correctIndex': 0,
      'explain': 'Free drink bundled.',
    },
    {
      'question':
          "Post:\n(1) Bus Notice: Stop A closed; use Stop B.\n(2) Map: Stop B two blocks west.\nQuestion: Where to board?",
      'options': ['Stop B', 'Stop A', 'Stop C', 'Station only'],
      'correctIndex': 0,
      'explain': 'Use Stop B.',
    },
    {
      'question':
          "Post:\n(1) Invoice: Payment due May 10.\n(2) Email: Bank transfer scheduled May 12.\nQuestion: What issue arises?",
      'options': [
        'Late payment',
        'Overpayment',
        'Duplicate charge',
        'Refund needed',
      ],
      'correctIndex': 0,
      'explain': 'Transfer after due date.',
    },
    {
      'question':
          "Post:\n(1) Event: Seats limited; RSVP required.\n(2) Reply: “I’ll come without RSVP.”\nQuestion: What is the problem?",
      'options': [
        'RSVP required',
        'Wrong venue',
        'Timezone error',
        'Dress code',
      ],
      'correctIndex': 0,
      'explain': 'Must RSVP.',
    },
  ];

  // L5 — Ôn tập tổng hợp (email, báo, thư, double)
  final p7Lv600L5 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nPlease review the attached draft today; we present tomorrow morning.\nQuestion: What is the urgency?",
      'options': [
        'Presentation tomorrow',
        'Client visit today',
        'Budget cut',
        'Office move',
      ],
      'correctIndex': 0,
      'explain': 'Deadline gần.',
    },
    {
      'question':
          "News:\nThe bridge will close for repairs from June 3–5; detours posted.\nQuestion: What happens June 4?",
      'options': [
        'Bridge closed',
        'Bridge open',
        'Toll increase',
        'Event held',
      ],
      'correctIndex': 0,
      'explain': 'Within closure window.',
    },
    {
      'question':
          "Letter:\nPlease settle the balance within 7 days to avoid service interruption.\nQuestion: What happens if unpaid?",
      'options': ['Service interruption', 'Bonus', 'Upgrade', 'Warranty'],
      'correctIndex': 0,
      'explain': 'Stated consequence.',
    },
    {
      'question':
          "Double:\n(1) Promo: Free shipping over \$50.\n(2) Cart total: \$48.\nQuestion: How to get free shipping?",
      'options': [
        'Add \$2 or more',
        'Remove items',
        'Change address',
        'Pay cash',
      ],
      'correctIndex': 0,
      'explain': 'Reach threshold.',
    },
    {
      'question':
          "Email:\nWe moved the venue to Room 210 due to noise in 105.\nQuestion: Why was it moved?",
      'options': [
        'Noise in 105',
        'Lack of chairs',
        'Projector issue',
        'AC broken',
      ],
      'correctIndex': 0,
      'explain': 'Noise reason.',
    },
    {
      'question':
          "News:\nA festival will feature local food trucks and live bands downtown.\nQuestion: What is featured?",
      'options': [
        'Food trucks & live bands',
        'Art auction',
        'Film screening',
        'Book fair',
      ],
      'correctIndex': 0,
      'explain': 'Features stated.',
    },
    {
      'question':
          "Letter:\nYour appointment is confirmed for 9:00 a.m. Tuesday. Arrive 10 minutes early.\nQuestion: When should you arrive?",
      'options': [
        '8:50 a.m. Tuesday',
        '9:10 a.m. Tuesday',
        '9:00 a.m. Monday',
        '8:50 a.m. Monday',
      ],
      'correctIndex': 0,
      'explain': '10’ early.',
    },
    {
      'question':
          "Double:\n(1) Job post: Resume + cover letter required.\n(2) Applicant: Sent resume only.\nQuestion: What is missing?",
      'options': ['Cover letter', 'Portfolio', 'Transcript', 'Reference'],
      'correctIndex': 0,
      'explain': 'Cover letter thiếu.',
    },
    {
      'question':
          "Email:\nWe’ll share the meeting link 30 minutes before start time.\nQuestion: When is the link sent?",
      'options': [
        '30 minutes before',
        'At start',
        'One day before',
        'After meeting',
      ],
      'correctIndex': 0,
      'explain': 'Timing given.',
    },
    {
      'question':
          "News:\nCity introduced a recycling guide to reduce landfill waste.\nQuestion: What is the purpose?",
      'options': [
        'Reduce landfill waste',
        'Raise taxes',
        'Ban plastic bottles',
        'Close recycling centers',
      ],
      'correctIndex': 0,
      'explain': 'Purpose stated.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // L1 — Double passage nâng cao (200–300 từ rút gọn)
  final p7Lv800L1 = <Map<String, dynamic>>[
    {
      'question':
          "Double:\n(1) Internal Memo: “From Nov, all client data must be stored in Drive-X (EU servers). Legacy files should be migrated by Nov 30. Access to Drive-Y ends Dec 5.”\n(2) FAQ: “Migration tool runs nightly; large folders may take 48 hours. Contact it-support@company.com for exceptions.”\nQuestion: By when must legacy files be migrated?",
      'options': ['By Nov 30', 'By Dec 5', 'By Nov 15', 'By Dec 1'],
      'correctIndex': 0,
      'explain': 'Deadline rõ: Nov 30.',
    },
    {
      'question':
          "Double:\n(1) Vendor Offer: “Premium plan includes 3 admin seats, SSO, priority support.”\n(2) Email: “We have 4 admins.”\nQuestion: What issue arises with Premium?",
      'options': [
        'Not enough admin seats',
        'No SSO',
        'No support',
        'Data cap too small',
      ],
      'correctIndex': 0,
      'explain': 'Premium chỉ 3 admin.',
    },
    {
      'question':
          "Double:\n(1) Conference Agenda: Keynote 9:00–9:45; Panels 10:00–12:00; Lunch 12:00–13:00.\n(2) Email: “Arrive 9:30 to catch the keynote.”\nQuestion: What’s incorrect?",
      'options': [
        'Arriving 9:30 misses part of keynote',
        'Lunch time wrong',
        'Panel room wrong',
        'Date wrong',
      ],
      'correctIndex': 0,
      'explain': 'Keynote bắt đầu 9:00.',
    },
    {
      'question':
          "Double:\n(1) Policy: “Travel booked <7 days before trip requires director approval.”\n(2) Itinerary: Ticket purchased 5 days before.\nQuestion: What is required?",
      'options': [
        'Director approval',
        'HR approval',
        'No approval',
        'CFO approval only',
      ],
      'correctIndex': 0,
      'explain': '<7 days ⇒ director.',
    },
    {
      'question':
          "Double:\n(1) SLA: “Support responds within 4 hours (business).”\n(2) Ticket: Submitted Fri 4:30 p.m.; reply Mon 9:00 a.m.\nQuestion: Was SLA met?",
      'options': ['Yes', 'No', 'Partially', 'Not applicable'],
      'correctIndex': 0,
      'explain': 'Ngoài giờ tuần cuối; tính giờ làm việc.',
    },
    {
      'question':
          "Double:\n(1) Lease: “Office access 6:00–22:00, daily.”\n(2) Email: “Team will work midnight Sunday.”\nQuestion: Is this allowed?",
      'options': [
        'No, outside access hours',
        'Yes, weekends allowed',
        'Yes, 24/7 access',
        'Only with guard',
      ],
      'correctIndex': 0,
      'explain': 'Giới hạn đến 22:00.',
    },
    {
      'question':
          "Double:\n(1) Budget Note: “Marketing cap \$50k/quarter.”\n(2) Spend: \$47k committed; \$6k pending.\nQuestion: What must marketing do?",
      'options': [
        'Reduce pending by \$3k',
        'Add \$3k more',
        'Move to next quarter',
        'Cancel all spend',
      ],
      'correctIndex': 0,
      'explain': '47+6=53 > 50 ⇒ giảm 3.',
    },
    {
      'question':
          "Double:\n(1) Shipping Policy: “Fragile items require insurance.”\n(2) Order: Glassware, no insurance selected.\nQuestion: What is missing?",
      'options': ['Insurance', 'Signature', 'Express label', 'Gift wrap'],
      'correctIndex': 0,
      'explain': 'Fragile ⇒ insurance.',
    },
    {
      'question':
          "Double:\n(1) Job Post: “Hybrid: 3 days on-site (Tue–Thu).”\n(2) Candidate: “Can work on-site Mon–Wed only.”\nQuestion: What mismatch exists?",
      'options': ['On-site days', 'Salary', 'Location', 'Seniority'],
      'correctIndex': 0,
      'explain': 'Yêu cầu Tue–Thu khác Mon–Wed.',
    },
    {
      'question':
          "Double:\n(1) Hackathon Rules: “Teams ≤5 members; code must be new.”\n(2) Team: 6 members; using old repo.\nQuestion: How many rules are broken?",
      'options': ['Two', 'One', 'None', 'Three'],
      'correctIndex': 0,
      'explain': 'Vượt số người + dùng code cũ.',
    },
  ];

  // L2 — Triple passage (email + bảng + thông báo)
  final p7Lv800L2 = <Map<String, dynamic>>[
    {
      'question':
          "Triple:\n(1) Email: “Your workshop is confirmed for June 12 at Studio C.”\n(2) Timetable: Studio C booked 9–12; 13–16.\n(3) Notice: “Studios closed for cleaning 12–13.”\nQuestion: If the event runs 12–13, what happens?",
      'options': [
        'Conflict with cleaning',
        'Room double-booked',
        'No chairs available',
        'Free parking only',
      ],
      'correctIndex': 0,
      'explain': '12–13 đóng cửa.',
    },
    {
      'question':
          "Triple:\n(1) Email: “Please submit slides by May 5.”\n(2) Calendar: Presenter on leave May 1–6.\n(3) Policy: “Another team member may submit on behalf.”\nQuestion: What is the solution?",
      'options': [
        'Delegate submission',
        'Extend deadline',
        'Cancel talk',
        'Ignore policy',
      ],
      'correctIndex': 0,
      'explain': 'Cho phép người khác nộp.',
    },
    {
      'question':
          "Triple:\n(1) Menu: Vegan meals require 24h notice.\n(2) Order: Event tomorrow 10 a.m.\n(3) Email: Vegan count sent at 9 p.m. today.\nQuestion: Is notice sufficient?",
      'options': ['No', 'Yes', 'Only for half', 'Irrelevant'],
      'correctIndex': 0,
      'explain': 'Chưa đủ 24h.',
    },
    {
      'question':
          "Triple:\n(1) Flight: Departs 07:50.\n(2) Airport Note: Check-in closes 45 min before departure.\n(3) Ride ETA: Arrival 07:15.\nQuestion: Will check-in be open on arrival?",
      'options': [
        'No, it closes at 07:05',
        'Yes, until 07:30',
        'Open until 07:45',
        'Open until 08:00',
      ],
      'correctIndex': 0,
      'explain': '07:50-0:45=07:05.',
    },
    {
      'question':
          "Triple:\n(1) Invoice: Due \$1,200 on 10th.\n(2) Bank: Transfer scheduled 11th.\n(3) Contract: Late fee \$20/day.\nQuestion: Late fee on 11th?",
      'options': ['\$20', '\$0', '\$40', '\$10'],
      'correctIndex': 0,
      'explain': '1 ngày trễ = \$20.',
    },
    {
      'question':
          "Triple:\n(1) Gym rule: Max booking 60 min.\n(2) Sheet: User booked 90 min.\n(3) Email: “Please adjust within policy.”\nQuestion: What change is needed?",
      'options': [
        'Reduce to 60 min',
        'Extend to 120',
        'Add partner',
        'Move to weekend',
      ],
      'correctIndex': 0,
      'explain': 'Giới hạn 60’.',
    },
    {
      'question':
          "Triple:\n(1) Ad: Free upgrade for stays 3 nights+.\n(2) Booking: 2 nights.\n(3) Offer email: “Upgrade?”\nQuestion: Eligibility?",
      'options': [
        'Not eligible',
        'Eligible',
        'Eligible on weekdays',
        'Only for groups',
      ],
      'correctIndex': 0,
      'explain': 'Cần ≥3 đêm.',
    },
    {
      'question':
          "Triple:\n(1) Contest: Submissions by 18:00 UTC.\n(2) Team clock: 18:00 GMT.\n(3) Note: UTC = GMT.\nQuestion: Is timing aligned?",
      'options': ['Yes', 'No', 'Only in summer', 'Unknown'],
      'correctIndex': 0,
      'explain': 'UTC≈GMT → ok.',
    },
    {
      'question':
          "Triple:\n(1) Policy: “Visitors must sign in.”\n(2) Log: Two guests no signature.\n(3) Security email: “Please comply.”\nQuestion: What went wrong?",
      'options': [
        'Guests didn’t sign in',
        'Wrong IDs',
        'Late arrival',
        'Wrong floor',
      ],
      'correctIndex': 0,
      'explain': 'Thiếu chữ ký.',
    },
    {
      'question':
          "Triple:\n(1) Course: Quiz 20%, Project 40%, Final 40%.\n(2) Scores: Quiz 90, Project 70, Final 60.\n(3) Passing: ≥60 overall.\nQuestion: Does the student pass?",
      'options': [
        'Yes (overall 68)',
        'No (overall 58)',
        'Exactly 60',
        'Unknown',
      ],
      'correctIndex': 0,
      'explain': '0.2*90+0.4*70+0.4*60=18+28+24=70.',
    },
  ];

  // L3 — Văn bản học thuật & báo cáo (ngắn gọn)
  final p7Lv800L3 = <Map<String, dynamic>>[
    {
      'question':
          "Report:\nPilot stores adopting self-checkout saw a 15% reduction in wait times with unchanged basket size.\nQuestion: What changed?",
      'options': [
        'Wait times reduced',
        'Basket size increased',
        'Prices rose',
        'Store hours changed',
      ],
      'correctIndex': 0,
      'explain': 'Giảm thời gian chờ.',
    },
    {
      'question':
          "Academic:\nThe study controlled for age and income to isolate the effect of training on productivity.\nQuestion: What variables were controlled?",
      'options': [
        'Age and income',
        'Gender and height',
        'Location only',
        'None',
      ],
      'correctIndex': 0,
      'explain': 'Stated directly.',
    },
    {
      'question':
          "Report:\nQ2 churn declined after implementing a loyalty program; however, acquisition costs increased.\nQuestion: What trade-off occurred?",
      'options': [
        'Lower churn, higher acquisition cost',
        'Higher churn, lower cost',
        'Both increased',
        'Both decreased',
      ],
      'correctIndex': 0,
      'explain': 'Trade-off nêu rõ.',
    },
    {
      'question':
          "Academic:\nParticipants were randomly assigned to treatment and control groups.\nQuestion: What method is used?",
      'options': [
        'Random assignment',
        'Quota sampling',
        'Case study',
        'Observational only',
      ],
      'correctIndex': 0,
      'explain': 'Random assignment.',
    },
    {
      'question':
          "Report:\nThe forecast assumes stable exchange rates through Q4.\nQuestion: What assumption is made?",
      'options': [
        'Stable exchange rates',
        'Rising inflation',
        'Lower taxes',
        'New tariffs',
      ],
      'correctIndex': 0,
      'explain': 'Assumption stated.',
    },
    {
      'question':
          "Academic:\nA limitation is the small sample size, which may reduce generalizability.\nQuestion: What is the limitation?",
      'options': [
        'Small sample size',
        'Measurement bias',
        'Missing data',
        'Confounding',
      ],
      'correctIndex': 0,
      'explain': 'Nêu rõ hạn chế.',
    },
    {
      'question':
          "Report:\nDemand elasticity appears higher for premium products than for basic ones.\nQuestion: Which is more elastic?",
      'options': ['Premium products', 'Basic products', 'Both same', 'Unknown'],
      'correctIndex': 0,
      'explain': 'Premium > basic.',
    },
    {
      'question':
          "Academic:\nWe used a difference-in-differences model to estimate causal impact.\nQuestion: Which model was used?",
      'options': [
        'Difference-in-differences',
        'Linear probability',
        'K-means',
        'ARIMA',
      ],
      'correctIndex': 0,
      'explain': 'Model named.',
    },
    {
      'question':
          "Report:\nAfter redesign, the website’s bounce rate fell from 48% to 34%.\nQuestion: What happened to bounce rate?",
      'options': [
        'Decreased to 34%',
        'Increased to 60%',
        'Unchanged',
        'Unknown',
      ],
      'correctIndex': 0,
      'explain': 'Giảm còn 34%.',
    },
    {
      'question':
          "Academic:\nThe correlation between study time and test scores was positive and significant (p<0.05).\nQuestion: How are study time and scores related?",
      'options': [
        'Positively',
        'Negatively',
        'No relation',
        'Curvilinear only',
      ],
      'correctIndex': 0,
      'explain': 'Positive significant.',
    },
  ];

  // L4 — Phân tích suy luận (ẩn ý)
  final p7Lv800L4 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\n“I’ll bring the projector since Room 101 doesn’t have one.”\nQuestion: What can be inferred about Room 101?",
      'options': [
        'It lacks a projector',
        'It is too small',
        'It is under repair',
        'It is double-booked',
      ],
      'correctIndex': 0,
      'explain': 'Suy ra từ lý do.',
    },
    {
      'question':
          "Notice:\n“Complimentary earplugs available at the entrance.”\nQuestion: What is implied about the venue?",
      'options': [
        'It may be loud',
        'It is cold',
        'It is crowded',
        'It is dark',
      ],
      'correctIndex': 0,
      'explain': 'Earplugs ⇒ ồn.',
    },
    {
      'question':
          "Email:\n“Let’s push the review to next week; the draft isn’t ready.”\nQuestion: Why postpone?",
      'options': [
        'Draft not ready',
        'Room unavailable',
        'Client sick',
        'Holiday',
      ],
      'correctIndex': 0,
      'explain': 'Nêu trực tiếp.',
    },
    {
      'question':
          "Ad:\n“Bring your own cup for a discount.”\nQuestion: What does the store encourage?",
      'options': [
        'Reusable cups',
        'More sugar',
        'Late-night visits',
        'Delivery orders',
      ],
      'correctIndex': 0,
      'explain': 'Khuyến khích tái sử dụng.',
    },
    {
      'question':
          "Email:\n“I’ll forward the NDA; please sign before we share the dataset.”\nQuestion: What is required before sharing?",
      'options': ['Signed NDA', 'Payment', 'License fee', 'Travel'],
      'correctIndex': 0,
      'explain': 'Điều kiện tiên quyết.',
    },
    {
      'question':
          "Notice:\n“Water will be shut off 2–4 p.m.”\nQuestion: What should residents avoid then?",
      'options': [
        'Using taps',
        'Using elevator',
        'Leaving building',
        'Opening windows',
      ],
      'correctIndex': 0,
      'explain': 'Không có nước.',
    },
    {
      'question':
          "Email:\n“Can we switch to 11 a.m.? The supplier lands at 10:30.”\nQuestion: Why change time?",
      'options': [
        'Supplier arrival',
        'Room change',
        'Power cut',
        'Budget issue',
      ],
      'correctIndex': 0,
      'explain': 'Phụ thuộc giờ đáp.',
    },
    {
      'question':
          "Notice:\n“Strollers not allowed on escalators.”\nQuestion: What is the concern?",
      'options': ['Safety', 'Noise', 'Cleanliness', 'Capacity'],
      'correctIndex': 0,
      'explain': 'An toàn.',
    },
    {
      'question':
          "Email:\n“Let’s cap attendance at 30 due to the room size.”\nQuestion: What is implied about the room?",
      'options': [
        'Limited capacity',
        'No projector',
        'Under repair',
        'Far away',
      ],
      'correctIndex': 0,
      'explain': 'Dung lượng hạn chế.',
    },
    {
      'question':
          "Notice:\n“Please use the back entrance after 8 p.m.”\nQuestion: What can be inferred?",
      'options': [
        'Front entrance closes at night',
        'Front entrance dangerous',
        'Only staff allowed',
        'Parking closed',
      ],
      'correctIndex': 0,
      'explain': 'Giới hạn cửa trước.',
    },
  ];

  // L5 — Ôn tập tổng hợp (Double, triple, báo cáo, suy luận)
  final p7Lv800L5 = <Map<String, dynamic>>[
    {
      'question':
          "Double:\n(1) Agenda: Review 14:00–14:30, Demo 14:30–15:00.\n(2) Email: “Join at 14:20 for the demo.”\nQuestion: What is wrong?",
      'options': [
        'Demo starts 14:30, not 14:20',
        'Review starts 14:00',
        'No demo today',
        'Time zone error',
      ],
      'correctIndex': 0,
      'explain': 'Lịch demo 14:30.',
    },
    {
      'question':
          "Triple:\n(1) Policy: “Keys must be returned by last workday.”\n(2) Email: Last day extended.\n(3) Log: Keys returned earlier.\nQuestion: Was policy followed?",
      'options': ['Yes', 'No', 'Partially', 'Unknown'],
      'correctIndex': 0,
      'explain': 'Đã trả trước ngày làm việc cuối.',
    },
    {
      'question':
          "Report:\nCustomer NPS rose after support hours expanded.\nQuestion: What likely caused the rise?",
      'options': [
        'Longer support hours',
        'Price drop',
        'New logo',
        'Holiday sales',
      ],
      'correctIndex': 0,
      'explain': 'Quan hệ nêu rõ.',
    },
    {
      'question':
          "Inference:\n“Please bring cash; our card machine is down.”\nQuestion: What payment is unavailable?",
      'options': ['Card payment', 'Cash', 'Voucher', 'Wire'],
      'correctIndex': 0,
      'explain': 'Card machine down.',
    },
    {
      'question':
          "Double:\n(1) Flight delay 2 hours.\n(2) Shuttle leaves on original time.\nQuestion: Risk for passengers?",
      'options': ['Miss the shuttle', 'Lose baggage', 'Extra fee', 'New seat'],
      'correctIndex': 0,
      'explain': 'Shuttle không đổi giờ.',
    },
    {
      'question':
          "Triple:\n(1) Exam 10:00.\n(2) Rule: Arrivals after 10:15 not allowed.\n(3) Bus ETA 10:20.\nQuestion: Outcome?",
      'options': [
        'Student cannot enter',
        'Allowed with penalty',
        'Exam extended',
        'Different room',
      ],
      'correctIndex': 0,
      'explain': 'Đến 10:20 > 10:15.',
    },
    {
      'question':
          "Report:\nWarehouse automation cut errors by 30% but raised maintenance costs.\nQuestion: What is the trade-off?",
      'options': [
        'Fewer errors, higher maintenance cost',
        'More errors, lower cost',
        'Both lower',
        'No change',
      ],
      'correctIndex': 0,
      'explain': 'Trade-off rõ ràng.',
    },
    {
      'question':
          "Inference:\n“Microwave is out of order; use the pantry on floor 5.”\nQuestion: What can users do?",
      'options': [
        'Use another pantry',
        'Repair it',
        'Order lunch',
        'Skip meals',
      ],
      'correctIndex': 0,
      'explain': 'Chuyển sang tầng 5.',
    },
    {
      'question':
          "Double:\n(1) Rental: No pets allowed.\n(2) Tenant: Requests to bring a cat.\nQuestion: Policy outcome?",
      'options': [
        'Request denied',
        'Extra fee required',
        'Allowed with deposit',
        'Allowed on weekends',
      ],
      'correctIndex': 0,
      'explain': 'Chính sách cấm.',
    },
    {
      'question':
          "Triple:\n(1) Shift 08:00–16:00.\n(2) Badge-in: 08:17.\n(3) Policy: Grace period 10 min.\nQuestion: Status?",
      'options': ['Late arrival', 'On time', 'Excused', 'Holiday'],
      'correctIndex': 0,
      'explain':
          '08:17 > 10’ grace? Bắt đầu 08:00 → 10’ = 08:10; 08:17 là trễ.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv300
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Đọc hiểu đoạn văn ngắn',
    questions: p7Lv300L1,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Quảng cáo & Thông báo',
    questions: p7Lv300L2,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Email đơn giản',
    questions: p7Lv300L3,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Bảng biểu & thời gian biểu',
    questions: p7Lv300L4,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p7Lv300L5,
  );

  // lv600
  await pushLesson(
    levelId: 'lv600',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Email công việc',
    questions: p7Lv600L1,
  );
  await pushLesson(
    levelId: 'lv600',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Bài báo & tin tức',
    questions: p7Lv600L2,
  );
  await pushLesson(
    levelId: 'lv600',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Thư từ công việc',
    questions: p7Lv600L3,
  );
  await pushLesson(
    levelId: 'lv600',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Double passage',
    questions: p7Lv600L4,
  );
  await pushLesson(
    levelId: 'lv600',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p7Lv600L5,
  );

  // lv800
  await pushLesson(
    levelId: 'lv800',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Double passage nâng cao',
    questions: p7Lv800L1,
  );
  await pushLesson(
    levelId: 'lv800',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Triple passage',
    questions: p7Lv800L2,
  );
  await pushLesson(
    levelId: 'lv800',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Văn bản học thuật & báo cáo',
    questions: p7Lv800L3,
  );
  await pushLesson(
    levelId: 'lv800',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Phân tích suy luận',
    questions: p7Lv800L4,
  );
  await pushLesson(
    levelId: 'lv800',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p7Lv800L5,
  );
}
