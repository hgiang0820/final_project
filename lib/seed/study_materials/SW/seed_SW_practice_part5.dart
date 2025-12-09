import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart5() async {
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
        .doc('part5')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Express an opinion',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      // final imagePath =
      //     'study_materials/SWMaterials/part4/$levelId/$lessonId/$id.jpg';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Express an opinion',
        // 'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions': q['directions'],
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
        .doc('speak5')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Express an opinion',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'type': 'Express an opinion',
        // 'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions': q['directions'],
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p5Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "What is your favorite food?",
      "directions":
          "Say one sentence to express your opinion or preference. Use 'I like…' or 'I think…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "I like pizza.",
    },
    {
      "text": "Do you like reading books?",
      "directions":
          "Say one short sentence to show your opinion. Use 'I like…' or 'I don’t like…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "I like reading books.",
    },
    {
      "text": "What subject do you like at school?",
      "directions":
          "Say one sentence to express your opinion. Use 'I think…' or 'I like…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "I think English is fun.",
    },
  ];

  final p5Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "What sport do you like?",
      "directions": "Say one sentence with a reason. Use 'I like… because…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "I like football because it’s fun.",
    },
    {
      "text": "Do you like doing homework?",
      "directions":
          "Say your opinion and give a reason. Use 'I think… because…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "I don’t like homework because it’s boring.",
    },
    {
      "text": "Is English important?",
      "directions":
          "Say your opinion and give a reason. Use 'I think… because…'.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer":
          "I think English is important because it helps me travel.",
    },
  ];

  final p5Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "What is your favorite hobby?",
      "directions":
          "Say 3–4 sentences: your opinion, a reason, an example, and a short conclusion.",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer":
          "I like painting. Because it helps me relax. For example, I paint after school. That’s why I enjoy it.",
    },
    {
      "text": "Do you like watching movies?",
      "directions":
          "Say 3–4 sentences: your opinion, a reason, an example, and a short conclusion.",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer":
          "I like watching movies. Because they are fun and exciting. For example, I watch movies every weekend. That’s why I love them.",
    },
    {
      "text": "What do you think about reading books?",
      "directions":
          "Say 3–4 sentences: your opinion, a reason, an example, and a short conclusion.",
      "prepare_time": 10,
      "record_time": 15,
      "max_score": 3,
      "sample_answer":
          "I think reading is great. Because it helps me learn. For example, I read every night. That’s why I enjoy books.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p5Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "Why is learning English important?",
      "directions":
          "Say your opinion with two reasons and examples. Use 'Firstly…', 'Secondly…', and 'For example…'.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I think learning English is important. Firstly, it helps me talk to people. For example, I used English when I traveled. Secondly, it helps me get a good job.",
    },
    {
      "text": "Why should students play sports?",
      "directions":
          "Give two reasons and examples to support your opinion. Use clear linking words.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "Students should play sports. Firstly, it keeps them healthy. For example, running makes them strong. Secondly, it teaches teamwork.",
    },
    {
      "text": "Why is reading a good habit?",
      "directions":
          "Say your opinion with two reasons and examples. Use 'Firstly…', 'Secondly…', and 'For instance…'.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "Reading is a good habit. Firstly, it helps me relax. For instance, I read before bed. Secondly, it improves my vocabulary.",
    },
  ];

  final p5Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Give your opinion using academic linking words like 'Moreover', 'However', and 'Therefore'.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I think students should wear uniforms. Moreover, it helps reduce pressure. However, some students want to wear what they like. Therefore, schools should explain the benefits clearly.",
    },
    {
      "text": "Is it better to study online or in class?",
      "directions":
          "Use academic linking words to compare and explain your opinion. Include at least three linking words.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I prefer studying online. In addition, it saves time. However, some students miss face-to-face learning. As a result, I think a mix of both is best.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Use linking words like 'Firstly', 'However', and 'In conclusion' to organize your opinion.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 4,
      "sample_answer":
          "I don’t think students need homework every day. Firstly, they need time to rest. However, some homework is helpful. In conclusion, homework should be balanced.",
    },
  ];

  final p5Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Give a full response with introduction, two reasons, and a short conclusion. Use linking words.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 4,
      "sample_answer":
          "I think students should study online. Firstly, it gives more flexibility. For example, I can study anytime. Secondly, it saves travel time. In conclusion, online learning is very useful.",
    },
    {
      "text": "Is it better to live in the city or countryside?",
      "directions":
          "Say your opinion clearly. Give two reasons and a conclusion. Use linking words to organize your ideas.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 4,
      "sample_answer":
          "I think living in the countryside is better. Firstly, it’s quiet and peaceful. Secondly, the air is cleaner. In conclusion, the countryside is a good place to live.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Give a full opinion with two reasons and a conclusion. Use clear linking words.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 4,
      "sample_answer":
          "I don’t think students should have homework every day. Firstly, it can be stressful. Secondly, they need time to relax. In conclusion, homework should be given in moderation.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p5Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "Do you think homework is necessary?",
      "directions":
          "Express your opinion and respond to an opposite view. Say what others think, then give your own opinion with a reason and example.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Some people think homework is unnecessary. However, I believe it helps students review lessons. This is because regular practice improves memory. For example, I do math exercises every day to get better.",
    },
    {
      "text": "Is online learning better than classroom learning?",
      "directions":
          "Present one opposing opinion and give your rebuttal. Include a reason and example to support your view.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Some people say online learning is less effective. But I think it gives students more freedom. This is because they can study anytime and review lessons. For example, I watch recorded videos when I need help.",
    },
    {
      "text": "Should students wear uniforms?",
      "directions":
          "Mention an opposite opinion and explain why you disagree. Give a reason and example.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Some people believe uniforms limit self-expression. However, I think they help students focus. This is because everyone wears the same, so no one feels judged. For example, I feel more confident in uniform.",
    },
  ];

  final p5Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "Why is reading a good habit?",
      "directions":
          "Use at least two advanced sentence structures like conditionals or complex sentences. Show how reading helps you.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Reading is a great habit. If I read every day, I learn new words. Although some people prefer watching videos, I enjoy books more. It helps me relax, and it improves my thinking.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Use advanced grammar like 'If…then…' or 'Although…'. Combine ideas with 'and'.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "I think learning English is very important. If you speak English, then you can travel and work easily. Although it’s hard at first, it gets better with practice. It helps you connect with people, and it opens many doors.",
    },
    {
      "text": "Should students play sports?",
      "directions":
          "Use at least two complex or conditional sentences. Show how sports help students.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Students should play sports. If they play every week, they stay healthy. Although some students prefer studying, sports teach teamwork. It builds strength, and it helps students feel more confident.",
    },
  ];

  final p5Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Give a full response with four parts: introduction, two reasons, one counterargument, and a strong conclusion. Use academic linking words.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I believe students should study online. Firstly, it gives flexibility. For example, they can choose when to study. Secondly, it offers many resources. Some people say it lacks interaction, but video calls can solve that. In conclusion, online learning is modern and effective.",
    },
    {
      "text": "Is it better to live in the city or countryside?",
      "directions":
          "Speak a full opinion with reasons, counterpoint, and conclusion. Use linking words like 'Firstly', 'However', 'In conclusion'.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I think living in the countryside is better. Firstly, it’s quiet and peaceful. Secondly, it’s cheaper than the city. Some people say cities have more jobs, but countryside life is healthier. In conclusion, I prefer the countryside.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Give a complete opinion with two reasons, one opposing view, and a strong conclusion.",
      "prepare_time": 15,
      "record_time": 25,
      "max_score": 5,
      "sample_answer":
          "I don’t think students should have homework every day. Firstly, it causes stress. Secondly, it takes away time with family. Some people say homework helps learning, but too much is harmful. In conclusion, homework should be given in moderation.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv100
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói câu đơn thể hiện ý kiến cá nhân',
    questions: p5Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Nói câu có lý do đơn giản',
    questions: p5Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói đoạn ngắn 3–4 câu có tổ chức',
    questions: p5Lv100L3,
  );

  // lv200
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói đoạn có 2 lý do và ví dụ',
    questions: p5Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối học thuật để tăng độ mạch lạc',
    questions: p5Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói đoạn có mở bài và kết luận rõ ràng',
    questions: p5Lv200L3,
  );

  // lv300
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói đoạn có phản biện ý kiến đối lập',
    questions: p5Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng cấu trúc học thuật nâng cao',
    questions: p5Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói bài hoàn chỉnh có phản biện và kết luận mạnh',
    questions: p5Lv300L3,
  );



  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói câu đơn thể hiện ý kiến cá nhân',
    questions: p5Lv100L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Nói câu có lý do đơn giản',
    questions: p5Lv100L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói đoạn ngắn 3–4 câu có tổ chức',
    questions: p5Lv100L3,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói đoạn có 2 lý do và ví dụ',
    questions: p5Lv200L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối học thuật để tăng độ mạch lạc',
    questions: p5Lv200L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói đoạn có mở bài và kết luận rõ ràng',
    questions: p5Lv200L3,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Nói đoạn có phản biện ý kiến đối lập',
    questions: p5Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng cấu trúc học thuật nâng cao',
    questions: p5Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Nói bài hoàn chỉnh có phản biện và kết luận mạnh',
    questions: p5Lv300L3,
  );
}
