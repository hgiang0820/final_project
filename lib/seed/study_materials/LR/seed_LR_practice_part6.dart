// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';

final supabase = Supabase.instance.client;

Future<void> seedLRPracticePart6() async {
  final db = FirebaseFirestore.instance;
  // final materialId = 'LRMaterials';

  await db.collection('study_materials').doc('LRMaterials').set({
    'title': 'Listening & Reading Materials',
    'levels': ['lv300', 'lv600', 'lv800'],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  Future<void> pushLessonLR({
    required String levelId,
    required String lessonId,
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc('LRMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('part6')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Text completion',
      'lessonName': lessonName,
      'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
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

  Future<void> pushLessonFull({
    required String levelId,
    required String lessonId, // lesson1..lesson5
    required String lessonName,
    required List<Map<String, dynamic>> questions,
  }) async {
    final lessonRef = db
        .collection('study_materials')
        .doc('FullMaterials')
        .collection('levels')
        .doc(levelId)
        .collection('parts')
        .doc('read2')
        .collection('lessons')
        .doc(lessonId);

    await lessonRef.set({
      'type': 'Text completion',
      'lessonName': lessonName,
      'audioPath': null,
      'questionCount': questions.length,
    }, SetOptions(merge: true));

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final id = 'q${(i + 1).toString().padLeft(2, '0')}';
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

  // L1 — Hoàn thành đoạn văn ngắn (chủ đề cơ bản)
  final p6Lv300L1 = <Map<String, dynamic>>[
    {
      'question':
          "Company Notice:\nOur office cafeteria opens at 8:00 a.m. and closes at 3:00 p.m. Please ______ your trays on the return rack after eating to keep the area clean.",
      'options': ['place', 'placing', 'placed', 'places'],
      'correctIndex': 0,
      'explain': 'Sau “please” dùng V nguyên mẫu: “please place”.',
    },
    {
      'question':
          "Message:\nHi team, the weekly meeting will be held in Room 302. Please arrive ______ time so we can start promptly.",
      'options': ['on', 'at', 'in', 'by'],
      'correctIndex': 0,
      'explain': 'Cụm cố định: “on time”.',
    },
    {
      'question':
          "Flyer:\nJoin our fitness class every Tuesday evening. The instructor ______ beginners and advanced participants.",
      'options': ['welcomes', 'welcome', 'welcoming', 'to welcome'],
      'correctIndex': 0,
      'explain': 'Chủ ngữ “instructor” số ít → “welcomes”.',
    },
    {
      'question':
          "Announcement:\nThe 10:30 train to Lakeside is delayed due to maintenance. We ______ for the inconvenience.",
      'options': ['apologize', 'apology', 'apologizing', 'apologized'],
      'correctIndex': 0,
      'explain': 'Cần động từ hiện tại đơn: “we apologize”.',
    },
    {
      'question':
          "Note:\nPlease do not use the main entrance. The door is ______ repair until noon.",
      'options': ['under', 'on', 'at', 'for'],
      'correctIndex': 0,
      'explain': 'Cụm cố định: “under repair”.',
    },
    {
      'question':
          "Email:\nHi Nora, thanks for your order. We will ______ the package tomorrow morning.",
      'options': ['ship', 'shipping', 'ships', 'to ship'],
      'correctIndex': 0,
      'explain': 'Sau “will” dùng V nguyên mẫu: “will ship”.',
    },
    {
      'question':
          "Poster:\nLibrary Rules — Please keep your voice ______ and silence your phone.",
      'options': ['low', 'lower', 'lowest', 'downer'],
      'correctIndex': 0,
      'explain': 'Tính từ mô tả mức độ: “keep your voice low”.',
    },
    {
      'question':
          "Memo:\nThe receptionist is out today. For urgent requests, contact Mr. Perez ______ extension 204.",
      'options': ['at', 'on', 'in', 'to'],
      'correctIndex': 0,
      'explain': '“at extension + số”.',
    },
    {
      'question':
          "Sign:\nEmployees must wear their ID badges ______ work hours.",
      'options': ['during', 'while', 'for', 'at'],
      'correctIndex': 0,
      'explain': '“during + noun”: during work hours.',
    },
    {
      'question':
          "Notice:\nThe elevator is out of service. Please use the stairs ______ further notice.",
      'options': ['until', 'since', 'for', 'by'],
      'correctIndex': 0,
      'explain': '“until further notice”.',
    },
  ];

  // L2 — Từ loại cơ bản (N/V/Adj/Adv)
  final p6Lv300L2 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nThank you for your ______. We will review your application this week.",
      'options': ['submission', 'submit', 'submitting', 'submissive'],
      'correctIndex': 0,
      'explain': 'Cần danh từ: submission.',
    },
    {
      'question': "Brochure:\nOur hotel offers ______ rooms with ocean views.",
      'options': ['spacious', 'spaciously', 'spaciousness', 'space'],
      'correctIndex': 0,
      'explain': 'Bổ nghĩa danh từ “rooms” → tính từ: spacious.',
    },
    {
      'question':
          "Notice:\nThe technician will ______ the air conditioner this afternoon.",
      'options': ['repair', 'repairing', 'repairs', 'repaired'],
      'correctIndex': 0,
      'explain': 'Will + V nguyên mẫu.',
    },
    {
      'question':
          "Internal Post:\nWe need to work ______ to finish the report by Friday.",
      'options': ['quickly', 'quick', 'quicker', 'quickest'],
      'correctIndex': 0,
      'explain': 'Trạng từ bổ nghĩa động từ “work”.',
    },
    {
      'question': "Memo:\nCustomer ______ is our top priority.",
      'options': ['satisfaction', 'satisfy', 'satisfying', 'satisfied'],
      'correctIndex': 0,
      'explain': 'Cần danh từ khái niệm: satisfaction.',
    },
    {
      'question': "Email:\nPlease provide a more ______ estimate for delivery.",
      'options': ['accurate', 'accurately', 'accuracy', 'accuracies'],
      'correctIndex': 0,
      'explain': 'Bổ nghĩa danh từ “estimate” → tính từ.',
    },
    {
      'question': "Flyer:\nThe café ______ breakfast from 7 a.m.",
      'options': ['serves', 'serve', 'serving', 'to serve'],
      'correctIndex': 0,
      'explain': 'Chủ ngữ số ít “café” → serves.',
    },
    {
      'question':
          "Guide:\nPlease read the ______ carefully before using the device.",
      'options': ['instructions', 'instruct', 'instructor', 'instructional'],
      'correctIndex': 0,
      'explain': 'Cần danh từ số nhiều: instructions.',
    },
    {
      'question': "Ad:\nOur new app is very ______ to use.",
      'options': ['easy', 'easily', 'ease', 'easing'],
      'correctIndex': 0,
      'explain': 'Bổ nghĩa “to use” dạng tính từ: easy.',
    },
    {
      'question': "Notice:\nAll visitors must ______ at the front desk.",
      'options': ['register', 'registration', 'registered', 'registrar'],
      'correctIndex': 0,
      'explain': 'Cần động từ nguyên mẫu: register.',
    },
  ];

  // L3 — Giới từ và liên từ (in/on/at + and/but/because)
  final p6Lv300L3 = <Map<String, dynamic>>[
    {
      'question':
          "Schedule:\nThe seminar starts ______ 2 p.m. ______ ends at 4 p.m.",
      'options': ['at / and', 'on / and', 'in / but', 'at / because'],
      'correctIndex': 0,
      'explain': 'Giờ dùng “at”; nối hai mệnh đề cùng loại bằng “and”.',
    },
    {
      'question': "Notice:\nPlease leave packages ______ the front desk.",
      'options': ['at', 'on', 'in', 'to'],
      'correctIndex': 0,
      'explain': '“at the front desk”.',
    },
    {
      'question':
          "Email:\nWe canceled the outdoor event ______ it was raining.",
      'options': ['because', 'but', 'and', 'in'],
      'correctIndex': 0,
      'explain': 'Lý do → because.',
    },
    {
      'question': "Poster:\nOpen ______ weekends ______ holidays.",
      'options': ['on / and', 'in / and', 'at / but', 'on / because'],
      'correctIndex': 0,
      'explain': 'Ngày cụ thể → on weekends; liên từ “and”.',
    },
    {
      'question': "Guide:\nThe café is ______ the corner ______ Maple Street.",
      'options': ['on / of', 'at / of', 'in / on', 'on / on'],
      'correctIndex': 0,
      'explain': 'Cụm: on the corner of + street.',
    },
    {
      'question':
          "Memo:\nArrive ______ time, ______ we will start without you.",
      'options': ['on / or', 'at / and', 'in / and', 'on / and'],
      'correctIndex': 0,
      'explain': '“on time” và lựa chọn “or” cho điều kiện xấu.',
    },
    {
      'question': "Email:\nI’ll see you ______ the lobby ______ noon.",
      'options': ['in / at', 'at / on', 'on / at', 'in / on'],
      'correctIndex': 0,
      'explain': 'in the lobby; at noon.',
    },
    {
      'question':
          "Notice:\nPlace laptops ______ the shelf ______ do not stack them.",
      'options': ['on / and', 'in / but', 'at / because', 'on / because'],
      'correctIndex': 0,
      'explain': 'on the shelf; nối thêm yêu cầu bằng “and”.',
    },
    {
      'question':
          "Announcement:\nThe bus stops ______ the station, ______ it does not wait long.",
      'options': ['at / but', 'in / and', 'on / because', 'at / and'],
      'correctIndex': 0,
      'explain': 'at the station; đối lập → but.',
    },
    {
      'question':
          "Flyer:\nClasses are held ______ the evening ______ the community center.",
      'options': ['in / at', 'at / in', 'on / at', 'in / in'],
      'correctIndex': 0,
      'explain': 'in the evening; at the community center.',
    },
  ];

  // L4 — Thì hiện tại & quá khứ (đơn giản)
  final p6Lv300L4 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nOur store ______ at 9 a.m. every day, but yesterday it ______ late due to maintenance.",
      'options': [
        'opens / closed',
        'opens / opened',
        'open / opened',
        'is opening / opens',
      ],
      'correctIndex': 1,
      'explain': 'Thói quen: opens; quá khứ: opened.',
    },
    {
      'question':
          "Memo:\nI ______ the samples last week and the client ______ them yesterday.",
      'options': [
        'sent / received',
        'send / receives',
        'sent / receives',
        'send / received',
      ],
      'correctIndex': 0,
      'explain': 'Cả hai quá khứ đơn: sent / received.',
    },
    {
      'question':
          "Notice:\nThe museum ______ at 6 p.m., so please leave by then.",
      'options': ['closes', 'closed', 'close', 'is closing'],
      'correctIndex': 0,
      'explain': 'Giờ đóng cố định → present simple.',
    },
    {
      'question':
          "Post:\nHe ______ in the sales team now, but he ______ in marketing before.",
      'options': [
        'works / worked',
        'worked / works',
        'is working / works',
        'works / is working',
      ],
      'correctIndex': 0,
      'explain': 'Hiện tại: works; trước đây: worked.',
    },
    {
      'question': "Report:\nLast quarter, our revenue ______ by 8%.",
      'options': ['increased', 'increases', 'increase', 'was increase'],
      'correctIndex': 0,
      'explain': 'Quá khứ đơn: increased.',
    },
    {
      'question':
          "Email:\nI usually ______ the 8:10 train, but today I ______ a taxi.",
      'options': [
        'take / took',
        'took / take',
        'takes / take',
        'am taking / took',
      ],
      'correctIndex': 0,
      'explain': 'Thói quen: take; hôm nay (quá khứ gần) took.',
    },
    {
      'question':
          "Update:\nThe team ______ the draft and ______ feedback tomorrow.",
      'options': [
        'finished / will send',
        'finishes / sent',
        'finish / sent',
        'finished / sends',
      ],
      'correctIndex': 0,
      'explain': 'Quá khứ + tương lai đơn: finished / will send.',
    },
    {
      'question':
          "Notice:\nThe store ______ early yesterday because of the storm.",
      'options': ['closed', 'closes', 'is closing', 'was close'],
      'correctIndex': 0,
      'explain': 'Quá khứ đơn: closed.',
    },
    {
      'question': "Memo:\nWe ______ a new intern this week.",
      'options': ['hired', 'hire', 'hires', 'are hire'],
      'correctIndex': 0,
      'explain': 'Trong tuần này (đã hoàn thành) → past simple: hired.',
    },
    {
      'question': "Email:\nShe ______ the report every Friday.",
      'options': ['sends', 'sent', 'send', 'is sent'],
      'correctIndex': 0,
      'explain': 'Thói quen: sends.',
    },
  ];

  // L5 — Ôn tập tổng hợp (cơ bản)
  final p6Lv300L5 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nPlease ______ the attached form and return it by Friday.",
      'options': ['complete', 'completes', 'completed', 'completing'],
      'correctIndex': 0,
      'explain': 'Mệnh lệnh lịch sự → V nguyên mẫu.',
    },
    {
      'question': "Notice:\nThe meeting is ______ Thursday ______ 2 p.m.",
      'options': ['on / at', 'at / on', 'in / at', 'on / in'],
      'correctIndex': 0,
      'explain': 'on + ngày; at + giờ.',
    },
    {
      'question': "Post:\nOur new product is very ______ for beginners.",
      'options': ['useful', 'usefully', 'usefulness', 'use'],
      'correctIndex': 0,
      'explain': 'Cần tính từ: useful.',
    },
    {
      'question': "Memo:\nWe canceled the tour ______ the heavy rain.",
      'options': ['because of', 'because', 'and', 'but'],
      'correctIndex': 0,
      'explain': '“because of + noun”: heavy rain.',
    },
    {
      'question': "Report:\nLast month, sales ______ by 12%.",
      'options': ['rose', 'rise', 'rises', 'raising'],
      'correctIndex': 0,
      'explain': 'Quá khứ đơn: rose.',
    },
    {
      'question':
          "Email:\nI usually ______ to work, but yesterday I ______ the bus.",
      'options': [
        'drive / took',
        'drove / take',
        'drive / take',
        'drives / took',
      ],
      'correctIndex': 0,
      'explain': 'Thói quen vs quá khứ: drive / took.',
    },
    {
      'question':
          "Guide:\nPlace the device ______ a flat surface ______ turn it on.",
      'options': ['on / and', 'at / but', 'in / because', 'on / but'],
      'correctIndex': 0,
      'explain': 'on a surface; and để nối hành động.',
    },
    {
      'question': "Notice:\nPlease be ______ while waiting in line.",
      'options': ['patient', 'patience', 'patiently', 'patients'],
      'correctIndex': 0,
      'explain': 'Be + adj → patient.',
    },
    {
      'question': "Poster:\nThe gallery opens ______ 10 a.m. ______ Sundays.",
      'options': ['at / on', 'on / at', 'in / on', 'at / in'],
      'correctIndex': 0,
      'explain': 'at 10 a.m.; on Sundays.',
    },
    {
      'question':
          "Email:\nThanks for your help. We ______ the results tomorrow.",
      'options': ['will share', 'shared', 'shares', 'are share'],
      'correctIndex': 0,
      'explain': 'Tương lai đơn: will share.',
    },
  ];

  // =========================
  // ===== LEVEL 600+ ========
  // =========================

  // L1 — Email công việc cơ bản (opening–body–closing)
  final p6Lv600L1 = <Map<String, dynamic>>[
    {
      'question':
          "Email (Opening):\nDear Ms. Chen,\nThank you for your inquiry about our services. I am ______ to provide a quotation for your team.",
      'options': ['pleased', 'pleasing', 'pleasure', 'pleasant'],
      'correctIndex': 0,
      'explain': 'Be + adj: be pleased to do sth.',
    },
    {
      'question':
          "Email (Body):\nWe can schedule a demo ______ next Tuesday or Wednesday, depending on your availability.",
      'options': ['for', 'in', 'on', 'at'],
      'correctIndex': 0,
      'explain':
          'Schedule a demo for + time option (khi chưa cố định ngày cụ thể).',
    },
    {
      'question':
          "Email (Body):\nPlease find the brochure ______ to this email.",
      'options': ['attached', 'attaching', 'attachment', 'attach'],
      'correctIndex': 0,
      'explain': 'Tính từ phân từ: brochure attached.',
    },
    {
      'question':
          "Email (Body):\nOur standard plan ______ access for up to 25 users.",
      'options': ['includes', 'include', 'including', 'to include'],
      'correctIndex': 0,
      'explain': 'Chủ ngữ số ít → includes.',
    },
    {
      'question':
          "Email (Body):\nThe discounted price is valid ______ the end of the month.",
      'options': ['until', 'since', 'for', 'by'],
      'correctIndex': 0,
      'explain': 'until + mốc thời gian.',
    },
    {
      'question':
          "Email (Body):\nIf you have any questions, please do not ______ to contact me.",
      'options': ['hesitate', 'hesitation', 'hesitant', 'hesitating'],
      'correctIndex': 0,
      'explain': 'Cụm cố định: do not hesitate to…',
    },
    {
      'question': "Email (Closing):\nI look forward to ______ from you.",
      'options': ['hearing', 'hear', 'to hear', 'be heard'],
      'correctIndex': 0,
      'explain': 'Look forward to + V-ing.',
    },
    {
      'question': "Email (Signature):\nBest ______,\nA. Rivera",
      'options': ['regards', 'regard', 'regarding', 'regards to'],
      'correctIndex': 0,
      'explain': 'Cụm chuẩn: Best regards.',
    },
    {
      'question':
          "Email (Body):\nWe have ______ your order and will ship it tomorrow morning.",
      'options': ['processed', 'process', 'processing', 'processor'],
      'correctIndex': 0,
      'explain': 'Hiện tại hoàn thành ngụ ý hoàn tất: have processed.',
    },
    {
      'question':
          "Email (Body):\nCould you please confirm the delivery address ______ 5 p.m. today?",
      'options': ['by', 'at', 'until', 'on'],
      'correctIndex': 0,
      'explain': 'Hạn chót: by 5 p.m.',
    },
  ];

  // L2 — Từ loại nâng cao (danh từ ghép, V+prep)
  final p6Lv600L2 = <Map<String, dynamic>>[
    {
      'question':
          "Brochure:\nOur co-working space provides high-speed ______ for remote teams.",
      'options': ['internet', 'intern', 'internal', 'international'],
      'correctIndex': 0,
      'explain': 'Danh từ ghép: high-speed internet.',
    },
    {
      'question':
          "Guide:\nPlease ______ for the seminar at the front desk upon arrival.",
      'options': ['sign up', 'sign in', 'sign off', 'sign over'],
      'correctIndex': 0,
      'explain': 'Cụm V+prep: sign up for.',
    },
    {
      'question': "Manual:\nTurn ______ the printer after use to save energy.",
      'options': ['off', 'on', 'up', 'over'],
      'correctIndex': 0,
      'explain': 'Turn off = tắt.',
    },
    {
      'question':
          "Notice:\nEmployees must comply ______ safety regulations at all times.",
      'options': ['with', 'to', 'for', 'on'],
      'correctIndex': 0,
      'explain': 'Comply with.',
    },
    {
      'question':
          "Email:\nWe will follow ______ your suggestion and run a pilot test.",
      'options': ['up on', 'on to', 'out of', 'in for'],
      'correctIndex': 0,
      'explain': 'Follow up on sth.',
    },
    {
      'question':
          "Guide:\nPlease back ______ your files before updating the software.",
      'options': ['up', 'out', 'over', 'off'],
      'correctIndex': 0,
      'explain': 'Back up = sao lưu.',
    },
    {
      'question': "Notice:\nThe elevator is under routine ______.",
      'options': ['maintenance', 'maintain', 'maintaining', 'maintainer'],
      'correctIndex': 0,
      'explain': 'Danh từ: maintenance.',
    },
    {
      'question':
          "Email:\nWe would like to ______ a meeting to discuss the proposal.",
      'options': ['arrange', 'arrangement', 'arranging', 'arranged'],
      'correctIndex': 0,
      'explain': 'Động từ nguyên mẫu: arrange a meeting.',
    },
    {
      'question':
          "Manual:\nMake sure to log ______ after you finish using the system.",
      'options': ['out', 'in', 'into', 'onto'],
      'correctIndex': 0,
      'explain': 'Log out.',
    },
    {
      'question': "Flyer:\nJoin our lunchtime ______ series every Friday.",
      'options': ['workshop', 'work', 'worker', 'workflow'],
      'correctIndex': 0,
      'explain': 'Danh từ đúng: workshop series.',
    },
  ];

  // L3 — Liên từ nâng cao (although/however/therefore/while)
  final p6Lv600L3 = <Map<String, dynamic>>[
    {
      'question':
          "Report:\nSales increased in Q2; ______, costs also rose slightly.",
      'options': ['however', 'therefore', 'although', 'because'],
      'correctIndex': 0,
      'explain': 'Tương phản giữa hai mệnh đề độc lập → however.',
    },
    {
      'question':
          "Email:\n______ the shipment was delayed, the client remained patient.",
      'options': ['Although', 'However', 'Therefore', 'Because'],
      'correctIndex': 0,
      'explain': 'Although + clause.',
    },
    {
      'question':
          "Memo:\nThe event was overbooked; ______ we had to add more seats.",
      'options': ['therefore', 'however', 'although', 'while'],
      'correctIndex': 0,
      'explain': 'Nguyên nhân → kết quả: therefore.',
    },
    {
      'question':
          "Report:\nMarketing performed well, ______ operations faced challenges.",
      'options': ['while', 'because', 'therefore', 'although'],
      'correctIndex': 0,
      'explain': 'So sánh hai vế đồng thời: while.',
    },
    {
      'question':
          "Email:\nThe venue is small; ______, it is conveniently located.",
      'options': ['however', 'therefore', 'because', 'although'],
      'correctIndex': 0,
      'explain': 'Tương phản: however.',
    },
    {
      'question': "Report:\nWe reduced churn; ______, revenue grew by 6%.",
      'options': ['therefore', 'however', 'although', 'while'],
      'correctIndex': 0,
      'explain': 'Kết luận kết quả: therefore.',
    },
    {
      'question':
          "Email:\n______ we can start today, we prefer to wait for the contract.",
      'options': ['Although', 'However', 'Therefore', 'Because'],
      'correctIndex': 0,
      'explain': 'Although + clause (nhượng bộ).',
    },
    {
      'question':
          "Report:\nSupport satisfaction improved, ______ response time decreased.",
      'options': ['while', 'because', 'however', 'therefore'],
      'correctIndex': 0,
      'explain': 'Đồng thời hai xu hướng khác nhau: while.',
    },
    {
      'question':
          "Email:\nWe missed the deadline; ______, we will offer a discount.",
      'options': ['therefore', 'however', 'although', 'while'],
      'correctIndex': 0,
      'explain': 'Hậu quả/biện pháp: therefore.',
    },
    {
      'question': "Notice:\n______ the renovation, the store will remain open.",
      'options': ['During', 'Although', 'However', 'Therefore'],
      'correctIndex': 0,
      'explain': 'During + noun: during the renovation.',
    },
  ];

  // L4 — Ngữ pháp: bị động & điều kiện (be+V3, if-clauses)
  final p6Lv600L4 = <Map<String, dynamic>>[
    {
      'question':
          "Memo:\nAll laptops ______ checked before being issued to staff.",
      'options': ['are', 'is', 'be', 'been'],
      'correctIndex': 0,
      'explain': 'Bị động hiện tại đơn: are checked.',
    },
    {
      'question':
          "Notice:\nIf the package ______ late, please contact customer service.",
      'options': ['arrives', 'will arrive', 'arrived', 'arrive'],
      'correctIndex': 0,
      'explain': 'Type 1: If + present.',
    },
    {
      'question':
          "Report:\nThe prototype ______ tested last week by the R&D team.",
      'options': ['was', 'were', 'is', 'has'],
      'correctIndex': 0,
      'explain': 'Quá khứ bị động: was tested.',
    },
    {
      'question':
          "Email:\nIf you ______ any issues, we will extend your trial period.",
      'options': [
        'experience',
        'experienced',
        'will experience',
        'are experiencing',
      ],
      'correctIndex': 0,
      'explain': 'If + present, main “will …”.',
    },
    {
      'question': "Notice:\nRefunds ______ issued within five business days.",
      'options': ['are', 'is', 'be', 'were'],
      'correctIndex': 0,
      'explain': 'Present passive: are issued.',
    },
    {
      'question':
          "Guide:\nIf the device overheats, it ______ down automatically.",
      'options': ['shuts', 'will shut', 'shutting', 'was shut'],
      'correctIndex': 0,
      'explain': 'Miêu tả quy luật → present simple.',
    },
    {
      'question':
          "Email:\nIf we ______ your confirmation today, we can ship tomorrow.",
      'options': ['receive', 'received', 'will receive', 'are receiving'],
      'correctIndex': 0,
      'explain': 'Type 1: receive.',
    },
    {
      'question':
          "Report:\nThe contract ______ signed by both parties yesterday.",
      'options': ['was', 'is', 'were', 'has'],
      'correctIndex': 0,
      'explain': 'Past passive: was signed.',
    },
    {
      'question':
          "Manual:\nIf the light ______ green, the device is ready to use.",
      'options': ['turns', 'will turn', 'turned', 'is turning'],
      'correctIndex': 0,
      'explain': 'Miêu tả điều kiện hiện tại: turns.',
    },
    {
      'question': "Policy:\nComplaints ______ reviewed within 48 hours.",
      'options': ['are', 'is', 'be', 'been'],
      'correctIndex': 0,
      'explain': 'Present passive: are reviewed.',
    },
  ];

  // L5 — Ôn tập tổng hợp (Email, từ loại, liên từ, ngữ pháp)
  final p6Lv600L5 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nPlease see the ______ below and confirm your availability.",
      'options': ['schedule', 'scheduled', 'scheduling', 'schedulely'],
      'correctIndex': 0,
      'explain': 'Danh từ cần thiết: schedule.',
    },
    {
      'question':
          "Report:\nWe extended support hours; ______, customer satisfaction improved.",
      'options': ['therefore', 'however', 'although', 'while'],
      'correctIndex': 0,
      'explain': 'Nguyên nhân → kết quả.',
    },
    {
      'question': "Notice:\nVisitors must check in ______ the reception desk.",
      'options': ['at', 'on', 'in', 'to'],
      'correctIndex': 0,
      'explain': 'at the desk.',
    },
    {
      'question': "Email:\nYour account ______ been activated.",
      'options': ['has', 'have', 'is', 'was'],
      'correctIndex': 0,
      'explain':
          'Hiện tại hoàn thành bị động: has been activated (been implied).',
    },
    {
      'question': "Guide:\nIf the error ______ again, contact IT immediately.",
      'options': ['appears', 'will appear', 'appeared', 'is appearing'],
      'correctIndex': 0,
      'explain': 'Type 1: appears.',
    },
    {
      'question': "Manual:\nDevices ______ packaged carefully before shipment.",
      'options': ['are', 'is', 'be', 'being'],
      'correctIndex': 0,
      'explain': 'Passive present: are packaged.',
    },
    {
      'question': "Email:\nI’m ______ to share the updated proposal.",
      'options': ['happy', 'happily', 'happiness', 'happier'],
      'correctIndex': 0,
      'explain': 'Be + adj: happy to share.',
    },
    {
      'question':
          "Report:\nSales grew in Europe, ______ demand in Asia remained flat.",
      'options': ['while', 'however', 'therefore', 'although'],
      'correctIndex': 0,
      'explain': 'Song hành tương phản: while.',
    },
    {
      'question': "Notice:\nAll meeting rooms ______ reserved online.",
      'options': ['are', 'is', 'be', 'were'],
      'correctIndex': 0,
      'explain': 'Present passive.',
    },
    {
      'question': "Email:\nIf you ______ any changes, please let me know.",
      'options': ['need', 'needed', 'will need', 'are needing'],
      'correctIndex': 0,
      'explain': 'If + present.',
    },
  ];

  // =========================
  // ===== LEVEL 800+ ========
  // =========================

  // L1 — Thư/Email nâng cao (từ học thuật)
  final p6Lv800L1 = <Map<String, dynamic>>[
    {
      'question':
          "Email:\nDear Committee Members,\nWe would like to ______ your feedback on the attached proposal before Friday.",
      'options': ['solicit', 'solution', 'solidify', 'solitary'],
      'correctIndex': 0,
      'explain': '“solicit feedback” = xin ý kiến.',
    },
    {
      'question':
          "Email:\nThe revised timeline is ______ to resource availability and regulatory approval.",
      'options': ['contingent', 'contiguous', 'containing', 'contented'],
      'correctIndex': 0,
      'explain': 'Contingent on = phụ thuộc vào.',
    },
    {
      'question':
          "Email:\nPlease review the budget ______ and highlight any discrepancies.",
      'options': ['breakdown', 'breakthrough', 'breakout', 'breakage'],
      'correctIndex': 0,
      'explain': 'Budget breakdown = bảng phân bổ.',
    },
    {
      'question':
          "Email:\nWe appreciate your ______ to improving the onboarding process.",
      'options': ['commitment', 'committee', 'committing', 'committed'],
      'correctIndex': 0,
      'explain': 'Danh từ trừu tượng: commitment.',
    },
    {
      'question':
          "Email:\nThe partnership will ______ both organizations through shared expertise.",
      'options': ['benefit', 'benefits', 'beneficial', 'benefited'],
      'correctIndex': 0,
      'explain': 'Động từ nguyên mẫu “will benefit”.',
    },
    {
      'question':
          "Email:\nKindly note that the figures are ______ and may change after the audit.",
      'options': ['provisional', 'provincial', 'provided', 'provision'],
      'correctIndex': 0,
      'explain': 'Provisional = tạm thời.',
    },
    {
      'question':
          "Email:\nYour quick response will help us ______ the schedule.",
      'options': ['finalize', 'final', 'finally', 'finalist'],
      'correctIndex': 0,
      'explain': 'Động từ: finalize the schedule.',
    },
    {
      'question':
          "Email:\nWe aim to ______ risks by introducing phased testing.",
      'options': ['mitigate', 'mediate', 'migrate', 'militate'],
      'correctIndex': 0,
      'explain': 'Mitigate risks = giảm thiểu rủi ro.',
    },
    {
      'question':
          "Email:\nThe training materials have been ______ for clarity and consistency.",
      'options': ['standardized', 'standing', 'statured', 'stabilize'],
      'correctIndex': 0,
      'explain': 'Standardized for…',
    },
    {
      'question':
          "Email:\nPlease keep this information ______ until the official release.",
      'options': ['confidential', 'confident', 'confidence', 'confiding'],
      'correctIndex': 0,
      'explain': 'Confidential = bảo mật.',
    },
  ];

  // L2 — Văn bản báo cáo (company report)
  final p6Lv800L2 = <Map<String, dynamic>>[
    {
      'question':
          "Report:\nQ3 revenue grew 7% year-over-year, ______ strong performance in the retail segment.",
      'options': ['driven by', 'driving', 'drive by', 'to drive'],
      'correctIndex': 0,
      'explain': 'Cụm phân từ chỉ nguyên nhân: driven by.',
    },
    {
      'question':
          "Report:\nOur churn rate declined from 9% to 6%, ______ improved customer support.",
      'options': ['owing to', 'despite', 'however', 'in case of'],
      'correctIndex': 0,
      'explain': 'Owing to = nhờ vào.',
    },
    {
      'question':
          "Report:\nWe will ______ capital expenditures to focus on profitability.",
      'options': ['curb', 'curve', 'carve', 'care'],
      'correctIndex': 0,
      'explain': 'Curb expenditures = kiềm chế chi tiêu.',
    },
    {
      'question':
          "Report:\nThe pilot program yielded ______ feedback from early adopters.",
      'options': ['favorable', 'favor', 'favorite', 'favorably'],
      'correctIndex': 0,
      'explain': 'Tính từ: favorable feedback.',
    },
    {
      'question':
          "Report:\nCash flow remained ______ due to efficient collections.",
      'options': ['robust', 'robustly', 'robustness', 'robustest'],
      'correctIndex': 0,
      'explain': 'Tính từ bổ nghĩa “remained”: robust.',
    },
    {
      'question':
          "Report:\nWe plan to ______ our presence in Southeast Asia next year.",
      'options': ['expand', 'expansion', 'expansive', 'expanding'],
      'correctIndex': 0,
      'explain': 'Động từ: plan to expand.',
    },
    {
      'question':
          "Report:\nOperating costs were ______ by lower logistics fees.",
      'options': ['offset', 'offshoot', 'offered', 'offsetting'],
      'correctIndex': 0,
      'explain': 'Were offset by = được bù trừ bởi.',
    },
    {
      'question': "Report:\nWe observed a ______ uptake in mobile orders.",
      'options': ['notable', 'notably', 'notability', 'notice'],
      'correctIndex': 0,
      'explain': 'Tính từ: notable uptake.',
    },
    {
      'question': "Report:\nThe board approved a ______ dividend policy.",
      'options': ['revised', 'revision', 'revise', 'revising'],
      'correctIndex': 0,
      'explain': 'Tính từ: revised policy.',
    },
    {
      'question':
          "Report:\nInternational sales accounted ______ 35% of total revenue.",
      'options': ['for', 'to', 'of', 'with'],
      'correctIndex': 0,
      'explain': 'Account for + tỷ lệ.',
    },
  ];

  // L3 — Cấu trúc nâng cao (đảo ngữ, quan hệ, cụm danh từ)
  final p6Lv800L3 = <Map<String, dynamic>>[
    {
      'question':
          "Policy:\nOnly after the audit ______ the discrepancies addressed.",
      'options': ['were', 'was', 'are', 'have'],
      'correctIndex': 0,
      'explain': 'Đảo ngữ: Only after… were the discrepancies addressed.',
    },
    {
      'question':
          "Memo:\nThe candidate ______ experience we value most has joined the team.",
      'options': ['whose', 'who', 'whom', 'which'],
      'correctIndex': 0,
      'explain': 'Đại từ sở hữu: whose experience.',
    },
    {
      'question': "Guide:\nPlease submit the ______ approval form to HR.",
      'options': [
        'pre-employment',
        'preemploy',
        'pre-employing',
        'pre-employer',
      ],
      'correctIndex': 0,
      'explain': 'Cụm danh từ ghép: pre-employment approval form.',
    },
    {
      'question':
          "Report:\nSeldom ______ such rapid growth in two consecutive quarters.",
      'options': [
        'do we witness',
        'we witness',
        'are we witness',
        'did we witnessing',
      ],
      'correctIndex': 0,
      'explain': 'Đảo ngữ với trạng từ phủ định: Seldom do we….',
    },
    {
      'question':
          "Manual:\nUsers must comply with the data retention policy, ______ sets the storage period.",
      'options': ['which', 'who', 'whom', 'where'],
      'correctIndex': 0,
      'explain': 'Mệnh đề quan hệ miêu tả “policy”: which.',
    },
    {
      'question':
          "Policy:\nUnder no circumstances ______ confidential files be shared externally.",
      'options': ['should', 'must', 'would', 'could'],
      'correctIndex': 0,
      'explain': 'Đảo ngữ mệnh lệnh: should … be shared.',
    },
    {
      'question':
          "Notice:\nEmployees with ______ performance records may apply for remote work.",
      'options': ['outstanding', 'outstand', 'standout', 'outstandingly'],
      'correctIndex': 0,
      'explain': 'Tính từ: outstanding records.',
    },
    {
      'question': "Report:\nThe team achieved results ______ expectations.",
      'options': ['beyond', 'behind', 'below of', 'over to'],
      'correctIndex': 0,
      'explain': 'Cụm: beyond expectations.',
    },
    {
      'question':
          "Guide:\nPlease use the ______-grade disinfectant for lab equipment.",
      'options': ['medical', 'medically', 'medicine', 'medicate'],
      'correctIndex': 0,
      'explain': 'Cụm danh từ ghép: medical-grade.',
    },
    {
      'question':
          "Memo:\nThe conference, ______ agenda was shared earlier, starts at 9.",
      'options': ['whose', 'which', 'who', 'whom'],
      'correctIndex': 0,
      'explain': 'Sở hữu cho “agenda”: whose.',
    },
  ];

  // L4 — Đoạn văn logic (từ nối mạch văn)
  final p6Lv800L4 = <Map<String, dynamic>>[
    {
      'question':
          "Report:\nDemand was strong in Q1. ______, supply constraints limited shipments.",
      'options': ['However', 'Therefore', 'Moreover', 'For example'],
      'correctIndex': 0,
      'explain': 'Chuyển ý tương phản: However.',
    },
    {
      'question':
          "Report:\nWe expanded the sales team; ______, we launched a new training program.",
      'options': ['in addition', 'however', 'instead', 'otherwise'],
      'correctIndex': 0,
      'explain': 'Bổ sung song song: in addition.',
    },
    {
      'question':
          "Report:\nShipments were delayed; ______, customers received refunds.",
      'options': ['as a result', 'on the contrary', 'even so', 'by contrast'],
      'correctIndex': 0,
      'explain': 'Hệ quả: as a result.',
    },
    {
      'question':
          "Report:\nThe beta was successful. ______, we plan to scale globally.",
      'options': ['Therefore', 'Nevertheless', 'Meanwhile', 'Conversely'],
      'correctIndex': 0,
      'explain': 'Suy luận kết quả: Therefore.',
    },
    {
      'question': "Report:\nCosts rose in Q2; ______, margins remained stable.",
      'options': [
        'nevertheless',
        'for instance',
        'in other words',
        'otherwise',
      ],
      'correctIndex': 0,
      'explain': 'Nhượng bộ: nevertheless.',
    },
    {
      'question': "Report:\nThe system is simple; ______, it is secure.",
      'options': ['moreover', 'however', 'instead', 'hence'],
      'correctIndex': 0,
      'explain': 'Thêm ý cùng chiều: moreover.',
    },
    {
      'question':
          "Report:\nWe missed the target; ______, we learned valuable lessons.",
      'options': ['even so', 'in contrast', 'otherwise', 'for example'],
      'correctIndex': 0,
      'explain': 'Nhượng bộ: even so.',
    },
    {
      'question':
          "Report:\nWe will cut costs. ______, we will invest in automation.",
      'options': [
        'At the same time',
        'Therefore',
        'On the contrary',
        'For instance',
      ],
      'correctIndex': 0,
      'explain': 'Song hành đồng thời: at the same time.',
    },
    {
      'question':
          "Report:\nThe proposal is sound; ______, some details need refinement.",
      'options': ['that said', 'hence', 'therefore', 'moreover'],
      'correctIndex': 0,
      'explain': 'Chuyển ý nhượng bộ: That said, ….',
    },
    {
      'question':
          "Report:\nSupply improved in May; ______, backorders decreased by 30%.",
      'options': ['consequently', 'otherwise', 'conversely', 'similarly'],
      'correctIndex': 0,
      'explain': 'Hệ quả: consequently.',
    },
  ];

  // L5 — Ôn tập tổng hợp (Email, report, cấu trúc nâng cao)
  final p6Lv800L5 = <Map<String, dynamic>>[
    {
      'question': "Email:\nWe ______ your approval to proceed with Phase 2.",
      'options': ['seek', 'seeking', 'sought', 'seeks'],
      'correctIndex': 0,
      'explain': 'Động từ hiện tại đơn: seek approval.',
    },
    {
      'question':
          "Report:\nNo sooner ______ the update rolled out than users reported bugs.",
      'options': ['had', 'was', 'did', 'has'],
      'correctIndex': 0,
      'explain': 'No sooner had … than ….',
    },
    {
      'question':
          "Email:\nPlease keep the attached document ______ until the public announcement.",
      'options': ['confidential', 'confidence', 'confident', 'confiding'],
      'correctIndex': 0,
      'explain': 'Adj: confidential.',
    },
    {
      'question': "Report:\nRevenue growth was ______ by higher retention.",
      'options': ['bolstered', 'bolster', 'bolstering', 'bolsterous'],
      'correctIndex': 0,
      'explain': 'Bị động quá khứ: was bolstered.',
    },
    {
      'question': "Email:\nShould you ______ further assistance, let us know.",
      'options': ['require', 'required', 'requiring', 'to require'],
      'correctIndex': 0,
      'explain': 'Đảo điều kiện: Should you require….',
    },
    {
      'question':
          "Report:\nInternational sales accounted ______ 42% of total revenue.",
      'options': ['for', 'to', 'of', 'with'],
      'correctIndex': 0,
      'explain': 'Account for.',
    },
    {
      'question':
          "Policy:\nUnder no circumstances ______ proprietary data be shared externally.",
      'options': ['should', 'must', 'would', 'could'],
      'correctIndex': 0,
      'explain': 'Đảo ngữ mệnh lệnh: should … be shared.',
    },
    {
      'question':
          "Report:\nWe chose a phased rollout; ______, we minimized risk.",
      'options': ['thus', 'however', 'meanwhile', 'instead'],
      'correctIndex': 0,
      'explain': 'Hệ quả: thus.',
    },
    {
      'question': "Email:\nI am ______ to schedule a follow-up call next week.",
      'options': ['available', 'availability', 'availably', 'avail'],
      'correctIndex': 0,
      'explain': 'Be available to….',
    },
    {
      'question':
          "Report:\nThe initiative delivered ______ value across departments.",
      'options': ['tangible', 'tangibly', 'tangibility', 'tangent'],
      'correctIndex': 0,
      'explain': 'Adj + noun: tangible value.',
    },
  ];

  // ========== PUSH ALL LESSONS ==========

  /// ===== LRMaterials ========
  // lv300
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hoàn thành đoạn văn ngắn',
    questions: p6Lv300L1,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Từ loại cơ bản',
    questions: p6Lv300L2,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Giới từ và liên từ',
    questions: p6Lv300L3,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Thì hiện tại & quá khứ',
    questions: p6Lv300L4,
  );
  await pushLessonLR(
    levelId: 'lv300',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv300L5,
  );

  // lv600
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Email công việc cơ bản',
    questions: p6Lv600L1,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Từ loại nâng cao',
    questions: p6Lv600L2,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Liên từ nâng cao',
    questions: p6Lv600L3,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Ngữ pháp – bị động & điều kiện',
    questions: p6Lv600L4,
  );
  await pushLessonLR(
    levelId: 'lv600',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv600L5,
  );

  // lv800
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Thư/Email nâng cao',
    questions: p6Lv800L1,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Văn bản báo cáo',
    questions: p6Lv800L2,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Cấu trúc nâng cao',
    questions: p6Lv800L3,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Đoạn văn logic',
    questions: p6Lv800L4,
  );
  await pushLessonLR(
    levelId: 'lv800',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv800L5,
  );



  /// ===== FullMaterials ========
  // lv1
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Hoàn thành đoạn văn ngắn',
    questions: p6Lv300L1,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Từ loại cơ bản',
    questions: p6Lv300L2,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Giới từ và liên từ',
    questions: p6Lv300L3,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Thì hiện tại & quá khứ',
    questions: p6Lv300L4,
  );
  await pushLessonFull(
    levelId: 'lv1',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv300L5,
  );

  // lv2
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Email công việc cơ bản',
    questions: p6Lv600L1,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Từ loại nâng cao',
    questions: p6Lv600L2,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Liên từ nâng cao',
    questions: p6Lv600L3,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Ngữ pháp – bị động & điều kiện',
    questions: p6Lv600L4,
  );
  await pushLessonFull(
    levelId: 'lv2',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv600L5,
  );

  // lv3
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson1',
    lessonName: 'Bài 1: Thư/Email nâng cao',
    questions: p6Lv800L1,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson2',
    lessonName: 'Bài 2: Văn bản báo cáo',
    questions: p6Lv800L2,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson3',
    lessonName: 'Bài 3: Cấu trúc nâng cao',
    questions: p6Lv800L3,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson4',
    lessonName: 'Bài 4: Đoạn văn logic',
    questions: p6Lv800L4,
  );
  await pushLessonFull(
    levelId: 'lv3',
    lessonId: 'lesson5',
    lessonName: 'Bài 5: Ôn tập tổng hợp',
    questions: p6Lv800L5,
  );
}
