import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart8() async {
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
        .doc('part8')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Write an opinion essay',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      // final imagePath =
      //     'study_materials/SWMaterials/part6/$levelId/$lessonId/$id.jpg';
      final q = questions[i];

      await lessonRef.collection('questions').doc(id).set({
        'type': 'Write an opinion essay',
        // 'imagePath': imagePath,
        'text': q['text'],
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
        .doc('write3')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Write an opinion essay',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      // final imagePath =
      //     'study_materials/SWMaterials/part6/$levelId/$lessonId/$id.jpg';
      final q = questions[i];

      await lessonRef.collection('questions').doc(id).set({
        'type': 'Write an opinion essay',
        // 'imagePath': imagePath,
        'text': q['text'],
        'sample_answer': q['sample_answer'],
        'directions': q['directions'],
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p8Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Write an introduction paragraph that clearly states your opinion. Include 2 sentences: one to introduce the topic and one to express your opinion. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "Many people have different opinions about school uniforms. In my opinion, students should wear uniforms because it creates equality and discipline.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write an introduction paragraph with a clear opinion. Include 2 sentences: one general statement and one personal view. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "English is a global language used in many countries. I believe learning English is important because it helps us communicate and find better opportunities.",
    },
    {
      "text": "Should children play sports?",
      "directions":
          "Write an opening paragraph that introduces the topic and gives your opinion. Use 2 short sentences. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "Many parents encourage their children to play sports. I think playing sports is good for children because it improves their health and teamwork skills.",
    },
  ];

  final p8Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Write a body paragraph with one reason and one example to support your opinion. Use linking words like 'For example' or 'This shows that'. Word limit: 40–60 words.",
      "max_score": 3,
      "sample_answer":
          "One reason students should wear uniforms is that it reduces distractions. For example, students don’t have to worry about what to wear every day. This helps them focus more on studying.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write a body paragraph with one reason and one example. Use clear linking words. Word limit: 40–60 words.",
      "max_score": 3,
      "sample_answer":
          "Learning English is important because it helps people travel and work abroad. For example, many companies require English skills. This shows that English can improve career chances.",
    },
    {
      "text": "Should children play sports?",
      "directions":
          "Write a body paragraph with one reason and one example. Use 'For example' and 'This helps'. Word limit: 40–60 words.",
      "max_score": 3,
      "sample_answer":
          "Children should play sports because it keeps them active and healthy. For example, playing football helps improve strength and teamwork. This helps children grow stronger and more confident.",
    },
  ];

  final p8Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Write a conclusion paragraph that restates your opinion and gives a final reason. Use 2 sentences. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "In conclusion, I believe that students should wear uniforms. It helps create a better learning environment and reduces pressure.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write a short conclusion paragraph. Restate your opinion and give one final benefit. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "To sum up, learning English is very useful. It helps us connect with people around the world.",
    },
    {
      "text": "Should children play sports?",
      "directions":
          "Write a conclusion paragraph with a clear opinion and one final reason. Word limit: 30–40 words.",
      "max_score": 3,
      "sample_answer":
          "Overall, I think children should play sports. It makes them healthier and teaches them how to work with others.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p8Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Write a body paragraph with two clear reasons and examples to support your opinion. Use linking words like 'Firstly' and 'Secondly'. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "Firstly, uniforms help reduce social pressure among students. For example, everyone wears the same clothes, so no one feels judged. Secondly, uniforms create a sense of discipline. For instance, students learn to follow rules and dress properly.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write a body paragraph with two reasons and examples. Use academic linking phrases. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "Firstly, learning English helps people communicate internationally. For example, travelers can ask for help or directions easily. Secondly, English is useful for career development. For instance, many companies require English skills for promotion.",
    },
    {
      "text": "Should children play sports?",
      "directions":
          "Write a body paragraph with two reasons and examples. Use 'Firstly' and 'Secondly' to organize your ideas. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "Firstly, playing sports improves children's physical health. For example, running and jumping help build strong muscles. Secondly, sports teach teamwork and discipline. For instance, children learn to cooperate and follow rules during games.",
    },
  ];

  final p8Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should wear uniforms?",
      "directions":
          "Write a paragraph using at least three academic linking words to improve coherence. Use phrases like 'Moreover', 'On the other hand', and 'Therefore'. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "Uniforms help reduce distractions. Moreover, they promote equality among students. On the other hand, some argue that uniforms limit self-expression. However, the benefits outweigh the drawbacks. Therefore, uniforms are a good choice for schools.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write a paragraph with academic linking words to connect ideas. Use 'In addition', 'However', and 'As a result'. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "English is important for communication. In addition, it opens doors to international education and work. However, some people find it difficult to learn. As a result, schools should provide better support for English learners.",
    },
    {
      "text": "Should children play sports?",
      "directions":
          "Write a paragraph using academic linking words to show contrast and addition. Use 'Furthermore', 'Nevertheless', and 'In conclusion'. Word limit: 60–80 words.",
      "max_score": 4,
      "sample_answer":
          "Children should play sports because it improves their health. Furthermore, it helps them develop social skills. Nevertheless, some children prefer quiet activities. In conclusion, sports offer many benefits and should be encouraged.",
    },
  ];

  final p8Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Write a complete opinion essay with three parts: introduction, body, and conclusion. Use academic linking words and give two reasons with examples. Word limit: 100–120 words.",
      "max_score": 4,
      "sample_answer":
          "In my opinion, students should study online. Firstly, it allows flexibility in learning. For example, students can choose their own schedule. Secondly, it provides access to many resources. For instance, they can watch videos and read articles anytime. In conclusion, online learning is a convenient and effective way to study.",
    },
    {
      "text": "Is it better to live in the city or the countryside?",
      "directions":
          "Write a full opinion essay with introduction, body, and conclusion. Include two reasons and examples. Word limit: 100–120 words.",
      "max_score": 4,
      "sample_answer":
          "I believe living in the countryside is better. Firstly, it is quieter and less polluted. For example, people can enjoy fresh air and peaceful surroundings. Secondly, the cost of living is lower. For instance, housing and food are more affordable. In conclusion, the countryside offers a healthier and more relaxed lifestyle.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Write a complete opinion essay with three parts. Include two reasons and examples. Word limit: 100–120 words.",
      "max_score": 4,
      "sample_answer":
          "I don’t think students should have homework every day. Firstly, it can cause stress and reduce time for rest. For example, students may feel tired and lose motivation. Secondly, too much homework affects family time. For instance, children have less time to talk or play with parents. In conclusion, homework should be given in moderation.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p8Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Write a body paragraph that includes one opposing opinion and your rebuttal. Use academic linking phrases like 'However', 'This is because', and 'For instance'. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "Some people argue that online learning is less effective than traditional classes. However, I believe that it offers flexibility and access to diverse resources. This is because students can learn at their own pace and revisit materials anytime. For instance, I often watch recorded lectures to review difficult topics.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Write a body paragraph that presents an opposing view and your response. Include a reason and example. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "Some people think homework is unnecessary and stressful. However, I believe it reinforces learning and builds discipline. This is because students need regular practice to remember key concepts. For example, doing math exercises daily helps improve problem-solving skills.",
    },
    {
      "text": "Is it better to live in the city or the countryside?",
      "directions":
          "Write a body paragraph that includes one opposing opinion and your rebuttal. Use formal tone and clear structure. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "Some people argue that city life is better because of convenience and entertainment. However, I prefer the countryside due to its peaceful environment. This is because fresh air and quiet surroundings reduce stress. For instance, walking in nature helps me feel calm and focused.",
    },
  ];

  final p8Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Write a paragraph using at least two advanced academic structures such as conditional sentences or complex clauses. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "If students study online, they can manage their time better. Although some may struggle with motivation, the flexibility allows them to learn at their own pace. It also reduces travel time, and it gives access to global resources.",
    },
    {
      "text": "Should students wear uniforms?",
      "directions":
          "Write a paragraph using advanced sentence structures like 'Although', 'If...then', and compound sentences. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "Although some students prefer wearing their own clothes, uniforms help create a sense of equality. If everyone wears the same outfit, then no one feels judged by appearance. It also promotes discipline, and it helps students focus on learning.",
    },
    {
      "text": "Is it important to learn English?",
      "directions":
          "Write a paragraph using at least two academic structures such as conditional or complex sentences. Word limit: 70–90 words.",
      "max_score": 5,
      "sample_answer":
          "If people learn English, they can communicate globally and access more opportunities. Although it may be difficult at first, regular practice makes it easier. English is used in business, education, and travel, and it helps people connect across cultures.",
    },
  ];

  final p8Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "Do you think students should study online?",
      "directions":
          "Write a full opinion essay with four parts: introduction, body, counterargument, and strong conclusion. Use academic linking words and advanced sentence structures. Word limit: 120–150 words.",
      "max_score": 5,
      "sample_answer":
          "In my opinion, students should study online. Firstly, it provides flexibility in learning. For example, students can choose when and where to study. Secondly, it offers access to a wide range of materials. For instance, online platforms include videos, articles, and interactive exercises. Some people argue that online learning lacks interaction. However, I believe that discussion forums and video calls can solve this problem. In conclusion, online learning is a modern and effective method that prepares students for the future.",
    },
    {
      "text": "Should students have homework every day?",
      "directions":
          "Write a complete opinion essay with four parts: opening, reasons, rebuttal, and conclusion. Use formal tone and academic vocabulary. Word limit: 120–150 words.",
      "max_score": 5,
      "sample_answer":
          "I believe students should not have homework every day. Firstly, daily homework can cause stress and reduce time for rest. For example, students may feel tired and lose motivation. Secondly, it limits time for family and hobbies. Some people argue that homework helps reinforce learning. However, too much homework can lead to burnout. In conclusion, homework should be given in moderation to support both academic success and well-being.",
    },
    {
      "text": "Is it better to live in the city or the countryside?",
      "directions":
          "Write a full opinion essay with four parts: introduction, body, counterargument, and conclusion. Use academic linking phrases and advanced grammar. Word limit: 120–150 words.",
      "max_score": 5,
      "sample_answer":
          "In my opinion, living in the countryside is better than living in the city. Firstly, it offers a peaceful environment and fresh air. For example, people can enjoy nature and avoid noise pollution. Secondly, the cost of living is lower. Some people argue that cities provide more opportunities. However, the stress and fast pace of city life can affect health. In conclusion, the countryside provides a healthier and more balanced lifestyle.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv100
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết mở bài nêu rõ quan điểm',
    questions: p8Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Viết thân bài với lý do và ví dụ',
    questions: p8Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết kết bài nhấn mạnh lại quan điểm',
    questions: p8Lv100L3,
  );

  // lv200
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết thân bài có 2 lý do và ví dụ',
    questions: p8Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối học thuật để tăng độ mạch lạc',
    questions: p8Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết bài luận hoàn chỉnh (mở bài – thân bài – kết bài)',
    questions: p8Lv200L3,
  );

  // lv300
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Phản biện ý kiến đối lập trong thân bài',
    questions: p8Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng cấu trúc học thuật nâng cao',
    questions: p8Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết bài luận nâng cao có phản biện và kết luận mạnh',
    questions: p8Lv300L3,
  );



  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết mở bài nêu rõ quan điểm',
    questions: p8Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Viết thân bài với lý do và ví dụ',
    questions: p8Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết kết bài nhấn mạnh lại quan điểm',
    questions: p8Lv100L3,
  );

  // lv2
  await pushLessonSW(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Viết thân bài có 2 lý do và ví dụ',
    questions: p8Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng từ nối học thuật để tăng độ mạch lạc',
    questions: p8Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết bài luận hoàn chỉnh (mở bài – thân bài – kết bài)',
    questions: p8Lv200L3,
  );

  // lv3
  await pushLessonSW(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Phản biện ý kiến đối lập trong thân bài',
    questions: p8Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng cấu trúc học thuật nâng cao',
    questions: p8Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết bài luận nâng cao có phản biện và kết luận mạnh',
    questions: p8Lv300L3,
  );
}
