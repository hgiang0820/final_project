// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart5() async {
  final db = FirebaseFirestore.instance;
  final materialId = 'LRMaterials';

  await db.collection('study_materials').doc(materialId).set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> _pushLesson({
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
        .doc('part5')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Incomplete sentences',
      'lessonName': lessonName,
      'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
      final q = questions[i];
      await lessonRef.collection('questions').doc(id).set({
        'question': q['question'],
        'imagePath': null,
        'options': q['options'],
        'correctIndex': q['correctIndex'],
        'explain': q['explain'],
        'order': i + 1,
      });
    }
  }

  // =========================
  // ===== LEVEL 300+ ========
  // =========================

  // L1 — Thì hiện tại: Present Simple vs Present Continuous
  final p5Lv300L1 = <Map<String, dynamic>>[
    {
      'question': "She usually ______ to work by bus, but today she ______ a taxi.",
      'options': ['goes / is taking', 'is going / takes', 'go / take', 'goes / takes'],
      'correctIndex': 0,
      'explain': 'Habit → present simple “goes”; happening now → present continuous “is taking”.',
    },
    {
      'question': "I can’t talk now. I ______ to a client.",
      'options': ['am talking', 'talk', 'talks', 'was talking'],
      'correctIndex': 0,
      'explain': 'Đang diễn ra hiện tại → “am talking”.',
    },
    {
      'question': "Our office ______ at 9 a.m. every day.",
      'options': ['opens', 'is opening', 'open', 'opening'],
      'correctIndex': 0,
      'explain': 'Sự thật/lịch cố định → present simple “opens”.',
    },
    {
      'question': "Listen! The manager ______ the plan now.",
      'options': ['is explaining', 'explains', 'explained', 'has explained'],
      'correctIndex': 0,
      'explain': 'Tín hiệu “Listen!” → hành động ngay lúc nói.',
    },
    {
      'question': "He ______ coffee in the morning, but he ______ tea right now.",
      'options': ['drinks / is having', 'is drinking / has', 'drink / drinks', 'drank / has'],
      'correctIndex': 0,
      'explain': 'Thói quen “drinks”; hiện tại ngay bây giờ “is having”.',
    },
    {
      'question': "They ______ in New York, but this week they ______ in Boston.",
      'options': ['live / are staying', 'are living / stay', 'lives / stay', 'live / stay'],
      'correctIndex': 0,
      'explain': 'Sống lâu dài “live”; tạm thời “are staying”.',
    },
    {
      'question': "The train ______ at 6:30 every morning.",
      'options': ['leaves', 'is leaving', 'leave', 'leaving'],
      'correctIndex': 0,
      'explain': 'Thời khóa biểu → present simple.',
    },
    {
      'question': "Be quiet. The baby ______.",
      'options': ['is sleeping', 'sleeps', 'sleep', 'sleeping'],
      'correctIndex': 0,
      'explain': 'Đang diễn ra → present continuous.',
    },
    {
      'question': "I ______ my keys. Can you help me look for them?",
      'options': ['can’t find', 'don’t finding', 'am not find', 'not finding'],
      'correctIndex': 0,
      'explain': 'Stative verb “find” → dùng simple: “can’t find”.',
    },
    {
      'question': "He ______ in sales and ______ customers every day.",
      'options': ['works / meets', 'is working / is meeting', 'work / meet', 'worked / met'],
      'correctIndex': 0,
      'explain': 'Mô tả công việc thường xuyên → present simple.',
    },
  ];

  // L2 — Danh từ & Mạo từ: a/an, the, singular/plural
  final p5Lv300L2 = <Map<String, dynamic>>[
    {
      'question': "She is ______ engineer at ______ software company.",
      'options': ['an / a', 'a / an', 'the / the', 'an / the'],
      'correctIndex': 0,
      'explain': '“engineer” bắt đầu bằng âm nguyên âm → “an”; “a software company” lần đầu nhắc.',
    },
    {
      'question': "Please put ______ boxes in ______ storage room.",
      'options': ['the / the', 'a / a', 'the / a', '— / the'],
      'correctIndex': 0,
      'explain': 'Boxes cụ thể + phòng lưu trữ xác định → “the”.',
    },
    {
      'question': "I need ______ information about the product.",
      'options': ['some', 'an', 'a', 'many'],
      'correctIndex': 0,
      'explain': '“information” không đếm được → “some information”.',
    },
    {
      'question': "There is ______ new message in ______ inbox.",
      'options': ['a / the', 'the / a', 'an / an', 'some / the'],
      'correctIndex': 0,
      'explain': 'Một tin nhắn bất kỳ + inbox xác định của bạn → a / the.',
    },
    {
      'question': "He bought ______ umbrella because it was raining.",
      'options': ['an', 'a', 'the', 'some'],
      'correctIndex': 0,
      'explain': '“umbrella” âm /ʌ/ → “an”.',
    },
    {
      'question': "We received ______ emails from clients this morning.",
      'options': ['many', 'much', 'a', 'an'],
      'correctIndex': 0,
      'explain': '“emails” đếm được số nhiều → “many”.',
    },
    {
      'question': "Could you pass me ______ salt, please?",
      'options': ['the', 'a', 'an', 'some'],
      'correctIndex': 0,
      'explain': 'Ngầm hiểu muối trên bàn → đối tượng xác định → “the salt”.',
    },
    {
      'question': "______ customer called to ask for ______ refund.",
      'options': ['A / a', 'The / a', 'A / the', 'An / the'],
      'correctIndex': 0,
      'explain': 'Lần đầu nhắc đến cả hai danh từ → “a / a”.',
    },
    {
      'question': "I couldn’t find ______ documents you requested.",
      'options': ['the', 'a', 'an', 'some'],
      'correctIndex': 0,
      'explain': 'Tài liệu được xác định bởi mệnh đề quan hệ ngầm → dùng “the”.',
    },
    {
      'question': "There are ______ chairs but only ______ table.",
      'options': ['many / one', 'much / one', 'a few / a', 'many / a'],
      'correctIndex': 0,
      'explain': '“chairs” số nhiều → many; “one table” số đếm cụ thể.',
    },
  ];

  // L3 — Giới từ at/in/on (time/place)
  final p5Lv300L3 = <Map<String, dynamic>>[
    {
      'question': "The meeting starts ______ 9 a.m. ______ Monday.",
      'options': ['at / on', 'on / at', 'in / on', 'at / in'],
      'correctIndex': 0,
      'explain': 'Giờ dùng “at”; ngày trong tuần dùng “on”.',
    },
    {
      'question': "Her office is ______ the second floor ______ the main building.",
      'options': ['on / in', 'in / on', 'at / in', 'on / at'],
      'correctIndex': 0,
      'explain': 'Tầng → “on”; tòa nhà → “in”.',
    },
    {
      'question': "We usually have a team lunch ______ Fridays.",
      'options': ['on', 'at', 'in', '—'],
      'correctIndex': 0,
      'explain': 'Ngày trong tuần → “on Fridays”.',
    },
    {
      'question': "The store closes ______ midnight.",
      'options': ['at', 'on', 'in', 'by'],
      'correctIndex': 0,
      'explain': '“at midnight”.',
    },
    {
      'question': "I’ll see you ______ the lobby ______ noon.",
      'options': ['in / at', 'at / at', 'on / at', 'in / on'],
      'correctIndex': 0,
      'explain': 'Không gian kín → “in the lobby”; thời điểm → “at noon”.',
    },
    {
      'question': "Our company was founded ______ 2005.",
      'options': ['in', 'on', 'at', 'by'],
      'correctIndex': 0,
      'explain': 'Năm → “in 2005”.',
    },
    {
      'question': "There’s a café ______ the corner ______ the street.",
      'options': ['on / of', 'at / of', 'in / of', 'on / in'],
      'correctIndex': 0,
      'explain': '“on the corner of the street”.',
    },
    {
      'question': "Her birthday is ______ June 3rd.",
      'options': ['on', 'in', 'at', 'by'],
      'correctIndex': 0,
      'explain': 'Ngày cụ thể → “on”.',
    },
    {
      'question': "He arrived ______ the airport early ______ the morning.",
      'options': ['at / in', 'in / at', 'on / in', 'at / on'],
      'correctIndex': 0,
      'explain': 'Địa điểm điểm đến → “at the airport”; buổi sáng → “in the morning”.',
    },
    {
      'question': "The keys are ______ the desk, not ______ the drawer.",
      'options': ['on / in', 'in / on', 'at / in', 'on / at'],
      'correctIndex': 0,
      'explain': 'Bề mặt “on”; bên trong “in”.',
    },
  ];

  // L4 — Đại từ: subject & possessive adjectives
  final p5Lv300L4 = <Map<String, dynamic>>[
    {
      'question': "Tom and Anna are from Italy. ______ are designers.",
      'options': ['They', 'He', 'She', 'We'],
      'correctIndex': 0,
      'explain': 'Chủ ngữ số nhiều → “They”.',
    },
    {
      'question': "I can’t find ______ keys. Have you seen them?",
      'options': ['my', 'mine', 'me', 'our'],
      'correctIndex': 0,
      'explain': 'Tính từ sở hữu + danh từ → “my keys”.',
    },
    {
      'question': "Is this ______ laptop or ______?",
      'options': ['your / his', 'yours / his', 'your / he', 'you / his'],
      'correctIndex': 0,
      'explain': '“your laptop” + “his” thay cho “his laptop”.',
    },
    {
      'question': "Jenny loves ______ job because ______ team is supportive.",
      'options': ['her / her', 'hers / her', 'she / her', 'her / she'],
      'correctIndex': 0,
      'explain': '“her job”; “her team”.',
    },
    {
      'question': "We’ll bring ______ documents to the meeting.",
      'options': ['our', 'ours', 'us', 'we'],
      'correctIndex': 0,
      'explain': 'Tính từ sở hữu + danh từ: “our documents”.',
    },
    {
      'question': "Mr. Lee said ______ would call back later.",
      'options': ['he', 'him', 'his', 'they'],
      'correctIndex': 0,
      'explain': 'Chủ ngữ của “would call” → “he”.',
    },
    {
      'question': "Is this seat ______?",
      'options': ['yours', 'your', 'you', 'yourself'],
      'correctIndex': 0,
      'explain': 'Đại từ sở hữu đứng một mình → “yours”.',
    },
    {
      'question': "The team finished ______ project ahead of schedule.",
      'options': ['their', 'theirs', 'them', 'they'],
      'correctIndex': 0,
      'explain': 'Tính từ sở hữu + danh từ → “their project”.',
    },
    {
      'question': "I’ll email ______ as soon as I get the file.",
      'options': ['you', 'your', 'yours', 'yourself'],
      'correctIndex': 0,
      'explain': 'Tân ngữ → “email you”.',
    },
    {
      'question': "This is my seat, and that one is ______.",
      'options': ['yours', 'your', 'you', 'their'],
      'correctIndex': 0,
      'explain': 'Đại từ sở hữu thay cho “your seat”.',
    },
  ];

  // L5 — Ôn tập tổng hợp (300+)
  final p5Lv300L5 = <Map<String, dynamic>>[
    {
      'question': "She ______ to the gym on Tuesdays, but she ______ yoga right now.",
      'options': ['goes / is doing', 'is going / does', 'go / does', 'goes / does'],
      'correctIndex': 0,
      'explain': 'Habit vs now: goes / is doing.',
    },
    {
      'question': "Could you pass me ______ stapler on ______ desk?",
      'options': ['the / the', 'a / the', 'the / a', 'an / the'],
      'correctIndex': 0,
      'explain': 'Đều đã xác định → “the stapler … the desk”.',
    },
    {
      'question': "The conference is ______ September 12 ______ 2 p.m.",
      'options': ['on / at', 'in / at', 'at / on', 'on / in'],
      'correctIndex': 0,
      'explain': 'Ngày → on; giờ → at.',
    },
    {
      'question': "Is this umbrella ______?",
      'options': ['yours', 'your', 'you', 'their'],
      'correctIndex': 0,
      'explain': 'Đại từ sở hữu đứng một mình.',
    },
    {
      'question': "Our office ______ at 8:30. Please arrive ______ time.",
      'options': ['opens / on', 'is opening / in', 'open / at', 'opens / at'],
      'correctIndex': 0,
      'explain': '“opens” (simple); cụm cố định “on time”.',
    },
    {
      'question': "There are ______ chairs but not ______ projector.",
      'options': ['many / a', 'much / a', 'many / the', 'some / any'],
      'correctIndex': 0,
      'explain': 'Đếm được số nhiều → many; “a projector” số ít.',
    },
    {
      'question': "I’ll meet you ______ the lobby ______ noon.",
      'options': ['in / at', 'at / on', 'on / at', 'in / on'],
      'correctIndex': 0,
      'explain': 'in the lobby; at noon.',
    },
    {
      'question': "He ______ lunch now, so he can’t answer the phone.",
      'options': ['is having', 'has', 'have', 'had'],
      'correctIndex': 0,
      'explain': 'Hành động đang diễn ra → “is having”.',
    },
    {
      'question': "Please give this to ______ assistant.",
      'options': ['my', 'me', 'mine', 'I'],
      'correctIndex': 0,
      'explain': 'Tính từ sở hữu + danh từ: my assistant.',
    },
    {
      'question': "The meeting is ______ Room 402 ______ Friday.",
      'options': ['in / on', 'at / in', 'on / at', 'in / at'],
      'correctIndex': 0,
      'explain': 'Phòng → in; thứ → on.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // L1 — Thì quá khứ & tương lai: Past Simple & Future Simple
  final p5Lv600L1 = <Map<String, dynamic>>[
    {
      'question': "We ______ the contract yesterday, and we ______ the kickoff next Monday.",
      'options': ['signed / will hold', 'sign / hold', 'were signing / hold', 'had signed / hold'],
      'correctIndex': 0,
      'explain': '“yesterday” → past simple; kế hoạch tương lai → “will hold”.',
    },
    {
      'question': "He ______ late, so I ______ a taxi for him.",
      'options': ['arrived / called', 'arrives / call', 'was arriving / call', 'had arrived / am calling'],
      'correctIndex': 0,
      'explain': 'Hành động quá khứ nối tiếp → past simple.',
    },
    {
      'question': "I think it ______ rain this afternoon.",
      'options': ['will', 'is', 'was', 'has'],
      'correctIndex': 0,
      'explain': 'Dự đoán → “will rain”.',
    },
    {
      'question': "We ______ a workshop last week to train new staff.",
      'options': ['held', 'hold', 'are holding', 'will hold'],
      'correctIndex': 0,
      'explain': 'Tuần trước → past simple “held”.',
    },
    {
      'question': "Don’t worry. I ______ you as soon as I arrive.",
      'options': ['will call', 'called', 'am calling', 'call'],
      'correctIndex': 0,
      'explain': 'Lời hứa/tức thì → “will call”.',
    },
    {
      'question': "We ______ the report on Friday and ______ feedback next week.",
      'options': ['sent / will receive', 'send / receive', 'were sending / receive', 'had sent / received'],
      'correctIndex': 0,
      'explain': 'Thứ sáu (quá khứ) + tương lai tuần sau.',
    },
    {
      'question': "The flight ______ on time, but the bus ______ late.",
      'options': ['arrived / was', 'arrives / is', 'arrived / is', 'was arriving / is'],
      'correctIndex': 0,
      'explain': 'Cả hai quá khứ → arrived / was late.',
    },
    {
      'question': "I ______ the file to you later today.",
      'options': ['will send', 'sent', 'am sending', 'send'],
      'correctIndex': 0,
      'explain': 'Hành động tương lai gần quyết định lúc nói → “will send”.',
    },
    {
      'question': "We ______ a new supplier last quarter.",
      'options': ['chose', 'choose', 'will choose', 'are choosing'],
      'correctIndex': 0,
      'explain': 'Last quarter → past simple.',
    },
    {
      'question': "He says he ______ the meeting if it runs late.",
      'options': ['will leave', 'leaves', 'left', 'is leaving'],
      'correctIndex': 0,
      'explain': 'Mệnh đề tương lai phụ thuộc → “will leave”.',
    },
  ];

  // L2 — So sánh: Comparatives & Superlatives
  final p5Lv600L2 = <Map<String, dynamic>>[
    {
      'question': "This model is ______ than the old one.",
      'options': ['faster', 'fastest', 'more fast', 'the most fast'],
      'correctIndex': 0,
      'explain': 'So sánh hơn của “fast” → faster.',
    },
    {
      'question': "He is the ______ salesperson in our team.",
      'options': ['best', 'better', 'good', 'more good'],
      'correctIndex': 0,
      'explain': 'So sánh nhất của “good” → best.',
    },
    {
      'question': "Our prices are ______ than theirs.",
      'options': ['lower', 'lowest', 'more low', 'the most low'],
      'correctIndex': 0,
      'explain': 'Comparative → lower.',
    },
    {
      'question': "This is the ______ project we’ve done this year.",
      'options': ['biggest', 'bigger', 'more big', 'the more big'],
      'correctIndex': 0,
      'explain': 'Superlative → biggest.',
    },
    {
      'question': "The new software is ______ to use than the old one.",
      'options': ['easier', 'more easy', 'easiest', 'easyer'],
      'correctIndex': 0,
      'explain': 'Comparative của “easy” → easier.',
    },
    {
      'question': "Among the three designs, this one is the ______.",
      'options': ['most creative', 'more creative', 'creative', 'creativest'],
      'correctIndex': 0,
      'explain': 'So sánh nhất: most + adj dài.',
    },
    {
      'question': "Her presentation was ______ than mine.",
      'options': ['more engaging', 'most engaging', 'engagingest', 'engagier'],
      'correctIndex': 0,
      'explain': 'Comparative: more + adj dài.',
    },
    {
      'question': "This route is ______ but ______.",
      'options': ['shorter / busier', 'short / busier', 'shortest / busy', 'more short / busier'],
      'correctIndex': 0,
      'explain': 'Cả hai so sánh hơn: shorter / busier.',
    },
    {
      'question': "January is ______ month for sales in our region.",
      'options': ['the slowest', 'slower', 'slow', 'more slow'],
      'correctIndex': 0,
      'explain': 'Superlative với the.',
    },
    {
      'question': "She speaks ______ English than I do.",
      'options': ['more fluent', 'more fluently', 'fluenter', 'fluentlier'],
      'correctIndex': 1,
      'explain': 'Cần trạng từ → more fluently.',
    },
  ];

  // L3 — Conditional Type 1 (If + present, will + V)
  final p5Lv600L3 = <Map<String, dynamic>>[
    {
      'question': "If it ______ tomorrow, we ______ the outdoor event.",
      'options': ['rains / will cancel', 'will rain / cancel', 'rains / cancel', 'rain / will cancel'],
      'correctIndex': 0,
      'explain': 'Type 1: If + present, will + V.',
    },
    {
      'question': "If you ______ early, I ______ you the report.",
      'options': ['arrive / will show', 'will arrive / show', 'arrives / show', 'arrived / would show'],
      'correctIndex': 0,
      'explain': 'arrive (present) + will show.',
    },
    {
      'question': "We ______ a discount if you ______ 50 units.",
      'options': ['will offer / order', 'offer / will order', 'offered / order', 'will offer / will order'],
      'correctIndex': 0,
      'explain': 'Main clause “will offer”; if-clause present “order”.',
    },
    {
      'question': "If the room ______ full, we ______ a bigger one.",
      'options': ['is / will book', 'will be / book', 'was / would book', 'is / book'],
      'correctIndex': 0,
      'explain': 'is (present) + will book.',
    },
    {
      'question': "If you ______ the form, we ______ processing today.",
      'options': ['submit / will start', 'will submit / start', 'submitted / would start', 'submit / start'],
      'correctIndex': 0,
      'explain': 'Type 1 chuẩn.',
    },
    {
      'question': "If the price ______ too high, customers ______ away.",
      'options': ['is / will go', 'will be / go', 'was / would go', 'is / go'],
      'correctIndex': 0,
      'explain': 'is + will go.',
    },
    {
      'question': "We ______ late if the taxi ______ soon.",
      'options': ['will be / doesn’t arrive', 'are / won’t arrive', 'would be / didn’t arrive', 'will be / isn’t arrived'],
      'correctIndex': 0,
      'explain': 'will be + if present negative “doesn’t arrive”.',
    },
    {
      'question': "If you ______ any questions, please ______ us.",
      'options': ['have / contact', 'will have / will contact', 'had / contacted', 'have / will contact'],
      'correctIndex': 0,
      'explain': 'Mệnh lệnh/đề nghị → If + present, (imperative) contact.',
    },
    {
      'question': "If we ______ the 9 a.m. train, we ______ by noon.",
      'options': ['take / will arrive', 'took / would arrive', 'will take / arrive', 'take / arrive'],
      'correctIndex': 0,
      'explain': 'Type 1 cơ bản.',
    },
    {
      'question': "You ______ the bonus if you ______ all targets.",
      'options': ['will get / meet', 'get / will meet', 'would get / met', 'will get / will meet'],
      'correctIndex': 0,
      'explain': 'will get + if present “meet”.',
    },
  ];

  // L4 — Passive Voice (be + V3)
  final p5Lv600L4 = <Map<String, dynamic>>[
    {
      'question': "The report ______ by Ms. Kim yesterday.",
      'options': ['was written', 'is written', 'has written', 'wrote'],
      'correctIndex': 0,
      'explain': 'Quá khứ bị động: was + V3.',
    },
    {
      'question': "All orders ______ within 24 hours.",
      'options': ['are shipped', 'were shipped', 'ship', 'are shipping'],
      'correctIndex': 0,
      'explain': 'Sự thật chung → hiện tại bị động “are shipped”.',
    },
    {
      'question': "The meeting room ______ for maintenance tomorrow.",
      'options': ['will be closed', 'is closing', 'was closed', 'has closed'],
      'correctIndex': 0,
      'explain': 'Tương lai bị động: will be + V3.',
    },
    {
      'question': "Customer data ______ carefully.",
      'options': ['is stored', 'stores', 'was store', 'is storing'],
      'correctIndex': 0,
      'explain': 'Bị động hiện tại đơn.',
    },
    {
      'question': "The tickets ______ online only.",
      'options': ['are sold', 'sell', 'were sold', 'are selling'],
      'correctIndex': 0,
      'explain': 'are sold (bị động).',
    },
    {
      'question': "A new policy ______ last week.",
      'options': ['was announced', 'is announcing', 'announced', 'has announce'],
      'correctIndex': 0,
      'explain': 'was + V3.',
    },
    {
      'question': "Snacks ______ at the back of the hall.",
      'options': ['are provided', 'provide', 'were provide', 'are providing'],
      'correctIndex': 0,
      'explain': 'are provided (bị động).',
    },
    {
      'question': "The documents ______ to all participants tomorrow.",
      'options': ['will be sent', 'are sending', 'sent', 'have sent'],
      'correctIndex': 0,
      'explain': 'will be sent (tương lai bị động).',
    },
    {
      'question': "The devices ______ before shipment.",
      'options': ['are tested', 'test', 'were testing', 'are testing'],
      'correctIndex': 0,
      'explain': 'are tested (hiện tại bị động).',
    },
    {
      'question': "The room ______ when we arrived.",
      'options': ['was being cleaned', 'is cleaned', 'has been clean', 'cleaned'],
      'correctIndex': 0,
      'explain': 'Quá khứ tiếp diễn bị động → was being + V3.',
    },
  ];

  // L5 — Ôn tập tổng hợp (600+)
  final p5Lv600L5 = <Map<String, dynamic>>[
    {
      'question': "If you ______ the form today, we ______ your account tomorrow.",
      'options': ['submit / will activate', 'submitted / would activate', 'will submit / activate', 'submit / activate'],
      'correctIndex': 0,
      'explain': 'Type 1.',
    },
    {
      'question': "Last year our costs were ______ than expected.",
      'options': ['higher', 'highest', 'more high', 'the most high'],
      'correctIndex': 0,
      'explain': 'Comparative → higher.',
    },
    {
      'question': "The invoice ______ by finance on Friday.",
      'options': ['was approved', 'approved', 'is approving', 'has approve'],
      'correctIndex': 0,
      'explain': 'Past passive.',
    },
    {
      'question': "We ______ the prototype last week and we ______ feedback soon.",
      'options': ['sent / will receive', 'send / receive', 'were sending / receive', 'had sent / received'],
      'correctIndex': 0,
      'explain': 'Past + future.',
    },
    {
      'question': "This option is the ______ for small teams.",
      'options': ['most efficient', 'more efficient', 'efficientest', 'very efficient'],
      'correctIndex': 0,
      'explain': 'Superlative.',
    },
    {
      'question': "If it ______ again, we ______ the deadline.",
      'options': ['rains / will extend', 'will rain / extend', 'rained / would extend', 'rains / extend'],
      'correctIndex': 0,
      'explain': 'Type 1.',
    },
    {
      'question': "The new policy ______ to all staff next week.",
      'options': ['will be announced', 'is announcing', 'announces', 'was announce'],
      'correctIndex': 0,
      'explain': 'Future passive.',
    },
    {
      'question': "We think the price ______ increase next quarter.",
      'options': ['will', 'was', 'has', 'is'],
      'correctIndex': 0,
      'explain': 'Dự đoán → will increase.',
    },
    {
      'question': "Our results are ______ than last quarter.",
      'options': ['better', 'best', 'more good', 'gooder'],
      'correctIndex': 0,
      'explain': 'Comparative of good → better.',
    },
    {
      'question': "All tickets ______ online only this year.",
      'options': ['are sold', 'sell', 'are selling', 'were sell'],
      'correctIndex': 0,
      'explain': 'Present passive.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // L1 — Mệnh đề quan hệ: who/which/that/where
  final p5Lv800L1 = <Map<String, dynamic>>[
    {
      'question': "The manager ______ leads the team is on leave.",
      'options': ['who', 'which', 'where', 'whom'],
      'correctIndex': 0,
      'explain': 'Người làm chủ ngữ → who.',
    },
    {
      'question': "This is the software ______ we discussed yesterday.",
      'options': ['that', 'who', 'where', 'whom'],
      'correctIndex': 0,
      'explain': 'Vật → that/which. Chọn “that”.',
    },
    {
      'question': "The office ______ I work has a great view.",
      'options': ['where', 'who', 'which', 'that'],
      'correctIndex': 0,
      'explain': 'Nơi chốn → where.',
    },
    {
      'question': "The client, ______ proposal we accepted, is from Canada.",
      'options': ['whose', 'who', 'whom', 'which'],
      'correctIndex': 0,
      'explain': 'Sở hữu → whose.',
    },
    {
      'question': "The laptop ______ I bought last week is on sale now.",
      'options': ['that', 'who', 'whom', 'where'],
      'correctIndex': 0,
      'explain': 'Vật → that/which.',
    },
    {
      'question': "Do you know the restaurant ______ serves vegan dishes?",
      'options': ['that', 'who', 'whom', 'whose'],
      'correctIndex': 0,
      'explain': 'That + V miêu tả vật.',
    },
    {
      'question': "Our team needs people ______ can code and design.",
      'options': ['who', 'which', 'where', 'whom'],
      'correctIndex': 0,
      'explain': 'Người làm chủ ngữ.',
    },
    {
      'question': "The file ______ you sent is corrupted.",
      'options': ['which', 'who', 'whom', 'where'],
      'correctIndex': 0,
      'explain': 'Vật tân ngữ → which/that.',
    },
    {
      'question': "That’s the reason ______ we changed suppliers.",
      'options': ['why', 'which', 'where', 'who'],
      'correctIndex': 0,
      'explain': 'Reason → why.',
    },
    {
      'question': "The city ______ our conference was held is beautiful.",
      'options': ['where', 'which', 'who', 'whom'],
      'correctIndex': 0,
      'explain': 'Nơi diễn ra → where.',
    },
  ];

  // L2 — Điều kiện loại 2 & 3
  final p5Lv800L2 = <Map<String, dynamic>>[
    {
      'question': "If I ______ more time, I ______ the report (but I don’t).",
      'options': ['had / would finish', 'have / will finish', 'had / will finish', 'have / would finish'],
      'correctIndex': 0,
      'explain': 'Type 2: If + past, would + V.',
    },
    {
      'question': "If they had left earlier, they ______ the flight.",
      'options': ['would have caught', 'would catch', 'caught', 'will catch'],
      'correctIndex': 0,
      'explain': 'Type 3: If + had + V3 → would have + V3.',
    },
    {
      'question': "I ______ you if I ______ your number.",
      'options': ['would call / had', 'will call / had', 'would have called / have', 'called / had'],
      'correctIndex': 0,
      'explain': 'Type 2 giả định hiện tại.',
    },
    {
      'question': "If we ______ the warning, we ______ the system (but we didn’t).",
      'options': ['had noticed / would have fixed', 'noticed / would fix', 'had noticed / would fix', 'notice / will fix'],
      'correctIndex': 0,
      'explain': 'Type 3 (quá khứ không có thật).',
    },
    {
      'question': "If I ______ you, I ______ a different supplier.",
      'options': ['were / would choose', 'was / would choose', 'am / will choose', 'had been / would have choose'],
      'correctIndex': 0,
      'explain': 'Câu điều kiện giả định → If I were you.',
    },
    {
      'question': "We ______ the deal if we ______ the budget last month.",
      'options': ['would have closed / had increased', 'would close / increased', 'will close / increase', 'closed / had increased'],
      'correctIndex': 0,
      'explain': 'Type 3.',
    },
    {
      'question': "If she ______ here, she ______ the issue quickly.",
      'options': ['were / would handle', 'was / would handle', 'had been / would handle', 'is / will handle'],
      'correctIndex': 0,
      'explain': 'Type 2 (giả định hiện tại).',
    },
    {
      'question': "If you had told me, I ______ you (but you didn’t).",
      'options': ['would have helped', 'would help', 'helped', 'will help'],
      'correctIndex': 0,
      'explain': 'Type 3.',
    },
    {
      'question': "If the weather ______ better, we ______ a picnic.",
      'options': ['were / would have', 'was / would have', 'had been / would have had', 'were / will have'],
      'correctIndex': 2,
      'explain': 'Type 3 với quá khứ → had been / would have had.',
    },
    {
      'question': "He ______ earlier if he ______ about the traffic.",
      'options': ['would have left / had known', 'would leave / knew', 'left / knows', 'will leave / knows'],
      'correctIndex': 0,
      'explain': 'Type 3.',
    },
  ];

  // L3 — Đảo ngữ (Hardly/No sooner/Only if…)
  final p5Lv800L3 = <Map<String, dynamic>>[
    {
      'question': "Hardly ______ the meeting started ______ the fire alarm rang.",
      'options': ['had / when', 'have / when', 'had / than', 'did / when'],
      'correctIndex': 0,
      'explain': 'Cấu trúc: Hardly had S + V3 when…',
    },
    {
      'question': "No sooner ______ the report ______ the manager asked for changes.",
      'options': ['had he submitted / than', 'he submitted / when', 'had he submitted / when', 'did he submit / than'],
      'correctIndex': 0,
      'explain': 'No sooner had S + V3 than…',
    },
    {
      'question': "Only if you ______ the fee ______ we process the application.",
      'options': ['pay / will', 'will pay / will', 'paid / would', 'pay / do'],
      'correctIndex': 3,
      'explain': 'Only if + clause → đảo ngữ: Only if you pay do we process…',
    },
    {
      'question': "Rarely ______ such a strong response from users.",
      'options': ['do we receive', 'we receive', 'are we receiving', 'we are receiving'],
      'correctIndex': 0,
      'explain': 'Trạng từ tiêu cực đầu câu → đảo trợ động từ.',
    },
    {
      'question': "Seldom ______ deliveries arrive ahead of schedule.",
      'options': ['do', 'does', 'are', 'have'],
      'correctIndex': 1,
      'explain': 'Chủ ngữ “deliveries” (số nhiều) → nhưng đảo với “seldom” cần trợ “do/does”; sai bẫy. Chủ ngữ là “deliveries” → “do” mới đúng. (Chỉnh) ',
    },
  ];
  // chỉnh lại câu 5 cho đúng chủ ngữ số nhiều
  p5Lv800L3[4] = {
    'question': "Seldom ______ deliveries arrive ahead of schedule.",
    'options': ['do', 'does', 'are', 'have'],
    'correctIndex': 0,
    'explain': 'Plural “deliveries” → “do”.',
  };

  p5Lv800L3.addAll([
    {
      'question': "Little ______ we know about the final budget.",
      'options': ['do', 'are', 'have', 'did'],
      'correctIndex': 0,
      'explain': 'Little + đảo ngữ hiện tại → “do we know”.',
    },
    {
      'question': "Only after the audit ______ the errors obvious.",
      'options': ['were', 'was', 'did', 'had'],
      'correctIndex': 2,
      'explain': 'Only after + time → đảo “did … become” (động từ chính implied).',
    },
    {
      'question': "Not until 2026 ______ production resume.",
      'options': ['will', 'does', 'did', 'has'],
      'correctIndex': 0,
      'explain': 'Not until + time → “will production resume”.',
    },
    {
      'question': "Under no circumstances ______ personal data be shared externally.",
      'options': ['should', 'must', 'would', 'could'],
      'correctIndex': 0,
      'explain': 'Đảo ngữ mệnh lệnh/khuyến cáo: “should … be shared”.',
    },
  ]);

  // L4 — Cấu trúc nâng cao: It is ... that / If I were you / (đảo ngữ dạng rút gọn)
  final p5Lv800L4 = <Map<String, dynamic>>[
    {
      'question': "It was ______ we met at the conference last year.",
      'options': ['there that', 'her that', 'she whom', 'she that'],
      'correctIndex': 3,
      'explain': 'Cleft sentence: It was she that… (trong văn nói dùng “her” nhưng trang trọng là “she that”).',
    },
    {
      'question': "If I ______ you, I ______ ask for a deadline extension.",
      'options': ['were / would', 'was / will', 'am / would', 'were / will'],
      'correctIndex': 0,
      'explain': 'Cấu trúc khuyên nhủ: If I were you, I would…',
    },
    {
      'question': "It is ______ teamwork that drives our success.",
      'options': ['effective', 'effectively', 'effectiveness', 'more effective'],
      'correctIndex': 0,
      'explain': 'Bổ nghĩa danh từ “teamwork” → tính từ “effective”.',
    },
    {
      'question': "Had I ______ the risk, I ______ invested less.",
      'options': ['known / would have', 'knew / would', 'known / will have', 'know / would have'],
      'correctIndex': 0,
      'explain': 'Đảo “Had I known …, I would have …”.',
    },
    {
      'question': "It was not until midnight that the team ______ the bug.",
      'options': ['found', 'had found', 'was found', 'finds'],
      'correctIndex': 0,
      'explain': 'Not until + past time → past simple “found”.',
    },
    {
      'question': "Were the price lower, more customers ______ interested.",
      'options': ['would be', 'will be', 'are', 'were'],
      'correctIndex': 0,
      'explain': 'Đảo điều kiện loại 2: Were + subject…, would….',
    },
    {
      'question': "It is ______ innovation that sets this brand apart.",
      'options': ['continuous', 'continuously', 'continuity', 'to continue'],
      'correctIndex': 0,
      'explain': 'Tính từ miêu tả danh từ “innovation”.',
    },
    {
      'question': "Should you ______ any issues, contact support.",
      'options': ['experience', 'experienced', 'to experience', 'experiencing'],
      'correctIndex': 0,
      'explain': 'Đảo với “Should” + V nguyên mẫu.',
    },
    {
      'question': "No sooner ______ the app launched than reviews poured in.",
      'options': ['had', 'did', 'was', 'has'],
      'correctIndex': 0,
      'explain': 'No sooner had … than …',
    },
    {
      'question': "It was ______ 2019 that we opened the Tokyo office.",
      'options': ['in', 'on', 'at', 'since'],
      'correctIndex': 0,
      'explain': 'Cụm năm dùng “in 2019”.',
    },
  ];

  // L5 — Ôn tập tổng hợp (800+)
  final p5Lv800L5 = <Map<String, dynamic>>[
    {
      'question': "If they ______ the terms, we ______ the agreement last week.",
      'options': ['had accepted / would have signed', 'accepted / would sign', 'accept / will sign', 'were accepting / would have signed'],
      'correctIndex': 0,
      'explain': 'Type 3.',
    },
    {
      'question': "Only after the upgrade ______ the system stable.",
      'options': ['was', 'did become', 'had become', 'has become'],
      'correctIndex': 1,
      'explain': 'Only after… → đảo “did + V”.',
    },
    {
      'question': "The engineer ______ designed the tool joined last month.",
      'options': ['who', 'whom', 'which', 'where'],
      'correctIndex': 0,
      'explain': 'Người làm chủ ngữ → who.',
    },
    {
      'question': "Had we ______ the forecast, we ______ stock earlier.",
      'options': ['seen / would have ordered', 'see / will order', 'saw / would order', 'seen / would order'],
      'correctIndex': 0,
      'explain': 'Đảo điều kiện loại 3.',
    },
    {
      'question': "It is ______ communication that the project needs most.",
      'options': ['clear', 'clearly', 'clarity', 'clearing'],
      'correctIndex': 0,
      'explain': 'Tính từ bổ nghĩa danh từ “communication”.',
    },
    {
      'question': "No sooner ______ we launched than demand exceeded supply.",
      'options': ['had', 'did', 'were', 'has'],
      'correctIndex': 0,
      'explain': 'No sooner had … than …',
    },
    {
      'question': "If I ______ you, I ______ renegotiate the deadline.",
      'options': ['were / would', 'was / will', 'were / will', 'am / would'],
      'correctIndex': 0,
      'explain': 'If I were you, I would…',
    },
    {
      'question': "The city ______ we held our summit was extremely welcoming.",
      'options': ['where', 'which', 'that', 'when'],
      'correctIndex': 0,
      'explain': 'Nơi chốn → where.',
    },
    {
      'question': "Hardly ______ he started speaking ______ the lights went out.",
      'options': ['had / when', 'did / than', 'had / than', 'has / when'],
      'correctIndex': 0,
      'explain': 'Hardly had … when …',
    },
    {
      'question': "It was ______ the CEO that the announcement came.",
      'options': ['from', 'by', 'with', 'through'],
      'correctIndex': 0,
      'explain': 'Cụm cố định “It was from X that …” nhấn nguồn tin.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  // lv300
  await _pushLesson(levelId: 'lv300', lessonId: 'lesson1', lessonName: 'Bài 1: Thì hiện tại', questions: p5Lv300L1);
  await _pushLesson(levelId: 'lv300', lessonId: 'lesson2', lessonName: 'Bài 2: Danh từ & Mạo từ', questions: p5Lv300L2);
  await _pushLesson(levelId: 'lv300', lessonId: 'lesson3', lessonName: 'Bài 3: Giới từ cơ bản', questions: p5Lv300L3);
  await _pushLesson(levelId: 'lv300', lessonId: 'lesson4', lessonName: 'Bài 4: Đại từ', questions: p5Lv300L4);
  await _pushLesson(levelId: 'lv300', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p5Lv300L5);

  // lv600
  await _pushLesson(levelId: 'lv600', lessonId: 'lesson1', lessonName: 'Bài 1: Thì quá khứ & tương lai', questions: p5Lv600L1);
  await _pushLesson(levelId: 'lv600', lessonId: 'lesson2', lessonName: 'Bài 2: So sánh', questions: p5Lv600L2);
  await _pushLesson(levelId: 'lv600', lessonId: 'lesson3', lessonName: 'Bài 3: Câu điều kiện loại 1', questions: p5Lv600L3);
  await _pushLesson(levelId: 'lv600', lessonId: 'lesson4', lessonName: 'Bài 4: Câu bị động', questions: p5Lv600L4);
  await _pushLesson(levelId: 'lv600', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p5Lv600L5);

  // lv800
  await _pushLesson(levelId: 'lv800', lessonId: 'lesson1', lessonName: 'Bài 1: Mệnh đề quan hệ', questions: p5Lv800L1);
  await _pushLesson(levelId: 'lv800', lessonId: 'lesson2', lessonName: 'Bài 2: Điều kiện loại 2 & 3', questions: p5Lv800L2);
  await _pushLesson(levelId: 'lv800', lessonId: 'lesson3', lessonName: 'Bài 3: Đảo ngữ', questions: p5Lv800L3);
  await _pushLesson(levelId: 'lv800', lessonId: 'lesson4', lessonName: 'Bài 4: Cấu trúc nâng cao', questions: p5Lv800L4);
  await _pushLesson(levelId: 'lv800', lessonId: 'lesson5', lessonName: 'Bài 5: Ôn tập tổng hợp', questions: p5Lv800L5);
}
