import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart2() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'SWMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc('SWMaterials').set({
    'title': 'Speaking & Writing Materials',
    'levels': ['lv100', 'lv200', 'lv300'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> pushLessonSW({
    required String levelId,
    required String lessonId,
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc('SWMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('part2')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Describe a picture',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final imagePath =
          'study_materials/SWMaterials/part2/$levelId/$lessonId/$id.jpeg';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Describe a picture',
        'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will describe the picture on your screen in 1 sentence as much detail as you can.",
        'max_score': q['max_score'],
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
        .doc('FullMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('speak2')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Describe a picture',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final imagePath =
          'study_materials/FullMaterials/speak2/$levelId/$lessonId/$id.jpeg';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Describe a picture',
        'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will describe the picture on your screen in 1 sentence as much detail as you can.",
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p2Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "boy, ball",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "A boy is playing with a ball.",
    },
    {
      "text": "dog, table",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "There is a dog under the table.",
    },
    {
      "text": "girl, apple",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "A girl is eating an apple.",
    },
  ];

  final p2Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "cat, chair",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "There is a cat on the chair.",
    },
    {
      "text": "books, table",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "There are some books on the table.",
    },
    {
      "text": "apple, basket",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "There is an apple in the basket.",
    },
  ];

  final p2Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "park, children",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "This is a picture of a park. Two children are playing on the grass. There is a bench next to a tree. The weather looks sunny.",
    },
    {
      "text": "classroom, teacher",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "This is a picture of a classroom. A teacher is writing on the board. There are students sitting at desks. The room looks bright and clean.",
    },
    {
      "text": "kitchen, woman",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "This is a picture of a kitchen. A woman is cooking at the stove. There are some vegetables on the counter. The kitchen looks modern and tidy.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p2Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "woman, phone",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "A woman is talking on the phone near the window.",
    },
    {
      "text": "man, newspaper",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "A man is reading a newspaper while sitting on a bench.",
    },
    {
      "text": "children, park",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "Two children are playing happily in the park.",
    },
  ];

  final p2Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "girl, draw",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "The girl is drawing a picture with colored pencils.",
    },
    {
      "text": "boy, write",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "The boy is writing a letter at his desk.",
    },
    {
      "text": "people, talk",
      "prepare_time": 12,
      "record_time": 18,
      "max_score": 4,
      "sample_answer": "Some people are talking quietly in the library.",
    },
  ];

  final p2Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "street, bicycle",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "This is a picture of a busy street. A man is riding a bicycle while a woman is crossing the road. There are many cars and people around. The weather looks cloudy, and everyone seems to be in a hurry.",
    },
    {
      "text": "market, umbrella",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "This is a picture of a market. People are buying vegetables and fruits. There are colorful umbrellas above the stalls. The place looks crowded but lively.",
    },
    {
      "text": "classroom, students",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "This is a picture of a classroom. Students are working in groups. Some are writing, and others are talking. The teacher is walking around to help them.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p2Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "park, classroom",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "In the first picture, children are playing in a park. In contrast, the second picture shows students studying in a classroom. While both pictures involve children, the atmosphere is very different.",
    },
    {
      "text": "beach, mountain",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "The first picture shows people relaxing on a beach, whereas the second one shows hikers climbing a mountain. Both pictures are taken outdoors, but the activities and environments are quite different.",
    },
    {
      "text": "office, café",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "In the office picture, people are working at their desks. In contrast, the café scene shows people chatting and drinking coffee. Unlike the office, the café has a more casual and relaxed atmosphere.",
    },
  ];

  final p2Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "beach, children",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a beach. Children are swimming and playing with sand. Moreover, some adults are sunbathing nearby. The weather looks sunny, so everyone seems happy.",
    },
    {
      "text": "library, students",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a library. Students are reading books quietly. In addition, some are using computers. Although the room is full, the atmosphere is calm and focused.",
    },
    {
      "text": "market, people",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a market. People are buying fruits and vegetables. Moreover, there are colorful umbrellas above the stalls. The place looks lively and crowded.",
    },
  ];

  final p2Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "family, dinner",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a family having dinner. In the center, a woman is serving food. On the left, a child is smiling while holding a spoon. The room looks warm and cozy. Overall, the picture shows a happy family moment.",
    },
    {
      "text": "birthday, cake",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a birthday party. A boy is blowing out candles on a cake. Around him, friends are clapping and smiling. The decorations are colorful. Overall, the picture captures a joyful celebration.",
    },
    {
      "text": "street, traffic",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "This is a picture of a busy street. Cars and motorbikes are moving in different directions. On the right, people are walking on the sidewalk. The sky looks cloudy. Overall, the picture shows a typical day in the city.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // === SWMaterials ===
  // lv100
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Từ vựng mô tả hình ảnh cơ bản',
    questions: p2Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Cấu trúc câu đơn giản (There is/are…)',
    questions: p2Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh tĩnh đơn giản',
    questions: p2Lv100L3,
  );

  // lv200
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Mô tả hành động trong ảnh',
    questions: p2Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng thì hiện tại tiếp diễn',
    questions: p2Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh có nhiều chi tiết',
    questions: p2Lv200L3,
  );

  // lv300
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: So sánh hai bức ảnh',
    questions: p2Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối và liên kết',
    questions: p2Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh theo bố cục logic',
    questions: p2Lv300L3,
  );

  // === FullMaterials ===
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Từ vựng mô tả hình ảnh cơ bản',
    questions: p2Lv100L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Cấu trúc câu đơn giản (There is/are…)',
    questions: p2Lv100L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh tĩnh đơn giản',
    questions: p2Lv100L3,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Mô tả hành động trong ảnh',
    questions: p2Lv200L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng thì hiện tại tiếp diễn',
    questions: p2Lv200L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh có nhiều chi tiết',
    questions: p2Lv200L3,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: So sánh hai bức ảnh',
    questions: p2Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối và liên kết',
    questions: p2Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mô tả ảnh theo bố cục logic',
    questions: p2Lv300L3,
  );
}
