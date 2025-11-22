import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedSWPracticePart4() async {
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
        .doc('part4')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Respond to questions using information provided',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final imagePath =
          'study_materials/SWMaterials/part4/$levelId/$lessonId/$id.jpg';
      final q = questions[i];

      await lessonRef.collection('questions').doc(id).set({
        'type': 'Respond to questions using information provided',
        'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will respond to questions using information provided on your screen.",
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
        .doc('speak4')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Respond to questions using information provided',
      'lessonName': lessonName,
      // 'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final imagePath =
          'study_materials/FullMaterials/speak4/$levelId/$lessonId/$id.jpg';
      final q = questions[i];

      await lessonRef.collection('questions').doc(id).set({
        'type': 'Respond to questions using information provided',
        'imagePath': imagePath,
        'text': q['text'],
        'prepare_time': q['prepare_time'],
        'record_time': q['record_time'],
        'sample_answer': q['sample_answer'],
        'directions':
            "In this question of the test, you will respond to questions using information provided on your screen.",
        'max_score': q['max_score'],
        'order': i,
      });
    }
  }

  // === LEVEL 100+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p4Lv100L1 = <Map<String, dynamic>>[
    {
      "text": "Where does Linh live?",
      // "description": "A simple table with three rows and three columns. The columns are labeled 'Name', 'Age', and 'City'. The rows show: Anna (25, London), David (30, New York), and Linh (22, Hanoi). The table is clean and easy to read, with each cell clearly separated.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "She lives in Hanoi.",
    },
    {
      "text": "How old is David?",
      // "description": "A simple table with three rows and three columns. The columns are labeled 'Name', 'Age', and 'City'. The rows show: Anna (25, London), David (30, New York), and Linh (22, Hanoi). The table is clean and easy to read, with each cell clearly separated.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "He is 30 years old.",
    },
    {
      "text": "What is Anna’s age?",
      // "description": "A simple table with three rows and three columns. The columns are labeled 'Name', 'Age', and 'City'. The rows show: Anna (25, London), David (30, New York), and Linh (22, Hanoi). The table is clean and easy to read, with each cell clearly separated.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "She is 25 years old.",
    },
  ];

  final p4Lv100L2 = <Map<String, dynamic>>[
    {
      "text": "When is the Art Fair?",
      // "description": "A schedule table with three events. The columns are 'Event', 'Date', and 'Location'. The rows show: Music Show (Nov 20, Hanoi), Art Fair (Nov 22, Da Nang), and Book Expo (Nov 25, HCMC). The table has a bold header and clear grid lines.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "It is on November 22.",
    },
    {
      "text": "Where is the Book Expo?",
      // "description": "A schedule table with three events. The columns are 'Event', 'Date', and 'Location'. The rows show: Music Show (Nov 20, Hanoi), Art Fair (Nov 22, Da Nang), and Book Expo (Nov 25, HCMC). The table has a bold header and clear grid lines.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "It is in HCMC.",
    },
    {
      "text": "What event is on November 20?",
      // "description": "A schedule table with three events. The columns are 'Event', 'Date', and 'Location'. The rows show: Music Show (Nov 20, Hanoi), Art Fair (Nov 22, Da Nang), and Book Expo (Nov 25, HCMC). The table has a bold header and clear grid lines.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "The Music Show is on November 20.",
    },
  ];

  final p4Lv100L3 = <Map<String, dynamic>>[
    {
      "text": "What does Mai do?",
      // "description": "A table showing three people and their jobs and countries. The columns are 'Name', 'Job', and 'Country'. The rows show: Maria (Engineer, Spain), Tom (Teacher, Canada), and Mai (Designer, Vietnam). The table is neat, with alternating row colors for readability.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "She is a designer.",
    },
    {
      "text": "Where is Maria from?",
      // "description": "A table showing three people and their jobs and countries. The columns are 'Name', 'Job', and 'Country'. The rows show: Maria (Engineer, Spain), Tom (Teacher, Canada), and Mai (Designer, Vietnam). The table is neat, with alternating row colors for readability.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "She is from Spain.",
    },
    {
      "text": "What is Tom’s job?",
      // "description": "A table showing three people and their jobs and countries. The columns are 'Name', 'Job', and 'Country'. The rows show: Maria (Engineer, Spain), Tom (Teacher, Canada), and Mai (Designer, Vietnam). The table is neat, with alternating row colors for readability.",
      "prepare_time": 5,
      "record_time": 10,
      "max_score": 3,
      "sample_answer": "He is a teacher.",
    },
  ];

  // === LEVEL 200+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p4Lv200L1 = <Map<String, dynamic>>[
    {
      "text": "Which product is the most expensive?",
      // "description": "A comparison table with three products labeled A, B, and C. Columns include 'Product', 'Price', and 'Rating'. Product A costs $10 and has a rating of 4.5. Product B costs $15 and has a rating of 4.0. Product C costs $12 and has a rating of 4.8. The table is clean, with bold headers and aligned numeric values.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "Product B is the most expensive at \$15.",
    },
    {
      "text": "Compare the ratings of Product A and C.",
      // "description": "A comparison table with three products labeled A, B, and C. Columns include 'Product', 'Price', and 'Rating'. Product A costs $10 and has a rating of 4.5. Product C costs $12 and has a rating of 4.8. The table is clean, with bold headers and aligned numeric values.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "Product C has a higher rating than Product A.",
    },
    {
      "text": "Which product has the lowest rating?",
      // "description": "A comparison table with three products labeled A, B, and C. Columns include 'Product', 'Price', and 'Rating'. Product A: $10, 4.5; Product B: $15, 4.0; Product C: $12, 4.8. The table is organized with clear rows and columns.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "Product B has the lowest rating at 4.0.",
    },
  ];

  final p4Lv200L2 = <Map<String, dynamic>>[
    {
      "text": "How much did sales increase from January to March?",
      // "description": "A sales chart showing monthly revenue. Columns: 'Month' and 'Sales ($)'. January: $1,000; February: $1,500; March: $2,000. The table uses a simple layout with dollar signs and ascending values.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "Sales increased by \$1,000 from January to March.",
    },
    {
      "text": "What were the sales in February?",
      // "description": "A sales chart showing monthly revenue. Columns: 'Month' and 'Sales ($)'. February shows $1,500. The table is minimalistic with clear labels and values.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer": "Sales in February were \$1,500.",
    },
    {
      "text": "According to the chart, which month had the highest sales?",
      // "description": "A sales chart showing monthly revenue. January: $1,000; February: $1,500; March: $2,000. The table is structured with bold headers and increasing sales figures.",
      "prepare_time": 8,
      "record_time": 15,
      "max_score": 4,
      "sample_answer":
          "According to the chart, March had the highest sales at \$2,000.",
    },
  ];

  final p4Lv200L3 = <Map<String, dynamic>>[
    {
      "text": "Summarize the information in the chart.",
      // "description": "A table showing three activities and the number of people who enjoy each. Reading: 40, Sports: 30, Music: 50. The layout is simple with two columns: 'Activity' and 'Number of People'. Music has the highest number.",
      "prepare_time": 10,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "Overall, music is the most popular activity, followed by reading and sports.",
    },
    {
      "text": "What does the data suggest about people's interests?",
      // "description": "A table showing preferences for three activities: Reading (40), Sports (30), Music (50). The table is clean and shows a clear trend toward music.",
      "prepare_time": 10,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "In general, most people prefer music, while sports are the least popular.",
    },
    {
      "text": "Give a brief summary of the chart.",
      // "description": "A table comparing three hobbies: Reading (40), Sports (30), Music (50). The chart highlights music as the top choice. The layout is simple and easy to interpret.",
      "prepare_time": 10,
      "record_time": 18,
      "max_score": 4,
      "sample_answer":
          "The chart shows that music is the most preferred activity among the three options.",
    },
  ];

  // === LEVEL 300+ : 3 bài lý thuyết × 3 câu = 9 câu ===
  final p4Lv300L1 = <Map<String, dynamic>>[
    {
      "text": "What can you infer from the data?",
      // "description": "A table showing the number of visitors to a tourist site over three years. Columns: 'Year' and 'Visitors (in thousands)'. Rows: 2022 (120), 2023 (180), 2024 (250). The table shows a clear upward trend with evenly spaced rows and bold headers.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "The number of visitors has increased steadily over the years, suggesting growing interest in the site.",
    },
    {
      "text": "Describe the trend in visitor numbers.",
      // "description": "A table showing yearly visitor data. Years: 2022, 2023, 2024. Visitor counts: 120k, 180k, 250k. The layout is simple and shows a consistent increase.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Visitor numbers increased steadily from 2022 to 2024, showing a positive growth trend.",
    },
    {
      "text": "What does the data suggest about popularity?",
      // "description": "A table with three years of visitor data: 2022 (120k), 2023 (180k), 2024 (250k). The format is clean and shows a clear rising pattern.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "It can be inferred that the site is becoming more popular each year.",
    },
  ];

  final p4Lv300L2 = <Map<String, dynamic>>[
    {
      "text": "Why did sales drop in Q3?",
      // "description": "A table comparing quarterly sales and advertising spending. Columns: 'Quarter', 'Sales ($)', 'Advertising ($)'. Q1: 10,000 / 2,000; Q2: 12,000 / 3,000; Q3: 9,000 / 1,000. The table shows a drop in both sales and advertising in Q3.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Sales dropped in Q3 possibly due to reduced advertising spending, which fell to \$1,000. This may have led to lower customer engagement.",
    },
    {
      "text": "What factors contributed to the change in Q3?",
      // "description": "A table showing quarterly sales and advertising budgets. Q3 shows the lowest advertising spend and a drop in sales. The layout is structured with clear numeric values.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "The drop in advertising in Q3 likely contributed to the decrease in sales, affecting customer awareness.",
    },
    {
      "text": "How did advertising impact sales?",
      // "description": "A table comparing sales and advertising across Q1–Q3. Q2 had the highest ad spend and highest sales; Q3 had the lowest ad spend and lowest sales. The table is clean and shows correlation.",
      "prepare_time": 10,
      "record_time": 20,
      "max_score": 5,
      "sample_answer":
          "Higher advertising spending in Q2 led to better sales, while reduced spending in Q3 likely caused the drop.",
    },
  ];

  final p4Lv300L3 = <Map<String, dynamic>>[
    {
      "text": "Describe the trend in revenue from 2020 to 2024.",
      // "description": "A line graph showing revenue over five years. Revenue rises from 2020 to 2022, dips slightly in 2023, then rises again in 2024. The graph has labeled axes and a smooth curve.",
      "prepare_time": 12,
      "record_time": 22,
      "max_score": 5,
      "sample_answer":
          "Revenue increased steadily from 2020 to 2022, dropped slightly in 2023, and rose again in 2024.",
    },
    {
      "text": "What does the chart show about revenue performance?",
      // "description": "A line graph with five data points from 2020 to 2024. The curve shows a peak in 2022, a dip in 2023, and recovery in 2024. The graph is labeled and visually clear.",
      "prepare_time": 12,
      "record_time": 22,
      "max_score": 5,
      "sample_answer":
          "The chart shows a positive growth trend overall, with a temporary decline in 2023.",
    },
    {
      "text": "Summarize the revenue changes over time.",
      // "description": "A line graph tracking revenue from 2020 to 2024. The graph shows a steady rise, a slight drop, and a rebound. The layout includes gridlines and year labels.",
      "prepare_time": 12,
      "record_time": 22,
      "max_score": 5,
      "sample_answer":
          "Overall, revenue grew over time with a small dip in 2023 before increasing again.",
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  /// ==== SWMaterials =====
  // lv100
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Đọc hiểu bảng thông tin đơn giản',
    questions: p4Lv100L1,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trích xuất dữ liệu cơ bản',
    questions: p4Lv100L2,
  );
  await pushLessonSW(
    levelId: 'lv100',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Trả lời câu hỏi dựa trên bảng',
    questions: p4Lv100L3,
  );

  // lv200
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: So sánh thông tin từ bảng',
    questions: p4Lv200L1,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng số liệu để trả lời',
    questions: p4Lv200L2,
  );
  await pushLessonSW(
    levelId: 'lv200',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Tóm tắt thông tin chính xác',
    questions: p4Lv200L3,
  );

  // lv300
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Phân tích và suy luận từ dữ liệu',
    questions: p4Lv300L1,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trả lời câu hỏi phức tạp',
    questions: p4Lv300L2,
  );
  await pushLessonSW(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Luyện tập với biểu đồ và bảng nâng cao',
    questions: p4Lv300L3,
  );

  /// ==== FullMaterials =====
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Đọc hiểu bảng thông tin đơn giản',
    questions: p4Lv100L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trích xuất dữ liệu cơ bản',
    questions: p4Lv100L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Trả lời câu hỏi dựa trên bảng',
    questions: p4Lv100L3,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: So sánh thông tin từ bảng',
    questions: p4Lv200L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Sử dụng số liệu để trả lời',
    questions: p4Lv200L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Tóm tắt thông tin chính xác',
    questions: p4Lv200L3,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Phân tích và suy luận từ dữ liệu',
    questions: p4Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Trả lời câu hỏi phức tạp',
    questions: p4Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Luyện tập với biểu đồ và bảng nâng cao',
    questions: p4Lv300L3,
  );
}
