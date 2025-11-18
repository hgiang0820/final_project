import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart6() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'SWMaterials';

  // Firestore: Create test document
  await db.collection('study_materials').doc(materialId).set({
    'title': 'Speaking & Writing Materials',
    'levels': ['lv100', 'lv200', 'lv300'],
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
        .doc('part6')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Write a sentence based on a picture',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final imagePath =
          'study_materials/SWMaterials/part6/$levelId/$lessonId/$id.jpg';
      final q = questions[i];

      await lessonRef.collection('questions').doc(id).set({
        'type': 'Write a sentence based on a picture',
        'imagePath': imagePath,
        'text': q['text'],
        'sample_answer': q['sample_answer'],
        'directions':
            "Write ONE sentence that is based on the picture using the TWO words or phrases under it. You may change the forms of the words and you may use them in any order.",
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p6Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "dog, table",
      // "description": "A small brown dog is lying under a wooden dining table in a cozy room with soft lighting.",
      "max_score": 3,
      "sample_answer": "There is a dog under the table.",
    },
    {
      "text": "girl, tree",
      // "description": "A young girl in a red dress is standing next to a tall green tree in a sunny park.",
      "max_score": 3,
      "sample_answer": "A girl is standing next to a tree.",
    },
    {
      "text": "book, desk",
      // "description": "A blue book is placed neatly on a wooden desk with a lamp and a pen holder beside it.",
      "max_score": 3,
      "sample_answer": "The book is on the desk.",
    },
  ];

  final p6Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "boy, park",
      // "description": "A boy wearing a blue T-shirt is running along a path in a green park with trees around.",
      "max_score": 3,
      "sample_answer": "A boy is running in the park.",
    },
    {
      "text": "children, ball",
      // "description": "Two children are playing with a red ball on the grass in a sunny playground.",
      "max_score": 3,
      "sample_answer": "The children are playing with a ball.",
    },
    {
      "text": "woman, book",
      // "description": "A woman is sitting on a sofa and reading a book in a quiet living room with soft lighting.",
      "max_score": 3,
      "sample_answer": "She is reading a book.",
    },
  ];

  final p6Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "boy, tree",
      // "description": "A boy with a backpack is sitting under a large tree and looking at a notebook.",
      "max_score": 3,
      "sample_answer": "A boy is sitting under a tree.",
    },
    {
      "text": "woman, window",
      // "description": "A woman is standing beside a window with sunlight coming in, talking on her phone.",
      "max_score": 3,
      "sample_answer": "She is talking on the phone next to a window.",
    },
    {
      "text": "cat, sofa",
      // "description": "A fluffy white cat is curled up and sleeping peacefully on a gray sofa in a living room.",
      "max_score": 3,
      "sample_answer": "The cat is sleeping on the sofa.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p6Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "boy, chair",
      // "description": "A small boy with short hair is sitting on a red chair and smiling happily.",
      "max_score": 4,
      "sample_answer": "A small boy is sitting on a red chair.",
    },
    {
      "text": "woman, kitchen",
      // "description": "A happy woman is cooking in a clean kitchen with white cabinets and a stove.",
      "max_score": 4,
      "sample_answer":
          "The woman is happy because she is cooking in the kitchen.",
    },
    {
      "text": "dog, bench",
      // "description": "A big brown dog is lying under a wooden bench in a quiet garden.",
      "max_score": 4,
      "sample_answer": "There is a big, brown dog under the bench.",
    },
  ];

  final p6Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "children, yard",
      // "description": "Two children are playing happily in a green yard with toys scattered around.",
      "max_score": 4,
      "sample_answer": "The children are playing happily in the yard.",
    },
    {
      "text": "man, street",
      // "description": "A man wearing a hat is walking slowly along a quiet street with trees on both sides.",
      "max_score": 4,
      "sample_answer": "A man is walking slowly along the street.",
    },
    {
      "text": "teacher, class",
      // "description": "A teacher is speaking loudly to a group of students in a bright classroom.",
      "max_score": 4,
      "sample_answer": "The teacher is speaking loudly to the class.",
    },
  ];

  final p6Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "boy, floor",
      "max_score": 4,
      // "description": "A young boy is sitting on the floor playing with a toy car. There is a colorful rug under him and a bookshelf in the background.",
      "sample_answer": "A boy is playing with a toy car on the floor.",
    },
    {
      "text": "woman, kitchen",
      "max_score": 4,
      // "description": "A woman is standing in a bright kitchen, chopping vegetables on a wooden counter. There are pots and pans hanging behind her.",
      "sample_answer": "A woman is cutting vegetables in the kitchen.",
    },
    {
      "text": "children, garden",
      "max_score": 4,
      // "description": "Two children are running and laughing in a green garden. Flowers are blooming around them and a tree is in the background.",
      "sample_answer": "Two children are playing in the garden.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p6Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "girl, ice cream",
      // "description": "A young girl is crying because she dropped her ice cream on the ground near a bench.",
      "max_score": 5,
      "sample_answer": "A girl is crying because she dropped her ice cream.",
    },
    {
      "text": "man, street",
      // "description": "A man is running quickly along the street because he is late for work. He is holding a briefcase.",
      "max_score": 5,
      "sample_answer": "A man is running because he is late for work.",
    },
    {
      "text": "children, bubbles",
      // "description": "Two children are laughing while playing with bubbles in a sunny backyard.",
      "max_score": 5,
      "sample_answer": "The children are laughing while playing with bubbles.",
    },
  ];

  final p6Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "girls, hug",
      // "description": "Two girls are hugging each other in front of a school building. They look happy and excited.",
      "max_score": 5,
      "sample_answer": "Two girls are hugging each other.",
    },
    {
      "text": "woman, old man",
      // "description": "A woman is helping an old man cross the street. She is holding his arm gently.",
      "max_score": 5,
      "sample_answer": "A woman is helping an old man cross the street.",
    },
    {
      "text": "teacher, students",
      // "description": "A teacher is showing a book to her students in a classroom. The children are looking at the book with interest.",
      "max_score": 5,
      "sample_answer": "A teacher is showing a book to her students.",
    },
  ];

  final p6Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "man box",
      "max_score": 5,
      // "description": "A man is entering a room while carrying a cardboard box. There is a table and chairs behind him.",
      "sample_answer": "A man is walking into a room while carrying a box.",
    },
    {
      "text": "woman child",
      "max_score": 5,
      // "description": "A woman is cooking in the kitchen. Meanwhile, a child is sitting on the floor playing with blocks.",
      "sample_answer":
          "A woman is cooking in the kitchen while her child plays nearby.",
    },
    {
      "text": "children dog",
      "max_score": 5,
      // "description": "Two children are running in a garden. In the background, a dog is sleeping under a tree.",
      "sample_answer":
          "Two children are running in the garden while a dog sleeps in the background.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv100
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết câu đơn mô tả người và vật',
    questions: p6Lv100L1,
  );
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Viết câu mô tả hành động đơn giản',
    questions: p6Lv100L2,
  );
  await pushLesson( 
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết câu mô tả vị trí và hành động kết hợp',
    questions: p6Lv100L3,
  );

  // lv200
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết câu có tính từ mô tả đặc điểm',
    questions: p6Lv200L1,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Viết câu có trạng từ mô tả cách thực hiện hành động',
    questions: p6Lv200L2,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết 1 câu mô tả hành động và bối cảnh rõ ràng',
    questions: p6Lv200L3,
  );

  // lv300
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết câu phức mô tả hành động và nguyên nhân',
    questions: p6Lv300L1,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Viết câu mô tả tương tác giữa các nhân vật',
    questions: p6Lv300L2,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết 1 câu mô tả hành động có trình tự rõ ràng',
    questions: p6Lv300L3,
  );
}
