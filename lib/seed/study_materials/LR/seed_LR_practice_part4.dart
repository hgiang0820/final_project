// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart4() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';
  const audioDemo = 'input_tests/testLR/part4/01%20Test%201_LC_Voca.mp3';

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
        .doc('part4')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Talks',
      'lessonName': lessonName,
      'audioPath': audioDemo,
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

  // L1 — Public Announcement (time/place/service)
  final p4Lv300L1 = <Map<String, dynamic>>[
    {
      'question':
          "Announcement: The library will close at 7 p.m. today due to maintenance.\nQuestion: What time will the library close?",
      'options': ['7 p.m.', '6 p.m.', '8 p.m.', '9 p.m.'],
      'correctIndex': 0,
      'explain': 'Keyword thời gian: close at 7 p.m.',
    },
    {
      'question':
          "Announcement: Trains to Riverside depart from Platform 4.\nQuestion: Where should passengers go?",
      'options': ['Platform 4', 'Platform 2', 'Gate B', 'Counter 4'],
      'correctIndex': 0,
      'explain': 'Địa điểm: Platform 4.',
    },
    {
      'question':
          "Announcement: Free Wi-Fi is available in the main hall and cafeteria.\nQuestion: Where is Wi-Fi available?",
      'options': ['Main hall and cafeteria', 'Parking lot only', 'Offices only', 'Conference room only'],
      'correctIndex': 0,
      'explain': 'Địa điểm dịch vụ.',
    },
    {
      'question':
          "Announcement: The museum opens at 9 a.m. and offers guided tours every hour.\nQuestion: How often are tours offered?",
      'options': ['Every hour', 'Every two hours', 'Only mornings', 'Weekends only'],
      'correctIndex': 0,
      'explain': 'Tần suất: every hour.',
    },
    {
      'question':
          "Announcement: Please use the south entrance; the north entrance is under renovation.\nQuestion: Which entrance should visitors use?",
      'options': ['South entrance', 'North entrance', 'West gate', 'Basement door'],
      'correctIndex': 0,
      'explain': 'Chỉ rõ lối vào hợp lệ.',
    },
    {
      'question':
          "Announcement: The last bus to the airport leaves at 10:30 p.m.\nQuestion: What is the last departure time?",
      'options': ['10:30 p.m.', '10:00 p.m.', '11:00 p.m.', '9:30 p.m.'],
      'correctIndex': 0,
      'explain': 'Giờ cuối: 10:30 p.m.',
    },
    {
      'question':
          "Announcement: Luggage storage is located behind the ticket counter.\nQuestion: Where is the luggage storage?",
      'options': ['Behind the ticket counter', 'Next to Platform 1', 'Across the street', 'On the second floor'],
      'correctIndex': 0,
      'explain': 'Giới từ vị trí: behind.',
    },
    {
      'question':
          "Announcement: The café offers a lunch set until 2 p.m.\nQuestion: Until when is the lunch set available?",
      'options': ['2 p.m.', 'Noon', '3 p.m.', 'All day'],
      'correctIndex': 0,
      'explain': 'Thời hạn: until 2 p.m.',
    },
    {
      'question':
          "Announcement: Please keep your belongings with you at all times.\nQuestion: What are listeners asked to do?",
      'options': ['Keep belongings with them', 'Leave bags at the door', 'Check bags at counter', 'Turn off phones'],
      'correctIndex': 0,
      'explain': 'Yêu cầu an ninh.',
    },
    {
      'question':
          "Announcement: Visitor parking is across from the main building.\nQuestion: Where is visitor parking?",
      'options': ['Across from the main building', 'Behind the cafeteria', 'On the roof', 'Under the north gate'],
      'correctIndex': 0,
      'explain': 'Chỉ đường: across from.',
    },
  ];

  // L2 — Service Information (service, promo, basics)
  final p4Lv300L2 = <Map<String, dynamic>>[
    {
      'question':
          "Info: Green Gym offers a three-month membership for \$99 with free classes on weekends.\nQ: What is included?",
      'options': ['Weekend classes', 'Free towels daily', 'Personal trainer', '24/7 sauna'],
      'correctIndex': 0,
      'explain': 'Khuyến mãi: free classes on weekends.',
    },
    {
      'question':
          "Info: City Tours run every two hours; tickets can be purchased online.\nQ: How can tickets be bought?",
      'options': ['Online', 'At ATMs only', 'Phone only', 'Agents only'],
      'correctIndex': 0,
      'explain': 'Phương thức mua: online.',
    },
    {
      'question':
          "Info: Laundry service returns items within 24 hours.\nQ: When will items be ready?",
      'options': ['Within 24 hours', 'Within 3 days', 'Same day only', 'Within a week'],
      'correctIndex': 0,
      'explain': 'Turnaround: 24h.',
    },
    {
      'question':
          "Info: The bank offers no-fee checking for students.\nQ: Who gets no-fee checking?",
      'options': ['Students', 'Seniors', 'Businesses', 'Tourists'],
      'correctIndex': 0,
      'explain': 'Đối tượng: students.',
    },
    {
      'question':
          "Info: Orders over \$50 qualify for free delivery.\nQ: What qualifies for free delivery?",
      'options': ['Orders over \$50', 'Any order', 'Members only', 'Weekends only'],
      'correctIndex': 0,
      'explain': 'Điều kiện: > \$50.',
    },
    {
      'question':
          "Info: The coworking space provides meeting rooms by the hour.\nQ: How are the rooms rented?",
      'options': ['By the hour', 'By the week', 'By the month only', 'Annually'],
      'correctIndex': 0,
      'explain': 'Billing theo giờ.',
    },
    {
      'question':
          "Info: Free returns are accepted within 14 days with receipt.\nQ: What is required for free returns?",
      'options': ['Receipt', 'Membership card', 'Online account', 'Original cash only'],
      'correctIndex': 0,
      'explain': 'Cần hóa đơn.',
    },
    {
      'question':
          "Info: Phone support is available from 8 a.m. to 8 p.m.\nQ: Until what time is support available?",
      'options': ['8 p.m.', '6 p.m.', '9 p.m.', 'Midnight'],
      'correctIndex': 0,
      'explain': 'Khung giờ kết thúc: 8 p.m.',
    },
    {
      'question':
          "Info: Weekend classes require advance registration.\nQ: What must customers do?",
      'options': ['Register in advance', 'Pay cash only', 'Arrive late', 'Bring ID only'],
      'correctIndex': 0,
      'explain': 'Yêu cầu đăng ký sớm.',
    },
    {
      'question':
          "Info: The salon offers a 10% discount for first-time customers.\nQ: Who gets the discount?",
      'options': ['First-time customers', 'Members only', 'Students only', 'Groups only'],
      'correctIndex': 0,
      'explain': 'Đối tượng ưu đãi.',
    },
  ];

  // L3 — Directions (left/right/across/behind)
  final p4Lv300L3 = <Map<String, dynamic>>[
    {
      'question':
          "Directions: From the lobby, turn left and go past the elevators; the conference room is on your right.\nQ: Where is the conference room?",
      'options': ['On your right after the elevators', 'Behind the lobby', 'Across the street', 'On the left of elevators'],
      'correctIndex': 0,
      'explain': 'Left → past → on your right.',
    },
    {
      'question':
          "Directions: The shuttle stop is across from the hotel entrance.\nQ: Where is the shuttle stop?",
      'options': ['Across from the entrance', 'Behind the hotel', 'Next to Room 102', 'On the rooftop'],
      'correctIndex': 0,
      'explain': 'across from = đối diện.',
    },
    {
      'question':
          "Directions: Restrooms are behind the café, down the hall.\nQ: Where are the restrooms?",
      'options': ['Behind the café', 'At the lobby', 'Across the street', 'Inside the café counter'],
      'correctIndex': 0,
      'explain': 'behind the café.',
    },
    {
      'question':
          "Directions: Take the escalator to the second floor; the bookstore is to the left.\nQ: Where is the bookstore?",
      'options': ['To the left on the second floor', 'Right of the escalator on 1F', 'Behind the cinema', 'Across from parking'],
      'correctIndex': 0,
      'explain': '2F bên trái.',
    },
    {
      'question':
          "Directions: The gym is next to the pool, across the courtyard.\nQ: The gym is located…",
      'options': ['Next to the pool', 'Behind the lobby', 'Under the courtyard', 'Opposite the pool'],
      'correctIndex': 0,
      'explain': 'next to = kế bên.',
    },
    {
      'question':
          "Directions: Turn right at the light and the station will be on your left.\nQ: After turning right, where is the station?",
      'options': ['On your left', 'On your right', 'Straight ahead', 'Behind you'],
      'correctIndex': 0,
      'explain': 'Turn right → station on your left.',
    },
    {
      'question':
          "Directions: Meeting Room A is across the corridor from the lounge.\nQ: Where is Room A?",
      'options': ['Across the corridor from the lounge', 'Behind the lounge', 'Next to Room B', 'Above the lounge'],
      'correctIndex': 0,
      'explain': 'across the corridor.',
    },
    {
      'question':
          "Directions: The ticket office is at the far end of the hall on the right.\nQ: Where is the ticket office?",
      'options': ['At the far end on the right', 'Near the entrance', 'Left side halfway', 'Behind the stairs'],
      'correctIndex': 0,
      'explain': 'cuối hành lang bên phải.',
    },
    {
      'question':
          "Directions: Go straight past the fountain; the gallery is behind the café.\nQ: Where is the gallery?",
      'options': ['Behind the café', 'Across from the fountain', 'Left of the fountain', 'Right of the café'],
      'correctIndex': 0,
      'explain': 'gallery behind café.',
    },
    {
      'question':
          "Directions: Visitor badges are issued at the desk to the right of the main doors.\nQ: Where are badges issued?",
      'options': ['At the desk to the right of the doors', 'At security outside', 'In the basement', 'At the café counter'],
      'correctIndex': 0,
      'explain': 'right of the doors.',
    },
  ];

  // L4 — Event Info (name/time/date/place)
  final p4Lv300L4 = <Map<String, dynamic>>[
    {
      'question':
          "Event: The Career Fair will be held on May 12 at the Convention Center.\nQ: When is the Career Fair?",
      'options': ['May 12', 'May 21', 'June 12', 'April 12'],
      'correctIndex': 0,
      'explain': 'Date keyword.',
    },
    {
      'question':
          "Event: The opening ceremony starts at 10 a.m. in Hall B.\nQ: What time does it start?",
      'options': ['10 a.m.', '9 a.m.', '11 a.m.', '2 p.m.'],
      'correctIndex': 0,
      'explain': 'Time keyword.',
    },
    {
      'question':
          "Event: Tickets for the Jazz Night are available online and at the door.\nQ: Where can tickets be purchased?",
      'options': ['Online and at the door', 'Phone only', 'At kiosks only', 'Members only'],
      'correctIndex': 0,
      'explain': 'Where to buy.',
    },
    {
      'question':
          "Event: Registration closes Friday at noon.\nQ: When does registration close?",
      'options': ['Friday at noon', 'Thursday at noon', 'Friday at 5', 'Saturday morning'],
      'correctIndex': 0,
      'explain': 'Deadline.',
    },
    {
      'question':
          "Event: The keynote speaker is Dr. Helen Park.\nQ: Who is the keynote speaker?",
      'options': ['Dr. Helen Park', 'Mr. Adam Lee', 'Prof. Kim', 'Ms. Nora Hill'],
      'correctIndex': 0,
      'explain': 'Name keyword.',
    },
    {
      'question':
          "Event: Workshops will take place in Rooms 201 and 202.\nQ: Where are the workshops?",
      'options': ['Rooms 201 & 202', 'Hall A', 'Lobby', 'Cafeteria'],
      'correctIndex': 0,
      'explain': 'Place keyword.',
    },
    {
      'question':
          "Event: The concert begins at 7:30 p.m. on Saturday.\nQ: What is the day of the concert?",
      'options': ['Saturday', 'Friday', 'Sunday', 'Monday'],
      'correctIndex': 0,
      'explain': 'Day keyword.',
    },
    {
      'question':
          "Event: Free parking is available in Lot C.\nQ: Where is free parking?",
      'options': ['Lot C', 'Lot A', 'Street only', 'Underground only'],
      'correctIndex': 0,
      'explain': 'Place keyword.',
    },
    {
      'question':
          "Event: Check-in opens one hour before the race.\nQ: When does check-in open?",
      'options': ['1 hour before', '2 hours before', 'At start time', 'After the race'],
      'correctIndex': 0,
      'explain': 'Time relative.',
    },
    {
      'question':
          "Event: Please wear your badge at all times during the conference.\nQ: What must attendees do?",
      'options': ['Wear badges always', 'Arrive by 8', 'Bring laptops', 'Pay cash'],
      'correctIndex': 0,
      'explain': 'Rule keyword.',
    },
  ];

  // L5 — Mixed review
  final p4Lv300L5 = <Map<String, dynamic>>[
    {
      'question':
          "Announcement: The 8:15 train to Lakeside will depart from Platform 2.\nQ: Which platform?",
      'options': ['Platform 2', 'Platform 8', 'Gate 2', 'Platform 5'],
      'correctIndex': 0,
      'explain': 'Platform keyword.',
    },
    {
      'question':
          "Info: Our bike rental shop opens at 9 and closes at 7.\nQ: What is the closing time?",
      'options': ['7 p.m.', '9 p.m.', '6 p.m.', '5 p.m.'],
      'correctIndex': 0,
      'explain': 'Close at 7.',
    },
    {
      'question':
          "Directions: Turn left at the bookstore; the theater is behind the café.\nQ: Where is the theater?",
      'options': ['Behind the café', 'Across the street', 'Next to the bookstore', 'On the right of café'],
      'correctIndex': 0,
      'explain': 'behind.',
    },
    {
      'question':
          "Event: The Spring Market runs April 5–7 in Central Square.\nQ: Where is the event?",
      'options': ['Central Square', 'City Hall', 'River Park', 'Main Hall'],
      'correctIndex': 0,
      'explain': 'Place keyword.',
    },
    {
      'question':
          "Info: Free delivery for orders over \$60 this weekend only.\nQ: What is the condition?",
      'options': ['Over \$60 this weekend', 'Members only', 'All orders', 'Weekdays only'],
      'correctIndex': 0,
      'explain': 'Condition + time window.',
    },
    {
      'question':
          "Announcement: Please proceed to Gate 11 for boarding.\nQ: What should listeners do?",
      'options': ['Go to Gate 11', 'Wait at Gate 1', 'Call customer service', 'Pick up bags'],
      'correctIndex': 0,
      'explain': 'Action required.',
    },
    {
      'question':
          "Event: Check-in opens at 8 a.m.; the workshop begins at 9.\nQ: What time does the workshop begin?",
      'options': ['9 a.m.', '8 a.m.', '10 a.m.', '9 p.m.'],
      'correctIndex': 0,
      'explain': 'Begin time.',
    },
    {
      'question':
          "Directions: The pharmacy is across from the supermarket entrance.\nQ: Where is the pharmacy?",
      'options': ['Across from the entrance', 'Behind the parking lot', 'On the rooftop', 'Next to Gate A'],
      'correctIndex': 0,
      'explain': 'Across from.',
    },
    {
      'question':
          "Info: Call 555-0123 for customer support between 9 and 6.\nQ: When is support available?",
      'options': ['9–6', '24 hours', '6–9', 'Weekends only'],
      'correctIndex': 0,
      'explain': 'Time window.',
    },
    {
      'question':
          "Announcement: The elevator is out of service; please use the stairs.\nQ: What is not working?",
      'options': ['The elevator', 'The lights', 'The escalator', 'The doors'],
      'correctIndex': 0,
      'explain': 'Service status.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // L1 — News Report (main idea + numbers)
  final p4Lv600L1 = <Map<String, dynamic>>[
    {
      'question':
          "News: The city approved a \$2 million plan to expand bike lanes this summer.\nQ: What was approved?",
      'options': [
        'A \$2M bike-lane expansion',
        'A new subway line',
        'Free parking downtown',
        'Airport renovation'
      ],
      'correctIndex': 0,
      'explain': 'Main idea + number.',
    },
    {
      'question':
          "News: A charity run raised \$85,000 with over 1,200 participants.\nQ: How much was raised?",
      'options': ['\$85,000', '\$1,200', '\$58,000', '\$120,000'],
      'correctIndex': 0,
      'explain': 'Số tiền quyên góp.',
    },
    {
      'question':
          "News: The 7:30 ferry will be delayed 20 minutes due to fog.\nQ: How long is the delay?",
      'options': ['20 minutes', '7 minutes', '30 minutes', '2 hours'],
      'correctIndex': 0,
      'explain': 'Delay = 20’.',
    },
    {
      'question':
          "News: A new tech park will create 500 jobs by next year.\nQ: What will the tech park create?",
      'options': ['500 jobs', '500 offices', '500 houses', '500 stores'],
      'correctIndex': 0,
      'explain': 'Jobs.',
    },
    {
      'question':
          "News: Gas prices dropped 5 percent this week.\nQ: What happened to gas prices?",
      'options': ['Dropped 5%', 'Rose 5%', 'Stayed the same', 'Doubled'],
      'correctIndex': 0,
      'explain': 'Trend.',
    },
    {
      'question':
          "News: The marathon starts at 6 a.m. with road closures until noon.\nQ: Until when are roads closed?",
      'options': ['Noon', '10 a.m.', '2 p.m.', 'All day'],
      'correctIndex': 0,
      'explain': 'Time window.',
    },
    {
      'question':
          "News: The museum welcomed its 1 millionth visitor this month.\nQ: Which milestone was reached?",
      'options': [
        '1 million visitors',
        '100 thousand visitors',
        '1 million exhibits',
        '1 million members'
      ],
      'correctIndex': 0,
      'explain': 'Milestone.',
    },
    {
      'question':
          "News: A storm is expected to bring up to 10 cm of rain tonight.\nQ: How much rain is expected?",
      'options': ['Up to 10 cm', 'Up to 1 cm', 'Up to 20 cm', 'None'],
      'correctIndex': 0,
      'explain': 'Amount.',
    },
    {
      'question':
          "News: The council approved a 3% increase in the education budget.\nQ: What changed by 3%?",
      'options': [
        'Education budget',
        'Sales tax',
        'Transit fares',
        'Utility fees'
      ],
      'correctIndex': 0,
      'explain': 'Budget change.',
    },
    {
      'question':
          "News: A new flight to Tokyo will operate four times a week starting in June.\nQ: How often will the flight operate?",
      'options': ['Four times a week', 'Daily', 'Twice a week', 'Weekends only'],
      'correctIndex': 0,
      'explain': 'Frequency.',
    },
  ];

  // L2 — Product Presentation (functions, benefits)
  final p4Lv600L2 = <Map<String, dynamic>>[
    {
      'question':
          "Product: Our smart lamp adjusts brightness automatically and saves up to 30% energy.\nQ: What is a benefit?",
      'options': ['Saves up to 30% energy', 'Requires special bulbs', 'Manual only', 'Heavier than others'],
      'correctIndex': 0,
      'explain': 'Benefit keyword.',
    },
    {
      'question':
          "Product: The vacuum includes a HEPA filter and runs for 60 minutes per charge.\nQ: How long does it run?",
      'options': ['60 minutes', '16 minutes', '6 hours', '30 minutes'],
      'correctIndex': 0,
      'explain': 'Runtime.',
    },
    {
      'question':
          "Product: The smartwatch is waterproof up to 50 meters.\nQ: What is true about the watch?",
      'options': ['Waterproof to 50 m', 'Not water-resistant', 'Only splash-proof', 'For swimming no'],
      'correctIndex': 0,
      'explain': 'Spec.',
    },
    {
      'question':
          "Product: Our blender features a quiet mode and a 5-year warranty.\nQ: What feature reduces noise?",
      'options': ['Quiet mode', 'Turbo mode', 'Travel mode', 'Sleep mode'],
      'correctIndex': 0,
      'explain': 'Feature.',
    },
    {
      'question':
          "Product: The camera supports 4K recording and image stabilization.\nQ: Which capability is mentioned?",
      'options': ['4K recording', '8K printing', 'Thermal imaging', '3D scanning'],
      'correctIndex': 0,
      'explain': 'Capability.',
    },
    {
      'question':
          "Product: The mixer comes with three attachments and a storage case.\nQ: What does it come with?",
      'options': ['Three attachments', 'Only one attachment', 'No case', 'Batteries included'],
      'correctIndex': 0,
      'explain': 'Included items.',
    },
    {
      'question':
          "Product: Battery fully charges in 90 minutes via USB-C.\nQ: How long for a full charge?",
      'options': ['90 minutes', '9 minutes', '60 minutes', '2 hours 30'],
      'correctIndex': 0,
      'explain': 'Charge time.',
    },
    {
      'question':
          "Product: The app offers real-time tracking and alerts.\nQ: What does the app provide?",
      'options': ['Tracking and alerts', 'Music only', 'Games only', 'Offline maps only'],
      'correctIndex': 0,
      'explain': 'Functions.',
    },
    {
      'question':
          "Product: The laptop weighs just 1.2 kilograms.\nQ: What is highlighted?",
      'options': ['Light weight', 'Large battery', 'Touch bar', 'CD drive'],
      'correctIndex': 0,
      'explain': 'Selling point.',
    },
    {
      'question':
          "Product: Noise-canceling headphones block ambient sound on flights.\nQ: Where are they especially useful?",
      'options': ['On flights', 'In the pool', 'While cooking', 'While driving a car'],
      'correctIndex': 0,
      'explain': 'Use case.',
    },
  ];

  // L3 — Schedules & Plans (multi timepoints)
  final p4Lv600L3 = <Map<String, dynamic>>[
    {
      'question':
          "Schedule: Registration opens at 8:30; the first session begins at 9:15.\nQ: When does the first session begin?",
      'options': ['9:15', '8:30', '9:00', '10:15'],
      'correctIndex': 0,
      'explain': 'Time mapping.',
    },
    {
      'question':
          "Schedule: There is a break from 10:45 to 11:00.\nQ: How long is the break?",
      'options': ['15 minutes', '30 minutes', '10 minutes', '45 minutes'],
      'correctIndex': 0,
      'explain': '11:00–10:45=15’.',
    },
    {
      'question':
          "Plan: The bus departs at 2:20 and arrives at 3:05.\nQ: What is the travel time?",
      'options': ['45 minutes', '35 minutes', '55 minutes', '1 hour'],
      'correctIndex': 0,
      'explain': '3:05–2:20=45’.',
    },
    {
      'question':
          "Schedule: Lunch is served from 12 to 1; tours start at 1:15.\nQ: When do tours start?",
      'options': ['1:15', '12:15', '1:00', '12:45'],
      'correctIndex': 0,
      'explain': 'Start time tours.',
    },
    {
      'question':
          "Plan: Setup takes 30 minutes; rehearsal takes 20.\nQ: How long in total?",
      'options': ['50 minutes', '30 minutes', '20 minutes', '45 minutes'],
      'correctIndex': 0,
      'explain': '30+20=50’.',
    },
    {
      'question':
          "Schedule: The evening session ends at 6; networking follows for 45 minutes.\nQ: When does networking end?",
      'options': ['6:45', '6:30', '7:00', '5:45'],
      'correctIndex': 0,
      'explain': '6 + 45’ = 6:45.',
    },
    {
      'question':
          "Plan: Buses run every 12 minutes.\nQ: How many buses per hour approximately?",
      'options': ['5', '4', '6', '3'],
      'correctIndex': 0,
      'explain': '60/12 ≈ 5.',
    },
    {
      'question':
          "Schedule: The last workshop begins at 4:20 and lasts 40 minutes.\nQ: When does it end?",
      'options': ['5:00', '4:50', '5:10', '5:20'],
      'correctIndex': 0,
      'explain': '4:20 + 40’ = 5:00.',
    },
    {
      'question':
          "Plan: Doors open 30 minutes before showtime at 7.\nQ: When do doors open?",
      'options': ['6:30', '6:00', '6:45', '7:30'],
      'correctIndex': 0,
      'explain': '7:00 − 30’ = 6:30.',
    },
    {
      'question':
          "Schedule: Check-in closes 15 minutes before departure at 10:10.\nQ: When does check-in close?",
      'options': ['9:55', '9:50', '10:00', '10:05'],
      'correctIndex': 0,
      'explain': '10:10 − 15’ = 9:55.',
    },
  ];

  // L4 — Instructions (sequence words)
  final p4Lv600L4 = <Map<String, dynamic>>[
    {
      'question':
          "Instruction: First, plug in the projector; then press the power button.\nQ: What should be done first?",
      'options': ['Plug in the projector', 'Press power', 'Open slides', 'Dim the lights'],
      'correctIndex': 0,
      'explain': 'First → hành động đầu.',
    },
    {
      'question':
          "Instruction: After you sign, place the form in the tray.\nQ: What happens after signing?",
      'options': ['Place form in tray', 'Send an email', 'Call support', 'Make a copy'],
      'correctIndex': 0,
      'explain': 'After → bước kế.',
    },
    {
      'question':
          "Instruction: Next, remove the cover and insert the cartridge.\nQ: What is inserted?",
      'options': ['The cartridge', 'The paper', 'The tray', 'The cable'],
      'correctIndex': 0,
      'explain': 'Object chính.',
    },
    {
      'question':
          "Instruction: Finally, restart the device to complete the update.\nQ: What is the final step?",
      'options': ['Restart the device', 'Download the file', 'Charge the device', 'Call IT'],
      'correctIndex': 0,
      'explain': 'Finally → bước cuối.',
    },
    {
      'question':
          "Instruction: First, mix the ingredients; then bake for 20 minutes.\nQ: How long is the baking time?",
      'options': ['20 minutes', '12 minutes', '30 minutes', '10 minutes'],
      'correctIndex': 0,
      'explain': 'Bake for 20’.',
    },
    {
      'question':
          "Instruction: Before you leave, turn off the lights and lock the door.\nQ: What must be done before leaving?",
      'options': ['Turn off lights and lock', 'Open windows', 'Print a report', 'Call manager'],
      'correctIndex': 0,
      'explain': 'Before you leave → 2 actions.',
    },
    {
      'question':
          "Instruction: To reset, hold the button for five seconds.\nQ: How long should the button be held?",
      'options': ['Five seconds', 'Two seconds', 'Ten seconds', 'One minute'],
      'correctIndex': 0,
      'explain': 'Duration.',
    },
    {
      'question':
          "Instruction: First, select Settings; next, tap Bluetooth.\nQ: Which menu is tapped next?",
      'options': ['Bluetooth', 'Wi-Fi', 'Display', 'Battery'],
      'correctIndex': 0,
      'explain': 'Next step.',
    },
    {
      'question':
          "Instruction: After printing, collect your pages from the output tray.\nQ: Where should pages be collected?",
      'options': ['Output tray', 'Input tray', 'Front desk', 'Scanner bed'],
      'correctIndex': 0,
      'explain': 'Location.',
    },
    {
      'question':
          "Instruction: Finally, label the samples and store them in the fridge.\nQ: Where are the samples stored?",
      'options': ['In the fridge', 'On the desk', 'In the oven', 'In the drawer'],
      'correctIndex': 0,
      'explain': 'Storage.',
    },
  ];

  // L5 — Mixed review
  final p4Lv600L5 = <Map<String, dynamic>>[
    {
      'question':
          "News: The festival attracted 25,000 visitors last year.\nQ: How many visitors?",
      'options': ['25,000', '2,500', '15,000', '50,000'],
      'correctIndex': 0,
      'explain': 'Number.',
    },
    {
      'question':
          "Product: The speaker lasts 12 hours on a single charge.\nQ: What is the battery life?",
      'options': ['12 hours', '2 hours', '20 hours', '6 hours'],
      'correctIndex': 0,
      'explain': 'Spec.',
    },
    {
      'question':
          "Schedule: Doors open at 5:30; the show starts at 6.\nQ: When do doors open?",
      'options': ['5:30', '6:00', '5:00', '6:30'],
      'correctIndex': 0,
      'explain': 'Time.',
    },
    {
      'question':
          "Instruction: First, wash your hands; then put on gloves.\nQ: What is done after washing?",
      'options': ['Put on gloves', 'Remove gloves', 'Call a nurse', 'Turn on water'],
      'correctIndex': 0,
      'explain': 'Sequence.',
    },
    {
      'question':
          "Plan: Shuttle departs every 15 minutes.\nQ: How many per hour approx.?",
      'options': ['4', '5', '6', '3'],
      'correctIndex': 1,
      'explain': '60/15=4 → cẩn thận! (Bẫy) Tuy nhiên “approx.” thường 4; sửa đáp án: 4.',
    },
    {
      'question':
          "Event: The seminar will be in Room 204 at 10 a.m.\nQ: Where is it?",
      'options': ['Room 204', 'Room 402', 'Hall A', 'Lobby'],
      'correctIndex': 0,
      'explain': 'Place.',
    },
    {
      'question':
          "Product: Free returns within 30 days.\nQ: What is the return period?",
      'options': ['30 days', '14 days', '7 days', '60 days'],
      'correctIndex': 0,
      'explain': 'Policy.',
    },
    {
      'question':
          "Directions: The clinic is to the right of the post office.\nQ: Where is the clinic?",
      'options': ['Right of the post office', 'Left of the post office', 'Behind the bank', 'Across the river'],
      'correctIndex': 0,
      'explain': 'Right of.',
    },
    {
      'question':
          "Announcement: Use Gate 3 for international flights.\nQ: Which gate?",
      'options': ['Gate 3', 'Gate 2', 'Gate 1', 'Gate 5'],
      'correctIndex': 0,
      'explain': 'Gate.',
    },
    {
      'question':
          "Instruction: Finally, press Submit to finish the form.\nQ: What is the final action?",
      'options': ['Press Submit', 'Click Cancel', 'Print the form', 'Restart the app'],
      'correctIndex': 0,
      'explain': 'Final step.',
    },
  ];
  // (Sửa đáp án câu 5 cho chính xác)
  p4Lv600L5[4]['options'] = ['4', '5', '6', '3'];
  p4Lv600L5[4]['correctIndex'] = 0;
  p4Lv600L5[4]['explain'] = '60/15 = 4 chuyến/giờ.';

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // L1 — Speech (multiple main ideas + supporting details)
  final p4Lv800L1 = <Map<String, dynamic>>[
    {
      'question':
          "Speech: Today, I’ll outline three goals: improving access, reducing costs by 10%, and expanding training.\nQ: Which target was mentioned?",
      'options': ['Reduce costs by 10%', 'Increase costs', 'Cut training', 'Limit access'],
      'correctIndex': 0,
      'explain': 'Main goal with number.',
    },
    {
      'question':
          "Speech: Our pilot program in two cities showed higher satisfaction and faster response times.\nQ: What did the pilot improve?",
      'options': ['Satisfaction and response time', 'Only sales', 'Building size', 'Parking fees'],
      'correctIndex': 0,
      'explain': 'Key results.',
    },
    {
      'question':
          "Speech: We’ll phase the rollout: beta in July, full launch in October.\nQ: When is full launch?",
      'options': ['October', 'July', 'June', 'December'],
      'correctIndex': 0,
      'explain': 'Timeline.',
    },
    {
      'question':
          "Speech: Funding comes from a \$500k grant and internal savings.\nQ: What is one funding source?",
      'options': ['A \$500k grant', 'Bank loan', 'Ticket sales', 'Tax increase'],
      'correctIndex': 0,
      'explain': 'Funding.',
    },
    {
      'question':
          "Speech: To build a culture of learning, we’ll mentor, recognize progress, and share wins weekly.\nQ: What supports the culture?",
      'options': ['Mentoring and recognition', 'Cut training budget', 'Ban feedback', 'Quarterly layoffs'],
      'correctIndex': 0,
      'explain': 'Supporting details.',
    },
    {
      'question':
          "Speech: Our challenges include turnover and outdated tools; we’ll address both this quarter.\nQ: What challenges were cited?",
      'options': ['Turnover and outdated tools', 'Lack of office space', 'Too many meetings', 'High rent'],
      'correctIndex': 0,
      'explain': 'Challenges.',
    },
    {
      'question':
          "Speech: By partnering with colleges, we can recruit interns and fresh talent.\nQ: What is the benefit of partnering?",
      'options': ['Recruit interns', 'Reduce rent', 'Close branches', 'Cut salaries'],
      'correctIndex': 0,
      'explain': 'Benefit.',
    },
    {
      'question':
          "Speech: I urge you to embrace change—small steps daily lead to big results.\nQ: What is the speaker encouraging?",
      'options': ['Embracing change', 'Avoiding change', 'Delaying decisions', 'Ignoring results'],
      'correctIndex': 0,
      'explain': 'Motivational theme.',
    },
    {
      'question':
          "Speech: We’ll measure progress with monthly dashboards and quarterly reviews.\nQ: How will progress be measured?",
      'options': ['Dashboards and reviews', 'Random checks', 'Annual survey only', 'No measurement'],
      'correctIndex': 0,
      'explain': 'Mechanism.',
    },
    {
      'question':
          "Speech: In closing, remember our vision: access, affordability, and quality.\nQ: Which is NOT part of the vision?",
      'options': ['Higher prices', 'Access', 'Affordability', 'Quality'],
      'correctIndex': 0,
      'explain': 'Not mentioned/contradicts.',
    },
  ];

  // L2 — Business Report (numbers, comparison, trends)
  final p4Lv800L2 = <Map<String, dynamic>>[
    {
      'question':
          "Report: Revenue grew 12% year-over-year, while costs rose 5%.\nQ: What was revenue growth?",
      'options': ['12%', '5%', '2%', '20%'],
      'correctIndex': 0,
      'explain': 'YoY growth.',
    },
    {
      'question':
          "Report: Online sales now account for 40% of total, up from 25%.\nQ: What share do online sales have now?",
      'options': ['40%', '25%', '15%', '50%'],
      'correctIndex': 0,
      'explain': 'Current share.',
    },
    {
      'question':
          "Report: Customer churn decreased from 10% to 7%.\nQ: What happened to churn?",
      'options': ['Decreased to 7%', 'Increased to 10%', 'Stayed at 10%', 'Doubled'],
      'correctIndex': 0,
      'explain': 'Trend down.',
    },
    {
      'question':
          "Report: We added 3 new regions and 15 enterprise clients.\nQ: How many new regions?",
      'options': ['3', '15', '5', '2'],
      'correctIndex': 0,
      'explain': 'Count.',
    },
    {
      'question':
          "Report: Marketing spend remains flat; R&D will increase next quarter.\nQ: Which area will increase?",
      'options': ['R&D', 'Marketing', 'Rent', 'Taxes'],
      'correctIndex': 0,
      'explain': 'Future plan.',
    },
    {
      'question':
          "Report: Our cash position is strong with six months of runway.\nQ: What does runway indicate?",
      'options': ['Operating months available', 'Revenue trend', 'Number of staff', 'Office space'],
      'correctIndex': 0,
      'explain': 'Runway = thời gian duy trì.',
    },
    {
      'question':
          "Report: Unit cost fell from \$12 to \$10 due to scale.\nQ: What is the new unit cost?",
      'options': ['\$10', '\$12', '\$8', '\$15'],
      'correctIndex': 0,
      'explain': 'New cost.',
    },
    {
      'question':
          "Report: Support tickets dropped 18% after the new help center launched.\nQ: What changed after launch?",
      'options': ['Tickets dropped 18%', 'Tickets rose 18%', 'No change', 'Tickets doubled'],
      'correctIndex': 0,
      'explain': 'Impact.',
    },
    {
      'question':
          "Report: We forecast 5–7% growth next quarter.\nQ: What is the forecasted growth?",
      'options': ['5–7%', '10–12%', '2–3%', '0%'],
      'correctIndex': 0,
      'explain': 'Forecast.',
    },
    {
      'question':
          "Report: Inventory turnover improved from 4x to 6x per year.\nQ: What is turnover now?",
      'options': ['6x', '4x', '2x', '8x'],
      'correctIndex': 0,
      'explain': 'Current metric.',
    },
  ];

  // L3 — Emergency / Incident (problem + solution + safety)
  final p4Lv800L3 = <Map<String, dynamic>>[
    {
      'question':
          "Alert: A small fire has been contained on the third floor; please evacuate using the stairs only.\nQ: Which route should be used?",
      'options': ['Stairs only', 'Elevators', 'Rooftop', 'Basement tunnel'],
      'correctIndex': 0,
      'explain': 'Safety instruction.',
    },
    {
      'question':
          "Alert: Due to a gas leak, the east wing is closed; assemble at Point B across the street.\nQ: Where should people assemble?",
      'options': ['Point B across the street', 'East wing', 'Cafeteria', 'Garage'],
      'correctIndex': 0,
      'explain': 'Assembly point.',
    },
    {
      'question':
          "Alert: Severe weather expected; all outdoor activities are canceled after 4 p.m.\nQ: What is canceled?",
      'options': ['Outdoor activities after 4', 'Indoor workshops', 'All events', 'Morning sessions'],
      'correctIndex': 0,
      'explain': 'Scope + time.',
    },
    {
      'question':
          "Alert: If you feel unwell, report to the first-aid station near Gate 5.\nQ: Where is the first-aid station?",
      'options': ['Near Gate 5', 'At Gate 2', 'Across from Stage A', 'Behind Gate 7'],
      'correctIndex': 0,
      'explain': 'Location.',
    },
    {
      'question':
          "Alert: Power will be restored in approximately 30 minutes; avoid using elevators.\nQ: How long until power returns?",
      'options': ['~30 minutes', '~3 minutes', '~90 minutes', 'Unknown'],
      'correctIndex': 0,
      'explain': 'ETA.',
    },
    {
      'question':
          "Alert: A missing child wearing a red jacket was last seen near the fountain.\nQ: What was the child wearing?",
      'options': ['A red jacket', 'A blue hat', 'Green shoes', 'Black coat'],
      'correctIndex': 0,
      'explain': 'Detail.',
    },
    {
      'question':
          "Alert: Please boil tap water for three minutes before drinking.\nQ: What should listeners do?",
      'options': ['Boil water 3 minutes', 'Drink bottled only', 'Avoid all water', 'Add ice'],
      'correctIndex': 0,
      'explain': 'Safety instruction.',
    },
    {
      'question':
          "Alert: The west exit is blocked; use the north exit instead.\nQ: Which exit should be used?",
      'options': ['North exit', 'West exit', 'South exit', 'Basement exit'],
      'correctIndex': 0,
      'explain': 'Alternate route.',
    },
    {
      'question':
          "Alert: If the alarm sounds, proceed to the nearest staircase and do not return for belongings.\nQ: What should be avoided?",
      'options': ['Returning for belongings', 'Using stairs', 'Following staff', 'Leaving the building'],
      'correctIndex': 0,
      'explain': 'Prohibition.',
    },
    {
      'question':
          "Alert: Emergency drill will start at 10 a.m.; participation is mandatory.\nQ: What is mandatory?",
      'options': ['Participation in the drill', 'Staying at desk', 'Evacuating at noon', 'Calling security'],
      'correctIndex': 0,
      'explain': 'Requirement.',
    },
  ];

  // L4 — Motivational Talk (idioms, metaphor)
  final p4Lv800L4 = <Map<String, dynamic>>[
    {
      'question':
          "Talk: Don’t wait for perfect weather—start where you are with what you have.\nQ: What is the speaker urging people to do?",
      'options': ['Start now', 'Wait for perfect time', 'Buy more tools', 'Avoid risks always'],
      'correctIndex': 0,
      'explain': 'Hành động ngay.',
    },
    {
      'question':
          "Talk: Success is a marathon, not a sprint; pace yourself and keep showing up.\nQ: What is the metaphor implying?",
      'options': ['Long-term effort', 'Quick win', 'Random luck', 'One-time push'],
      'correctIndex': 0,
      'explain': 'Marathon = bền bỉ.',
    },
    {
      'question':
          "Talk: When doors close, build a window—create opportunities.\nQ: What should listeners do?",
      'options': ['Create opportunities', 'Complain', 'Quit early', 'Wait silently'],
      'correctIndex': 0,
      'explain': 'Ẩn dụ: tự tạo cơ hội.',
    },
    {
      'question':
          "Talk: Learn from setbacks; they are stepping stones to progress.\nQ: How are setbacks described?",
      'options': ['Stepping stones', 'Dead ends', 'Punishments', 'Random events'],
      'correctIndex': 0,
      'explain': 'Ẩn dụ tích cực.',
    },
    {
      'question':
          "Talk: Aim high but take small daily steps.\nQ: What balance is advised?",
      'options': ['Big goals + small steps', 'No goals', 'Only big leaps', 'Only details'],
      'correctIndex': 0,
      'explain': 'Chiến lược.',
    },
    {
      'question':
          "Talk: Surround yourself with people who lift you up.\nQ: What type of people are recommended?",
      'options': ['Supportive people', 'Critical only', 'Competitors', 'Strangers'],
      'correctIndex': 0,
      'explain': 'Môi trường tích cực.',
    },
    {
      'question':
          "Talk: Your habits write your future—choose them wisely.\nQ: What shapes the future?",
      'options': ['Habits', 'Luck', 'Weather', 'Trends only'],
      'correctIndex': 0,
      'explain': 'Thói quen quyết định.',
    },
    {
      'question':
          "Talk: Celebrate small wins to stay motivated.\nQ: Why celebrate small wins?",
      'options': ['To stay motivated', 'To distract', 'To impress others', 'To waste time'],
      'correctIndex': 0,
      'explain': 'Duy trì động lực.',
    },
    {
      'question':
          "Talk: Compare yourself to yesterday, not to others.\nQ: What comparison is suggested?",
      'options': ['With your past self', 'With others', 'With industry', 'With friends'],
      'correctIndex': 0,
      'explain': 'Tự tham chiếu.',
    },
    {
      'question':
          "Talk: Progress over perfection—keep moving.\nQ: What is prioritized?",
      'options': ['Progress', 'Perfection', 'Approval', 'Speed only'],
      'correctIndex': 0,
      'explain': 'Ưu tiên tiến bộ.',
    },
  ];

  // L5 — Mixed review (advanced)
  final p4Lv800L5 = <Map<String, dynamic>>[
    {
      'question':
          "Report: Q2 revenue rose 9% while expenses were flat.\nQ: What happened to revenue?",
      'options': ['Rose 9%', 'Fell 9%', 'Flat', 'Unknown'],
      'correctIndex': 0,
      'explain': 'Trend + number.',
    },
    {
      'question':
          "Speech: We’ll launch in three phases starting in August.\nQ: What begins in August?",
      'options': ['A phased launch', 'Hiring freeze', 'Plant closure', 'Annual leave'],
      'correctIndex': 0,
      'explain': 'Plan.',
    },
    {
      'question':
          "Emergency: Use exits A and C; B is blocked.\nQ: Which exit should not be used?",
      'options': ['Exit B', 'Exit A', 'Exit C', 'Any exit'],
      'correctIndex': 0,
      'explain': 'Blocked exit.',
    },
    {
      'question':
          "Event: The awards ceremony starts at 8 p.m. in Hall D.\nQ: Where is the ceremony?",
      'options': ['Hall D', 'Hall B', 'Room 8', 'Lobby'],
      'correctIndex': 0,
      'explain': 'Place.',
    },
    {
      'question':
          "Product: The phone supports fast charging up to 65W.\nQ: What charging feature is mentioned?",
      'options': ['Fast charging 65W', 'Wireless only', 'No fast charge', '10W only'],
      'correctIndex': 0,
      'explain': 'Spec.',
    },
    {
      'question':
          "News: A new bridge will open next March after two years of construction.\nQ: When will the bridge open?",
      'options': ['Next March', 'Next May', 'This March', 'Last March'],
      'correctIndex': 0,
      'explain': 'Date.',
    },
    {
      'question':
          "Instructions: First, scan your badge; then choose “Visitor”.\nQ: Which option should be selected?",
      'options': ['“Visitor”', '“Staff”', '“Admin”', '“Guest Wi-Fi”'],
      'correctIndex': 0,
      'explain': 'Step 2 option.',
    },
    {
      'question':
          "Schedule: The next tour departs at 2:45; doors close five minutes prior.\nQ: When do doors close?",
      'options': ['2:40', '2:45', '2:50', '2:35'],
      'correctIndex': 0,
      'explain': '2:45 − 5’ = 2:40.',
    },
    {
      'question':
          "Motivational: Set a daily target—small gains compound.\nQ: What practice is advised?",
      'options': ['Daily targets', 'Weekly only', 'Random tasks', 'No goals'],
      'correctIndex': 0,
      'explain': 'Habit building.',
    },
    {
      'question':
          "Emergency: If you smell smoke, alert staff and move to the nearest exit.\nQ: What should you do first?",
      'options': ['Alert staff', 'Use elevator', 'Ignore it', 'Search alone'],
      'correctIndex': 0,
      'explain': 'Safety priority.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv300
  await pushLesson(levelId: 'lv300', lessonId: 'lesson1', lessonName: 'Bài 1: Thông báo tại nơi công cộng – Public Announcement', questions: p4Lv300L1);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson2', lessonName: 'Bài 2: Giới thiệu dịch vụ – Service Information', questions: p4Lv300L2);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson3', lessonName: 'Bài 3: Hướng dẫn cơ bản – Directions', questions: p4Lv300L3);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson4', lessonName: 'Bài 4: Giới thiệu sự kiện – Event Info', questions: p4Lv300L4);
  await pushLesson(levelId: 'lv300', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p4Lv300L5);

  // lv600
  await pushLesson(levelId: 'lv600', lessonId: 'lesson1', lessonName: 'Bài 1: Bản tin ngắn – News Report', questions: p4Lv600L1);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson2', lessonName: 'Bài 2: Thuyết trình sản phẩm – Product Presentation', questions: p4Lv600L2);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson3', lessonName: 'Bài 3: Lịch trình sự kiện – Schedules & Plans', questions: p4Lv600L3);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson4', lessonName: 'Bài 4: Hướng dẫn chi tiết – Instructions', questions: p4Lv600L4);
  await pushLesson(levelId: 'lv600', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p4Lv600L5);

  // lv800
  await pushLesson(levelId: 'lv800', lessonId: 'lesson1', lessonName: 'Bài 1: Bài phát biểu dài – Speech', questions: p4Lv800L1);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson2', lessonName: 'Bài 2: Báo cáo tài chính / công ty – Business Report', questions: p4Lv800L2);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson3', lessonName: 'Bài 3: Thông báo khẩn cấp / xử lý sự cố', questions: p4Lv800L3);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson4', lessonName: 'Bài 4: Bài diễn thuyết truyền cảm hứng – Motivational Talk', questions: p4Lv800L4);
  await pushLesson(levelId: 'lv800', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p4Lv800L5);
}
