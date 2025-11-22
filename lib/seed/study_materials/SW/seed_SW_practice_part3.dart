import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart3() async {
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
        .doc('part3')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Respond to questions',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Respond to questions',
        // 'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will respond to questions on your screen.",
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
        .doc('speak3')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Respond to questions',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Respond to questions',
        // 'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will respond to questions on your screen.",
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p3Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "Do you like coffee?",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "Yes, I do. I drink it every morning.",
    },
    {
      "text": "Can you swim?",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "No, I can't. I'm afraid of deep water.",
    },
    {
      "text": "Are you a student?",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "Yes, I am. I study at a university in Hanoi.",
    },
  ];

  final p3Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "What do you eat for breakfast?",
      "prepare_time": 5,
      "record_time": 12,
      "max_score": 3,
      "sample_answer": "I eat bread and eggs for breakfast.",
    },
    {
      "text": "Where do you live?",
      "prepare_time": 5,
      "record_time": 12,
      "max_score": 3,
      "sample_answer": "I live in Hanoi, near the city center.",
    },
    {
      "text": "When do you go to bed?",
      "prepare_time": 5,
      "record_time": 12,
      "max_score": 3,
      "sample_answer": "I usually go to bed at 10 p.m.",
    },
  ];

  final p3Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "Do you like reading?",
      "prepare_time": 5,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "Yes, I do because it helps me learn new things.",
    },
    {
      "text": "What is your favorite subject?",
      "prepare_time": 5,
      "record_time": 15,
      "max_score": 3,
      "sample_answer": "I like English because it's interesting and useful.",
    },
    {
      "text": "Do you enjoy cooking?",
      "prepare_time": 5,
      "record_time": 15,
      "max_score": 3,
      "sample_answer":
          "No, I don't because it's difficult and takes a lot of time.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p3Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "Do you enjoy traveling?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "Yes, I do because I can learn new things. For example, I visited Japan last year and learned about their culture.",
    },
    {
      "text": "What sports do you like?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I like football and badminton. For instance, I play football every Sunday with my friends.",
    },
    {
      "text": "Do you like cooking?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "Yes, I do. I often cook simple meals like fried rice and noodles.",
    },
  ];

  final p3Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "How do you feel when you speak English?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I feel nervous when I speak English in front of many people, but I try to stay confident.",
    },
    {
      "text": "Why do you think learning English is important?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "In my opinion, learning English is important because it helps us communicate with people around the world.",
    },
    {
      "text": "Do you enjoy group work?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I think group work is useful because we can share ideas and help each other.",
    },
  ];

  final p3Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "What do you usually do on weekends?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I usually visit my grandparents or go out with friends. For example, last weekend I went to the cinema.",
    },
    {
      "text": "Do you like listening to music?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "Yes, I do because it helps me relax. I often listen to pop music while studying.",
    },
    {
      "text": "What is your favorite season?",
      "prepare_time": 5,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I like autumn because the weather is cool and the trees look beautiful.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p3Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "Do you enjoy learning new languages?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "Yes, I do because it helps me understand other cultures. For example, I started learning Japanese last year and now I can watch anime without subtitles.",
    },
    {
      "text": "What do you usually do after work or school?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I usually relax by reading or watching movies. For instance, last week I watched a documentary about space exploration.",
    },
    {
      "text": "Do you like outdoor activities?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "Yes, I enjoy outdoor activities such as hiking and cycling. They help me stay healthy and reduce stress.",
    },
  ];

  final p3Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "How do you feel when you achieve a goal?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I feel proud and motivated because it shows that my hard work paid off. It gives me confidence to set bigger goals.",
    },
    {
      "text": "What do you think about online learning?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "In my opinion, online learning is convenient and flexible. However, it requires strong self-discipline to be effective.",
    },
    {
      "text": "Do you prefer working alone or in a team?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "Personally, I prefer working in a team because we can share ideas and support each other. It also helps improve communication skills.",
    },
  ];

  final p3Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "What do you usually do on weekends?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "On weekends, I often spend time with my family or go out with friends. For example, last Sunday we had a picnic in the park and played games together.",
    },
    {
      "text": "Do you enjoy watching movies?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "Yes, I do. I especially enjoy science fiction movies because they spark my imagination. For instance, I recently watched Interstellar and found it fascinating.",
    },
    {
      "text": "What kind of music do you like?",
      "prepare_time": 5,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I like pop music because it's energetic and easy to sing along. I often listen to artists like Taylor Swift and Ed Sheeran.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // ==== SWMaterials =====
  // lv100
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời câu hỏi Yes/No',
    questions: p3Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trả lời câu hỏi Wh- đơn giản',
    questions: p3Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mở rộng câu trả lời bằng 1 lý do',
    questions: p3Lv100L3,
  );

  // lv200
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời với ví dụ cụ thể',
    questions: p3Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Diễn đạt cảm xúc và quan điểm',
    questions: p3Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Luyện phản xạ trả lời nhanh',
    questions: p3Lv200L3,
  );

  // lv300
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời câu hỏi trừu tượng',
    questions: p3Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng thành ngữ và cấu trúc nâng cao',
    questions: p3Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Tự đặt và trả lời câu hỏi phản biện',
    questions: p3Lv300L3,
  );

  // ==== FullMaterials =====
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời câu hỏi Yes/No',
    questions: p3Lv100L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trả lời câu hỏi Wh- đơn giản',
    questions: p3Lv100L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Mở rộng câu trả lời bằng 1 lý do',
    questions: p3Lv100L3,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời với ví dụ cụ thể',
    questions: p3Lv200L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Diễn đạt cảm xúc và quan điểm',
    questions: p3Lv200L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Luyện phản xạ trả lời nhanh',
    questions: p3Lv200L3,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời câu hỏi trừu tượng',
    questions: p3Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng thành ngữ và cấu trúc nâng cao',
    questions: p3Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Tự đặt và trả lời câu hỏi phản biện',
    questions: p3Lv300L3,
  );
}
