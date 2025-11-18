import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart1() async {
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
        .doc('part1')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Read a text aloud',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Read a text aloud',
        // 'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "Read the sentence aloud clearly and confidently. Focus on correct pronunciation.",
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p1Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "Hi! I’m Tom. I’m from Canada.",
      "prepare_time": 8,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "Hi! I’m Tom. I’m from Canada.",
    },
    {
      "text": "I go to school every morning at 7 o’clock.",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 3,
      "sample_answer": "I go to school every morning at 7 o’clock.",
    },
    {
      "text": "My favorite food is noodles because they are delicious.",
      "prepare_time": 12,
      "record_time": 15,
      "max_score": 3,
      "sample_answer":
          "My favorite food is noodles because they are delicious.",
    },
  ];

  final p1Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "Do you want some tea?",
      "prepare_time": 8,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "Do you want some tea?",
    },
    {
      "text": "Wow! That’s incredible!",
      "prepare_time": 8,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "Wow! That’s incredible!",
    },
    {
      "text": "I have a pen, a notebook, and a ruler.",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 3,
      "sample_answer": "I have a pen, a notebook, and a ruler.",
    },
  ];

  final p1Lv100L3 = <Map<String, dynamic>>[
    {
      "text":
          "My name is Anna. I live in a small town. Every morning, I wake up at 6 a.m. I eat breakfast and go to school.",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "My name is Anna. I live in a small town. Every morning, I wake up at 6 a.m. I eat breakfast and go to school.",
    },
    {
      "text":
          "This is my family. I have a brother and a sister. We play together after school. On weekends, we go to the park.",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "This is my family. I have a brother and a sister. We play together after school. On weekends, we go to the park.",
    },
    {
      "text":
          "I like English. I read books and watch videos in English. It helps me learn new words. I want to speak English well.",
      "prepare_time": 15,
      "record_time": 20,
      "max_score": 3,
      "sample_answer":
          "I like English. I read books and watch videos in English. It helps me learn new words. I want to speak English well.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p1Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "I always use my computer in the evening.",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 4,
      "sample_answer": "I always use my computer in the evening.",
    },
    {
      "text": "It's extremely important to be on time for the meeting.",
      "prepare_time": 12,
      "record_time": 15,
      "max_score": 4,
      "sample_answer":
          "It's extremely important to be on time for the meeting.",
    },
    {
      "text": "My computer is very expensive, but I use it every day.",
      "prepare_time": 12,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "My computer is very expensive, but I use it every day.",
    },
  ];

  final p1Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "Education plays a vital role in the development of society.",
      "prepare_time": 15,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "Education plays a vital role in the development of society.",
    },
    {
      "text":
          "In addition, schools must provide equal opportunities for all students.",
      "prepare_time": 15,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "In addition, schools must provide equal opportunities for all students.",
    },
    {
      "text":
          "The government should implement new policies to improve education quality.",
      "prepare_time": 15,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "The government should implement new policies to improve education quality.",
    },
  ];

  final p1Lv200L3 = <Map<String, dynamic>>[
    {
      "text":
          "I usually read books in the evening. It helps me relax after a long day. Sometimes, I listen to music or watch a movie before going to bed.",
      "prepare_time": 18,
      "record_time": 22,
      "max_score": 4,
      "sample_answer":
          "I usually read books in the evening. It helps me relax after a long day. Sometimes, I listen to music or watch a movie before going to bed.",
    },
    {
      "text":
          "Before going to bed, I often write in my journal. This habit helps me reflect on my day and sleep better.",
      "prepare_time": 18,
      "record_time": 22,
      "max_score": 4,
      "sample_answer":
          "Before going to bed, I often write in my journal. This habit helps me reflect on my day and sleep better.",
    },
    {
      "text":
          "Reading at a moderate speed allows the listener to understand better. It also makes your voice sound more natural and confident.",
      "prepare_time": 18,
      "record_time": 22,
      "max_score": 4,
      "sample_answer":
          "Reading at a moderate speed allows the listener to understand better. It also makes your voice sound more natural and confident.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p1Lv300L1 = <Map<String, dynamic>>[
    {
      "text":
          "She opened the door and saw her family standing there, smiling. Tears filled her eyes. After months of being apart, they were finally together again.",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "She opened the door and saw her family standing there, smiling. Tears filled her eyes. After months of being apart, they were finally together again.",
    },
    {
      "text":
          "He looked around the empty room and sighed. Memories of laughter and joy echoed in his mind. It had been years since he last visited.",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "He looked around the empty room and sighed. Memories of laughter and joy echoed in his mind. It had been years since he last visited.",
    },
    {
      "text":
          "The children ran toward the beach, shouting with excitement. Their parents smiled, watching them play. It was a perfect summer afternoon.",
      "prepare_time": 20,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "The children ran toward the beach, shouting with excitement. Their parents smiled, watching them play. It was a perfect summer afternoon.",
    },
  ];

  final p1Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "Do you really think that’s a good idea?",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 5,
      "sample_answer": "Do you really think that’s a good idea?",
    },
    {
      "text": "What time does the train leave tomorrow morning?",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 5,
      "sample_answer": "What time does the train leave tomorrow morning?",
    },
    {
      "text": "I visited London, Paris, and Rome last summer.",
      "prepare_time": 10,
      "record_time": 12,
      "max_score": 5,
      "sample_answer": "I visited London, Paris, and Rome last summer.",
    },
  ];

  final p1Lv300L3 = <Map<String, dynamic>>[
    {
      "text":
          "Technology has changed the way we live and work. With smartphones and the internet, people can communicate instantly across the globe. However, it's important to balance screen time with real-life interactions to maintain mental well-being.",
      "prepare_time": 25,
      "record_time": 30,
      "max_score": 5,
      "sample_answer":
          "Technology has changed the way we live and work. With smartphones and the internet, people can communicate instantly across the globe. However, it's important to balance screen time with real-life interactions to maintain mental well-being.",
    },
    {
      "text":
          "Many people believe that digital tools improve productivity. While this is true, overuse can lead to stress and fatigue. Finding a healthy balance is essential.",
      "prepare_time": 25,
      "record_time": 30,
      "max_score": 5,
      "sample_answer":
          "Many people believe that digital tools improve productivity. While this is true, overuse can lead to stress and fatigue. Finding a healthy balance is essential.",
    },
    {
      "text":
          "Reading aloud with proper pacing helps listeners stay engaged. It also improves clarity and emotional impact. Practicing regularly can make your speech more effective.",
      "prepare_time": 25,
      "record_time": 30,
      "max_score": 5,
      "sample_answer":
          "Reading aloud with proper pacing helps listeners stay engaged. It also improves clarity and emotional impact. Practicing regularly can make your speech more effective.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv100
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Phát âm nguyên âm đơn',
    questions: p1Lv100L1,
  );
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Ngắt nghỉ đúng chỗ trong câu',
    questions: p1Lv100L2,
  );
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Đọc đoạn văn ngắn có dấu câu',
    questions: p1Lv100L3,
  );

  // lv200
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nhấn trọng âm từ và câu',
    questions: p1Lv200L1,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Đọc đoạn văn có từ vựng học thuật',
    questions: p1Lv200L2,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Luyện đọc với tốc độ vừa phải',
    questions: p1Lv200L3,
  );

  // lv300
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Đọc đoạn văn dài với cảm xúc',
    questions: p1Lv300L1,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Luyện đọc với ngữ điệu tự nhiên',
    questions: p1Lv300L2,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Ghi âm và tự đánh giá phát âm',
    questions: p1Lv300L3,
  );
}
