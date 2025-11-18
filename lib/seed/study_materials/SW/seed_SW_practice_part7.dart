import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart7() async {
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
        .doc('part7')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Respond to a written request',
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
        'type': 'Respond to a written request',
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
  final p7Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "Please send me your phone number.",
      "directions":
          "Write one short, polite sentence to give your phone number.",
      "max_score": 3,
      "sample_answer": "Sure, here is my phone number: 0987654321.",
    },
    {
      "text": "Can you help me with this file?",
      "directions":
          "Write one sentence to say yes and show you are willing to help.",
      "max_score": 3,
      "sample_answer": "Yes, I can help you with that.",
    },
    {
      "text": "Tell me your favorite color.",
      "directions": "Write one sentence to say what your favorite color is.",
      "max_score": 3,
      "sample_answer": "My favorite color is blue.",
    },
  ];

  final p7Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "What’s your favorite food?",
      "directions":
          "Write two sentences: one to answer, one to give more detail.",
      "max_score": 3,
      "sample_answer":
          "My favorite food is pho. It's a delicious Vietnamese noodle soup.",
    },
    {
      "text": "Can you tell me your favorite subject?",
      "directions": "Write two sentences: one to answer, one to explain why.",
      "max_score": 3,
      "sample_answer":
          "Sure, I like English. I enjoy learning new words and speaking.",
    },
    {
      "text": "What sport do you like?",
      "directions":
          "Write two sentences: one to answer, one to say when or how you play it.",
      "max_score": 3,
      "sample_answer":
          "My favorite sport is football. I usually play it with my friends on weekends.",
    },
  ];

  final p7Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "Can you send me your address?",
      "directions":
          "Write two polite sentences: one to give your address, one to offer more help.",
      "max_score": 3,
      "sample_answer":
          "Sure! My address is 25 Tran Phu Street. Let me know if you need directions.",
    },
    {
      "text": "Tell me about your hobby.",
      "directions":
          "Write two friendly sentences: one to say your hobby, one to explain why you like it.",
      "max_score": 3,
      "sample_answer":
          "Of course! I love painting. It helps me relax after school.",
    },
    {
      "text": "What’s your favorite color?",
      "directions":
          "Write two polite sentences: one to answer, one to explain how it makes you feel.",
      "max_score": 3,
      "sample_answer":
          "Thank you for asking! My favorite color is green. It makes me feel calm.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p7Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "Tell me about your favorite subject.",
      "directions":
          "Write a short paragraph (3–4 sentences) to answer the request. Include your favorite subject, a reason, an example, and a friendly closing.",
      "max_score": 4,
      "sample_answer":
          "Sure! My favorite subject is English. I love learning new vocabulary and practicing conversation. It helps me feel more confident when I travel. Let me know if you want to hear about my favorite book too!",
    },
    {
      "text": "Can you describe your daily routine?",
      "directions":
          "Write a short paragraph (3–4 sentences) to describe your daily routine. Include 2–3 activities and a closing sentence.",
      "max_score": 4,
      "sample_answer":
          "Of course! I usually wake up at 6 a.m. and go to school at 7. After class, I do my homework and help my parents. In the evening, I relax by reading or watching TV.",
    },
    {
      "text": "What do you usually do on weekends?",
      "directions":
          "Write a short paragraph (3–4 sentences) to describe your weekend activities. Include details and a friendly closing.",
      "max_score": 4,
      "sample_answer":
          "On weekends, I often spend time with my family. We go shopping or eat out together. I also play football with my friends in the afternoon. It’s a great way to relax after a busy week!",
    },
  ];

  final p7Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "Can you tell me about your hobby?",
      "directions":
          "Write a short paragraph (4–5 sentences) using different sentence types: simple, compound, and complex. Explain your hobby, why you enjoy it, and give an example.",
      "max_score": 4,
      "sample_answer":
          "Of course! I really enjoy painting. It helps me express my feelings, and I can be creative. When I have free time, I usually paint landscapes or animals. It’s a great way to relax after a busy day.",
    },
    {
      "text": "What kind of music do you like?",
      "directions":
          "Write a short paragraph (4–5 sentences) using varied sentence structures. Include your favorite type of music, a reason, and how often you listen to it.",
      "max_score": 4,
      "sample_answer":
          "I like pop music because it’s energetic and fun. I often listen to it while studying or walking. Sometimes I sing along to my favorite songs, and it makes me feel happy. Music is a big part of my life.",
    },
    {
      "text": "Can you describe your favorite place?",
      "directions":
          "Write a short paragraph (4–5 sentences) using a mix of sentence types. Describe the place, why you like it, and what you do there.",
      "max_score": 4,
      "sample_answer":
          "My favorite place is the park near my house. It’s quiet and full of trees. I go there to walk, read, or just relax. Although it’s small, it feels peaceful. I always feel better after spending time there.",
    },
  ];

  final p7Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "What's your favorite season? Why do you like it?",
      "directions":
          "Write a short paragraph (3–4 sentences) to answer both parts of the question. Include your favorite season, a reason, and a closing sentence.",
      "max_score": 4,
      "sample_answer":
          "My favorite season is autumn. I like it because the weather is cool and the leaves are beautiful. It’s the best time for walking in the park.",
    },
    {
      "text": "What do you usually do after school? Why?",
      "directions":
          "Write a short paragraph (3–4 sentences) to answer both parts of the question. Include your activity and a reason.",
      "max_score": 4,
      "sample_answer":
          "After school, I usually do my homework and then play games. I do this because it helps me relax and finish my tasks. Sometimes I also read books if I have time.",
    },
    {
      "text": "What do you like to do with your family? Why?",
      "directions":
          "Write a short paragraph (3–4 sentences) to answer both parts of the question. Include an activity and a reason.",
      "max_score": 4,
      "sample_answer":
          "I like having dinner with my family. We talk about our day and laugh together. It makes me feel close to them and happy.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p7Lv300L1 = <Map<String, dynamic>>[
    {
      "text":
          "Tell me about your favorite hobby and explain how it helps you in daily life.",
      "directions":
          "Write a well-organized paragraph (4–5 sentences). First, say what your favorite hobby is. Then explain how it benefits your daily life. Use linking words like 'Moreover', 'For example', or 'As a result'.",
      "max_score": 5,
      "sample_answer":
          "My favorite hobby is photography. It helps me observe details and express creativity. For example, I often take pictures during my walks, which helps me relax. Moreover, it improves my focus, which is useful when I study. As a result, photography has become an important part of my daily routine.",
    },
    {
      "text":
          "Describe a skill you have and explain how it helps you at school or work.",
      "directions":
          "Write a paragraph (4–5 sentences). Name the skill, explain how it helps, and give one example. Use academic vocabulary and clear structure.",
      "max_score": 5,
      "sample_answer":
          "One important skill I have developed is time management. It enables me to organize my tasks efficiently and meet deadlines. For instance, I use a planner to schedule study sessions and avoid last-minute stress. This skill has significantly improved my academic performance.",
    },
    {
      "text":
          "What is one thing you do to stay healthy? Explain why it is effective.",
      "directions":
          "Write a paragraph (4–5 sentences). Describe the activity, explain its benefits, and give an example. Use linking words to connect your ideas.",
      "max_score": 5,
      "sample_answer":
          "To stay healthy, I go jogging every morning. It helps improve my physical fitness and clears my mind. For example, after jogging, I feel more energetic and focused during the day. In addition, it helps me maintain a regular routine. That’s why I believe jogging is an effective way to stay healthy.",
    },
  ];

  final p7Lv300L2 = <Map<String, dynamic>>[
    {
      "text":
          "Do you think students should have homework every day? Explain your opinion.",
      "directions":
          "Write a paragraph (4–5 sentences) giving your opinion. Include a reason, a counterpoint, and a conclusion. Use linking words like 'Although', 'However', or 'Therefore'.",
      "max_score": 5,
      "sample_answer":
          "I don't think students should have homework every day. It can cause stress and reduce time for rest and hobbies. Although homework helps review lessons, too much can be harmful. Students need time to relax and recharge. Therefore, homework should be given in moderation.",
    },
    {
      "text":
          "Some people think online learning is better than classroom learning. What do you think?",
      "directions":
          "Write a paragraph (4–5 sentences) stating your opinion. Compare both sides and explain your preference. Use formal language and linking words.",
      "max_score": 5,
      "sample_answer":
          "While online learning is convenient, I believe classroom learning is more effective. In class, students can interact directly with teachers and classmates. Online learning may lack motivation and personal connection. However, combining both methods could be ideal. In conclusion, face-to-face learning still plays a vital role in education.",
    },
    {
      "text":
          "Do you agree that students should wear uniforms? Why or why not?",
      "directions":
          "Write a paragraph (4–5 sentences) expressing your opinion. Include one reason, one counterpoint, and a conclusion.",
      "max_score": 5,
      "sample_answer":
          "Yes, I think students should wear uniforms. Uniforms create a sense of equality and reduce distractions. Some people argue that uniforms limit self-expression, but students can express themselves in other ways. Overall, uniforms help maintain discipline and focus in school.",
    },
  ];

  final p7Lv300L3 = <Map<String, dynamic>>[
    {
      "text":
          "Describe a skill you have learned and explain how it benefits your studies.",
      "directions":
          "Write a formal paragraph (4–5 sentences) using academic vocabulary. Introduce the skill, explain its benefits, and give an example.",
      "max_score": 5,
      "sample_answer":
          "One important skill I have learned is note-taking. It allows me to organize information clearly and review it efficiently. For instance, I use bullet points and headings to summarize lectures. This method helps me retain knowledge and prepare better for exams. As a result, my academic performance has improved.",
    },
    {
      "text":
          "What is one challenge you have faced in learning English? How did you overcome it?",
      "directions":
          "Write a short academic paragraph (4–5 sentences). Describe the challenge, your solution, and the result. Use formal tone and clear structure.",
      "max_score": 5,
      "sample_answer":
          "One challenge I faced in learning English was speaking fluently. I often felt nervous and made mistakes. To overcome this, I practiced with friends and joined an English club. Gradually, I became more confident and fluent. This experience taught me the value of consistent practice.",
    },
    {
      "text":
          "What is one goal you have for your future career? Why is it important to you?",
      "directions":
          "Write a formal paragraph (4–5 sentences). State your goal, explain why it matters, and how you plan to achieve it.",
      "max_score": 5,
      "sample_answer":
          "My goal is to become a software engineer. I enjoy solving problems and building useful applications. This career allows me to be creative and contribute to society. To achieve this, I am studying computer science and practicing coding regularly. I believe this path will lead to a meaningful and rewarding future.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv100
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời yêu cầu đơn giản bằng một câu',
    questions: p7Lv100L1,
  );
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName:
        'Bài 2: Trả lời bằng 2 câu – cung cấp thông tin và thêm chi tiết',
    questions: p7Lv100L2,
  );
  await pushLesson(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Trả lời lịch sự và thân thiện',
    questions: p7Lv100L3,
  );

  // lv200
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời bằng đoạn văn ngắn (3–4 câu)',
    questions: p7Lv200L1,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng cấu trúc linh hoạt để trả lời yêu cầu',
    questions: p7Lv200L2,
  );
  await pushLesson(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Trả lời yêu cầu có thêm câu hỏi phụ',
    questions: p7Lv200L3,
  );

  // lv300
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Trả lời yêu cầu có nhiều phần',
    questions: p7Lv300L1,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trả lời yêu cầu mang tính phản biện',
    questions: p7Lv300L2,
  );
  await pushLesson(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Viết đoạn phản hồi mang tính học thuật',
    questions: p7Lv300L3,
  );
}
