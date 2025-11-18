// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart1() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc(materialId).set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  // === PART 1 — Picture Description ===
  // LEVEL 300+ : 5 bài lý thuyết × 10 câu = 50 câu
  // Lesson 1 - LV 300
  final p1Lv300L1Questions = <Map<String, dynamic>>[
    // ================= LEVEL 300+ — Bài 1 (Daily activities) =================
    {
      'question': "",
      'options': [
        'She is writing on a whiteboard.',
        'She is typing on a keyboard.',
        'She is carrying a box.',
        'She is standing at a counter.',
      ],
      'correctIndex': 1,
      'explain':
          'Nhận diện cụm be+V-ing cho hành động chính: "is typing". Các đáp án khác là hành động khác.',
    },
    {
      'question': "",
      'options': [
        'The man is drinking coffee.',
        'The man is cleaning the table.',
        'The man is opening a window.',
        'The man is paying at the register.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính là "is drinking". Bỏ qua chi tiết nền.',
    },
    {
      'question': "",
      'options': [
        'A woman is answering the phone.',
        'A woman is arranging flowers.',
        'A woman is printing documents.',
        'A woman is tying her shoes.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động cốt lõi: "is answering".',
    },
    {
      'question': "",
      'options': [
        'A cashier is scanning items.',
        'A cashier is closing the store.',
        'A cashier is sweeping the floor.',
        'A cashier is counting chairs.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động rõ nhất tại quầy: "is scanning".',
    },
    {
      'question': "",
      'options': [
        'The chef is stirring the soup.',
        'The chef is reading a menu.',
        'The chef is opening a fridge.',
        'The chef is washing dishes.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "is stirring".',
    },
    {
      'question': "",
      'options': [
        'The student is raising her hand.',
        'The student is closing a book.',
        'The student is pointing at the clock.',
        'The student is leaving the room.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nổi bật trong lớp: "is raising (her hand)".',
    },
    {
      'question': "",
      'options': [
        'The worker is lifting a box.',
        'The worker is calling a taxi.',
        'The worker is eating lunch.',
        'The worker is closing the gate.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "is lifting".',
    },
    {
      'question': "",
      'options': [
        'A clerk is filing documents.',
        'A clerk is painting a wall.',
        'A clerk is watering plants.',
        'A clerk is climbing a ladder.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động văn phòng: "is filing".',
    },
    {
      'question': "",
      'options': [
        'A barista is pouring coffee.',
        'A barista is closing the blinds.',
        'A barista is fixing a lamp.',
        'A barista is counting coins.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động cốt lõi nghề nghiệp: "is pouring".',
    },
    {
      'question': "",
      'options': [
        'A man is pushing a cart.',
        'A man is repairing a road.',
        'A man is building a fence.',
        'A man is selling tickets.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "is pushing".',
    },
  ];

  // Tạo metadata Part 1 Lesson 1
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson1')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 1: Daily activities',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv300L1Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv300L1Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';
    final q = p1Lv300L1Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson1')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 2 - LV 300 =====
  final p1Lv300L2Questions = <Map<String, dynamic>>[
    // ================= LEVEL 300+ — Bài 2 (Places & Objects) =================
    {
      'question': "",
      'options': [
        'The bicycles are in front of a store.',
        'The bicycles are behind a store.',
        'The bicycles are between two cars.',
        'The bicycles are on a boat.',
      ],
      'correctIndex': 0,
      'explain': 'Giới từ vị trí: "in front of" đúng ngữ cảnh.',
    },
    {
      'question': "",
      'options': [
        'Some books are on a shelf.',
        'Some books are under a shelf.',
        'Some books are inside a box.',
        'Some books are next to a window.',
      ],
      'correctIndex': 0,
      'explain': 'Vị trí đúng: "on a shelf".',
    },
    {
      'question': "",
      'options': [
        'A truck is parked beside the warehouse.',
        'A truck is parked beneath the warehouse.',
        'A truck is parked across the warehouse.',
        'A truck is parked among the warehouse.',
      ],
      'correctIndex': 0,
      'explain': '"beside" = cạnh/bên cạnh; các lựa chọn khác không tự nhiên.',
    },
    {
      'question': "",
      'options': [
        'Chairs are arranged around the table.',
        'Chairs are arranged above the table.',
        'Chairs are arranged under the table.',
        'Chairs are arranged inside the table.',
      ],
      'correctIndex': 0,
      'explain': '"around" là quanh/bên quanh bàn → hợp cảnh họp.',
    },
    {
      'question': "",
      'options': [
        'The paintings are hung on the wall.',
        'The paintings are hung under the wall.',
        'The paintings are hung between the doors.',
        'The paintings are hung behind the wall.',
      ],
      'correctIndex': 0,
      'explain': 'Tranh treo "on the wall" là tự nhiên nhất.',
    },
    {
      'question': "",
      'options': [
        'A plant is placed next to the window.',
        'A plant is placed opposite the window.',
        'A plant is placed across the window.',
        'A plant is placed onto the window.',
      ],
      'correctIndex': 0,
      'explain': '"next to" = ngay cạnh cửa sổ.',
    },
    {
      'question': "",
      'options': [
        'A suitcase is under the bench.',
        'A suitcase is between the bench.',
        'A suitcase is along the bench.',
        'A suitcase is onto the bench.',
      ],
      'correctIndex': 0,
      'explain': '"under" = bên dưới ghế băng.',
    },
    {
      'question': "",
      'options': [
        'The statue is in the middle of the plaza.',
        'The statue is into the plaza.',
        'The statue is onto the plaza.',
        'The statue is across of the plaza.',
      ],
      'correctIndex': 0,
      'explain': '"in the middle of" = ở giữa quảng trường.',
    },
    {
      'question': "",
      'options': [
        'Bags are placed under the seats.',
        'Bags are placed above the floor.',
        'Bags are placed inside the aisle.',
        'Bags are placed behind the seats.',
      ],
      'correctIndex': 0,
      'explain': 'Vị trí phổ biến: "under the seats".',
    },
    {
      'question': "",
      'options': [
        'A sign is posted at the entrance.',
        'A sign is posted between the entrance.',
        'A sign is posted under the entrance.',
        'A sign is posted into the entrance.',
      ],
      'correctIndex': 0,
      'explain': '"at the entrance" tự nhiên nhất.',
    },
  ];

  // Tạo metadata Part 1 Lesson 2
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson2')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 2: Places & Objects',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv300L2Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv300L2Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';
    final q = p1Lv300L2Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson2')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // Lesson 3 - LV 300
  final p1Lv300L3Questions = <Map<String, dynamic>>[
    // // =========== LEVEL 300+ — Bài 3 (People & Things: trạng thái) ===========
    {
      'question': "",
      'options': [
        'The audience is seated.',
        'The audience is seating.',
        'The audience is standing.',
        'The audience is talking.',
      ],
      'correctIndex': 0,
      'explain':
          '"is seated" = trạng thái đã ngồi; khác với hành động "is seating".',
    },
    {
      'question': "",
      'options': [
        'The door is closed.',
        'Someone is closing the door.',
        'The door is opening.',
        'A man is opening the door.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái tĩnh "is closed" ≠ hành động đóng/mở.',
    },
    {
      'question': "",
      'options': [
        'The store is open.',
        'A worker is opening the store.',
        'Customers are opening the door.',
        'A sign is opening the shop.',
      ],
      'correctIndex': 0,
      'explain': '"is open" = trạng thái mở cửa.',
    },
    {
      'question': "",
      'options': [
        'The lights are on.',
        'The lights are turning on.',
        'A man is turning on the lights.',
        'The lights are being turned off.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái tĩnh: đèn đang bật.',
    },
    {
      'question': "",
      'options': [
        'The shelves are empty.',
        'The clerk is emptying the shelves.',
        'The shelves are being emptied.',
        'The clerk is filling the shelves.',
      ],
      'correctIndex': 0,
      'explain': 'Mô tả trạng thái: kệ trống.',
    },
    {
      'question': "",
      'options': [
        'The table is set.',
        'The table is being set.',
        'A waitress is setting the table.',
        'A man is clearing the table.',
      ],
      'correctIndex': 0,
      'explain': '"is set" = trạng thái đã bày xong.',
    },
    {
      'question': "",
      'options': [
        'The parking lot is full.',
        'Cars are filling the parking lot.',
        'A guard is closing the parking lot.',
        'A driver is leaving the parking lot.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái: bãi đỗ đầy.',
    },
    {
      'question': "",
      'options': [
        'The seats are occupied.',
        'People are occupying the seats.',
        'A woman is occupying a seat.',
        'A man is leaving a seat.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái: ghế đã có người ngồi.',
    },
    {
      'question': "",
      'options': [
        'The computers are off.',
        'An assistant is turning off the computers.',
        'The computers are being turned on.',
        'A manager is checking the computers.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái: máy tính đang tắt.',
    },
    {
      'question': "",
      'options': [
        'The display case is locked.',
        'A clerk is locking the display case.',
        'A clerk is unlocking the display case.',
        'The display case is being opened.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái: tủ kính đã khóa.',
    },
  ];

  // Tạo metadata Part 1 Lesson 3
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson3')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 3: People & Things (Trạng thái)',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv300L3Questions.length,
      }, SetOptions(merge: true));

  // Push 50 câu vào Firestore, auto imagePath theo thứ tự q01.jpg → q50.jpg
  for (int i = 1; i <= p1Lv300L3Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';
    final q = p1Lv300L3Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // Lesson 4 - LV 300
  final p1Lv300L4Questions = <Map<String, dynamic>>[
    // ============= LEVEL 300+ — Bài 4 (Minimal pairs / âm dễ nhầm) ==========
    {
      'question': "",
      'options': [
        'The worker is typing at a desk.',
        'The worker is taping a box.',
        'The worker is wiping the floor.',
        'The worker is tipping a chair.',
      ],
      'correctIndex': 0,
      'explain':
          'Phân biệt typing /ˈtaɪpɪŋ/ với taping/wiping/tipping; cảnh bàn phím → typing.',
    },
    {
      'question': "",
      'options': [
        'The woman is sitting at her desk.',
        'The woman is setting the table.',
        'The woman is seeding the lawn.',
        'The woman is seating a guest.',
      ],
      'correctIndex': 0,
      'explain': 'sit vs set/seed/seat; ảnh văn phòng → sitting.',
    },
    {
      'question': "",
      'options': [
        'A man is holding a sheet of paper.',
        'A man is sitting on a seat.',
        'A man is shipping a package.',
        'A man is shouting at people.',
      ],
      'correctIndex': 0,
      'explain': 'sheet /ʃiːt/ vs seat /siːt/; ngữ cảnh cầm giấy → sheet.',
    },
    {
      'question': "",
      'options': [
        'A woman is wearing a coat.',
        'A woman is carrying a cart.',
        'A woman is calling a code.',
        'A woman is caring a cat.',
      ],
      'correctIndex': 0,
      'explain': 'wearing /ˈweərɪŋ/ khác với carrying/calling/caring.',
    },
    {
      'question': "",
      'options': [
        'The chef is pouring sauce.',
        'The chef is pulling sauce.',
        'The chef is polishing sauce.',
        'The chef is pausing the sauce.',
      ],
      'correctIndex': 0,
      'explain': 'pour /pɔːr/ ≠ pull/polish/pause.',
    },
    {
      'question': "",
      'options': [
        'A clerk is checking a bill.',
        'A clerk is kicking a ball.',
        'A clerk is baking a bun.',
        'A clerk is picking a bell.',
      ],
      'correctIndex': 0,
      'explain': 'bill /bɪl/ ≠ ball/bun/bell; văn phòng → bill.',
    },
    {
      'question': "",
      'options': [
        'A driver is parking a car.',
        'A driver is barking at a car.',
        'A driver is packing a car.',
        'A driver is backing a car.',
      ],
      'correctIndex': 0,
      'explain': 'parking /ˈpɑːkɪŋ/ ≠ barking/packing/backing.',
    },
    {
      'question': "",
      'options': [
        'A man is buying a pair of shoes.',
        'A man is buying a pear of shoes.',
        'A man is buying a bear of shoes.',
        'A man is buying a bar of shoes.',
      ],
      'correctIndex': 0,
      'explain': 'pair (đôi) ≠ pear (quả lê) / bear / bar.',
    },
    {
      'question': "",
      'options': [
        'A woman is reading a novel.',
        'A woman is riding a novel.',
        'A woman is raiding a novel.',
        'A woman is ridding a novel.',
      ],
      'correctIndex': 0,
      'explain': 'reading /ˈriːdɪŋ/ ≠ riding/raiding/ridding.',
    },
    {
      'question': "",
      'options': [
        'A man is mopping the floor.',
        'A man is mapping the floor.',
        'A man is mopping the flower.',
        'A man is popping the floor.',
      ],
      'correctIndex': 0,
      'explain': 'mop /mɒp/ ≠ map/pop; object phù hợp là floor.',
    },
  ];

  // Tạo metadata Part 1 Lesson 4
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson4')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 4: Minimal pairs',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv300L4Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv300L4Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';
    final q = p1Lv300L4Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // Lesson 5 - LV 300
  final p1Lv300L5Questions = <Map<String, dynamic>>[
    // =============== LEVEL 300+ — Bài 5 (Outdoor scenes) ====================
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Workers are paving a road in the foreground.',
        'Boats are anchored in the distance.',
        'Mountains are visible behind the city.',
        'A traffic light is above the street.',
      ],
      'correctIndex': 0,
      'explain':
          'Chọn hành động nổi bật ở tiền cảnh (paving). Các đáp án khác là chi tiết tĩnh.',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'People are jogging along the river.',
        'Clouds are in the sky.',
        'A bridge can be seen far away.',
        'Trees are lining the street.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "are jogging"; các chi tiết khác là nền.',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Cyclists are crossing an intersection.',
        'A sign is posted at the corner.',
        'A tower is standing in the background.',
        'A bench is placed near the path.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nổi bật: "are crossing".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'A vendor is selling fruit at a stall.',
        'Umbrellas are open above the tables.',
        'Customers are near the entrance.',
        'Baskets are on the ground.',
      ],
      'correctIndex': 0,
      'explain': 'Tập trung hành động chính: "is selling".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Hikers are climbing a rocky trail.',
        'A river runs through the valley.',
        'Snow is visible on the peaks.',
        'Clouds are covering the sky.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "are climbing".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Tourists are taking photos of a monument.',
        'Flags are flying above the building.',
        'Buses are parked along the street.',
        'A fountain is in the square.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính ở tiền cảnh: "are taking photos".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Shoppers are entering a mall.',
        'A poster is attached to the door.',
        'A bench is placed by the tree.',
        'Windows are decorated with lights.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "are entering".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'A crew is repairing the sidewalk.',
        'Traffic cones are on the street.',
        'A sign is warning pedestrians.',
        'A truck is parked nearby.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "is repairing".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Rowers are paddling on the lake.',
        'A fence runs along the shore.',
        'Houses are built near the water.',
        'Birds are flying in the distance.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "are paddling".',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': [
        'Construction workers are lifting steel beams.',
        'Cranes are visible behind the building.',
        'Materials are stacked on pallets.',
        'Helmets are placed on a table.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: "are lifting".',
    },
  ];

  // Tạo metadata Part 1 Lesson 5
  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv300')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson5')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 5: Outdoor scenes',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv300L5Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv300L5Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/$id.jpg';
    final q = p1Lv300L5Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv300')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson5')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // === PART 1 — Picture Description ===
  // LEVEL 600+ : 5 bài lý thuyết × 10 câu = 50 câu
  // Lesson 1 - LV 600 — Workplace actions
  final p1Lv600L1Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'They are having a meeting.',
        'One man is holding a pen.',
        'A projector is on the table.',
        'A clock is on the wall.',
      ],
      'correctIndex': 0,
      'explain': 'Nhiều người → chọn hành động chủ đạo “are having a meeting”.',
    },
    {
      'question': "",
      'options': [
        'Several colleagues are brainstorming ideas.',
        'A poster is hanging behind them.',
        'A laptop is open.',
        'There are markers on the desk.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nhóm trọng tâm: “are brainstorming”.',
    },
    {
      'question': "",
      'options': [
        'Team members are reviewing documents together.',
        'A woman is wearing glasses.',
        'A mug is next to a notebook.',
        'A phone is face down.',
      ],
      'correctIndex': 0,
      'explain': 'Tập trung vào hoạt động chung: “are reviewing”.',
    },
    {
      'question': "",
      'options': [
        'Staff are gathering around a whiteboard.',
        'One man is smiling.',
        'There is a plant in the corner.',
        'A window is open.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động tập thể: “are gathering”.',
    },
    {
      'question': "",
      'options': [
        'Coworkers are discussing a blueprint.',
        'A blueprint is blue.',
        'A lamp is switched on.',
        'A chair is empty.',
      ],
      'correctIndex': 0,
      'explain': 'Chọn động tác nhóm chính: “are discussing”.',
    },
    {
      'question': "",
      'options': [
        'Employees are collaborating at a workstation.',
        'A sticker is on the screen.',
        'Headphones are on the desk.',
        'A cable is plugged in.',
      ],
      'correctIndex': 0,
      'explain': '“are collaborating” mô tả hành động chủ đạo.',
    },
    {
      'question': "",
      'options': [
        'Designers are arranging samples on the table.',
        'A ruler is nearby.',
        'A shelf is full.',
        'A bin is beside the desk.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nhóm: “are arranging”.',
    },
    {
      'question': "",
      'options': [
        'The team is presenting findings to a client.',
        'A screen is bright.',
        'A notebook is closed.',
        'A cable is tangled.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chủ đạo: “is presenting”.',
    },
    {
      'question': "",
      'options': [
        'Engineers are testing a device together.',
        'A toolbox is red.',
        'Safety goggles are on the table.',
        'A badge is clipped.',
      ],
      'correctIndex': 0,
      'explain': '“are testing” là hoạt động chính nhiều người.',
    },
    {
      'question': "",
      'options': [
        'Managers are signing a contract.',
        'A calendar is visible.',
        'A plant is on the sill.',
        'The blinds are closed.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nhóm: “are signing”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson1')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 1: Workplace actions',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv600L1Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv600L1Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv600_l1_$id.jpg';
    final q = p1Lv600L1Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson1')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 2 - LV 600 — Transportation & Equipment =====
  final p1Lv600L2Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'Passengers are boarding a bus.',
        'A schedule is posted.',
        'A bench is empty.',
        'A sign is yellow.',
      ],
      'correctIndex': 0,
      'explain': 'Chọn hành động liên quan phương tiện: “are boarding”.',
    },
    {
      'question': "",
      'options': [
        'Crates are being loaded with a forklift.',
        'A forklift is parked.',
        'Labels are visible.',
        'A cone is on the ground.',
      ],
      'correctIndex': 0,
      'explain': 'Bị động tiếp diễn “are being loaded” = hành động chính.',
    },
    {
      'question': "",
      'options': [
        'Travelers are pulling suitcases along the platform.',
        'A map is displayed.',
        'A clock is overhead.',
        'A poster is colorful.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: “are pulling”.',
    },
    {
      'question': "",
      'options': [
        'Workers are unloading boxes from a truck.',
        'A truck is white.',
        'Boxes are brown.',
        'A ramp is metal.',
      ],
      'correctIndex': 0,
      'explain': '“are unloading” là động tác thiết bị–vận chuyển.',
    },
    {
      'question': "",
      'options': [
        'A mechanic is inspecting an engine.',
        'A poster is on the door.',
        'A fan is rotating.',
        'Oil is on the floor.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động với công cụ: “is inspecting”.',
    },
    {
      'question': "",
      'options': [
        'A technician is scanning a barcode with a handheld device.',
        'A cable is black.',
        'A shelf is tall.',
        'A label is printed.',
      ],
      'correctIndex': 0,
      'explain': 'Động tác với thiết bị cầm tay: “is scanning”.',
    },
    {
      'question': "",
      'options': [
        'Baggage is being weighed at the counter.',
        'A sticker is green.',
        'A bell is on the desk.',
        'A chair is nearby.',
      ],
      'correctIndex': 0,
      'explain': 'Bị động mô tả thao tác thiết bị: “is being weighed”.',
    },
    {
      'question': "",
      'options': [
        'Cyclists are securing helmets before riding.',
        'A fence is behind them.',
        'A path is narrow.',
        'A tree is tall.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động đúng công cụ: “are securing helmets”.',
    },
    {
      'question': "",
      'options': [
        'A dockworker is fastening a rope to the bollard.',
        'Water is calm.',
        'A boat is white.',
        'A cloud is overhead.',
      ],
      'correctIndex': 0,
      'explain': 'Động tác với dụng cụ (rope): “is fastening”.',
    },
    {
      'question': "",
      'options': [
        'A driver is adjusting the rearview mirror.',
        'A sticker is on the window.',
        'A seat is leather.',
        'A bag is on the seat.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động liên quan thiết bị xe: “is adjusting”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson2')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 2: Transportation & Equipment',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv600L2Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv600L2Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv600_l2_$id.jpg';
    final q = p1Lv600L2Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson2')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 3 - LV 600 — Tenses in description =====
  final p1Lv600L3Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'Workers are stacking boxes.',
        'Workers have stacked boxes.',
        'Workers had stacked boxes.',
        'Workers stack boxes yesterday.',
      ],
      'correctIndex': 0,
      'explain': 'Ảnh diễn tả quá trình → hiện tại tiếp diễn “are stacking”.',
    },
    {
      'question': "",
      'options': [
        'The shelves have been stocked.',
        'The shelves are stocking.',
        'Clerks are being stocked.',
        'The shelves were stocking.',
      ],
      'correctIndex': 0,
      'explain':
          'Kết quả đã hoàn tất (thấy kệ đầy) → hiện tại hoàn thành bị động “have been stocked”.',
    },
    {
      'question': "",
      'options': [
        'A table has been set.',
        'A table is setting.',
        'A waiter is set the table.',
        'A table sets now.',
      ],
      'correctIndex': 0,
      'explain': 'Trạng thái kết quả: “has been set”.',
    },
    {
      'question': "",
      'options': [
        'The presenter is pointing at the screen.',
        'The presenter has pointing at the screen.',
        'The presenter has point at the screen.',
        'The presenter pointed at the screen now.',
      ],
      'correctIndex': 0,
      'explain': 'Động tác đang diễn ra → “is pointing”.',
    },
    {
      'question': "",
      'options': [
        'The documents have been arranged neatly.',
        'The documents are arranging neatly.',
        'The documents have arranging neatly.',
        'The documents is arranged now.',
      ],
      'correctIndex': 0,
      'explain': 'Nhìn thấy kết quả hoàn tất → “have been arranged”.',
    },
    {
      'question': "",
      'options': [
        'Guests are taking their seats.',
        'Guests have take their seats.',
        'Guests are taken their seats.',
        'Guests has been seated.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động đang diễn ra → “are taking”.',
    },
    {
      'question': "",
      'options': [
        'The floor has been cleaned.',
        'The floor is cleaning now.',
        'The floor has cleaning.',
        'The floor had clean.',
      ],
      'correctIndex': 0,
      'explain': 'Thấy kết quả (sàn sạch) → hiện tại hoàn thành bị động.',
    },
    {
      'question': "",
      'options': [
        'The chef is slicing vegetables.',
        'The chef has slice vegetables.',
        'The chef is sliced vegetables.',
        'The chef was slicing tomorrow.',
      ],
      'correctIndex': 0,
      'explain': 'Quá trình đang thực hiện → hiện tại tiếp diễn.',
    },
    {
      'question': "",
      'options': [
        'The boxes have been sealed.',
        'The boxes are sealing.',
        'The boxes have sealing.',
        'The boxes is sealed now.',
      ],
      'correctIndex': 0,
      'explain': 'Kết quả thấy keo dán → “have been sealed”.',
    },
    {
      'question': "",
      'options': [
        'Attendees are lining up at the entrance.',
        'Attendees have lining up.',
        'Attendees are lined up by themselves.',
        'Attendees has been line up.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động đang diễn ra → “are lining up”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson3')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 3: Tenses in description',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv600L3Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv600L3Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv600_l3_$id.jpg';
    final q = p1Lv600L3Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 4 - LV 600 — Sound-alike words (nâng cao) =====
  final p1Lv600L4Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'The aisle is crowded with shoppers.',
        'The isle is crowded with shoppers.',
        'The eye is crowded with shoppers.',
        'The oil is crowded with shoppers.',
      ],
      'correctIndex': 0,
      'explain': '“aisle” (lối đi) ≠ isle (đảo).',
    },
    {
      'question': "",
      'options': [
        'The crew is repairing the brake.',
        'The crew is repairing the break.',
        'The crew is repairing the brick.',
        'The crew is repairing the brook.',
      ],
      'correctIndex': 0,
      'explain': '“brake” (phanh) ≠ break (nghỉ).',
    },
    {
      'question': "",
      'options': [
        'A customer is choosing kitchenware.',
        'A customer is choosing kitchen wear.',
        'A customer is choosing kitchen where.',
        'A customer is choosing kitchen swear.',
      ],
      'correctIndex': 0,
      'explain': '“ware” = đồ dùng; “wear” = mặc.',
    },
    {
      'question': "",
      'options': [
        'Sailors are raising a sail.',
        'Sellers are raising a sale.',
        'Sailors are raising a sale.',
        'Sellers are raising a sail.',
      ],
      'correctIndex': 0,
      'explain': '“sail” (cánh buồm) ≠ sale (giảm giá).',
    },
    {
      'question': "",
      'options': [
        'A worker is rolling a heavy roll of fabric.',
        'A worker is taking a heavy role of fabric.',
        'A worker is baking a heavy roll of fabric.',
        'A worker is roaming a heavy role of fabric.',
      ],
      'correctIndex': 0,
      'explain': '“roll” (cuộn) ≠ role (vai trò).',
    },
    {
      'question': "",
      'options': [
        'A woman is boarding a train.',
        'A woman is boring a train.',
        'A woman is board a train.',
        'A woman is bored a train.',
      ],
      'correctIndex': 0,
      'explain': '“boarding” = lên tàu; các biến thể khác sai/nghĩa khác.',
    },
    {
      'question': "",
      'options': [
        'The waiter is pouring water.',
        'The waiter is poor water.',
        'The waiter is pore water.',
        'The waiter is power water.',
      ],
      'correctIndex': 0,
      'explain': '“pour” (rót) ≠ poor/pore/power.',
    },
    {
      'question': "",
      'options': [
        'The chef is garnishing the dish with thyme.',
        'The chef is garnishing the dish with time.',
        'The chef is garnishing the dish with times.',
        'The chef is garnishing the dish with tie.',
      ],
      'correctIndex': 0,
      'explain': '“thyme” (cỏ xạ hương) phát âm gần “time” nhưng nghĩa khác.',
    },
    {
      'question': "",
      'options': [
        'A clerk is stamping a receipt.',
        'A clerk is stepping a receipt.',
        'A clerk is staring a receipt.',
        'A clerk is stopping a receipt.',
      ],
      'correctIndex': 0,
      'explain': '“stamping” (đóng dấu) ≠ stepping/staring/stopping.',
    },
    {
      'question': "",
      'options': [
        'A passenger is waiting by the fare machine.',
        'A passenger is waiting by the fair machine.',
        'A passenger is waiting by the fire machine.',
        'A passenger is waiting by the fear machine.',
      ],
      'correctIndex': 0,
      'explain': '“fare” (tiền vé) ≠ fair/fire/fear.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson4')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 4: Sound-alike words',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv600L4Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv600L4Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv600_l4_$id.jpg';
    final q = p1Lv600L4Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 5 - LV 600 — Paraphrase mô tả =====
  final p1Lv600L5Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'The presenter is highlighting key points.',
        'The presenter is turning off the lights.',
        'The presenter is closing the laptop.',
        'The presenter is leaving the room.',
      ],
      'correctIndex': 0,
      'explain': '“highlighting” ~ “emphasizing/explaining” nội dung trên màn.',
    },
    {
      'question': "",
      'options': [
        'A clerk is handing out brochures.',
        'A clerk is picking up brochures.',
        'A clerk is throwing away brochures.',
        'A clerk is filing brochures.',
      ],
      'correctIndex': 0,
      'explain': 'Paraphrase “distributing” = “handing out”.',
    },
    {
      'question': "",
      'options': [
        'A woman is examining a product closely.',
        'A woman is ignoring a product.',
        'A woman is hiding a product.',
        'A woman is returning a product.',
      ],
      'correctIndex': 0,
      'explain': '“examining” ≈ “inspecting/looking over”.',
    },
    {
      'question': "",
      'options': [
        'Workers are assembling a display.',
        'Workers are disassembling a display.',
        'Workers are transporting a display.',
        'Workers are painting a display.',
      ],
      'correctIndex': 0,
      'explain': '“assembling” ~ lắp ráp (paraphrase của “putting together”).',
    },
    {
      'question': "",
      'options': [
        'Shoppers are lining up at the cashier.',
        'Shoppers are wandering around.',
        'Shoppers are sitting on the floor.',
        'Shoppers are closing the store.',
      ],
      'correctIndex': 0,
      'explain': '“lining up” ≈ “queuing at the register”.',
    },
    {
      'question': "",
      'options': [
        'A man is browsing the shelves.',
        'A man is building the shelves.',
        'A man is breaking the shelves.',
        'A man is buying the shelves.',
      ],
      'correctIndex': 0,
      'explain': '“browsing” ≈ “looking through/over”.',
    },
    {
      'question': "",
      'options': [
        'Two people are exchanging business cards.',
        'Two people are correcting business cards.',
        'Two people are collecting business cards.',
        'Two people are counting business cards.',
      ],
      'correctIndex': 0,
      'explain': '“exchanging” ≈ “handing each other”.',
    },
    {
      'question': "",
      'options': [
        'A man is ascending the stairs.',
        'A man is descending the stairs.',
        'A man is sitting on the stairs.',
        'A man is fixing the stairs.',
      ],
      'correctIndex': 0,
      'explain': 'Paraphrase của “going up the stairs”: “ascending”.',
    },
    {
      'question': "",
      'options': [
        'A woman is adjusting the camera settings.',
        'A woman is deleting the camera.',
        'A woman is washing the camera.',
        'A woman is hiding the camera.',
      ],
      'correctIndex': 0,
      'explain': '“adjusting settings” ≈ “tweaking/configuring”.',
    },
    {
      'question': "",
      'options': [
        'Participants are taking part in a workshop.',
        'Participants are taking parts of a workshop.',
        'Participants are taking place a workshop.',
        'Participants are taking over a workshop.',
      ],
      'correctIndex': 0,
      'explain':
          '“taking part in” = tham gia; paraphrase của “participating in”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv600')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson5')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 5: Paraphrase mô tả',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv600L5Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv600L5Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv600_l5_$id.jpg';
    final q = p1Lv600L5Questions[i - 1];

    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv600')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson5')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // === PART 1 — Picture Description ===
  // LEVEL 800+ : 5 bài lý thuyết × 10 câu = 50 câu

  // ===== Lesson 1 - LV 800 — Advanced actions (mô tả phức hợp) =====
  final p1Lv800L1Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'Two chefs are plating dishes while a server is carrying a tray.',
        'Two chefs are talking near the sink.',
        'A server is standing by the door.',
        'A menu is posted on the wall.',
      ],
      'correctIndex': 0,
      'explain':
          'Chuỗi/đồng thời: “plating… while … carrying” — xác định ai làm gì.',
    },
    {
      'question': "",
      'options': [
        'An assistant is handing documents to a presenter who is pointing at a graph.',
        'An assistant is reading a magazine.',
        'A presenter is standing alone.',
        'The graph is on the screen.',
      ],
      'correctIndex': 0,
      'explain':
          'Tác nhân & người nhận rõ ràng: handing → presenter; presenter → pointing.',
    },
    {
      'question': "",
      'options': [
        'Workers are securing a crate that is being lifted by a crane.',
        'A crate is on the ground.',
        'A crane is parked with no activity.',
        'Workers are watching from afar.',
      ],
      'correctIndex': 0,
      'explain':
          'Kết hợp chủ động + bị động: “are securing… that is being lifted…”.',
    },
    {
      'question': "",
      'options': [
        'A barista is steaming milk before pouring it into cups.',
        'A barista is standing near cups.',
        'Cups are on a counter.',
        'A poster is behind the counter.',
      ],
      'correctIndex': 0,
      'explain': 'Trật tự hành động: steaming → before → pouring.',
    },
    {
      'question': "",
      'options': [
        'A technician is attaching labels after aligning the packages.',
        'Packages are next to a scale.',
        'A label is on the table.',
        'A chair is beside the conveyor.',
      ],
      'correctIndex': 0,
      'explain': 'Trình tự: align → after → attach labels.',
    },
    {
      'question': "",
      'options': [
        'A speaker is greeting attendees as they are taking their seats.',
        'A speaker is alone on stage.',
        'Attendees are near the entrance.',
        'A banner is above the stage.',
      ],
      'correctIndex': 0,
      'explain':
          'Đồng thời: greeting (speaker) & taking seats (attendees) — hai chủ thể.',
    },
    {
      'question': "",
      'options': [
        'Engineers are calibrating a device and recording the results.',
        'Engineers are standing.',
        'A device is on a bench.',
        'A notebook is closed.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động phức: calibrating + recording (song hành).',
    },
    {
      'question': "",
      'options': [
        'A vendor is weighing produce before handing change to a customer.',
        'A vendor is looking outside.',
        'A customer is near a stall.',
        'Bags are on a hook.',
      ],
      'correctIndex': 0,
      'explain': 'Trình tự: weigh → before → hand change.',
    },
    {
      'question': "",
      'options': [
        'Artists are setting up easels while organizers are cordoning off the area.',
        'Artists are chatting.',
        'Organizers are present.',
        'A sign is nearby.',
      ],
      'correctIndex': 0,
      'explain':
          'Hai nhóm tác nhân, hai hành động song song: setting up / cordoning off.',
    },
    {
      'question': "",
      'options': [
        'A nurse is preparing a syringe as a patient is rolling up his sleeve.',
        'A nurse is holding a clipboard.',
        'A patient is seated.',
        'Curtains are closed.',
      ],
      'correctIndex': 0,
      'explain':
          'Đồng thời, vai trò rõ ràng: nurse (prepare) vs patient (roll up).',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson1')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 1: Advanced actions',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv800L1Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv800L1Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv800_l1_$id.jpg';
    final q = p1Lv800L1Questions[i - 1];
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson1')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 2 - LV 800 — Synonyms practice (paraphrase sâu) =====
  final p1Lv800L2Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'A presenter is elaborating on the findings.',
        'A presenter is erasing the findings.',
        'A presenter is eliminating the findings.',
        'A presenter is ignoring the findings.',
      ],
      'correctIndex': 0,
      'explain': '“elaborating on” ≈ “explaining in detail”.',
    },
    {
      'question': "",
      'options': [
        'A clerk is retrieving files from a cabinet.',
        'A clerk is retreating files from a cabinet.',
        'A clerk is relieving files from a cabinet.',
        'A clerk is rewriting files in a cabinet.',
      ],
      'correctIndex': 0,
      'explain': '“retrieve” ≈ “get/fetch”.',
    },
    {
      'question': "",
      'options': [
        'An audience is applauding the performance.',
        'An audience is applying the performance.',
        'An audience is appraising the performance.',
        'An audience is appending the performance.',
      ],
      'correctIndex': 0,
      'explain': '“applaud” ≈ “clap/cheer”.',
    },
    {
      'question': "",
      'options': [
        'Staff are distributing handouts to participants.',
        'Staff are disrupting handouts to participants.',
        'Staff are distancing handouts from participants.',
        'Staff are distinguishing handouts for participants.',
      ],
      'correctIndex': 0,
      'explain': '“distribute” ≈ “give out/hand out”.',
    },
    {
      'question': "",
      'options': [
        'A worker is inspecting the machinery.',
        'A worker is respecting the machinery.',
        'A worker is suspecting the machinery.',
        'A worker is infecting the machinery.',
      ],
      'correctIndex': 0,
      'explain': '“inspect” ≈ “examine/check”.',
    },
    {
      'question': "",
      'options': [
        'A librarian is organizing periodicals on a shelf.',
        'A librarian is originating periodicals on a shelf.',
        'A librarian is orienting periodicals to a shelf.',
        'A librarian is ordaining periodicals on a shelf.',
      ],
      'correctIndex': 0,
      'explain': '“organize” ≈ “arrange/sort”.',
    },
    {
      'question': "",
      'options': [
        'Technicians are troubleshooting a connection issue.',
        'Technicians are joyshooting a connection issue.',
        'Technicians are footshooting a connection issue.',
        'Technicians are photoshooting a connection issue.',
      ],
      'correctIndex': 0,
      'explain': '“troubleshoot” ≈ “diagnose/fix”.',
    },
    {
      'question': "",
      'options': [
        'Attendees are perusing the brochure.',
        'Attendees are pursuing the brochure.',
        'Attendees are persuading the brochure.',
        'Attendees are perfusing the brochure.',
      ],
      'correctIndex': 0,
      'explain': '“peruse” ≈ “read carefully/examine”.',
    },
    {
      'question': "",
      'options': [
        'A manager is authorizing a purchase request.',
        'A manager is authenticating a purchase request.',
        'A manager is auditioning a purchase request.',
        'A manager is alternating a purchase request.',
      ],
      'correctIndex': 0,
      'explain': '“authorize” ≈ “approve/permit”.',
    },
    {
      'question': "",
      'options': [
        'Researchers are compiling data from multiple sources.',
        'Researchers are complaining data from multiple sources.',
        'Researchers are complying data from multiple sources.',
        'Researchers are compelling data from multiple sources.',
      ],
      'correctIndex': 0,
      'explain': '“compile” ≈ “collect/aggregate”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson2')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 2: Synonyms practice',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv800L2Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv800L2Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv800_l2_$id.jpg';
    final q = p1Lv800L2Questions[i - 1];
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson2')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 3 - LV 800 — Grammar traps (thì, chủ/động, bị động) =====
  final p1Lv800L3Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'A shipment is being inspected by customs officers.',
        'A shipment is inspecting customs officers.',
        'Customs officers are inspected by a shipment.',
        'A shipment has inspect by customs officers.',
      ],
      'correctIndex': 0,
      'explain': 'Bị động tiếp diễn đúng cấu trúc: is being + V3.',
    },
    {
      'question': "",
      'options': [
        'The audience has been seated.',
        'The audience is seating.',
        'The audience seats now.',
        'The audience has seating.',
      ],
      'correctIndex': 0,
      'explain': 'Hiện tại hoàn thành bị động = trạng thái kết quả.',
    },
    {
      'question': "",
      'options': [
        'The documents were signed before being scanned.',
        'The documents were signing before scanned.',
        'The documents are sign before scanning.',
        'The documents has been sign before being scan.',
      ],
      'correctIndex': 0,
      'explain': 'Chuỗi bị động hợp lệ: were signed → before being scanned.',
    },
    {
      'question': "",
      'options': [
        'The floor is being polished.',
        'The floor is polishing.',
        'The floor has polishing.',
        'The floor was polish now.',
      ],
      'correctIndex': 0,
      'explain': 'Bị động tiếp diễn: is being polished.',
    },
    {
      'question': "",
      'options': [
        'A clerk has placed the files on the counter.',
        'A clerk is place the files.',
        'A clerk has placing the files.',
        'A clerk place the files yesterday.',
      ],
      'correctIndex': 0,
      'explain': 'Hiện tại hoàn thành chủ động: has + V3.',
    },
    {
      'question': "",
      'options': [
        'The machines have been serviced recently.',
        'The machines have servicing recently.',
        'The machines are serviced recently.',
        'The machines has been service recently.',
      ],
      'correctIndex': 0,
      'explain': 'Have been + V3 (bị động hoàn thành) là đúng.',
    },
    {
      'question': "",
      'options': [
        'Guests are being escorted to their seats.',
        'Guests are escort to their seats.',
        'Guests have escorting to their seats.',
        'Guests were escorting to their seats now.',
      ],
      'correctIndex': 0,
      'explain': 'Bị động tiếp diễn cho hành động đang diễn ra.',
    },
    {
      'question': "",
      'options': [
        'Labels had been printed before the items arrived.',
        'Labels had printing before the items arrived.',
        'Labels were print before the items arrived.',
        'Labels are printed before the items arrive yesterday.',
      ],
      'correctIndex': 0,
      'explain': 'Quá khứ hoàn thành bị động: had been + V3.',
    },
    {
      'question': "",
      'options': [
        'A presenter is being introduced by the host.',
        'A presenter is introducing by the host.',
        'A presenter has introduce by the host.',
        'A presenter being introduced by the host.',
      ],
      'correctIndex': 0,
      'explain': 'Be + being + V3 (bị động tiếp diễn).',
    },
    {
      'question': "",
      'options': [
        'Equipment has been set up and is currently being tested.',
        'Equipment has be set up and is currently test.',
        'Equipment is set up and currently test.',
        'Equipment has been setting up and currently being test.',
      ],
      'correctIndex': 0,
      'explain': 'Kết hợp HTHT bị động + bị động tiếp diễn chính xác.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson3')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 3: Grammar traps',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv800L3Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv800L3Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv800_l3_$id.jpg';
    final q = p1Lv800L3Questions[i - 1];
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson3')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 4 - LV 800 — Complex scenes (foreground/background) =====
  final p1Lv800L4Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'In the foreground, contractors are laying tiles; in the background, shoppers are passing by.',
        'Shoppers are passing by.',
        'Tiles are on the ground.',
        'A store is visible.',
      ],
      'correctIndex': 0,
      'explain': 'Ưu tiên hành động foreground (laying tiles) > chi tiết nền.',
    },
    {
      'question': "",
      'options': [
        'A photographer is adjusting a lens while mountains are visible in the distance.',
        'Mountains are visible in the distance.',
        'A lens is on a camera.',
        'A bag is near a rock.',
      ],
      'correctIndex': 0,
      'explain':
          'Chọn hành động chính ở tiền cảnh (adjusting lens); background chỉ bổ trợ.',
    },
    {
      'question': "",
      'options': [
        'Commuters are rushing through a gate; far behind, a screen displays schedules.',
        'A screen displays schedules.',
        'A gate is open.',
        'People are near a station.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động nổi bật “are rushing” (foreground) mới là đáp án.',
    },
    {
      'question': "",
      'options': [
        'Vendors are arranging produce at a stall; boats are moored beyond the pier.',
        'Boats are moored beyond the pier.',
        'A stall is wooden.',
        'A crate is red.',
      ],
      'correctIndex': 0,
      'explain': 'Foreground hành động “arranging produce”.',
    },
    {
      'question': "",
      'options': [
        'A runner is tying shoelaces near the camera; spectators are cheering in the stands.',
        'Spectators are cheering.',
        'Shoelaces are on shoes.',
        'A stand is full.',
      ],
      'correctIndex': 0,
      'explain': 'Chọn hoạt động gần/tiền cảnh (tying).',
    },
    {
      'question': "",
      'options': [
        'A scientist is pouring liquid into a beaker; a whiteboard can be seen behind.',
        'A whiteboard can be seen behind.',
        'A beaker is on the table.',
        'A marker is on the tray.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động foreground: “is pouring”.',
    },
    {
      'question': "",
      'options': [
        'Cyclists are fixing a chain by the roadside; traffic is moving in the background.',
        'Traffic is moving.',
        'A roadside is present.',
        'A chain is metal.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động chính: “are fixing a chain”.',
    },
    {
      'question': "",
      'options': [
        'A chef is garnishing plates at the pass; diners are chatting at distant tables.',
        'Diners are chatting.',
        'Plates are on the pass.',
        'Tables are distant.',
      ],
      'correctIndex': 0,
      'explain': 'Foreground: “is garnishing plates”.',
    },
    {
      'question': "",
      'options': [
        'A worker is repainting a railing; a river flows behind the walkway.',
        'A river flows behind the walkway.',
        'A railing is metal.',
        'A walkway is long.',
      ],
      'correctIndex': 0,
      'explain': 'Hành động tiền cảnh: “is repainting”.',
    },
    {
      'question': "",
      'options': [
        'Musicians are tuning instruments near the camera; a crowd is forming farther back.',
        'A crowd is forming.',
        'Instruments are on stage.',
        'A cable is on the floor.',
      ],
      'correctIndex': 0,
      'explain': 'Foreground: “are tuning instruments”.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson4')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 4: Complex scenes',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv800L4Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv800L4Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv800_l4_$id.jpg';
    final q = p1Lv800L4Questions[i - 1];
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson4')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }

  // ===== Lesson 5 - LV 800 — Fast listening (tập trung keywords dễ nuốt âm) =====
  final p1Lv800L5Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': [
        'A passenger is fastening a seat belt.',
        'A passenger is fastening a seat boat.',
        'A passenger is fasten a seat belt.',
        'A passenger is fastened a seat belt.',
      ],
      'correctIndex': 0,
      'explain':
          'Nghe nhanh dễ nuốt âm /ən/: “fastening a seat belt” là cấu trúc chuẩn.',
    },
    {
      'question': "",
      'options': [
        'A clerk is issuing a receipt.',
        'A clerk is tissue a receipt.',
        'A clerk is assuring a receipt.',
        'A clerk is pushing a receipt.',
      ],
      'correctIndex': 0,
      'explain':
          '“issuing” /ˈɪʃuːɪŋ/ dễ lẫn khi đọc nhanh → chọn động từ đúng.',
    },
    {
      'question': "",
      'options': [
        'A janitor is wiping a countertop.',
        'A janitor is piping a countertop.',
        'A janitor is whipping a countertop.',
        'A janitor is wiping a counter topes.',
      ],
      'correctIndex': 0,
      'explain': 'Phân biệt /w/ vs /p/ vs /wh/ khi tốc độ nhanh.',
    },
    {
      'question': "",
      'options': [
        'A chef is sprinkling herbs on a dish.',
        'A chef is spring cleaning a dish.',
        'A chef is sprinkling herds on a dish.',
        'A chef is sprinting herbs on a dish.',
      ],
      'correctIndex': 0,
      'explain': 'Keyword “sprinkling herbs” (rắc rau thơm).',
    },
    {
      'question': "",
      'options': [
        'A worker is tightening a bolt.',
        'A worker is lighting a bolt.',
        'A worker is titling a bolt.',
        'A worker is tinting a bolt.',
      ],
      'correctIndex': 0,
      'explain': '“tightening” /ˈtaɪt(ə)nɪŋ/ dễ nuốt /tən/.',
    },
    {
      'question': "",
      'options': [
        'Shoppers are browsing the aisle.',
        'Shoppers are browsing the isle.',
        'Shoppers are browsing the eyes.',
        'Shoppers are browsing the oil.',
      ],
      'correctIndex': 0,
      'explain': '“aisle” (lối đi) ≠ “isle”.',
    },
    {
      'question': "",
      'options': [
        'A presenter is summarizing the agenda.',
        'A presenter is summer rising the agenda.',
        'A presenter is some arising the agenda.',
        'A presenter is summarize the agenda.',
      ],
      'correctIndex': 0,
      'explain': '“summarizing” chuẩn ngữ pháp & phát âm.',
    },
    {
      'question': "",
      'options': [
        'A mechanic is replacing a worn belt.',
        'A mechanic is re-placing a warm belt.',
        'A mechanic is replaying a worn belt.',
        'A mechanic is replacing a warn belt.',
      ],
      'correctIndex': 0,
      'explain': 'Nghe nhanh dễ lẫn /pleɪs/ vs “play/warm/warn”.',
    },
    {
      'question': "",
      'options': [
        'An usher is directing guests to the aisle seats.',
        'An usher is directing guests to the isle seats.',
        'An usher is directing guests to the oil seats.',
        'An usher is directing guests to the eyes seats.',
      ],
      'correctIndex': 0,
      'explain': '“aisle seats” là collocation phổ biến ở rạp/nhà hát.',
    },
    {
      'question': "",
      'options': [
        'A porter is stacking luggage onto a trolley.',
        'A porter is stalking luggage onto a trolley.',
        'A porter is sticking luggage onto a trolley.',
        'A porter is stacking language onto a trolley.',
      ],
      'correctIndex': 0,
      'explain': 'Keyword “stacking luggage” — phân biệt /stæk/ vs /stɔːk/.',
    },
  ];

  await db
      .collection('study_materials')
      .doc(materialId)
      .collection('levels')
      .doc('lv800')
      .collection('parts')
      .doc('part1')
      .collection('lessons')
      .doc('lesson5')
      .set({
        'type': 'Picture description',
        'lessonName': 'Bài 5: Fast listening',
        'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
        'questionCount': p1Lv800L5Questions.length,
      }, SetOptions(merge: true));

  for (int i = 1; i <= p1Lv800L5Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final imagePath = 'input_tests/testLR/part1/lv800_l5_$id.jpg';
    final q = p1Lv800L5Questions[i - 1];
    await db
        .collection('study_materials')
        .doc(materialId)
        .collection('levels')
        .doc('lv800')
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc('lesson5')
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'imagePath': imagePath,
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
        });
  }
}
