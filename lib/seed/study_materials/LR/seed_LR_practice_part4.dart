// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart4() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';
  const audioDemo = 'input_tests/testLR/part4/01%20Test%201_LC_Voca.mp3';

  await db.collection('study_materials').doc('LRMaterials').set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

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
        .doc('lis4')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Talks',
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

  // L1 — Public Announcement (time/place/service)
  final p4Lv300L1 = <Map<String, dynamic>>[
    {
      'question': "What time will the library close?",
      'options': ['7 p.m.', '6 p.m.', '8 p.m.', '9 p.m.'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The library will close at 7 p.m. today due to maintenance.\n\nKeyword thời gian: close at 7 p.m.',
    },
    {
      'question': "Where should passengers go?",
      'options': ['Platform 4', 'Platform 2', 'Gate B', 'Counter 4'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Trains to Riverside depart from Platform 4.\n\nĐịa điểm: Platform 4.',
    },
    {
      'question': "Where is Wi-Fi available?",
      'options': ['Main hall and cafeteria', 'Parking lot only', 'Offices only', 'Conference room only'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Free Wi-Fi is available in the main hall and cafeteria.\n\nĐịa điểm dịch vụ.',
    },
    {
      'question': "How often are tours offered?",
      'options': ['Every hour', 'Every two hours', 'Only mornings', 'Weekends only'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The museum opens at 9 a.m. and offers guided tours every hour.\n\nTần suất: every hour.',
    },
    {
      'question': "Which entrance should visitors use?",
      'options': ['South entrance', 'North entrance', 'West gate', 'Basement door'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Please use the south entrance; the north entrance is under renovation.\n\nChỉ rõ lối vào hợp lệ.',
    },
    {
      'question': "What is the last departure time?",
      'options': ['10:30 p.m.', '10:00 p.m.', '11:00 p.m.', '9:30 p.m.'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The last bus to the airport leaves at 10:30 p.m.\n\nGiờ cuối: 10:30 p.m.',
    },
    {
      'question': "Where is the luggage storage?",
      'options': ['Behind the ticket counter', 'Next to Platform 1', 'Across the street', 'On the second floor'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Luggage storage is located behind the ticket counter.\n\nGiới từ vị trí: behind.',
    },
    {
      'question': "Until when is the lunch set available?",
      'options': ['2 p.m.', 'Noon', '3 p.m.', 'All day'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The café offers a lunch set until 2 p.m.\n\nThời hạn: until 2 p.m.',
    },
    {
      'question': "What are listeners asked to do?",
      'options': ['Keep belongings with them', 'Leave bags at the door', 'Check bags at counter', 'Turn off phones'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Please keep your belongings with you at all times.\n\nYêu cầu an ninh.',
    },
    {
      'question': "Where is visitor parking?",
      'options': ['Across from the main building', 'Behind the cafeteria', 'On the roof', 'Under the north gate'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Visitor parking is across from the main building.\n\nChỉ đường: across from.',
    },
  ];

  // L2 — Service Information (service, promo, basics)
  final p4Lv300L2 = <Map<String, dynamic>>[
    {
      'question': "What is included?",
      'options': ['Weekend classes', 'Free towels daily', 'Personal trainer', '24/7 sauna'],
      'correctIndex': 0,
      'explain': '\nInfo: Green Gym offers a three-month membership for \$99 with free classes on weekends.\n\nKhuyến mãi: free classes on weekends.',
    },
    {
      'question': "How can tickets be bought?",
      'options': ['Online', 'At ATMs only', 'Phone only', 'Agents only'],
      'correctIndex': 0,
      'explain': '\nInfo: City Tours run every two hours; tickets can be purchased online.\n\nPhương thức mua: online.',
    },
    {
      'question': "When will items be ready?",
      'options': ['Within 24 hours', 'Within 3 days', 'Same day only', 'Within a week'],
      'correctIndex': 0,
      'explain': '\nInfo: Laundry service returns items within 24 hours.\n\nTurnaround: 24h.',
    },
    {
      'question': "Who gets no-fee checking?",
      'options': ['Students', 'Seniors', 'Businesses', 'Tourists'],
      'correctIndex': 0,
      'explain': '\nInfo: The bank offers no-fee checking for students.\n\nĐối tượng: students.',
    },
    {
      'question': "What qualifies for free delivery?",
      'options': ['Orders over \$50', 'Any order', 'Members only', 'Weekends only'],
      'correctIndex': 0,
      'explain': '\nInfo: Orders over \$50 qualify for free delivery.\n\nĐiều kiện: > \$50.',
    },
    {
      'question': "How are the rooms rented?",
      'options': ['By the hour', 'By the week', 'By the month only', 'Annually'],
      'correctIndex': 0,
      'explain': '\nInfo: The coworking space provides meeting rooms by the hour.\n\nBilling theo giờ.',
    },
    {
      'question': "What is required for free returns?",
      'options': ['Receipt', 'Membership card', 'Online account', 'Original cash only'],
      'correctIndex': 0,
      'explain': '\nInfo: Free returns are accepted within 14 days with receipt.\n\nCần hóa đơn.',
    },
    {
      'question': "Until what time is support available?",
      'options': ['8 p.m.', '6 p.m.', '9 p.m.', 'Midnight'],
      'correctIndex': 0,
      'explain': '\nInfo: Phone support is available from 8 a.m. to 8 p.m.\n\nKhung giờ kết thúc: 8 p.m.',
    },
    {
      'question': "What must customers do?",
      'options': ['Register in advance', 'Pay cash only', 'Arrive late', 'Bring ID only'],
      'correctIndex': 0,
      'explain': '\nInfo: Weekend classes require advance registration.\n\nYêu cầu đăng ký sớm.',
    },
    {
      'question': "Who gets the discount?",
      'options': ['First-time customers', 'Members only', 'Students only', 'Groups only'],
      'correctIndex': 0,
      'explain': '\nInfo: The salon offers a 10% discount for first-time customers.\n\nĐối tượng ưu đãi.',
    },
  ];

  // L3 — Directions (left/right/across/behind)
  final p4Lv300L3 = <Map<String, dynamic>>[
    {
      'question': "Where is the conference room?",
      'options': ['On your right after the elevators', 'Behind the lobby', 'Across the street', 'On the left of elevators'],
      'correctIndex': 0,
      'explain': '\nDirections: From the lobby, turn left and go past the elevators; the conference room is on your right.\n\nLeft → past → on your right.',
    },
    {
      'question': "Where is the shuttle stop?",
      'options': ['Across from the entrance', 'Behind the hotel', 'Next to Room 102', 'On the rooftop'],
      'correctIndex': 0,
      'explain': '\nDirections: The shuttle stop is across from the hotel entrance.\n\nacross from = đối diện.',
    },
    {
      'question': "Where are the restrooms?",
      'options': ['Behind the café', 'At the lobby', 'Across the street', 'Inside the café counter'],
      'correctIndex': 0,
      'explain': '\nDirections: Restrooms are behind the café, down the hall.\n\nbehind the café.',
    },
    {
      'question': "Where is the bookstore?",
      'options': ['To the left on the second floor', 'Right of the escalator on 1F', 'Behind the cinema', 'Across from parking'],
      'correctIndex': 0,
      'explain': '\nDirections: Take the escalator to the second floor; the bookstore is to the left.\n\n2F bên trái.',
    },
    {
      'question': "The gym is located…",
      'options': ['Next to the pool', 'Behind the lobby', 'Under the courtyard', 'Opposite the pool'],
      'correctIndex': 0,
      'explain': '\nDirections: The gym is next to the pool, across the courtyard.\n\nnext to = kế bên.',
    },
    {
      'question': "After turning right, where is the station?",
      'options': ['On your left', 'On your right', 'Straight ahead', 'Behind you'],
      'correctIndex': 0,
      'explain': '\nDirections: Turn right at the light and the station will be on your left.\n\nTurn right → station on your left.',
    },
    {
      'question': "Where is Room A?",
      'options': ['Across the corridor from the lounge', 'Behind the lounge', 'Next to Room B', 'Above the lounge'],
      'correctIndex': 0,
      'explain': '\nDirections: Meeting Room A is across the corridor from the lounge.\n\nacross the corridor.',
    },
    {
      'question': "Where is the ticket office?",
      'options': ['At the far end on the right', 'Near the entrance', 'Left side halfway', 'Behind the stairs'],
      'correctIndex': 0,
      'explain': '\nDirections: The ticket office is at the far end of the hall on the right.\n\ncuối hành lang bên phải.',
    },
    {
      'question': "Where is the gallery?",
      'options': ['Behind the café', 'Across from the fountain', 'Left of the fountain', 'Right of the café'],
      'correctIndex': 0,
      'explain': '\nDirections: Go straight past the fountain; the gallery is behind the café.\n\ngallery behind café.',
    },
    {
      'question': "Where are badges issued?",
      'options': ['At the desk to the right of the doors', 'At security outside', 'In the basement', 'At the café counter'],
      'correctIndex': 0,
      'explain': '\nDirections: Visitor badges are issued at the desk to the right of the main doors.\n\nright of the doors.',
    },
  ];

  // L4 — Event Info (name/time/date/place)
  final p4Lv300L4 = <Map<String, dynamic>>[
    {
      'question': "When is the Career Fair?",
      'options': ['May 12', 'May 21', 'June 12', 'April 12'],
      'correctIndex': 0,
      'explain': '\nEvent: The Career Fair will be held on May 12 at the Convention Center.\n\nDate keyword.',
    },
    {
      'question': "What time does it start?",
      'options': ['10 a.m.', '9 a.m.', '11 a.m.', '2 p.m.'],
      'correctIndex': 0,
      'explain': '\nEvent: The opening ceremony starts at 10 a.m. in Hall B.\n\nTime keyword.',
    },
    {
      'question': "Where can tickets be purchased?",
      'options': ['Online and at the door', 'Phone only', 'At kiosks only', 'Members only'],
      'correctIndex': 0,
      'explain': '\nEvent: Tickets for the Jazz Night are available online and at the door.\n\nWhere to buy.',
    },
    {
      'question': "When does registration close?",
      'options': ['Friday at noon', 'Thursday at noon', 'Friday at 5', 'Saturday morning'],
      'correctIndex': 0,
      'explain': '\nEvent: Registration closes Friday at noon.\n\nDeadline.',
    },
    {
      'question': "Who is the keynote speaker?",
      'options': ['Dr. Helen Park', 'Mr. Adam Lee', 'Prof. Kim', 'Ms. Nora Hill'],
      'correctIndex': 0,
      'explain': '\nEvent: The keynote speaker is Dr. Helen Park.\n\nName keyword.',
    },
    {
      'question': "Where are the workshops?",
      'options': ['Rooms 201 & 202', 'Hall A', 'Lobby', 'Cafeteria'],
      'correctIndex': 0,
      'explain': '\nEvent: Workshops will take place in Rooms 201 and 202.\n\nPlace keyword.',
    },
    {
      'question': "What is the day of the concert?",
      'options': ['Saturday', 'Friday', 'Sunday', 'Monday'],
      'correctIndex': 0,
      'explain': '\nEvent: The concert begins at 7:30 p.m. on Saturday.\n\nDay keyword.',
    },
    {
      'question': "Where is free parking?",
      'options': ['Lot C', 'Lot A', 'Street only', 'Underground only'],
      'correctIndex': 0,
      'explain': '\nEvent: Free parking is available in Lot C.\n\nPlace keyword.',
    },
    {
      'question': "When does check-in open?",
      'options': ['1 hour before', '2 hours before', 'At start time', 'After the race'],
      'correctIndex': 0,
      'explain': '\nEvent: Check-in opens one hour before the race.\n\nTime relative.',
    },
    {
      'question': "What must attendees do?",
      'options': ['Wear badges always', 'Arrive by 8', 'Bring laptops', 'Pay cash'],
      'correctIndex': 0,
      'explain': '\nEvent: Please wear your badge at all times during the conference.\n\nRule keyword.',
    },
  ];

  // L5 — Mixed review
  final p4Lv300L5 = <Map<String, dynamic>>[
    {
      'question': "Which platform?",
      'options': ['Platform 2', 'Platform 8', 'Gate 2', 'Platform 5'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The 8:15 train to Lakeside will depart from Platform 2.\n\nPlatform keyword.',
    },
    {
      'question': "What is the closing time?",
      'options': ['7 p.m.', '9 p.m.', '6 p.m.', '5 p.m.'],
      'correctIndex': 0,
      'explain': '\nInfo: Our bike rental shop opens at 9 and closes at 7.\n\nClose at 7.',
    },
    {
      'question': "Where is the theater?",
      'options': ['Behind the café', 'Across the street', 'Next to the bookstore', 'On the right of café'],
      'correctIndex': 0,
      'explain': '\nDirections: Turn left at the bookstore; the theater is behind the café.\n\nbehind.',
    },
    {
      'question': "Where is the event?",
      'options': ['Central Square', 'City Hall', 'River Park', 'Main Hall'],
      'correctIndex': 0,
      'explain': '\nEvent: The Spring Market runs April 5–7 in Central Square.\n\nPlace keyword.',
    },
    {
      'question': "What is the condition?",
      'options': ['Over \$60 this weekend', 'Members only', 'All orders', 'Weekdays only'],
      'correctIndex': 0,
      'explain': '\nInfo: Free delivery for orders over \$60 this weekend only.\n\nCondition + time window.',
    },
    {
      'question': "What should listeners do?",
      'options': ['Go to Gate 11', 'Wait at Gate 1', 'Call customer service', 'Pick up bags'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Please proceed to Gate 11 for boarding.\n\nAction required.',
    },
    {
      'question': "What time does the workshop begin?",
      'options': ['9 a.m.', '8 a.m.', '10 a.m.', '9 p.m.'],
      'correctIndex': 0,
      'explain': '\nEvent: Check-in opens at 8 a.m.; the workshop begins at 9.\n\nBegin time.',
    },
    {
      'question': "Where is the pharmacy?",
      'options': ['Across from the entrance', 'Behind the parking lot', 'On the rooftop', 'Next to Gate A'],
      'correctIndex': 0,
      'explain': '\nDirections: The pharmacy is across from the supermarket entrance.\n\nAcross from.',
    },
    {
      'question': "When is support available?",
      'options': ['9–6', '24 hours', '6–9', 'Weekends only'],
      'correctIndex': 0,
      'explain': '\nInfo: Call 555-0123 for customer support between 9 and 6.\n\nTime window.',
    },
    {
      'question': "What is not working?",
      'options': ['The elevator', 'The lights', 'The escalator', 'The doors'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: The elevator is out of service; please use the stairs.\n\nService status.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // L1 — News Report (main idea + numbers)
  final p4Lv600L1 = <Map<String, dynamic>>[
    {
      'question': "What was approved?",
      'options': ['A \$2M bike-lane expansion', 'A new subway line', 'Free parking downtown', 'Airport renovation'],
      'correctIndex': 0,
      'explain': '\nNews: The city approved a \$2 million plan to expand bike lanes this summer.\n\nMain idea + number.',
    },
    {
      'question': "How much was raised?",
      'options': ['\$85,000', '\$1,200', '\$58,000', '\$120,000'],
      'correctIndex': 0,
      'explain': '\nNews: A charity run raised \$85,000 with over 1,200 participants.\n\nSố tiền quyên góp.',
    },
    {
      'question': "How long is the delay?",
      'options': ['20 minutes', '7 minutes', '30 minutes', '2 hours'],
      'correctIndex': 0,
      'explain': '\nNews: The 7:30 ferry will be delayed 20 minutes due to fog.\n\nDelay = 20’.',
    },
    {
      'question': "What will the tech park create?",
      'options': ['500 jobs', '500 offices', '500 houses', '500 stores'],
      'correctIndex': 0,
      'explain': '\nNews: A new tech park will create 500 jobs by next year.\n\nJobs.',
    },
    {
      'question': "What happened to gas prices?",
      'options': ['Dropped 5%', 'Rose 5%', 'Stayed the same', 'Doubled'],
      'correctIndex': 0,
      'explain': '\nNews: Gas prices dropped 5 percent this week.\n\nTrend.',
    },
    {
      'question': "Until when are roads closed?",
      'options': ['Noon', '10 a.m.', '2 p.m.', 'All day'],
      'correctIndex': 0,
      'explain': '\nNews: The marathon starts at 6 a.m. with road closures until noon.\n\nTime window.',
    },
    {
      'question': "Which milestone was reached?",
      'options': ['1 million visitors', '100 thousand visitors', '1 million exhibits', '1 million members'],
      'correctIndex': 0,
      'explain': '\nNews: The museum welcomed its 1 millionth visitor this month.\n\nMilestone.',
    },
    {
      'question': "How much rain is expected?",
      'options': ['Up to 10 cm', 'Up to 1 cm', 'Up to 20 cm', 'None'],
      'correctIndex': 0,
      'explain': '\nNews: A storm is expected to bring up to 10 cm of rain tonight.\n\nAmount.',
    },
    {
      'question': "What changed by 3%?",
      'options': ['Education budget', 'Sales tax', 'Transit fares', 'Utility fees'],
      'correctIndex': 0,
      'explain': '\nNews: The council approved a 3% increase in the education budget.\n\nBudget change.',
    },
    {
      'question': "How often will the flight operate?",
      'options': ['Four times a week', 'Daily', 'Twice a week', 'Weekends only'],
      'correctIndex': 0,
      'explain': '\nNews: A new flight to Tokyo will operate four times a week starting in June.\n\nFrequency.',
    },
  ];

  // L2 — Product Presentation (functions, benefits)
  final p4Lv600L2 = <Map<String, dynamic>>[
    {
      'question': "What is a benefit?",
      'options': ['Saves up to 30% energy', 'Requires special bulbs', 'Manual only', 'Heavier than others'],
      'correctIndex': 0,
      'explain': '\nProduct: Our smart lamp adjusts brightness automatically and saves up to 30% energy.\n\nBenefit keyword.',
    },
    {
      'question': "How long does it run?",
      'options': ['60 minutes', '16 minutes', '6 hours', '30 minutes'],
      'correctIndex': 0,
      'explain': '\nProduct: The vacuum includes a HEPA filter and runs for 60 minutes per charge.\n\nRuntime.',
    },
    {
      'question': "What is true about the watch?",
      'options': ['Waterproof to 50 m', 'Not water-resistant', 'Only splash-proof', 'For swimming no'],
      'correctIndex': 0,
      'explain': '\nProduct: The smartwatch is waterproof up to 50 meters.\n\nSpec.',
    },
    {
      'question': "What feature reduces noise?",
      'options': ['Quiet mode', 'Turbo mode', 'Travel mode', 'Sleep mode'],
      'correctIndex': 0,
      'explain': '\nProduct: Our blender features a quiet mode and a 5-year warranty.\n\nFeature.',
    },
    {
      'question': "Which capability is mentioned?",
      'options': ['4K recording', '8K printing', 'Thermal imaging', '3D scanning'],
      'correctIndex': 0,
      'explain': '\nProduct: The camera supports 4K recording and image stabilization.\n\nCapability.',
    },
    {
      'question': "What does it come with?",
      'options': ['Three attachments', 'Only one attachment', 'No case', 'Batteries included'],
      'correctIndex': 0,
      'explain': '\nProduct: The mixer comes with three attachments and a storage case.\n\nIncluded items.',
    },
    {
      'question': "How long for a full charge?",
      'options': ['90 minutes', '9 minutes', '60 minutes', '2 hours 30'],
      'correctIndex': 0,
      'explain': '\nProduct: Battery fully charges in 90 minutes via USB-C.\n\nCharge time.',
    },
    {
      'question': "What does the app provide?",
      'options': ['Tracking and alerts', 'Music only', 'Games only', 'Offline maps only'],
      'correctIndex': 0,
      'explain': '\nProduct: The app offers real-time tracking and alerts.\n\nFunctions.',
    },
    {
      'question': "What is highlighted?",
      'options': ['Light weight', 'Large battery', 'Touch bar', 'CD drive'],
      'correctIndex': 0,
      'explain': '\nProduct: The laptop weighs just 1.2 kilograms.\n\nSelling point.',
    },
    {
      'question': "Where are they especially useful?",
      'options': ['On flights', 'In the pool', 'While cooking', 'While driving a car'],
      'correctIndex': 0,
      'explain': '\nProduct: Noise-canceling headphones block ambient sound on flights.\n\nUse case.',
    },
  ];

  // L3 — Schedules & Plans (multi timepoints)
  final p4Lv600L3 = <Map<String, dynamic>>[
    {
      'question': "When does the first session begin?",
      'options': ['9:15', '8:30', '9:00', '10:15'],
      'correctIndex': 0,
      'explain': '\nSchedule: Registration opens at 8:30; the first session begins at 9:15.\n\nTime mapping.',
    },
    {
      'question': "How long is the break?",
      'options': ['15 minutes', '30 minutes', '10 minutes', '45 minutes'],
      'correctIndex': 0,
      'explain': '\nSchedule: There is a break from 10:45 to 11:00.\n\n11:00–10:45=15’.',
    },
    {
      'question': "What is the travel time?",
      'options': ['45 minutes', '35 minutes', '55 minutes', '1 hour'],
      'correctIndex': 0,
      'explain': '\nPlan: The bus departs at 2:20 and arrives at 3:05.\n\n3:05–2:20=45’.',
    },
    {
      'question': "When do tours start?",
      'options': ['1:15', '12:15', '1:00', '12:45'],
      'correctIndex': 0,
      'explain': '\nSchedule: Lunch is served from 12 to 1; tours start at 1:15.\n\nStart time tours.',
    },
    {
      'question': "How long in total?",
      'options': ['50 minutes', '30 minutes', '20 minutes', '45 minutes'],
      'correctIndex': 0,
      'explain': '\nPlan: Setup takes 30 minutes; rehearsal takes 20.\n\n30+20=50’.',
    },
    {
      'question': "When does networking end?",
      'options': ['6:45', '6:30', '7:00', '5:45'],
      'correctIndex': 0,
      'explain': '\nSchedule: The evening session ends at 6; networking follows for 45 minutes.\n\n6 + 45’ = 6:45.',
    },
    {
      'question': "How many buses per hour approximately?",
      'options': ['5', '4', '6', '3'],
      'correctIndex': 0,
      'explain': '\nPlan: Buses run every 12 minutes.\n\n60/12 ≈ 5.',
    },
    {
      'question': "When does it end?",
      'options': ['5:00', '4:50', '5:10', '5:20'],
      'correctIndex': 0,
      'explain': '\nSchedule: The last workshop begins at 4:20 and lasts 40 minutes.\n\n4:20 + 40’ = 5:00.',
    },
    {
      'question': "When do doors open?",
      'options': ['6:30', '6:00', '6:45', '7:30'],
      'correctIndex': 0,
      'explain': '\nPlan: Doors open 30 minutes before showtime at 7.\n\n7:00 − 30’ = 6:30.',
    },
    {
      'question': "When does check-in close?",
      'options': ['9:55', '9:50', '10:00', '10:05'],
      'correctIndex': 0,
      'explain': '\nSchedule: Check-in closes 15 minutes before departure at 10:10.\n\n10:10 − 15’ = 9:55.',
    },
  ];

  // L4 — Instructions (sequence words)
  final p4Lv600L4 = <Map<String, dynamic>>[
    {
      'question': "What should be done first?",
      'options': ['Plug in the projector', 'Press power', 'Open slides', 'Dim the lights'],
      'correctIndex': 0,
      'explain': '\nInstruction: First, plug in the projector; then press the power button.\n\nFirst → hành động đầu.',
    },
    {
      'question': "What happens after signing?",
      'options': ['Place form in tray', 'Send an email', 'Call support', 'Make a copy'],
      'correctIndex': 0,
      'explain': '\nInstruction: After you sign, place the form in the tray.\n\nAfter → bước kế.',
    },
    {
      'question': "What is inserted?",
      'options': ['The cartridge', 'The paper', 'The tray', 'The cable'],
      'correctIndex': 0,
      'explain': '\nInstruction: Next, remove the cover and insert the cartridge.\n\nObject chính.',
    },
    {
      'question': "What is the final step?",
      'options': ['Restart the device', 'Download the file', 'Charge the device', 'Call IT'],
      'correctIndex': 0,
      'explain': '\nInstruction: Finally, restart the device to complete the update.\n\nFinally → bước cuối.',
    },
    {
      'question': "How long is the baking time?",
      'options': ['20 minutes', '12 minutes', '30 minutes', '10 minutes'],
      'correctIndex': 0,
      'explain': '\nInstruction: First, mix the ingredients; then bake for 20 minutes.\n\nBake for 20’.',
    },
    {
      'question': "What must be done before leaving?",
      'options': ['Turn off lights and lock', 'Open windows', 'Print a report', 'Call manager'],
      'correctIndex': 0,
      'explain': '\nInstruction: Before you leave, turn off the lights and lock the door.\n\nBefore you leave → 2 actions.',
    },
    {
      'question': "How long should the button be held?",
      'options': ['Five seconds', 'Two seconds', 'Ten seconds', 'One minute'],
      'correctIndex': 0,
      'explain': '\nInstruction: To reset, hold the button for five seconds.\n\nDuration.',
    },
    {
      'question': "Which menu is tapped next?",
      'options': ['Bluetooth', 'Wi-Fi', 'Display', 'Battery'],
      'correctIndex': 0,
      'explain': '\nInstruction: First, select Settings; next, tap Bluetooth.\n\nNext step.',
    },
    {
      'question': "Where should pages be collected?",
      'options': ['Output tray', 'Input tray', 'Front desk', 'Scanner bed'],
      'correctIndex': 0,
      'explain': '\nInstruction: After printing, collect your pages from the output tray.\n\nLocation.',
    },
    {
      'question': "Where are the samples stored?",
      'options': ['In the fridge', 'On the desk', 'In the oven', 'In the drawer'],
      'correctIndex': 0,
      'explain': '\nInstruction: Finally, label the samples and store them in the fridge.\n\nStorage.',
    },
  ];

  // L5 — Mixed review
  final p4Lv600L5 = <Map<String, dynamic>>[
    {
      'question': "How many visitors?",
      'options': ['25,000', '2,500', '15,000', '50,000'],
      'correctIndex': 0,
      'explain': '\nNews: The festival attracted 25,000 visitors last year.\n\nNumber.',
    },
    {
      'question': "What is the battery life?",
      'options': ['12 hours', '2 hours', '20 hours', '6 hours'],
      'correctIndex': 0,
      'explain': '\nProduct: The speaker lasts 12 hours on a single charge.\n\nSpec.',
    },
    {
      'question': "When do doors open?",
      'options': ['5:30', '6:00', '5:00', '6:30'],
      'correctIndex': 0,
      'explain': '\nSchedule: Doors open at 5:30; the show starts at 6.\n\nTime.',
    },
    {
      'question': "What is done after washing?",
      'options': ['Put on gloves', 'Remove gloves', 'Call a nurse', 'Turn on water'],
      'correctIndex': 0,
      'explain': '\nInstruction: First, wash your hands; then put on gloves.\n\nSequence.',
    },
    {
      'question': "How many per hour approx.?",
      'options': ['4', '5', '6', '3'],
      'correctIndex': 1,
      'explain': '\nPlan: Shuttle departs every 15 minutes.\n\n60/15=4 → cẩn thận! (Bẫy) Tuy nhiên “approx.” thường 4; sửa đáp án: 4.',
    },
    {
      'question': "Where is it?",
      'options': ['Room 204', 'Room 402', 'Hall A', 'Lobby'],
      'correctIndex': 0,
      'explain': '\nEvent: The seminar will be in Room 204 at 10 a.m.\n\nPlace.',
    },
    {
      'question': "What is the return period?",
      'options': ['30 days', '14 days', '7 days', '60 days'],
      'correctIndex': 0,
      'explain': '\nProduct: Free returns within 30 days.\n\nPolicy.',
    },
    {
      'question': "Where is the clinic?",
      'options': ['Right of the post office', 'Left of the post office', 'Behind the bank', 'Across the river'],
      'correctIndex': 0,
      'explain': '\nDirections: The clinic is to the right of the post office.\n\nRight of.',
    },
    {
      'question': "Which gate?",
      'options': ['Gate 3', 'Gate 2', 'Gate 1', 'Gate 5'],
      'correctIndex': 0,
      'explain': '\nAnnouncement: Use Gate 3 for international flights.\n\nGate.',
    },
    {
      'question': "What is the final action?",
      'options': ['Press Submit', 'Click Cancel', 'Print the form', 'Restart the app'],
      'correctIndex': 0,
      'explain': '\nInstruction: Finally, press Submit to finish the form.\n\nFinal step.',
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
      'question': "Which target was mentioned?",
      'options': ['Reduce costs by 10%', 'Increase costs', 'Cut training', 'Limit access'],
      'correctIndex': 0,
      'explain': '\nSpeech: Today, I’ll outline three goals: improving access, reducing costs by 10%, and expanding training.\n\nMain goal with number.',
    },
    {
      'question': "What did the pilot improve?",
      'options': ['Satisfaction and response time', 'Only sales', 'Building size', 'Parking fees'],
      'correctIndex': 0,
      'explain': '\nSpeech: Our pilot program in two cities showed higher satisfaction and faster response times.\n\nKey results.',
    },
    {
      'question': "When is full launch?",
      'options': ['October', 'July', 'June', 'December'],
      'correctIndex': 0,
      'explain': '\nSpeech: We’ll phase the rollout: beta in July, full launch in October.\n\nTimeline.',
    },
    {
      'question': "What is one funding source?",
      'options': ['A \$500k grant', 'Bank loan', 'Ticket sales', 'Tax increase'],
      'correctIndex': 0,
      'explain': '\nSpeech: Funding comes from a \$500k grant and internal savings.\n\nFunding.',
    },
    {
      'question': "What supports the culture?",
      'options': ['Mentoring and recognition', 'Cut training budget', 'Ban feedback', 'Quarterly layoffs'],
      'correctIndex': 0,
      'explain': '\nSpeech: To build a culture of learning, we’ll mentor, recognize progress, and share wins weekly.\n\nSupporting details.',
    },
    {
      'question': "What challenges were cited?",
      'options': ['Turnover and outdated tools', 'Lack of office space', 'Too many meetings', 'High rent'],
      'correctIndex': 0,
      'explain': '\nSpeech: Our challenges include turnover and outdated tools; we’ll address both this quarter.\n\nChallenges.',
    },
    {
      'question': "What is the benefit of partnering?",
      'options': ['Recruit interns', 'Reduce rent', 'Close branches', 'Cut salaries'],
      'correctIndex': 0,
      'explain': '\nSpeech: By partnering with colleges, we can recruit interns and fresh talent.\n\nBenefit.',
    },
    {
      'question': "What is the speaker encouraging?",
      'options': ['Embracing change', 'Avoiding change', 'Delaying decisions', 'Ignoring results'],
      'correctIndex': 0,
      'explain': '\nSpeech: I urge you to embrace change—small steps daily lead to big results.\n\nMotivational theme.',
    },
    {
      'question': "How will progress be measured?",
      'options': ['Dashboards and reviews', 'Random checks', 'Annual survey only', 'No measurement'],
      'correctIndex': 0,
      'explain': '\nSpeech: We’ll measure progress with monthly dashboards and quarterly reviews.\n\nMechanism.',
    },
    {
      'question': "Which is NOT part of the vision?",
      'options': ['Higher prices', 'Access', 'Affordability', 'Quality'],
      'correctIndex': 0,
      'explain': '\nSpeech: In closing, remember our vision: access, affordability, and quality.\n\nNot mentioned/contradicts.',
    },
  ];

  // L2 — Business Report (numbers, comparison, trends)
  final p4Lv800L2 = <Map<String, dynamic>>[
    {
      'question': "What was revenue growth?",
      'options': ['12%', '5%', '2%', '20%'],
      'correctIndex': 0,
      'explain': '\nReport: Revenue grew 12% year-over-year, while costs rose 5%.\n\nYoY growth.',
    },
    {
      'question': "What share do online sales have now?",
      'options': ['40%', '25%', '15%', '50%'],
      'correctIndex': 0,
      'explain': '\nReport: Online sales now account for 40% of total, up from 25%.\n\nCurrent share.',
    },
    {
      'question': "What happened to churn?",
      'options': ['Decreased to 7%', 'Increased to 10%', 'Stayed at 10%', 'Doubled'],
      'correctIndex': 0,
      'explain': '\nReport: Customer churn decreased from 10% to 7%.\n\nTrend down.',
    },
    {
      'question': "How many new regions?",
      'options': ['3', '15', '5', '2'],
      'correctIndex': 0,
      'explain': '\nReport: We added 3 new regions and 15 enterprise clients.\n\nCount.',
    },
    {
      'question': "Which area will increase?",
      'options': ['R&D', 'Marketing', 'Rent', 'Taxes'],
      'correctIndex': 0,
      'explain': '\nReport: Marketing spend remains flat; R&D will increase next quarter.\n\nFuture plan.',
    },
    {
      'question': "What does runway indicate?",
      'options': ['Operating months available', 'Revenue trend', 'Number of staff', 'Office space'],
      'correctIndex': 0,
      'explain': '\nReport: Our cash position is strong with six months of runway.\n\nRunway = thời gian duy trì.',
    },
    {
      'question': "What is the new unit cost?",
      'options': ['\$10', '\$12', '\$8', '\$15'],
      'correctIndex': 0,
      'explain': '\nReport: Unit cost fell from \$12 to \$10 due to scale.\n\nNew cost.',
    },
    {
      'question': "What changed after launch?",
      'options': ['Tickets dropped 18%', 'Tickets rose 18%', 'No change', 'Tickets doubled'],
      'correctIndex': 0,
      'explain': '\nReport: Support tickets dropped 18% after the new help center launched.\n\nImpact.',
    },
    {
      'question': "What is the forecasted growth?",
      'options': ['5–7%', '10–12%', '2–3%', '0%'],
      'correctIndex': 0,
      'explain': '\nReport: We forecast 5–7% growth next quarter.\n\nForecast.',
    },
    {
      'question': "What is turnover now?",
      'options': ['6x', '4x', '2x', '8x'],
      'correctIndex': 0,
      'explain': '\nReport: Inventory turnover improved from 4x to 6x per year.\n\nCurrent metric.',
    },
  ];

  // L3 — Emergency / Incident (problem + solution + safety)
  final p4Lv800L3 = <Map<String, dynamic>>[
    {
      'question': "Which route should be used?",
      'options': ['Stairs only', 'Elevators', 'Rooftop', 'Basement tunnel'],
      'correctIndex': 0,
      'explain': '\nAlert: A small fire has been contained on the third floor; please evacuate using the stairs only.\n\nSafety instruction.',
    },
    {
      'question': "Where should people assemble?",
      'options': ['Point B across the street', 'East wing', 'Cafeteria', 'Garage'],
      'correctIndex': 0,
      'explain': '\nAlert: Due to a gas leak, the east wing is closed; assemble at Point B across the street.\n\nAssembly point.',
    },
    {
      'question': "What is canceled?",
      'options': ['Outdoor activities after 4', 'Indoor workshops', 'All events', 'Morning sessions'],
      'correctIndex': 0,
      'explain': '\nAlert: Severe weather expected; all outdoor activities are canceled after 4 p.m.\n\nScope + time.',
    },
    {
      'question': "Where is the first-aid station?",
      'options': ['Near Gate 5', 'At Gate 2', 'Across from Stage A', 'Behind Gate 7'],
      'correctIndex': 0,
      'explain': '\nAlert: If you feel unwell, report to the first-aid station near Gate 5.\n\nLocation.',
    },
    {
      'question': "How long until power returns?",
      'options': ['~30 minutes', '~3 minutes', '~90 minutes', 'Unknown'],
      'correctIndex': 0,
      'explain': '\nAlert: Power will be restored in approximately 30 minutes; avoid using elevators.\n\nETA.',
    },
    {
      'question': "What was the child wearing?",
      'options': ['A red jacket', 'A blue hat', 'Green shoes', 'Black coat'],
      'correctIndex': 0,
      'explain': '\nAlert: A missing child wearing a red jacket was last seen near the fountain.\n\nDetail.',
    },
    {
      'question': "What should listeners do?",
      'options': ['Boil water 3 minutes', 'Drink bottled only', 'Avoid all water', 'Add ice'],
      'correctIndex': 0,
      'explain': '\nAlert: Please boil tap water for three minutes before drinking.\n\nSafety instruction.',
    },
    {
      'question': "Which exit should be used?",
      'options': ['North exit', 'West exit', 'South exit', 'Basement exit'],
      'correctIndex': 0,
      'explain': '\nAlert: The west exit is blocked; use the north exit instead.\n\nAlternate route.',
    },
    {
      'question': "What should be avoided?",
      'options': ['Returning for belongings', 'Using stairs', 'Following staff', 'Leaving the building'],
      'correctIndex': 0,
      'explain': '\nAlert: If the alarm sounds, proceed to the nearest staircase and do not return for belongings.\n\nProhibition.',
    },
    {
      'question': "What is mandatory?",
      'options': ['Participation in the drill', 'Staying at desk', 'Evacuating at noon', 'Calling security'],
      'correctIndex': 0,
      'explain': '\nAlert: Emergency drill will start at 10 a.m.; participation is mandatory.\n\nRequirement.',
    },
  ];

  // L4 — Motivational Talk (idioms, metaphor)
  final p4Lv800L4 = <Map<String, dynamic>>[
    {
      'question': "What is the speaker urging people to do?",
      'options': ['Start now', 'Wait for perfect time', 'Buy more tools', 'Avoid risks always'],
      'correctIndex': 0,
      'explain': '\nTalk: Don’t wait for perfect weather—start where you are with what you have.\n\nHành động ngay.',
    },
    {
      'question': "What is the metaphor implying?",
      'options': ['Long-term effort', 'Quick win', 'Random luck', 'One-time push'],
      'correctIndex': 0,
      'explain': '\nTalk: Success is a marathon, not a sprint; pace yourself and keep showing up.\n\nMarathon = bền bỉ.',
    },
    {
      'question': "What should listeners do?",
      'options': ['Create opportunities', 'Complain', 'Quit early', 'Wait silently'],
      'correctIndex': 0,
      'explain': '\nTalk: When doors close, build a window—create opportunities.\n\nẨn dụ: tự tạo cơ hội.',
    },
    {
      'question': "How are setbacks described?",
      'options': ['Stepping stones', 'Dead ends', 'Punishments', 'Random events'],
      'correctIndex': 0,
      'explain': '\nTalk: Learn from setbacks; they are stepping stones to progress.\n\nẨn dụ tích cực.',
    },
    {
      'question': "What balance is advised?",
      'options': ['Big goals + small steps', 'No goals', 'Only big leaps', 'Only details'],
      'correctIndex': 0,
      'explain': '\nTalk: Aim high but take small daily steps.\n\nChiến lược.',
    },
    {
      'question': "What type of people are recommended?",
      'options': ['Supportive people', 'Critical only', 'Competitors', 'Strangers'],
      'correctIndex': 0,
      'explain': '\nTalk: Surround yourself with people who lift you up.\n\nMôi trường tích cực.',
    },
    {
      'question': "What shapes the future?",
      'options': ['Habits', 'Luck', 'Weather', 'Trends only'],
      'correctIndex': 0,
      'explain': '\nTalk: Your habits write your future—choose them wisely.\n\nThói quen quyết định.',
    },
    {
      'question': "Why celebrate small wins?",
      'options': ['To stay motivated', 'To distract', 'To impress others', 'To waste time'],
      'correctIndex': 0,
      'explain': '\nTalk: Celebrate small wins to stay motivated.\n\nDuy trì động lực.',
    },
    {
      'question': "What comparison is suggested?",
      'options': ['With your past self', 'With others', 'With industry', 'With friends'],
      'correctIndex': 0,
      'explain': '\nTalk: Compare yourself to yesterday, not to others.\n\nTự tham chiếu.',
    },
    {
      'question': "What is prioritized?",
      'options': ['Progress', 'Perfection', 'Approval', 'Speed only'],
      'correctIndex': 0,
      'explain': '\nTalk: Progress over perfection—keep moving.\n\nƯu tiên tiến bộ.',
    },
  ];

  // L5 — Mixed review (advanced)
  final p4Lv800L5 = <Map<String, dynamic>>[
    {
      'question': "What happened to revenue?",
      'options': ['Rose 9%', 'Fell 9%', 'Flat', 'Unknown'],
      'correctIndex': 0,
      'explain': '\nReport: Q2 revenue rose 9% while expenses were flat.\n\nTrend + number.',
    },
    {
      'question': "What begins in August?",
      'options': ['A phased launch', 'Hiring freeze', 'Plant closure', 'Annual leave'],
      'correctIndex': 0,
      'explain': '\nSpeech: We’ll launch in three phases starting in August.\n\nPlan.',
    },
    {
      'question': "Which exit should not be used?",
      'options': ['Exit B', 'Exit A', 'Exit C', 'Any exit'],
      'correctIndex': 0,
      'explain': '\nEmergency: Use exits A and C; B is blocked.\n\nBlocked exit.',
    },
    {
      'question': "Where is the ceremony?",
      'options': ['Hall D', 'Hall B', 'Room 8', 'Lobby'],
      'correctIndex': 0,
      'explain': '\nEvent: The awards ceremony starts at 8 p.m. in Hall D.\n\nPlace.',
    },
    {
      'question': "What charging feature is mentioned?",
      'options': ['Fast charging 65W', 'Wireless only', 'No fast charge', '10W only'],
      'correctIndex': 0,
      'explain': '\nProduct: The phone supports fast charging up to 65W.\n\nSpec.',
    },
    {
      'question': "When will the bridge open?",
      'options': ['Next March', 'Next May', 'This March', 'Last March'],
      'correctIndex': 0,
      'explain': '\nNews: A new bridge will open next March after two years of construction.\n\nDate.',
    },
    {
      'question': "Which option should be selected?",
      'options': ['“Visitor”', '“Staff”', '“Admin”', '“Guest Wi-Fi”'],
      'correctIndex': 0,
      'explain': '\nInstructions: First, scan your badge; then choose “Visitor”.\n\nStep 2 option.',
    },
    {
      'question': "When do doors close?",
      'options': ['2:40', '2:45', '2:50', '2:35'],
      'correctIndex': 0,
      'explain': '\nSchedule: The next tour departs at 2:45; doors close five minutes prior.\n\n2:45 − 5’ = 2:40.',
    },
    {
      'question': "What practice is advised?",
      'options': ['Daily targets', 'Weekly only', 'Random tasks', 'No goals'],
      'correctIndex': 0,
      'explain': '\nMotivational: Set a daily target—small gains compound.\n\nHabit building.',
    },
    {
      'question': "What should you do first?",
      'options': ['Alert staff', 'Use elevator', 'Ignore it', 'Search alone'],
      'correctIndex': 0,
      'explain': '\nEmergency: If you smell smoke, alert staff and move to the nearest exit.\n\nSafety priority.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========
  /// ===== LRMaterials ========
  // lv300
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Thông báo tại nơi công cộng – Public Announcement',
    questions: p4Lv300L1,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Giới thiệu dịch vụ – Service Information',
    questions: p4Lv300L2,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hướng dẫn cơ bản – Directions',
    questions: p4Lv300L3,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Giới thiệu sự kiện – Event Info',
    questions: p4Lv300L4,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv300L5,
  );

  // lv600
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Bản tin ngắn – News Report',
    questions: p4Lv600L1,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Thuyết trình sản phẩm – Product Presentation',
    questions: p4Lv600L2,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Lịch trình sự kiện – Schedules & Plans',
    questions: p4Lv600L3,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Hướng dẫn chi tiết – Instructions',
    questions: p4Lv600L4,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv600L5,
  );

  // lv800
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Bài phát biểu dài – Speech',
    questions: p4Lv800L1,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Báo cáo tài chính / công ty – Business Report',
    questions: p4Lv800L2,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Thông báo khẩn cấp / xử lý sự cố',
    questions: p4Lv800L3,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Bài diễn thuyết truyền cảm hứng – Motivational Talk',
    questions: p4Lv800L4,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv800L5,
  );

  /// ===== FullMaterials ========
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Thông báo tại nơi công cộng – Public Announcement',
    questions: p4Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Giới thiệu dịch vụ – Service Information',
    questions: p4Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Hướng dẫn cơ bản – Directions',
    questions: p4Lv300L3,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Giới thiệu sự kiện – Event Info',
    questions: p4Lv300L4,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv300L5,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Bản tin ngắn – News Report',
    questions: p4Lv600L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Thuyết trình sản phẩm – Product Presentation',
    questions: p4Lv600L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Lịch trình sự kiện – Schedules & Plans',
    questions: p4Lv600L3,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Hướng dẫn chi tiết – Instructions',
    questions: p4Lv600L4,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv600L5,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Bài phát biểu dài – Speech',
    questions: p4Lv800L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Báo cáo tài chính / công ty – Business Report',
    questions: p4Lv800L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Thông báo khẩn cấp / xử lý sự cố',
    questions: p4Lv800L3,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Bài diễn thuyết truyền cảm hứng – Motivational Talk',
    questions: p4Lv800L4,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p4Lv800L5,
  );
}
