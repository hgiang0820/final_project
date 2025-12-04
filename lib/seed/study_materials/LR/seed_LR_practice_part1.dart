// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart1() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc('LRMaterials').set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  });

  Future<void> pushLessonLR({
    required String levelId,
    required String lessonId,
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc("LRMaterials")
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('part1')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Picture description',
      'lessonName': lessonName,
      'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 1; i <= questions.length; i++) {
      final id = 'q${i.toString().padLeft(2, '0')}';
      final imagePath = 'LR/$levelId/part1/$lessonId/$id.jpeg';
      final q = questions[i - 1];

      await db
          .collection('study_materials')
          .doc("LRMaterials")
          .collection('levels')
          .doc(levelId)
          .collection('parts')
          .doc('part1')
          .collection('lessons')
          .doc(lessonId)
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

  Future<void> pushLessonFull({
    required String levelId,
    required String lessonId,
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc("FullMaterials")
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('lis1')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Picture description',
      'lessonName': lessonName,
      'audioPath': 'input_tests/testLR/part1/01%20Test%201_LC_Voca.mp3',
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 1; i <= questions.length; i++) {
      final id = 'q${i.toString().padLeft(2, '0')}';
      // final imagePath = 'input_tests/testLR/part1/$id.jpg';
      final imagePath = 'Full/$levelId/lis1/$lessonId/$id.jpeg';
      final q = questions[i - 1];

      await db
          .collection('study_materials')
          .doc("FullMaterials")
          .collection('levels')
          .doc(levelId)
          .collection('parts')
          .doc('lis1')
          .collection('lessons')
          .doc(lessonId)
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

  // === PART 1 — Picture Description ===
  // LEVEL 300+ : 5 bài lý thuyết × 10 câu = 50 câu
  // Lesson 1 - LV 300
  final p1Lv300L1Questions = <Map<String, dynamic>>[
    // ================= LEVEL 300+ — Bài 1 (Daily activities) =================
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 1,
      'explain': '''
A. She is writing on a whiteboard.
B. She is typing on a keyboard.
C. She is carrying a box.
D. She is standing at a counter.

Nhận diện cụm be+V-ing cho hành động chính: "is typing". Các đáp án khác là hành động khác.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The man is drinking coffee.
B. The man is cleaning the table.
C. The man is opening a window.
D. The man is paying at the register.

Hành động chính là "is drinking". Bỏ qua chi tiết nền.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A woman is answering the phone.
B. A woman is arranging flowers.
C. A woman is printing documents.
D. A woman is tying her shoes.

Hành động cốt lõi: "is answering".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A cashier is scanning items.
B. A cashier is closing the store.
C. A cashier is sweeping the floor.
D. A cashier is counting chairs.

Hành động rõ nhất tại quầy: "is scanning".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The chef is stirring the soup.
B. The chef is reading a menu.
C. The chef is opening a fridge.
D. The chef is washing dishes.

Hành động chính: "is stirring".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The student is raising her hand.
B. The student is closing a book.
C. The student is pointing at the clock.
D. The student is leaving the room.

Hành động nổi bật trong lớp: "is raising (her hand)".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The worker is lifting a box.
B. The worker is calling a taxi.
C. The worker is eating lunch.
D. The worker is closing the gate.

Hành động chính: "is lifting".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A clerk is filing documents.
B. A clerk is painting a wall.
C. A clerk is watering plants.
D. A clerk is climbing a ladder.

Hành động văn phòng: "is filing".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A barista is pouring coffee.
B. A barista is closing the blinds.
C. A barista is fixing a lamp.
D. A barista is counting coins.

Hành động cốt lõi nghề nghiệp: "is pouring".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A man is pushing a cart.
B. A man is repairing a road.
C. A man is building a fence.
D. A man is selling tickets.

Hành động chính: "is pushing".
''',
    },
  ];

  // ===== Lesson 2 - LV 300 =====
  final p1Lv300L2Questions = <Map<String, dynamic>>[
    // ================= LEVEL 300+ — Bài 2 (Places & Objects) =================
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The bicycles are in front of a store.
B. The bicycles are behind a store.
C. The bicycles are between two cars.
D. The bicycles are on a boat.

Giới từ vị trí: "in front of" đúng ngữ cảnh.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Some books are on a shelf.
B. Some books are under a shelf.
C. Some books are inside a box.
D. Some books are next to a window.

Vị trí đúng: "on a shelf".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A truck is parked beside the warehouse.
B. A truck is parked beneath the warehouse.
C. A truck is parked across the warehouse.
D. A truck is parked among the warehouse.

"beside" = cạnh/bên cạnh; các lựa chọn khác không tự nhiên.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Chairs are arranged around the table.
B. Chairs are arranged above the table.
C. Chairs are arranged under the table.
D. Chairs are arranged inside the table.

"around" là quanh/bên quanh bàn → hợp cảnh họp.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The paintings are hung on the wall.
B. The paintings are hung under the wall.
C. The paintings are hung between the doors.
D. The paintings are hung behind the wall.

Tranh treo "on the wall" là tự nhiên nhất.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A plant is placed next to the window.
B. A plant is placed opposite the window.
C. A plant is placed across the window.
D. A plant is placed onto the window.

"next to" = ngay cạnh cửa sổ.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A suitcase is under the bench.
B. A suitcase is between the bench.
C. A suitcase is along the bench.
D. A suitcase is onto the bench.

"under" = bên dưới ghế băng.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The statue is in the middle of the plaza.
B. The statue is into the plaza.
C. The statue is onto the plaza.
D. The statue is across of the plaza.

"in the middle of" = ở giữa quảng trường.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Bags are placed under the seats.
B. Bags are placed above the floor.
C. Bags are placed inside the aisle.
D. Bags are placed behind the seats.

Vị trí phổ biến: "under the seats".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A sign is posted at the entrance.
B. A sign is posted between the entrance.
C. A sign is posted under the entrance.
D. A sign is posted into the entrance.

"at the entrance" tự nhiên nhất.
''',
    },
  ];

  // Lesson 3 - LV 300
  final p1Lv300L3Questions = <Map<String, dynamic>>[
    // =========== LEVEL 300+ — Bài 3 (People & Things: trạng thái) ===========
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The audience is seated.
B. The audience is seating.
C. The audience is standing.
D. The audience is talking.

"is seated" = trạng thái đã ngồi; khác với hành động "is seating".
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The door is closed.
B. Someone is closing the door.
C. The door is opening.
D. A man is opening the door.

Trạng thái tĩnh "is closed" ≠ hành động đóng/mở.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The store is open.
B. A worker is opening the store.
C. Customers are opening the door.
D. A sign is opening the shop.

"is open" = trạng thái mở cửa.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The lights are on.
B. The lights are turning on.
C. A man is turning on the lights.
D. The lights are being turned off.

Trạng thái tĩnh: đèn đang bật.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The shelves are empty.
B. The clerk is emptying the shelves.
C. The shelves are being emptied.
D. The clerk is filling the shelves.

Mô tả trạng thái: kệ trống.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The table is set.
B. The table is being set.
C. A waitress is setting the table.
D. A man is clearing the table.

"is set" = trạng thái đã bày xong.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The parking lot is full.
B. Cars are filling the parking lot.
C. A guard is closing the parking lot.
D. A driver is leaving the parking lot.

Trạng thái: bãi đỗ đầy.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The seats are occupied.
B. People are occupying the seats.
C. A woman is occupying a seat.
D. A man is leaving a seat.

Trạng thái: ghế đã có người ngồi.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The computers are off.
B. An assistant is turning off the computers.
C. The computers are being turned on.
D. A manager is checking the computers.

Trạng thái: máy tính đang tắt.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The display case is locked.
B. A clerk is locking the display case.
C. A clerk is unlocking the display case.
D. The display case is being opened.

Trạng thái: tủ kính đã khóa.
''',
    },
  ];

  // Lesson 4 - LV 300
  final p1Lv300L4Questions = <Map<String, dynamic>>[
    // ============= LEVEL 300+ — Bài 4 (Minimal pairs / âm dễ nhầm) ==========
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The worker is typing at a desk.
B. The worker is taping a box.
C. The worker is wiping the floor.
D. The worker is tipping a chair.

Phân biệt typing /ˈtaɪpɪŋ/ với taping/wiping/tipping; cảnh bàn phím → typing.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The woman is sitting at her desk.
B. The woman is setting the table.
C. The woman is seeding the lawn.
D. The woman is seating a guest.

sit vs set/seed/seat; ảnh văn phòng → sitting.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A man is holding a sheet of paper.
B. A man is sitting on a seat.
C. A man is shipping a package.
D. A man is shouting at people.

sheet /ʃiːt/ vs seat /siːt/; ngữ cảnh cầm giấy → sheet.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A woman is wearing a coat.
B. A woman is carrying a cart.
C. A woman is calling a code.
D. A woman is caring a cat.

wearing /ˈweərɪŋ/ khác với carrying/calling/caring.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. The chef is pouring sauce.
B. The chef is pulling sauce.
C. The chef is polishing sauce.
D. The chef is pausing the sauce.

pour /pɔːr/ ≠ pull/polish/pause.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A clerk is checking a bill.
B. A clerk is kicking a ball.
C. A clerk is baking a bun.
D. A clerk is picking a bell.

bill /bɪl/ ≠ ball/bun/bell; văn phòng → bill.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A driver is parking a car.
B. A driver is barking at a car.
C. A driver is packing a car.
D. A driver is backing a car.

parking /ˈpɑːkɪŋ/ ≠ barking/packing/backing.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A man is buying a pair of shoes.
B. A man is buying a pear of shoes.
C. A man is buying a bear of shoes.
D. A man is buying a bar of shoes.

pair (đôi) ≠ pear (quả lê) / bear / bar.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A woman is reading a novel.
B. A woman is riding a novel.
C. A woman is raiding a novel.
D. A woman is ridding a novel.

reading /ˈriːdɪŋ/ ≠ riding/raiding/ridding.
''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A man is mopping the floor.
B. A man is mapping the floor.
C. A man is mopping the flower.
D. A man is popping the floor.

mop /mɒp/ ≠ map/pop; object phù hợp là floor.
''',
    },
  ];

  // Lesson 5 - LV 300
  final p1Lv300L5Questions = <Map<String, dynamic>>[
    // =============== LEVEL 300+ — Bài 5 (Outdoor scenes) ====================
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Workers are paving a road in the foreground.
B. Boats are anchored in the distance.
C. Mountains are visible behind the city.
D. A traffic light is above the street.

Chọn hành động nổi bật ở tiền cảnh (paving). Các đáp án khác là chi tiết tĩnh.
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. People are jogging along the river.
B. Clouds are in the sky.
C. A bridge can be seen far away.
D. Trees are lining the street.

Hành động chính: "are jogging"; các chi tiết khác là nền.
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Cyclists are crossing an intersection.
B. A sign is posted at the corner.
C. A tower is standing in the background.
D. A bench is placed near the path.

Hành động nổi bật: "are crossing".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A vendor is selling fruit at a stall.
B. Umbrellas are open above the tables.
C. Customers are near the entrance.
D. Baskets are on the ground.

Tập trung hành động chính: "is selling".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Hikers are climbing a rocky trail.
B. A river runs through the valley.
C. Snow is visible on the peaks.
D. Clouds are covering the sky.

Hành động chính: "are climbing".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Tourists are taking photos of a monument.
B. Flags are flying above the building.
C. Buses are parked along the street.
D. A fountain is in the square.

Hành động chính ở tiền cảnh: "are taking photos".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Shoppers are entering a mall.
B. A poster is attached to the door.
C. A bench is placed by the tree.
D. Windows are decorated with lights.

Hành động chính: "are entering".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A crew is repairing the sidewalk.
B. Traffic cones are on the street.
C. A sign is warning pedestrians.
D. A truck is parked nearby.

Hành động chính: "is repairing".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Rowers are paddling on the lake.
B. A fence runs along the shore.
C. Houses are built near the water.
D. Birds are flying in the distance.

Hành động chính: "are paddling".
''',
    },
    {
      'level': '300+',
      'lesson': 'Bài 5: Outdoor scenes',
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Construction workers are lifting steel beams.
B. Cranes are visible behind the building.
C. Materials are stacked on pallets.
D. Helmets are placed on a table.

Hành động chính: "are lifting".
''',
    },
  ];

  // === PART 1 — Picture Description ===
  // LEVEL 600+ : 5 bài lý thuyết × 10 câu = 50 câu
  // Lesson 1 - LV 600 — Workplace actions
  final p1Lv600L1Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. They are having a meeting.
B. One man is holding a pen.
C. A projector is on the table.
D. A clock is on the wall.

Nhiều người → chọn hành động chủ đạo “are having a meeting”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Several colleagues are brainstorming ideas.
B. A poster is hanging behind them.
C. A laptop is open.
D. There are markers on the desk.

Hành động nhóm trọng tâm: “are brainstorming”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Team members are reviewing documents together.
B. A woman is wearing glasses.
C. A mug is next to a notebook.
D. A phone is face down.

Tập trung vào hoạt động chung: “are reviewing”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Staff are gathering around a whiteboard.
B. One man is smiling.
C. There is a plant in the corner.
D. A window is open.

Hành động tập thể: “are gathering”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Coworkers are discussing a blueprint.
B. A blueprint is blue.
C. A lamp is switched on.
D. A chair is empty.

Chọn động tác nhóm chính: “are discussing”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Employees are collaborating at a workstation.
B. A sticker is on the screen.
C. Headphones are on the desk.
D. A cable is plugged in.

“are collaborating” mô tả hành động chủ đạo.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Designers are arranging samples on the table.
B. A ruler is nearby.
C. A shelf is full.
D. A bin is beside the desk.

Hành động nhóm: “are arranging”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The team is presenting findings to a client.
B. A screen is bright.
C. A notebook is closed.
D. A cable is tangled.

Hành động chủ đạo: “is presenting”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Engineers are testing a device together.
B. A toolbox is red.
C. Safety goggles are on the table.
D. A badge is clipped.

“are testing” là hoạt động chính nhiều người.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Managers are signing a contract.
B. A calendar is visible.
C. A plant is on the sill.
D. The blinds are closed.

Hành động nhóm: “are signing”.''',
    },
  ];

  // ===== Lesson 2 - LV 600 — Transportation & Equipment =====
  final p1Lv600L2Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Passengers are boarding a bus.
B. A schedule is posted.
C. A bench is empty.
D. A sign is yellow.

Chọn hành động liên quan phương tiện: “are boarding”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Crates are being loaded with a forklift.
B. A forklift is parked.
C. Labels are visible.
D. A cone is on the ground.

Bị động tiếp diễn “are being loaded” = hành động chính.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Travelers are pulling suitcases along the platform.
B. A map is displayed.
C. A clock is overhead.
D. A poster is colorful.

Hành động chính: “are pulling”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Workers are unloading boxes from a truck.
B. A truck is white.
C. Boxes are brown.
D. A ramp is metal.

“are unloading” là động tác thiết bị–vận chuyển.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A mechanic is inspecting an engine.
B. A poster is on the door.
C. A fan is rotating.
D. Oil is on the floor.

Hành động với công cụ: “is inspecting”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A technician is scanning a barcode with a handheld device.
B. A cable is black.
C. A shelf is tall.
D. A label is printed.

Động tác với thiết bị cầm tay: “is scanning”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Baggage is being weighed at the counter.
B. A sticker is green.
C. A bell is on the desk.
D. A chair is nearby.

Bị động mô tả thao tác thiết bị: “is being weighed”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Cyclists are securing helmets before riding.
B. A fence is behind them.
C. A path is narrow.
D. A tree is tall.

Hành động đúng công cụ: “are securing helmets”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A dockworker is fastening a rope to the bollard.
B. Water is calm.
C. A boat is white.
D. A cloud is overhead.

Động tác với dụng cụ (rope): “is fastening”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A driver is adjusting the rearview mirror.
B. A sticker is on the window.
C. A seat is leather.
D. A bag is on the seat.

Hành động liên quan thiết bị xe: “is adjusting”.''',
    },
  ];

  // ===== Lesson 3 - LV 600 — Tenses in description =====
  final p1Lv600L3Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Workers are stacking boxes.
B. Workers have stacked boxes.
C. Workers had stacked boxes.
D. Workers stack boxes yesterday.

Ảnh diễn tả quá trình → hiện tại tiếp diễn “are stacking”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The shelves have been stocked.
B. The shelves are stocking.
C. Clerks are being stocked.
D. The shelves were stocking.

Kết quả đã hoàn tất (thấy kệ đầy) → hiện tại hoàn thành bị động “have been stocked”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A table has been set.
B. A table is setting.
C. A waiter is set the table.
D. A table sets now.

Trạng thái kết quả: “has been set”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The presenter is pointing at the screen.
B. The presenter has pointing at the screen.
C. The presenter has point at the screen.
D. The presenter pointed at the screen now.

Động tác đang diễn ra → “is pointing”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The documents have been arranged neatly.
B. The documents are arranging neatly.
C. The documents have arranging neatly.
D. The documents is arranged now.

Nhìn thấy kết quả hoàn tất → “have been arranged”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Guests are taking their seats.
B. Guests have take their seats.
C. Guests are taken their seats.
D. Guests has been seated.

Hành động đang diễn ra → “are taking”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The floor has been cleaned.
B. The floor is cleaning now.
C. The floor has cleaning.
D. The floor had clean.

Thấy kết quả (sàn sạch) → hiện tại hoàn thành bị động.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The chef is slicing vegetables.
B. The chef has slice vegetables.
C. The chef is sliced vegetables.
D. The chef was slicing tomorrow.

Quá trình đang thực hiện → hiện tại tiếp diễn.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The boxes have been sealed.
B. The boxes are sealing.
C. The boxes have sealing.
D. The boxes is sealed now.

Kết quả thấy keo dán → “have been sealed”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Attendees are lining up at the entrance.
B. Attendees have lining up.
C. Attendees are lined up by themselves.
D. Attendees has been line up.

Hành động đang diễn ra → “are lining up”.''',
    },
  ];

  // ===== Lesson 4 - LV 600 — Sound-alike words (nâng cao) =====
  final p1Lv600L4Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The aisle is crowded with shoppers.
B. The isle is crowded with shoppers.
C. The eye is crowded with shoppers.
D. The oil is crowded with shoppers.

“aisle” (lối đi) ≠ isle (đảo).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The crew is repairing the brake.
B. The crew is repairing the break.
C. The crew is repairing the brick.
D. The crew is repairing the brook.

“brake” (phanh) ≠ break (nghỉ).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A customer is choosing kitchenware.
B. A customer is choosing kitchen wear.
C. A customer is choosing kitchen where.
D. A customer is choosing kitchen swear.

“ware” = đồ dùng; “wear” = mặc.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Sailors are raising a sail.
B. Sellers are raising a sale.
C. Sailors are raising a sale.
D. Sellers are raising a sail.

“sail” (cánh buồm) ≠ sale (giảm giá).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A worker is rolling a heavy roll of fabric.
B. A worker is taking a heavy role of fabric.
C. A worker is baking a heavy roll of fabric.
D. A worker is roaming a heavy role of fabric.

“roll” (cuộn) ≠ role (vai trò).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A woman is boarding a train.
B. A woman is boring a train.
C. A woman is board a train.
D. A woman is bored a train.

“boarding” = lên tàu; các biến thể khác sai/nghĩa khác.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The waiter is pouring water.
B. The waiter is poor water.
C. The waiter is pore water.
D. The waiter is power water.

“pour” (rót) ≠ poor/pore/power.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The chef is garnishing the dish with thyme.
B. The chef is garnishing the dish with time.
C. The chef is garnishing the dish with times.
D. The chef is garnishing the dish with tie.

“thyme” (cỏ xạ hương) phát âm gần “time” nhưng nghĩa khác.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A clerk is stamping a receipt.
B. A clerk is stepping a receipt.
C. A clerk is staring a receipt.
D. A clerk is stopping a receipt.

“stamping” (đóng dấu) ≠ stepping/staring/stopping.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A passenger is waiting by the fare machine.
B. A passenger is waiting by the fair machine.
C. A passenger is waiting by the fire machine.
D. A passenger is waiting by the fear machine.

“fare” (tiền vé) ≠ fair/fire/fear.''',
    },
  ];

  // ===== Lesson 5 - LV 600 — Paraphrase mô tả =====
  final p1Lv600L5Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The presenter is highlighting key points.
B. The presenter is turning off the lights.
C. The presenter is closing the laptop.
D. The presenter is leaving the room.

“highlighting” ~ “emphasizing/explaining” nội dung trên màn.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A clerk is handing out brochures.
B. A clerk is picking up brochures.
C. A clerk is throwing away brochures.
D. A clerk is filing brochures.

Paraphrase “distributing” = “handing out”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A woman is examining a product closely.
B. A woman is ignoring a product.
C. A woman is hiding a product.
D. A woman is returning a product.

“examining” ≈ “inspecting/looking over”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Workers are assembling a display.
B. Workers are disassembling a display.
C. Workers are transporting a display.
D. Workers are painting a display.

“assembling” ~ lắp ráp (paraphrase của “putting together”).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Shoppers are lining up at the cashier.
B. Shoppers are wandering around.
C. Shoppers are sitting on the floor.
D. Shoppers are closing the store.

“lining up” ≈ “queuing at the register”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A man is browsing the shelves.
B. A man is building the shelves.
C. A man is breaking the shelves.
D. A man is buying the shelves.

“browsing” ≈ “looking through/over”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
      A. Two people are exchanging business cards.
B. Two people are correcting business cards.
C. Two people are collecting business cards.
D. Two people are counting business cards.
      “exchanging” ≈ “handing each other”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A man is ascending the stairs.
B. A man is descending the stairs.
C. A man is sitting on the stairs.
D. A man is fixing the stairs.
Paraphrase của “going up the stairs”: “ascending”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. A woman is adjusting the camera settings.
B. A woman is deleting the camera.
C. A woman is washing the camera.
D. A woman is hiding the camera.
“adjusting settings” ≈ “tweaking/configuring”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''
A. Participants are taking part in a workshop.
B. Participants are taking parts of a workshop.
C. Participants are taking place a workshop.
D. Participants are taking over a workshop.
“taking part in” = tham gia; paraphrase của “participating in”.''',
    },
  ];

  // === PART 1 — Picture Description ===
  // LEVEL 800+ : 5 bài lý thuyết × 10 câu = 50 câu

  final p1Lv800L1Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Two chefs are plating dishes while a server is carrying a tray.
B. Two chefs are talking near the sink.
C. A server is standing by the door.
D. A menu is posted on the wall.

Chuỗi/đồng thời: “plating… while … carrying” — xác định ai làm gì.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. An assistant is handing documents to a presenter who is pointing at a graph.
B. An assistant is reading a magazine.
C. A presenter is standing alone.
D. The graph is on the screen.

Tác nhân & người nhận rõ ràng: handing → presenter; presenter → pointing.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Workers are securing a crate that is being lifted by a crane.
B. A crate is on the ground.
C. A crane is parked with no activity.
D. Workers are watching from afar.

Kết hợp chủ động + bị động: “are securing… that is being lifted…".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A barista is steaming milk before pouring it into cups.
B. A barista is standing near cups.
C. Cups are on a counter.
D. A poster is behind the counter.

Trật tự hành động: steaming → before → pouring.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A technician is attaching labels after aligning the packages.
B. Packages are next to a scale.
C. A label is on the table.
D. A chair is beside the conveyor.

Trình tự: align → after → attach labels.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A speaker is greeting attendees as they are taking their seats.
B. A speaker is alone on stage.
C. Attendees are near the entrance.
D. A banner is above the stage.

Đồng thời: greeting (speaker) & taking seats (attendees) — hai chủ thể.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Engineers are calibrating a device and recording the results.
B. Engineers are standing.
C. A device is on a bench.
D. A notebook is closed.

Hành động phức: calibrating + recording (song hành).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A vendor is weighing produce before handing change to a customer.
B. A vendor is looking outside.
C. A customer is near a stall.
D. Bags are on a hook.

Trình tự: weigh → before → hand change.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Artists are setting up easels while organizers are cordoning off the area.
B. Artists are chatting.
C. Organizers are present.
D. A sign is nearby.

Hai nhóm tác nhân, hai hành động song song: setting up / cordoning off.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A nurse is preparing a syringe as a patient is rolling up his sleeve.
B. A nurse is holding a clipboard.
C. A patient is seated.
D. Curtains are closed.

Đồng thời, vai trò rõ ràng: nurse (prepare) vs patient (roll up).''',
    },
  ];

  // ===== Lesson 2 - LV 800 — Synonyms practice =====
  final p1Lv800L2Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A presenter is elaborating on the findings.
B. A presenter is erasing the findings.
C. A presenter is eliminating the findings.
D. A presenter is ignoring the findings.

“elaborating on” ≈ “explaining in detail".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A clerk is retrieving files from a cabinet.
B. A clerk is retreating files from a cabinet.
C. A clerk is relieving files from a cabinet.
D. A clerk is rewriting files in a cabinet.

“retrieve” ≈ “get/fetch".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. An audience is applauding the performance.
B. An audience is applying the performance.
C. An audience is appraising the performance.
D. An audience is appending the performance.

“applaud” ≈ “clap/cheer".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Staff are distributing handouts to participants.
B. Staff are disrupting handouts to participants.
C. Staff are distancing handouts from participants.
D. Staff are distinguishing handouts for participants.

“distribute” ≈ “give out/hand out".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A worker is inspecting the machinery.
B. A worker is respecting the machinery.
C. A worker is suspecting the machinery.
D. A worker is infecting the machinery.

“inspect” ≈ “examine/check".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A librarian is organizing periodicals on a shelf.
B. A librarian is originating periodicals on a shelf.
C. A librarian is orienting periodicals to a shelf.
D. A librarian is ordaining periodicals on a shelf.

“organize” ≈ “arrange/sort".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Technicians are troubleshooting a connection issue.
B. Technicians are joyshooting a connection issue.
C. Technicians are footshooting a connection issue.
D. Technicians are photoshooting a connection issue.

“troubleshoot” ≈ “diagnose/fix".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Attendees are perusing the brochure.
B. Attendees are pursuing the brochure.
C. Attendees are persuading the brochure.
D. Attendees are perfusing the brochure.

“peruse” ≈ “read carefully/examine".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A manager is authorizing a purchase request.
B. A manager is authenticating a purchase request.
C. A manager is auditioning a purchase request.
D. A manager is alternating a purchase request.

“authorize” ≈ “approve/permit".''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Researchers are compiling data from multiple sources.
B. Researchers are complaining data from multiple sources.
C. Researchers are complying data from multiple sources.
D. Researchers are compelling data from multiple sources.

“compile” ≈ “collect/aggregate".''',
    },
  ];

  // ===== Lesson 3 - LV 800 — Grammar traps =====
  final p1Lv800L3Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A shipment is being inspected by customs officers.
B. A shipment is inspecting customs officers.
C. Customs officers are inspected by a shipment.
D. A shipment has inspect by customs officers.

Bị động tiếp diễn đúng cấu trúc: is being + V3.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The audience has been seated.
B. The audience is seating.
C. The audience seats now.
D. The audience has seating.

Hiện tại hoàn thành bị động = trạng thái kết quả.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The documents were signed before being scanned.
B. The documents were signing before scanned.
C. The documents are sign before scanning.
D. The documents has been sign before being scan.

Chuỗi bị động hợp lệ: were signed → before being scanned.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The floor is being polished.
B. The floor is polishing.
C. The floor has polishing.
D. The floor was polish now.

Bị động tiếp diễn: is being polished.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A clerk has placed the files on the counter.
B. A clerk is place the files.
C. A clerk has placing the files.
D. A clerk place the files yesterday.

Hiện tại hoàn thành chủ động: has + V3.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. The machines have been serviced recently.
B. The machines have servicing recently.
C. The machines are serviced recently.
D. The machines has been service recently.

Have been + V3 (bị động hoàn thành) là đúng.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Guests are being escorted to their seats.
B. Guests are escort to their seats.
C. Guests have escorting to their seats.
D. Guests were escorting to their seats now.

Bị động tiếp diễn cho hành động đang diễn ra.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Labels had been printed before the items arrived.
B. Labels had printing before the items arrived.
C. Labels were print before the items arrived.
D. Labels are printed before the items arrive yesterday.

Quá khứ hoàn thành bị động: had been + V3.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A presenter is being introduced by the host.
B. A presenter is introducing by the host.
C. A presenter has introduce by the host.
D. A presenter being introduced by the host.

Be + being + V3 (bị động tiếp diễn).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Equipment has been set up and is currently being tested.
B. Equipment has be set up and is currently test.
C. Equipment is set up and currently test.
D. Equipment has been setting up and currently being test.

Kết hợp HTHT bị động + bị động tiếp diễn chính xác.''',
    },
  ];

  // ===== Lesson 4 - LV 800 — Complex scenes =====
  final p1Lv800L4Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. In the foreground, contractors are laying tiles; in the background, shoppers are passing by.
B. Shoppers are passing by.
C. Tiles are on the ground.
D. A store is visible.

Ưu tiên hành động foreground (laying tiles) > chi tiết nền.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A photographer is adjusting a lens while mountains are visible in the distance.
B. Mountains are visible in the distance.
C. A lens is on a camera.
D. A bag is near a rock.

Chọn hành động chính ở tiền cảnh (adjusting lens); background chỉ bổ trợ.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Commuters are rushing through a gate; far behind, a screen displays schedules.
B. A screen displays schedules.
C. A gate is open.
D. People are near a station.

Hành động nổi bật “are rushing” (foreground) mới là đáp án.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Vendors are arranging produce at a stall; boats are moored beyond the pier.
B. Boats are moored beyond the pier.
C. A stall is wooden.
D. A crate is red.

Foreground hành động “arranging produce”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A runner is tying shoelaces near the camera; spectators are cheering in the stands.
B. Spectators are cheering.
C. Shoelaces are on shoes.
D. A stand is full.

Chọn hoạt động gần/tiền cảnh (tying).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A scientist is pouring liquid into a beaker; a whiteboard can be seen behind.
B. A whiteboard can be seen behind.
C. A beaker is on the table.
D. A marker is on the tray.

Hành động foreground: “is pouring”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Cyclists are fixing a chain by the roadside; traffic is moving in the background.
B. Traffic is moving.
C. A roadside is present.
D. A chain is metal.

Hành động chính: “are fixing a chain”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A chef is garnishing plates at the pass; diners are chatting at distant tables.
B. Diners are chatting.
C. Plates are on the pass.
D. Tables are distant.

Foreground: “is garnishing plates”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. A worker is repainting a railing; a river flows behind the walkway.
B. A river flows behind the walkway.
C. A railing is metal.
D. A walkway is long.

Hành động tiền cảnh: “is repainting”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain':
          '''A. Musicians are tuning instruments near the camera; a crowd is forming farther back.
B. A crowd is forming.
C. Instruments are on stage.
D. A cable is on the floor.

Foreground: “are tuning instruments”.''',
    },
  ];

  // ===== Lesson 5 - LV 800 — Fast listening =====
  final p1Lv800L5Questions = <Map<String, dynamic>>[
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A passenger is fastening a seat belt.
B. A passenger is fastening a seat boat.
C. A passenger is fasten a seat belt.
D. A passenger is fastened a seat belt.

Nghe nhanh dễ nuốt âm /ən/: “fastening a seat belt” là cấu trúc chuẩn.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A clerk is issuing a receipt.
B. A clerk is tissue a receipt.
C. A clerk is assuring a receipt.
D. A clerk is pushing a receipt.

“issuing” /ˈɪʃuːɪŋ/ dễ lẫn khi đọc nhanh → chọn động từ đúng.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A janitor is wiping a countertop.
B. A janitor is piping a countertop.
C. A janitor is whipping a countertop.
D. A janitor is wiping a counter topes.

Phân biệt /w/ vs /p/ vs /wh/ khi tốc độ nhanh.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A chef is sprinkling herbs on a dish.
B. A chef is spring cleaning a dish.
C. A chef is sprinkling herds on a dish.
D. A chef is sprinting herbs on a dish.

Keyword “sprinkling herbs” (rắc rau thơm).''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A worker is tightening a bolt.
B. A worker is lighting a bolt.
C. A worker is titling a bolt.
D. A worker is tinting a bolt.

“tightening” /ˈtaɪt(ə)nɪŋ/ dễ nuốt /tən/.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. Shoppers are browsing the aisle.
B. Shoppers are browsing the isle.
C. Shoppers are browsing the eyes.
D. Shoppers are browsing the oil.

“aisle” (lối đi) ≠ “isle”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A presenter is summarizing the agenda.
B. A presenter is summer rising the agenda.
C. A presenter is some arising the agenda.
D. A presenter is summarize the agenda.

“summarizing” chuẩn ngữ pháp & phát âm.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A mechanic is replacing a worn belt.
B. A mechanic is re-placing a warm belt.
C. A mechanic is replaying a worn belt.
D. A mechanic is replacing a warn belt.

Nghe nhanh dễ lẫn /pleɪs/ vs “play/warm/warn”.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. An usher is directing guests to the aisle seats.
B. An usher is directing guests to the isle seats.
C. An usher is directing guests to the oil seats.
D. An usher is directing guests to the eyes seats.

“aisle seats” là collocation phổ biến ở rạp/nhà hát.''',
    },
    {
      'question': "",
      'options': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
      'explain': '''A. A porter is stacking luggage onto a trolley.
B. A porter is stalking luggage onto a trolley.
C. A porter is sticking luggage onto a trolley.
D. A porter is stacking language onto a trolley.

Keyword “stacking luggage” — phân biệt /stæk/ vs /stɔːk/.''',
    },
  ];

  /// ===== LRMaterials ========
  /// ===== Level 300 ======
  pushLessonLR(
    levelId: "lv300",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Daily activities',
    questions: p1Lv300L1Questions,
  );
  pushLessonLR(
    levelId: "lv300",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Places & Objects',
    questions: p1Lv300L2Questions,
  );
  pushLessonLR(
    levelId: "lv300",
    lessonId: "lesson3",
    lessonName: 'Bài 3: People & Things (Trạng thái)',
    questions: p1Lv300L3Questions,
  );
  pushLessonLR(
    levelId: "lv300",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Minimal pairs',
    questions: p1Lv300L4Questions,
  );
  pushLessonLR(
    levelId: "lv300",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Outdoor scene',
    questions: p1Lv300L5Questions,
  );

  /// ===== Level 600 ======
  pushLessonLR(
    levelId: "lv600",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Workplace actions',
    questions: p1Lv600L1Questions,
  );
  pushLessonLR(
    levelId: "lv600",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Transportation & Equipment',
    questions: p1Lv600L2Questions,
  );
  pushLessonLR(
    levelId: "lv600",
    lessonId: "lesson3",
    lessonName: 'Bài 3: Tenses in description',
    questions: p1Lv600L3Questions,
  );
  pushLessonLR(
    levelId: "lv600",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Sound-alike words',
    questions: p1Lv600L4Questions,
  );
  pushLessonLR(
    levelId: "lv600",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Paraphrase mô tả',
    questions: p1Lv600L5Questions,
  );

  /// ===== Level 800 ======
  pushLessonLR(
    levelId: "lv800",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Advanced actions',
    questions: p1Lv800L1Questions,
  );
  pushLessonLR(
    levelId: "lv800",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Synonyms practice',
    questions: p1Lv800L2Questions,
  );
  pushLessonLR(
    levelId: "lv800",
    lessonId: "lesson3",
    lessonName: 'Bài 3: Grammar traps',
    questions: p1Lv800L3Questions,
  );
  pushLessonLR(
    levelId: "lv800",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Complex scenes',
    questions: p1Lv800L4Questions,
  );
  pushLessonLR(
    levelId: "lv800",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Fast listening',
    questions: p1Lv800L5Questions,
  );

  /// ===== FullMaterials ========
  /// ===== Level 1 ======
  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Daily activities',
    questions: p1Lv300L1Questions,
  );
  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Places & Objects',
    questions: p1Lv300L2Questions,
  );
  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson3",
    lessonName: 'Bài 3: People & Things (Trạng thái)',
    questions: p1Lv300L3Questions,
  );
  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Minimal pairs',
    questions: p1Lv300L4Questions,
  );
  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Outdoor scene',
    questions: p1Lv300L5Questions,
  );

  /// ===== Level 2 ======
  pushLessonFull(
    levelId: "lv2",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Workplace actions',
    questions: p1Lv600L1Questions,
  );
  pushLessonFull(
    levelId: "lv2",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Transportation & Equipment',
    questions: p1Lv600L2Questions,
  );
  pushLessonFull(
    levelId: "lv2",
    lessonId: "lesson3",
    lessonName: 'Bài 3: Tenses in description',
    questions: p1Lv600L3Questions,
  );
  pushLessonFull(
    levelId: "lv2",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Sound-alike words',
    questions: p1Lv600L4Questions,
  );
  pushLessonFull(
    levelId: "lv2",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Paraphrase mô tả',
    questions: p1Lv600L5Questions,
  );

  /// ===== Level 3 ======
  pushLessonFull(
    levelId: "lv3",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Advanced actions',
    questions: p1Lv800L1Questions,
  );
  pushLessonFull(
    levelId: "lv3",
    lessonId: "lesson2",
    lessonName: 'Bài 2: Synonyms practice',
    questions: p1Lv800L2Questions,
  );
  pushLessonFull(
    levelId: "lv3",
    lessonId: "lesson3",
    lessonName: 'Bài 3: Grammar traps',
    questions: p1Lv800L3Questions,
  );
  pushLessonFull(
    levelId: "lv3",
    lessonId: "lesson4",
    lessonName: 'Bài 4: Complex scenes',
    questions: p1Lv800L4Questions,
  );
  pushLessonFull(
    levelId: "lv3",
    lessonId: "lesson5",
    lessonName: 'Bài 5: Fast listening',
    questions: p1Lv800L5Questions,
  );

  pushLessonFull(
    levelId: "lv1",
    lessonId: "lesson1",
    lessonName: 'Bài 1: Daily activities',
    questions: p1Lv300L1Questions,
  );
}
