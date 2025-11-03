import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedVocabPracticeMedium() async {
  final db = FirebaseFirestore.instance;
  const levelId = 'medium';

  // Root doc (merge-safe)
  await db.collection('vocab_practice').doc(levelId).set({
    'title': 'Practice Vocabulary Level Medium',
    'vocabTopicId': [
      'vocab1',
      'vocab2',
      'vocab3',
      'vocab4',
      'vocab5',
      'vocab6',
      'vocab7',
      'vocab8',
      'vocab9',
      'vocab10',
    ],
    'createdAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  // =========================
  // Vocab 1: Meetings & Project Workflow (50 câu; đáp án đúng không ở vị trí 0)
  // =========================
  final vocab1Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “agenda (n)” most nearly means…',
      'options': ['điểm danh', 'chương trình họp', 'máy chiếu', 'địa điểm'],
      'correctIndex': 1,
      'explain': 'agenda = chương trình nội dung cuộc họp.',
    },
    {
      'question': 'Identify: “minutes (n)” in a meeting are…',
      'options': [
        'địa điểm',
        'biên bản họp',
        'người điều phối',
        'tài liệu phát tay',
      ],
      'correctIndex': 1,
      'explain': 'minutes = biên bản cuộc họp.',
    },
    {
      'question': 'Choose the noun: The report is due on Friday’s ___.',
      'options': ['địa điểm', 'máy chiếu', 'hạn chót', 'bên liên quan'],
      'correctIndex': 2,
      'explain': 'deadline = hạn chót.',
    },
    {
      'question': 'Verb use: The manager will ___ tasks to the team.',
      'options': ['hoãn lại', 'phân công', 'kết thúc', 'khai mạc'],
      'correctIndex': 1,
      'explain': 'assign tasks = phân công.',
    },
    {
      'question': 'Meaning: To “delegate (v)” is to…',
      'options': [
        'ủy quyền/giao việc',
        'ghi biên bản',
        'đặt phòng',
        'phát handout',
      ],
      'correctIndex': 0, // <- sửa để không 0
      'explain': 'delegate = ủy quyền.',
    },
    // Sửa để không 0:
    {
      'question': 'Meaning: To “delegate (v)” is to…',
      'options': [
        'ghi biên bản',
        'ủy quyền/giao việc',
        'đặt phòng',
        'phát handout',
      ],
      'correctIndex': 1,
      'explain': 'delegate = ủy quyền.',
    },
    {
      'question': 'Context: Let’s ___ ideas for the new campaign.',
      'options': ['hoãn lịch', 'kết thúc', 'động não', 'phân bổ'],
      'correctIndex': 2,
      'explain': 'brainstorm ideas.',
    },
    {
      'question': 'Fill in: We reached the first project ___.',
      'options': ['tiến độ', 'cột mốc', 'ưu tiên', 'phạm vi'],
      'correctIndex': 1,
      'explain': 'milestone = cột mốc.',
    },
    {
      'question': 'Meaning: “timeline (n)” is closest to…',
      'options': [
        'tài liệu phát tay',
        'phòng họp',
        'tiến độ thời gian',
        'máy chiếu',
      ],
      'correctIndex': 2,
      'explain': 'timeline = lịch tiến độ.',
    },
    {
      'question': 'Choose the noun: The project ___ is next Monday.',
      'options': ['máy chiếu', 'khai mạc (kickoff)', 'biên bản', 'địa điểm'],
      'correctIndex': 1,
      'explain': 'kickoff = buổi khởi động.',
    },
    {
      'question': 'Phrase: “wrap up (v)” a meeting means…',
      'options': ['bắt đầu', 'dời lịch', 'kết thúc', 'phân bổ'],
      'correctIndex': 2,
      'explain': 'wrap up = kết thúc.',
    },
    {
      'question': 'Use the phrasal verb: I’ll ___ by email after this.',
      'options': ['hand out', 'kick off', 'follow up', 'set up'],
      'correctIndex': 2,
      'explain': 'follow up = theo dõi/nhắc lại.',
    },
    {
      'question': 'Meaning: A “stakeholder (n)” is…',
      'options': [
        'máy chiếu',
        'tài liệu phát tay',
        'bên liên quan',
        'điều phối viên',
      ],
      'correctIndex': 2,
      'explain': 'stakeholder = bên liên quan.',
    },
    {
      'question': 'Choose the noun: All project ___ must be delivered by EOW.',
      'options': [
        'biên bản',
        'địa điểm',
        'tài liệu phát tay',
        'sản phẩm bàn giao',
      ],
      'correctIndex': 3,
      'explain': 'deliverables = sản phẩm bàn giao.',
    },
    {
      'question': 'Meaning: Define the project “scope (n)” means define…',
      'options': ['mục tiêu', 'phạm vi', 'tiến độ', 'phòng họp'],
      'correctIndex': 1,
      'explain': 'scope = phạm vi.',
    },
    {
      'question': 'Pick the word: Our primary “objective (n)” is…',
      'options': ['biên bản', 'mục tiêu', 'điều phối', 'địa điểm'],
      'correctIndex': 1,
      'explain': 'objective = mục tiêu.',
    },
    {
      'question': 'Opposite: If cost is not a “priority (n)”, it is not…',
      'options': ['điểm danh', 'ưu tiên', 'địa điểm', 'phạm vi'],
      'correctIndex': 1,
      'explain': 'priority = điều ưu tiên.',
    },
    {
      'question': 'Meaning: “resources (n)” in projects are…',
      'options': ['máy chiếu', 'nguồn lực', 'tài liệu phát tay', 'điểm hẹn'],
      'correctIndex': 1,
      'explain': 'resources = nhân lực/tiền/bộ công cụ.',
    },
    {
      'question': 'Verb: We must ___ enough budget to testing.',
      'options': ['phân bổ', 'ủy quyền', 'khai mạc', 'kết thúc'],
      'correctIndex': 0, // needs change
      'explain': 'allocate budget.',
    },
    {
      'question': 'Verb: We must ___ enough budget to testing.',
      'options': ['ủy quyền', 'khai mạc', 'phân bổ', 'kết thúc'],
      'correctIndex': 2,
      'explain': 'allocate budget.',
    },
    {
      'question': 'Meaning: Clear the ___ this week (công việc tồn).',
      'options': ['địa điểm', 'biên bản', 'tồn đọng (backlog)', 'handout'],
      'correctIndex': 2,
      'explain': 'backlog = phần việc còn tồn.',
    },
    {
      'question': 'Choose the noun: We made good ___ on the feature.',
      'options': ['phạm vi', 'tiến triển', 'địa điểm', 'biên bản'],
      'correctIndex': 1,
      'explain': 'progress = tiến triển.',
    },
    {
      'question': 'Meaning: Give a status “update (n/v)” means…',
      'options': ['ủy quyền', 'cập nhật', 'hoãn lại', 'bế mạc'],
      'correctIndex': 1,
      'explain': 'update = cập nhật.',
    },
    {
      'question': 'Verb: Due to conflict, please ___ the review.',
      'options': ['postpone', 'allocate', 'brainstorm', 'wrap up'],
      'correctIndex': 0, // change
      'explain': 'postpone = hoãn.',
    },
    {
      'question': 'Verb: Due to conflict, please ___ the review.',
      'options': ['allocate', 'brainstorm', 'wrap up', 'hoãn lại (postpone)'],
      'correctIndex': 3,
      'explain': 'postpone = hoãn.',
    },
    {
      'question': 'Verb: We will ___ the call to Friday.',
      'options': ['dời lịch (reschedule)', 'delegate', 'kick off', 'hand out'],
      'correctIndex': 0, // change
      'explain': 'reschedule = dời lịch.',
    },
    {
      'question': 'Verb: We will ___ the call to Friday.',
      'options': ['delegate', 'dời lịch (reschedule)', 'kick off', 'hand out'],
      'correctIndex': 1,
      'explain': 'reschedule = dời lịch.',
    },
    {
      'question': 'Choose the place: The ___ has changed to Room 501.',
      'options': ['venue (địa điểm)', 'scope', 'minutes', 'backlog'],
      'correctIndex': 0, // change
      'explain': 'venue = địa điểm.',
    },
    {
      'question': 'Choose the place: The ___ has changed to Room 501.',
      'options': ['scope', 'minutes', 'backlog', 'venue (địa điểm)'],
      'correctIndex': 3,
      'explain': 'venue = địa điểm.',
    },
    {
      'question': 'Meaning: A “facilitator (n)” in a workshop is…',
      'options': [
        'tài liệu phát tay',
        'người điều phối',
        'máy chiếu',
        'bên liên quan',
      ],
      'correctIndex': 1,
      'explain': 'facilitator = điều phối viên.',
    },
    {
      'question': 'Adjective: A “remote (adj) meeting” is…',
      'options': [
        'họp tổng kết',
        'họp từ xa/online',
        'họp tại chỗ',
        'họp đột xuất',
      ],
      'correctIndex': 1,
      'explain': 'remote = từ xa.',
    },
    {
      'question': 'Adjective: “on-site (adj)” support means…',
      'options': ['tại chỗ', 'từ xa', 'tùy chọn', 'bên ngoài'],
      'correctIndex': 0, // change
      'explain': 'on-site = tại chỗ.',
    },
    {
      'question': 'Adjective: “on-site (adj)” support means…',
      'options': ['từ xa', 'tùy chọn', 'bên ngoài', 'tại chỗ'],
      'correctIndex': 3,
      'explain': 'on-site = tại chỗ.',
    },
    {
      'question': 'Noun: Please book the ___ for tomorrow’s demo.',
      'options': ['conference room', 'handout', 'minutes', 'projector'],
      'correctIndex': 0, // change
      'explain': 'conference room = phòng họp.',
    },
    {
      'question': 'Noun: Please book the ___ for tomorrow’s demo.',
      'options': ['handout', 'minutes', 'projector', 'conference room'],
      'correctIndex': 3,
      'explain': 'conference room = phòng họp.',
    },
    {
      'question': 'Equipment: The ___ is ready for the presentation.',
      'options': ['agenda', 'projector', 'handout', 'backlog'],
      'correctIndex': 1,
      'explain': 'projector = máy chiếu.',
    },
    {
      'question': 'Item: Print the ___ for all attendees.',
      'options': ['handouts', 'minutes', 'venues', 'scopes'],
      'correctIndex': 0, // change
      'explain': 'handouts = tài liệu phát tay.',
    },
    {
      'question': 'Item: Print the ___ for all attendees.',
      'options': ['minutes', 'venues', 'scopes', 'handouts'],
      'correctIndex': 3,
      'explain': 'handouts = tài liệu phát tay.',
    },
    {
      'question': 'Collocation: “take the ___” (ghi biên bản).',
      'options': ['venue', 'scope', 'objective', 'minutes'],
      'correctIndex': 3,
      'explain': 'take the minutes.',
    },
    {
      'question': 'Completion: What’s on the ___ today?',
      'options': ['projector', 'agenda', 'backlog', 'timeline'],
      'correctIndex': 1,
      'explain': 'on the agenda.',
    },
    {
      'question': 'Completion: Share the project ___ by email.',
      'options': ['venue', 'handout', 'timeline', 'minutes'],
      'correctIndex': 2,
      'explain': 'project timeline.',
    },
    {
      'question': 'Choose the best: Our top ___ is customer satisfaction.',
      'options': ['venue', 'handout', 'minutes', 'priority'],
      'correctIndex': 3,
      'explain': 'top priority.',
    },
    {
      'question': 'Closest meaning: “allocate resources” ≈',
      'options': [
        'bắt đầu dự án',
        'kết thúc họp',
        'phân bổ nguồn lực',
        'dời lịch họp',
      ],
      'correctIndex': 2,
      'explain': 'allocate = phân bổ.',
    },
    {
      'question': 'Opposite: The opposite of “kickoff” (khởi động) is…',
      'options': ['follow up', 'wrap up', 'reschedule', 'brainstorm'],
      'correctIndex': 1,
      'explain': 'kickoff ↔ wrap up.',
    },
    {
      'question':
          'Identify: People who have interest/impact in the project are…',
      'options': ['facilitators', 'handouts', 'venues', 'stakeholders'],
      'correctIndex': 3,
      'explain': 'stakeholders.',
    },
    {
      'question': 'Meaning check: “deliverable” is best described as…',
      'options': ['lịch trình', 'phòng họp', 'sản phẩm bàn giao', 'máy chiếu'],
      'correctIndex': 2,
      'explain': 'deliverable = output bàn giao.',
    },
    {
      'question': 'Choose the verb: Let’s ___ a quick session to gather ideas.',
      'options': ['allocate', 'brainstorm', 'wrap up', 'postpone'],
      'correctIndex': 1,
      'explain': 'brainstorm a session.',
    },
    {
      'question': 'Context: The proposal is out of project ___.',
      'options': ['minutes', 'handout', 'scope', 'venue'],
      'correctIndex': 2,
      'explain': 'out of scope.',
    },
    {
      'question': 'Context: We’ll ___ to next Tuesday because of the holiday.',
      'options': ['delegate', 'reschedule', 'brainstorm', 'allocate'],
      'correctIndex': 1,
      'explain': 'reschedule = dời lịch.',
    },
    {
      'question': 'Usage: The team made significant ___ this quarter.',
      'options': ['venues', 'minutes', 'progress', 'handouts'],
      'correctIndex': 2,
      'explain': 'make progress.',
    },
    {
      'question': 'Usage: Please ___ the meeting notes to all stakeholders.',
      'options': ['send', 'backlog', 'kickoff', 'venue'],
      'correctIndex': 0, // change
      'explain': 'send notes.',
    },
    {
      'question': 'Usage: Please ___ the meeting notes to all stakeholders.',
      'options': ['backlog', 'kickoff', 'venue', 'send'],
      'correctIndex': 3,
      'explain': 'send notes.',
    },
    {
      'question': 'Which fits best? “Our main ___ is to launch by Q3.”',
      'options': ['agenda', 'objective', 'venue', 'backlog'],
      'correctIndex': 1,
      'explain': 'main objective.',
    },
    {
      'question': 'Which fits best? “We need to ___ tasks fairly.”',
      'options': ['handout', 'assign', 'venue', 'minutes'],
      'correctIndex': 1,
      'explain': 'assign tasks.',
    },
    {
      'question': 'Meaning: “remote support” implies help is provided…',
      'options': [
        'tại chỗ',
        'trực tiếp phòng họp',
        'sau khi kết thúc',
        'từ xa',
      ],
      'correctIndex': 3,
      'explain': 'remote = từ xa.',
    },
    {
      'question': 'Meaning: “on-site training” will take place…',
      'options': ['qua video call', 'ngoài giờ', 'tại chỗ', 'qua email'],
      'correctIndex': 2,
      'explain': 'on-site = tại chỗ.',
    },
    {
      'question': 'Completion: Please reserve the ___ from 2–4 p.m.',
      'options': ['handout', 'scope', 'conference room', 'minutes'],
      'correctIndex': 2,
      'explain': 'reserve the conference room.',
    },
    {
      'question': 'Completion: Print 20 ___ for the workshop.',
      'options': ['projectors', 'stakeholders', 'handouts', 'venues'],
      'correctIndex': 2,
      'explain': 'print handouts.',
    },
    {
      'question': 'Closest meaning: “follow up (v)” ≈',
      'options': ['bắt đầu', 'phân bổ', 'theo dõi/nhắc lại', 'ủy quyền'],
      'correctIndex': 2,
      'explain': 'follow up = theo dõi.',
    },
    {
      'question': 'Opposite: The opposite of “postpone” is…',
      'options': ['delegate', 'bring forward', 'wrap up', 'allocate'],
      'correctIndex': 1,
      'explain': 'dời sớm hơn = bring forward.',
    },
    {
      'question': 'Meaning check: “backlog” is best explained as…',
      'options': ['máy chiếu', 'mục tiêu', 'điểm hẹn', 'công việc tồn'],
      'correctIndex': 3,
      'explain': 'backlog = công việc tồn.',
    },
    {
      'question': 'Choose the verb: We will ___ the sprint at 9 a.m. Monday.',
      'options': ['wrap up', 'kick off', 'reschedule', 'follow up'],
      'correctIndex': 1,
      'explain': 'kick off = bắt đầu.',
    },
  ];

  // Ghi metadata của bài luyện
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab1")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 1: Meetings & Project Workflow',
        'questionCount': vocab1Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab1Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab1Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab1")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 2: Customer Service & Complaints (50 câu; options đã hoán vị)
  // =========================
  final vocab2Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “inquiry (n)” most nearly means…',
      'options': ['khiếu nại', 'yêu cầu thông tin', 'đánh giá', 'phiếu hỗ trợ'],
      'correctIndex': 1,
      'explain': 'inquiry = yêu cầu/đề nghị thông tin.',
    },
    {
      'question': 'Choose the best word: File a ___ online if you are unhappy.',
      'options': ['policy', 'survey', 'complaint', 'credit'],
      'correctIndex': 2,
      'explain': 'complaint = khiếu nại.',
    },
    {
      'question': 'Closest meaning: “resolve (v)” ≈',
      'options': ['vận chuyển', 'đổi hàng', 'tăng giá', 'giải quyết'],
      'correctIndex': 3,
      'explain': 'resolve an issue = giải quyết sự cố.',
    },
    {
      'question': 'Fill in: We sincerely ___ for the delay.',
      'options': ['survey', 'refund', 'apologize', 'ship'],
      'correctIndex': 2,
      'explain': 'apologize = xin lỗi.',
    },
    {
      'question': 'Meaning: “refund (n/v)” refers to…',
      'options': ['giao hàng', 'giám sát', 'đánh giá', 'hoàn tiền'],
      'correctIndex': 3,
      'explain': 'refund = hoàn tiền.',
    },
    {
      'question': 'Complete: We sent a ___ for the broken item.',
      'options': ['replacement', 'policy', 'response time', 'warranty'],
      'correctIndex': 0,
      'explain': 'replacement = hàng thay thế.',
    },
    {
      'question': 'Pick the noun: The product is under ___.',
      'options': ['ticket', 'credit', 'warranty', 'survey'],
      'correctIndex': 2,
      'explain': 'warranty = bảo hành.',
    },
    {
      'question': 'Meaning check: a “defective” item is…',
      'options': ['hết hạn bảo hành', 'giao nhanh', 'bị lỗi', 'đổi mới'],
      'correctIndex': 2,
      'explain': 'defective = khiếm khuyết.',
    },
    {
      'question': 'Choose the adjective: The package arrived ___.',
      'options': ['courteous', 'damaged', 'tentative', 'inconvenient'],
      'correctIndex': 1,
      'explain': 'damaged = hư hại.',
    },
    {
      'question': 'Sentence: We regret the ___ in processing your order.',
      'options': ['exchange', 'policy', 'survey', 'delay'],
      'correctIndex': 3,
      'explain': 'delay = chậm trễ.',
    },
    {
      'question': 'Meaning: “shipping (n)” is…',
      'options': ['giải quyết', 'đánh giá', 'vận chuyển', 'hoàn tiền'],
      'correctIndex': 2,
      'explain': 'shipping = vận chuyển.',
    },
    {
      'question': 'Fill in: What’s the ___ so I can check the delivery?',
      'options': [
        'store credit',
        'tracking number',
        'response time',
        'support ticket',
      ],
      'correctIndex': 1,
      'explain': 'tracking number = mã theo dõi.',
    },
    {
      'question': 'Choose the noun: Please create a ___ for this request.',
      'options': ['support ticket', 'exchange', 'policy', 'refund'],
      'correctIndex': 0,
      'explain': 'support ticket = phiếu hỗ trợ.',
    },
    {
      'question': 'Usage: We had to ___ the case to a supervisor.',
      'options': ['survey', 'apologize', 'escalate', 'refund'],
      'correctIndex': 2,
      'explain': 'escalate = chuyển cấp.',
    },
    {
      'question': 'Identify: A “supervisor” is…',
      'options': ['bảo hành', 'giám sát', 'hoàn tiền', 'khách hàng'],
      'correctIndex': 1,
      'explain': 'supervisor = người quản lý/giám sát.',
    },
    {
      'question': 'Meaning: Read our return ___ before sending items back.',
      'options': ['credit', 'minutes', 'policy', 'feedback'],
      'correctIndex': 2,
      'explain': 'policy = chính sách.',
    },
    {
      'question': 'Meaning: “customer satisfaction” is…',
      'options': [
        'đổi hàng',
        'phiếu hỗ trợ',
        'sự hài lòng khách hàng',
        'giờ chờ máy',
      ],
      'correctIndex': 2,
      'explain': 'satisfaction = sự hài lòng.',
    },
    {
      'question': 'Choose the noun: We value your ___.',
      'options': ['hold time', 'policy', 'feedback', 'exchange'],
      'correctIndex': 2,
      'explain': 'feedback = phản hồi.',
    },
    {
      'question': 'Fill in: Please fill out the customer ___.',
      'options': ['warranty', 'replacement', 'credit', 'survey'],
      'correctIndex': 3,
      'explain': 'survey = khảo sát.',
    },
    {
      'question': 'Meaning: Our ___ is 24 hours on weekdays.',
      'options': ['compensation', 'response time', 'store credit', 'hold time'],
      'correctIndex': 1,
      'explain': 'response time = thời gian phản hồi.',
    },
    {
      'question': 'Choose the phrase: Sorry for the long ___.',
      'options': ['refund', 'warranty', 'hold time', 'policy'],
      'correctIndex': 2,
      'explain': 'hold time = thời gian chờ máy.',
    },
    {
      'question': 'Adjective: Please be ___ to customers.',
      'options': ['damaged', 'courteous', 'tentative', 'defective'],
      'correctIndex': 1,
      'explain': 'courteous = lịch sự, nhã nhặn.',
    },
    {
      'question': 'Meaning: “inconvenient (adj)” means…',
      'options': ['đúng giờ', 'chính xác', 'gây bất tiện', 'được bảo hành'],
      'correctIndex': 2,
      'explain': 'inconvenient = bất tiện.',
    },
    {
      'question': 'Pick the noun: It was a ___. We will fix it quickly.',
      'options': ['policy', 'warranty', 'replacement', 'misunderstanding'],
      'correctIndex': 3,
      'explain': 'misunderstanding = hiểu lầm.',
    },
    {
      'question': 'Meaning: Offer a ___ credit to keep the customer happy.',
      'options': ['shipping', 'goodwill', 'survey', 'delay'],
      'correctIndex': 1,
      'explain': 'goodwill = thiện chí.',
    },
    {
      'question': 'Choose the word: We issued a store ___.',
      'options': ['complaint', 'warranty', 'escalation', 'credit'],
      'correctIndex': 3,
      'explain': 'credit = khoản tín/dư có.',
    },
    {
      'question': 'Meaning: “store credit (n)” is…',
      'options': [
        'phiếu hỗ trợ',
        'mã theo dõi',
        'tín dụng cửa hàng',
        'giải pháp thay thế',
      ],
      'correctIndex': 2,
      'explain': 'store credit = số dư dùng mua tại cửa hàng.',
    },
    {
      'question': 'Choose the noun: We offer ___ for the inconvenience.',
      'options': ['tracking number', 'warranty', 'compensation', 'survey'],
      'correctIndex': 2,
      'explain': 'compensation = đền bù.',
    },
    {
      'question': 'Fill in: You can ___ the item within 7 days.',
      'options': ['allocate', 'supervise', 'return', 'ship'],
      'correctIndex': 2,
      'explain': 'return = trả hàng.',
    },
    {
      'question': 'Fill in: If the size is wrong, you can request an ___.',
      'options': ['policy', 'exchange', 'response time', 'hold time'],
      'correctIndex': 1,
      'explain': 'exchange = đổi hàng.',
    },
    {
      'question': 'Collocation: “file a ___” (nộp khiếu nại).',
      'options': ['survey', 'warranty', 'credit', 'complaint'],
      'correctIndex': 3,
      'explain': 'file a complaint.',
    },
    {
      'question': 'Collocation: “request a full ___.”',
      'options': ['policy', 'refund', 'ticket', 'exchange'],
      'correctIndex': 1,
      'explain': 'request a refund.',
    },
    {
      'question': 'Completion: “speak to a ___” when the issue escalates.',
      'options': ['shipping', 'warranty', 'supervisor', 'survey'],
      'correctIndex': 2,
      'explain': 'speak to a supervisor.',
    },
    {
      'question': 'Completion: “under ___” → eligible for repair/replacement.',
      'options': ['delay', 'warranty', 'credit', 'policy'],
      'correctIndex': 1,
      'explain': 'under warranty.',
    },
    {
      'question': 'Best choice: “___ the issue within 24 hours.”',
      'options': ['Return', 'Exchange', 'Resolve', 'Ship'],
      'correctIndex': 2,
      'explain': 'resolve the issue.',
    },
    {
      'question': 'Best choice: “offer a ___ item if it arrived damaged.”',
      'options': ['policy', 'replacement', 'credit', 'survey'],
      'correctIndex': 1,
      'explain': 'offer a replacement.',
    },
    {
      'question': 'Meaning: “response time” differs from “hold time” because…',
      'options': [
        'cả hai là chính sách đổi trả',
        'hold time luôn nhanh hơn',
        'cả hai là bảo hành',
        'response time là tổng thời gian phản hồi, hold time là lúc chờ máy',
      ],
      'correctIndex': 3,
      'explain': 'response time vs hold time.',
    },
    {
      'question': 'Opposite: The opposite of “inconvenient” is…',
      'options': ['convenient', 'courteous', 'defective', 'damaged'],
      'correctIndex': 0,
      'explain': 'convenient = thuận tiện.',
    },
    {
      'question': 'Identify: “tracking number” helps you…',
      'options': [
        'đặt lịch bảo hành',
        'theo dõi đơn hàng',
        'điền khảo sát',
        'nhận hoàn tiền',
      ],
      'correctIndex': 1,
      'explain': 'track a package.',
    },
    {
      'question': 'Choose the verb: We’ll ___ your case to the next level.',
      'options': ['survey', 'escalate', 'refund', 'ship'],
      'correctIndex': 1,
      'explain': 'escalate a case.',
    },
    {
      'question': 'Pick the noun: Please leave your ___ after the call.',
      'options': ['warranty', 'policy', 'feedback', 'credit'],
      'correctIndex': 2,
      'explain': 'leave feedback.',
    },
    {
      'question': 'Context: The jacket was ___, so we issued a refund.',
      'options': ['courteous', 'defective', 'convenient', 'tentative'],
      'correctIndex': 1,
      'explain': 'defective jacket.',
    },
    {
      'question': 'Context: The box was ___ during shipping.',
      'options': ['refunded', 'escalated', 'exchanged', 'damaged'],
      'correctIndex': 3,
      'explain': 'damaged during shipping.',
    },
    {
      'question': 'Context: The company sent a ___ email to say “sorry”.',
      'options': ['warranty', 'complaint', 'courteous', 'inquiry'],
      'correctIndex': 2,
      'explain': 'courteous = lịch sự.',
    },
    {
      'question': 'Which fits best? “We appreciate your time and ___.”',
      'options': ['warranty', 'ticket', 'feedback', 'exchange'],
      'correctIndex': 2,
      'explain': 'appreciate your feedback.',
    },
    {
      'question': 'Which fits best? “This was a simple ___; no refund needed.”',
      'options': ['credit', 'policy', 'delay', 'misunderstanding'],
      'correctIndex': 3,
      'explain': 'hiểu lầm đơn giản.',
    },
    {
      'question': 'Meaning check: “compensation” in CS is usually…',
      'options': [
        'đền bù (tiền/phiếu/credit)',
        'đổi hàng',
        'bảo hành',
        'giao hàng',
      ],
      'correctIndex': 0,
      'explain': 'compensation = bồi thường.',
    },
    {
      'question': 'Collocation: “customer ___ is key.”',
      'options': ['policy', 'ticket', 'delay', 'satisfaction'],
      'correctIndex': 3,
      'explain': 'customer satisfaction.',
    },
    {
      'question': 'Completion: You can request an ___ instead of a refund.',
      'options': ['exchange', 'warranty', 'survey', 'hold time'],
      'correctIndex': 0,
      'explain': 'exchange instead of refund.',
    },
    {
      'question': 'Completion: We applied a \$10 store ___ to your account.',
      'options': ['credit', 'policy', 'ticket', 'delay'],
      'correctIndex': 0,
      'explain': 'store credit.',
    },
    {
      'question': 'Best paraphrase: “We apologize for the inconvenience.”',
      'options': [
        'Vui lòng đổi hàng ngay',
        'Đây là khiếu nại của bạn',
        'Xin gửi mã theo dõi',
        'Chúng tôi xin lỗi vì sự bất tiện',
      ],
      'correctIndex': 3,
      'explain': 'apologize for the inconvenience.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab2")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 2: Customer Service & Complaints',
        'questionCount': vocab2Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab2Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab2Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab2")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 3: Business Travel & Lodging (50 câu; options đã hoán vị)
  // =========================
  final vocab3Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “itinerary (n)” most nearly means…',
      'options': ['voucher', 'reservation', 'lịch trình', 'gate'],
      'correctIndex': 2,
      'explain': 'itinerary = lịch trình chuyến đi.',
    },
    {
      'question': 'Choose the noun: Print your ___ before security.',
      'options': ['arrival', 'boarding pass', 'customs', 'immigration'],
      'correctIndex': 1,
      'explain': 'boarding pass = thẻ lên máy bay.',
    },
    {
      'question': 'Fill in: We will ___ online tonight.',
      'options': ['check out', 'upgrade', 'check in', 'cancel'],
      'correctIndex': 2,
      'explain': 'check in online = làm thủ tục trước.',
    },
    {
      'question': 'Meaning: “baggage claim” refers to…',
      'options': [
        'quầy check-in',
        'cửa ra máy bay',
        'băng nhận hành lý',
        'khu hải quan',
      ],
      'correctIndex': 2,
      'explain': 'baggage claim = nơi lấy hành lý.',
    },
    {
      'question': 'Pick the seat: I prefer an ___ on long flights.',
      'options': ['economy class', 'aisle seat', 'window seat', 'standby'],
      'correctIndex': 1,
      'explain': 'aisle seat = ghế lối đi.',
    },
    {
      'question': 'Closest meaning: “departure (n)” is…',
      'options': ['đến nơi', 'bảo hiểm', 'khởi hành', 'quá cảnh'],
      'correctIndex': 2,
      'explain': 'departure = giờ khởi hành.',
    },
    {
      'question': 'Completion: The flight was ___ due to weather.',
      'options': ['delayed', 'confirmed', 'upgraded', 'canceled'],
      'correctIndex': 0,
      'explain': 'delayed = bị trễ.',
    },
    {
      'question': 'Meaning: A two-hour “layover” is…',
      'options': [
        'bảo hiểm chuyến đi',
        'nhập cảnh',
        'quá cảnh 2 giờ',
        'xe trung chuyển',
      ],
      'correctIndex': 2,
      'explain': 'layover = quá cảnh.',
    },
    {
      'question': 'Choose the service: Take the hotel ___.',
      'options': ['amenities', 'shuttle', 'passport', 'visa'],
      'correctIndex': 1,
      'explain': 'shuttle = xe trung chuyển.',
    },
    {
      'question': 'Fill in: Keep your ___ safe at all times.',
      'options': ['concierge', 'gate', 'passport', 'voucher'],
      'correctIndex': 2,
      'explain': 'passport = hộ chiếu.',
    },
    {
      'question': 'Meaning: “concierge (n)” at a hotel is…',
      'options': [
        'lễ tân hỗ trợ/nhân viên hỗ trợ',
        'buffet sáng',
        'dịch vụ đưa đón',
        'máy kiểm tra hộ chiếu',
      ],
      'correctIndex': 0,
      'explain': 'concierge hỗ trợ khách trong khách sạn.',
    },
    {
      'question': 'Completion: The room includes ___ breakfast.',
      'options': ['carry-on', 'complimentary', 'standby', 'arrival'],
      'correctIndex': 1,
      'explain': 'complimentary breakfast = bữa sáng miễn phí.',
    },
    {
      'question': 'Choose the noun: Please confirm your ___.',
      'options': ['reservation', 'gate', 'economy class', 'customs'],
      'correctIndex': 0,
      'explain': 'reservation = đặt chỗ.',
    },
    {
      'question': 'Meaning: A booking “confirmation (n)” is…',
      'options': [
        'xác nhận đặt chỗ',
        'phiếu ăn sáng',
        'bảo hiểm',
        'hành lý xách tay',
      ],
      'correctIndex': 0,
      'explain': 'confirmation email = email xác nhận.',
    },
    {
      'question': 'Pick the document: Present this ___ at check-in.',
      'options': ['voucher', 'gate', 'aisle seat', 'arrival'],
      'correctIndex': 0,
      'explain': 'voucher = phiếu/chứng từ.',
    },
    {
      'question': 'Best completion: We got a free room ___.',
      'options': ['customs', 'upgrade', 'immigration', 'layover'],
      'correctIndex': 1,
      'explain': 'upgrade = nâng hạng.',
    },
    {
      'question': 'Identify: I’m flying in ___.',
      'options': ['economy class', 'window seat', 'concierge', 'amenities'],
      'correctIndex': 0,
      'explain': 'economy class = hạng phổ thông.',
    },
    {
      'question': 'Seat choice: She wants a ___.',
      'options': ['window seat', 'standby', 'voucher', 'gate'],
      'correctIndex': 0,
      'explain': 'window seat = ghế cạnh cửa sổ.',
    },
    {
      'question': 'Opposite pair: “delayed” vs ___',
      'options': ['upgraded', 'on time', 'standby', 'arrival'],
      'correctIndex': 1,
      'explain': 'on time ↔ delayed.',
    },
    {
      'question': 'Status: The flight was ___ due to a storm.',
      'options': ['immigration', 'canceled', 'customs', 'amenities'],
      'correctIndex': 1,
      'explain': 'canceled = bị hủy.',
    },
    {
      'question': 'Meaning: I’m on airline ___.',
      'options': ['standby', 'gate', 'voucher', 'carry-on'],
      'correctIndex': 0,
      'explain': 'standby = danh sách chờ.',
    },
    {
      'question': 'Choose the noun: Buy ___ for your trip.',
      'options': ['travel insurance', 'complimentary', 'upgrade', 'concierge'],
      'correctIndex': 0,
      'explain': 'travel insurance = bảo hiểm du lịch.',
    },
    {
      'question': 'Instruction: Go through ___.',
      'options': ['itinerary', 'customs', 'boarding pass', 'amenities'],
      'correctIndex': 1,
      'explain': 'customs = hải quan.',
    },
    {
      'question': 'Meaning: “immigration (n)” is the process of…',
      'options': [
        'lấy hành lý',
        'kiểm soát xuất/nhập cảnh',
        'đổi chỗ ngồi',
        'nâng hạng',
      ],
      'correctIndex': 1,
      'explain': 'immigration = nhập cảnh.',
    },
    {
      'question': 'Choose the doc: Do I need a ___ for this country?',
      'options': ['visa', 'gate', 'aisle seat', 'voucher'],
      'correctIndex': 0,
      'explain': 'visa = thị thực.',
    },
    {
      'question': 'Hotel: What ___ are included?',
      'options': [
        'amenities',
        'gate numbers',
        'immigration lines',
        'customs slips',
      ],
      'correctIndex': 0,
      'explain': 'amenities = tiện nghi (gym, pool...).',
    },
    {
      'question': 'Role: Ask the ___ for help with restaurants.',
      'options': [
        'concierge',
        'immigration officer',
        'gate agent',
        'baggage handler',
      ],
      'correctIndex': 0,
      'explain': 'concierge gợi ý ăn uống/đi lại.',
    },
    {
      'question': 'Breakfast: The room includes ___ breakfast daily.',
      'options': ['window', 'standby', 'complimentary', 'carry-on'],
      'correctIndex': 2,
      'explain': 'complimentary = miễn phí.',
    },
    {
      'question': 'Collocation: “carry-on ___ allowed per passenger.”',
      'options': ['one', 'immigration', 'customs', 'concierge'],
      'correctIndex': 0,
      'explain': 'one carry-on per person.',
    },
    {
      'question': 'Gate info: Your ___ is B12.',
      'options': ['gate', 'voucher', 'amenities', 'window seat'],
      'correctIndex': 0,
      'explain': 'gate = cổng ra máy bay.',
    },
    {
      'question': 'Pairing: “check-out” is typically done…',
      'options': [
        'khi trả phòng/hoàn tất hóa đơn',
        'trước khi lên máy bay',
        'tại hải quan',
        'ở khu nhập cảnh',
      ],
      'correctIndex': 0,
      'explain': 'check-out = trả phòng (hotel).',
    },
    {
      'question': 'Usage: We will ___ at noon tomorrow.',
      'options': ['carry-on', 'check out', 'customs', 'arrival'],
      'correctIndex': 1,
      'explain': 'check out = trả phòng.',
    },
    {
      'question': 'Meaning: “luggage (n)” most nearly means…',
      'options': ['hành lý', 'cổng', 'bữa sáng', 'vé'],
      'correctIndex': 0,
      'explain': 'luggage = hành lý.',
    },
    {
      'question': 'Identify: “baggage” is closest to…',
      'options': ['luggage', 'gate', 'concierge', 'amenities'],
      'correctIndex': 0,
      'explain': 'baggage = luggage.',
    },
    {
      'question': 'Context: The ___ time has changed to 09:40.',
      'options': ['arrival', 'itinerary', 'voucher', 'concierge'],
      'correctIndex': 0,
      'explain': 'arrival time = giờ đến.',
    },
    {
      'question': 'Context: Please send me your travel ___.',
      'options': ['shuttle', 'itinerary', 'amenities', 'customs'],
      'correctIndex': 1,
      'explain': 'travel itinerary.',
    },
    {
      'question': 'Meaning: “gate (n)” is…',
      'options': ['cửa ra máy bay', 'băng hành lý', 'bảo hiểm', 'vé nâng hạng'],
      'correctIndex': 0,
      'explain': 'gate = cổng.',
    },
    {
      'question': 'Meaning: “arrival (n)” is…',
      'options': ['điểm khởi hành', 'đến nơi', 'đổi chỗ', 'nâng hạng'],
      'correctIndex': 1,
      'explain': 'arrival = đến nơi.',
    },
    {
      'question': 'Check-in desk asked me to show the hotel ___.',
      'options': ['voucher', 'immigration', 'carry-on', 'concierge'],
      'correctIndex': 0,
      'explain': 'voucher = phiếu xác nhận.',
    },
    {
      'question': 'Choose the class: We upgraded from ___ to business.',
      'options': ['economy', 'concierge', 'customs', 'amenities'],
      'correctIndex': 0,
      'explain': 'economy → business.',
    },
    {
      'question': 'Seat talk: He doesn’t like a ___ because he sleeps easily.',
      'options': ['window seat', 'aisle seat', 'standby', 'gate'],
      'correctIndex': 1,
      'explain': 'ngủ dễ → thích window hơn aisle.',
    },
    {
      'question': 'Airport flow: After landing, go to ___.',
      'options': ['baggage claim', 'departure board', 'gate', 'check-in'],
      'correctIndex': 0,
      'explain': 'lấy hành lý → baggage claim.',
    },
    {
      'question': 'Hotel help: The ___ can book you a taxi.',
      'options': ['immigration', 'concierge', 'customs', 'gate agent'],
      'correctIndex': 1,
      'explain': 'concierge đặt taxi.',
    },
    {
      'question': 'Amenities example: Which one belongs to amenities?',
      'options': [
        'pool & gym',
        'immigration stamp',
        'boarding pass',
        'carry-on tag',
      ],
      'correctIndex': 0,
      'explain': 'amenities = tiện nghi.',
    },
    {
      'question': 'Paperwork: You need a ___ for entry.',
      'options': ['visa', 'gate number', 'aisle seat', 'baggage tag'],
      'correctIndex': 0,
      'explain': 'visa để nhập cảnh.',
    },
    {
      'question': 'Baggage type: A small suitcase you take onboard is a…',
      'options': ['window seat', 'carry-on', 'voucher', 'concierge'],
      'correctIndex': 1,
      'explain': 'carry-on = hành lý xách tay.',
    },
    {
      'question': 'Timing: Our ___ board says “On Time”.',
      'options': ['departure', 'immigration', 'amenities', 'concierge'],
      'correctIndex': 0,
      'explain': 'bảng khởi hành (departure board).',
    },
    {
      'question': 'Situation: The flight to HN was ___, we waited 3 hours.',
      'options': ['complimentary', 'delayed', 'standby', 'concierge'],
      'correctIndex': 1,
      'explain': 'delayed = trễ.',
    },
    {
      'question': 'Hotel phrase: Breakfast is ___.',
      'options': ['standby', 'complimentary', 'customs', 'immigration'],
      'correctIndex': 1,
      'explain': 'miễn phí = complimentary.',
    },
    {
      'question':
          'Travel paperwork: Show your ___ and boarding pass at the gate.',
      'options': [
        'passport',
        'amenities list',
        'concierge note',
        'arrival slip',
      ],
      'correctIndex': 0,
      'explain': 'passport + boarding pass.',
    },
    {
      'question': 'Route info: A 2-hour ___ in Seoul, then onward to LA.',
      'options': ['immigration', 'layover', 'customs', 'upgrade'],
      'correctIndex': 1,
      'explain': 'layover = quá cảnh.',
    },
    {
      'question': 'Hotel booking: Please email the booking ___.',
      'options': ['upgrade', 'confirmation', 'customs', 'gate'],
      'correctIndex': 1,
      'explain': 'confirmation = xác nhận đặt chỗ.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab3")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 3: Business Travel & Lodging',
        'questionCount': vocab3Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab3Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab3Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab3")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 4: HR & Recruitment (50 câu; options đã hoán vị)
  // =========================
  final vocab4Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “human resources (HR)” most nearly means…',
      'options': ['tài chính', 'nhân sự', 'hậu cần', 'sản xuất'],
      'correctIndex': 1,
      'explain': 'HR = bộ phận nhân sự của công ty.',
    },
    {
      'question': 'Choose the verb: The company plans to ___ five developers.',
      'options': ['promote', 'recruit', 'resign', 'invoice'],
      'correctIndex': 1,
      'explain': 'recruit = tuyển dụng.',
    },
    {
      'question': 'Fill in: Our ___ process starts next week.',
      'options': ['recruitment', 'turnover', 'payroll', 'benefits'],
      'correctIndex': 0,
      'explain': 'recruitment = quy trình tuyển dụng.',
    },
    {
      'question': 'Pick the noun: Each ___ must submit a CV.',
      'options': ['panel', 'candidate', 'payroll', 'probation'],
      'correctIndex': 1,
      'explain': 'candidate = ứng viên.',
    },
    {
      'question': 'Meaning: Please email your ___.',
      'options': ['resume', 'promotion', 'headcount', 'turnover'],
      'correctIndex': 0,
      'explain': 'resume = sơ yếu lý lịch.',
    },
    {
      'question': 'Identify: A short letter that accompanies your CV is a…',
      'options': ['contract', 'cover letter', 'voucher', 'background check'],
      'correctIndex': 1,
      'explain': 'cover letter = thư xin việc ngắn.',
    },
    {
      'question': 'Choose the phrase: I saw the ___ on the company website.',
      'options': ['job posting', 'payroll', 'severance', 'reference'],
      'correctIndex': 0,
      'explain': 'job posting = tin tuyển dụng.',
    },
    {
      'question': 'Meaning: Read the ___ carefully before applying.',
      'options': ['job description', 'turnover', 'bonus slip', 'timesheet'],
      'correctIndex': 0,
      'explain': 'job description = mô tả công việc.',
    },
    {
      'question': 'Fill in: A degree is a key ___.',
      'options': ['probation', 'requirement', 'headcount', 'panel'],
      'correctIndex': 1,
      'explain': 'requirement = yêu cầu.',
    },
    {
      'question': 'Select the noun: List your ___.',
      'options': ['qualifications', 'turnovers', 'payrolls', 'resignations'],
      'correctIndex': 0,
      'explain': 'qualifications = trình độ/bằng cấp.',
    },
    {
      'question': 'Best completion: We need relevant work ___.',
      'options': ['experience', 'offer', 'benefit', 'promotion'],
      'correctIndex': 0,
      'explain': 'experience = kinh nghiệm.',
    },
    {
      'question': 'Meaning: Your ___ fits the role perfectly.',
      'options': ['skill set', 'invoice', 'purchase order', 'baggage'],
      'correctIndex': 0,
      'explain': 'skill set = bộ kỹ năng.',
    },
    {
      'question': 'Choose the verb: HR will ___ applications this week.',
      'options': ['screen', 'ship', 'refund', 'assemble'],
      'correctIndex': 0,
      'explain': 'screen = sàng lọc hồ sơ.',
    },
    {
      'question': 'Pick the action: We ___ five people for the final round.',
      'options': ['shortlisted', 'resigned', 'onboarded', 'invoiced'],
      'correctIndex': 0,
      'explain': 'shortlist = đưa vào vòng trong.',
    },
    {
      'question': 'Meaning: Your ___ is on Thursday afternoon.',
      'options': ['interview', 'payroll', 'quotation', 'warranty'],
      'correctIndex': 0,
      'explain': 'interview = phỏng vấn.',
    },
    {
      'question': 'Identify: A group that interviews you is called a…',
      'options': ['panel', 'voucher', 'catalog', 'shipment'],
      'correctIndex': 0,
      'explain': 'panel = hội đồng phỏng vấn.',
    },
    {
      'question': 'Fill in: Please provide two professional ___.',
      'options': ['references', 'shipments', 'receipts', 'licenses'],
      'correctIndex': 0,
      'explain': 'references = người/thư giới thiệu.',
    },
    {
      'question': 'Meaning: We’ll conduct a ___ before the offer.',
      'options': [
        'background check',
        'customs check',
        'health voucher',
        'warehouse audit',
      ],
      'correctIndex': 0,
      'explain': 'background check = kiểm tra lý lịch.',
    },
    {
      'question': 'Choose the word: They sent a job ___.',
      'options': ['offer', 'invoice', 'stock-out', 'layover'],
      'correctIndex': 0,
      'explain': 'offer = đề nghị làm việc.',
    },
    {
      'question': 'Meaning: The ___ package is competitive.',
      'options': ['compensation', 'inventory', 'consignment', 'amenities'],
      'correctIndex': 0,
      'explain': 'compensation = đãi ngộ (salary + bonus + perks).',
    },
    {
      'question': 'Closest meaning: Health ___ are included.',
      'options': ['benefits', 'receipts', 'shipments', 'quotations'],
      'correctIndex': 0,
      'explain': 'benefits = phúc lợi.',
    },
    {
      'question': 'Usage: We will ___ new hires next Monday.',
      'options': ['onboard', 'dispatch', 'refund', 'archive'],
      'correctIndex': 0,
      'explain': 'onboard = hội nhập nhân viên mới.',
    },
    {
      'question': 'Fill in: The ___ period lasts two months.',
      'options': ['probation', 'inventory', 'turnover', 'forecast'],
      'correctIndex': 0,
      'explain': 'probation = thử việc.',
    },
    {
      'question': 'Identify: It’s a ___ position with full benefits.',
      'options': ['full-time', 'obsolete', 'perishable', 'overdue'],
      'correctIndex': 0,
      'explain': 'full-time = toàn thời gian.',
    },
    {
      'question': 'Pick the adjective: We also hire ___ staff for weekends.',
      'options': ['part-time', 'backordered', 'expired', 'remote-sensing'],
      'correctIndex': 0,
      'explain': 'part-time = bán thời gian.',
    },
    {
      'question': 'Meaning: We’re hiring an ___.',
      'options': ['intern', 'contractor', 'auditor', 'tenant'],
      'correctIndex': 0,
      'explain': 'intern = thực tập sinh.',
    },
    {
      'question': 'Choose the noun: She received a ___ last quarter.',
      'options': ['promotion', 'quotation', 'shipment', 'overtime cap'],
      'correctIndex': 0,
      'explain': 'promotion = thăng chức.',
    },
    {
      'question': 'Meaning: ___ is processed monthly.',
      'options': ['Payroll', 'Runway', 'Gateway', 'Freeway'],
      'correctIndex': 0,
      'explain': 'payroll = bảng lương.',
    },
    {
      'question': 'Meaning: We aim to reduce staff ___.',
      'options': ['turnover', 'lead time', 'markup', 'break-even'],
      'correctIndex': 0,
      'explain': 'turnover = tỷ lệ nghỉ việc.',
    },
    {
      'question': 'Best completion: Please state your expected ___.',
      'options': [
        'salary range',
        'travel voucher',
        'cargo weight',
        'tax rebate',
      ],
      'correctIndex': 0,
      'explain': 'salary range = khoảng lương mong đợi.',
    },
    {
      'question': 'Pick the verb: We will ___ the offer tomorrow.',
      'options': ['negotiate', 'ship', 'warehouse', 'dispose'],
      'correctIndex': 0,
      'explain': 'negotiate = thương lượng.',
    },
    {
      'question': 'Meaning: This is a one-year ___ with renewal option.',
      'options': ['contract', 'receipt', 'leaflet', 'coupon'],
      'correctIndex': 0,
      'explain': 'contract = hợp đồng.',
    },
    {
      'question': 'Choose the adjective: It’s a ___ role, not permanent.',
      'options': ['temporary', 'edible', 'fragile', 'sterile'],
      'correctIndex': 0,
      'explain': 'temporary = tạm thời.',
    },
    {
      'question': 'Meaning: We have three ___ to fill in Sales.',
      'options': ['vacancies', 'warehouses', 'shipments', 'liabilities'],
      'correctIndex': 0,
      'explain': 'vacancy = vị trí còn trống.',
    },
    {
      'question': 'Identify: Total staff allowed for the year is our…',
      'options': ['headcount', 'overdraft', 'overage', 'freight'],
      'correctIndex': 0,
      'explain': 'headcount = số lượng nhân sự.',
    },
    {
      'question': 'Choose the noun: Meet our ___ at the job fair.',
      'options': ['recruiter', 'cashier', 'porter', 'usher'],
      'correctIndex': 0,
      'explain': 'recruiter = chuyên viên tuyển dụng.',
    },
    {
      'question': 'Fill in: Please complete the online job ___.',
      'options': ['application', 'apparatus', 'allocation', 'appendix'],
      'correctIndex': 0,
      'explain': 'application = đơn ứng tuyển.',
    },
    {
      'question':
          'Meaning: The person answering questions in an interview is the…',
      'options': ['interviewee', 'interviewer', 'accountant', 'auditor'],
      'correctIndex': 0,
      'explain': 'interviewee = người được phỏng vấn.',
    },
    {
      'question': 'Meaning: The one who asks questions is the…',
      'options': ['interviewer', 'interviewee', 'panelist', 'receptionist'],
      'correctIndex': 0,
      'explain': 'interviewer = người phỏng vấn.',
    },
    {
      'question': 'Choose the phrase: New hire ___ starts next Monday.',
      'options': ['onboarding', 'warehousing', 'outsourcing', 'offshoring'],
      'correctIndex': 0,
      'explain': 'onboarding = quy trình hội nhập.',
    },
    {
      'question': 'Best choice: The ___ ends with a formal evaluation.',
      'options': ['probation', 'quotation', 'consumption', 'expiration'],
      'correctIndex': 0,
      'explain': 'kết thúc thử việc → đánh giá.',
    },
    {
      'question': 'Pick the term: A payment when an employee is laid off is…',
      'options': ['severance', 'dividend', 'freight', 'rent'],
      'correctIndex': 0,
      'explain': 'severance = trợ cấp thôi việc.',
    },
    {
      'question': 'Meaning: Your KPIs will be reviewed in the…',
      'options': [
        'performance review',
        'customs check',
        'price audit',
        'safety drill',
      ],
      'correctIndex': 0,
      'explain': 'đánh giá hiệu suất.',
    },
    {
      'question':
          'Choose the word: We need to ___ two more engineers this quarter.',
      'options': ['hire', 'fire', 'invoice', 'lease'],
      'correctIndex': 0,
      'explain': 'hire = tuyển thêm.',
    },
    {
      'question': 'Opposite sense: To “terminate employment” is to…',
      'options': ['dismiss', 'promote', 'invoice', 'mentor'],
      'correctIndex': 0,
      'explain': 'dismiss/fire = chấm dứt hợp đồng.',
    },
    {
      'question': 'Meaning: A role with no end-date is a ___ position.',
      'options': ['permanent', 'perishable', 'periodic', 'pilot'],
      'correctIndex': 0,
      'explain': 'permanent = dài hạn.',
    },
    {
      'question': 'Context: Payroll taxes are calculated in the ___.',
      'options': [
        'payroll system',
        'warehouse slot',
        'load planner',
        'CRM board',
      ],
      'correctIndex': 0,
      'explain': 'payroll system = hệ thống bảng lương.',
    },
    {
      'question': 'Completion: The HR manager will send a formal job ___.',
      'options': ['offer', 'draft', 'erratum', 'recall'],
      'correctIndex': 0,
      'explain': 'job offer = thư mời làm việc.',
    },
    {
      'question': 'Which fits best? “Please attach two professional ___.”',
      'options': ['references', 'rebates', 'receivables', 'remittances'],
      'correctIndex': 0,
      'explain': 'references = người/thư giới thiệu.',
    },
    {
      'question':
          'Which fits best? “The ___ lists duties and responsibilities.”',
      'options': [
        'job description',
        'time sheet',
        'travel voucher',
        'packing list',
      ],
      'correctIndex': 0,
      'explain': 'mô tả công việc.',
    },
    {
      'question': 'Synonym-ish: “compensation & ___ package”.',
      'options': ['benefits', 'booklets', 'backlogs', 'barcodes'],
      'correctIndex': 0,
      'explain': 'compensation & benefits (C&B).',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab4")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 4: HR & Recruitment',
        'questionCount': vocab4Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab4Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab4Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab4")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 5: Marketing & Sales Ops (50 câu; options đã hoán vị)
  // =========================
  final vocab5Questions = <Map<String, dynamic>>[
    // 1–10
    {
      'question': 'Meaning: “campaign (n)” most nearly means…',
      'options': ['đường ống cơ hội', 'chiến dịch', 'tờ rơi', 'phễu bán hàng'],
      'correctIndex': 1,
      'explain': 'campaign = chiến dịch tiếp thị/bán hàng.',
    },
    {
      'question': 'Choose the noun: The store is running a weekend ___.',
      'options': ['pipeline', 'promotion', 'funnel', 'quotation'],
      'correctIndex': 1,
      'explain': 'promotion = khuyến mãi.',
    },
    {
      'question': 'Pick the document: Grab a hotel ___.',
      'options': ['leaflet', 'testimonial', 'brochure', 'KPI'],
      'correctIndex': 2,
      'explain': 'brochure = tờ giới thiệu nhiều trang.',
    },
    {
      'question': 'Meaning: “leaflet (n)” is a…',
      'options': [
        'tờ rơi mỏng',
        'trang đích',
        'chỉ số hiệu suất',
        'bài chứng thực',
      ],
      'correctIndex': 0,
      'explain': 'leaflet = tờ rơi phát tay.',
    },
    {
      'question': 'Fill in: Define your ___ before designing creatives.',
      'options': ['value proposition', 'target audience', 'ROI', 'A/B test'],
      'correctIndex': 1,
      'explain': 'target audience = khách hàng mục tiêu.',
    },
    {
      'question': 'Closest meaning: “segment (v)” ≈',
      'options': ['giữ chân', 'phân khúc', 'chốt hợp đồng', 'bán thêm'],
      'correctIndex': 1,
      'explain': 'segment (thị trường) = phân khúc.',
    },
    {
      'question': 'Choose the noun: Brand ___ must be clear and consistent.',
      'options': ['awareness', 'positioning', 'prospect', 'lead'],
      'correctIndex': 1,
      'explain': 'positioning = định vị thương hiệu.',
    },
    {
      'question': 'Meaning: “brand awareness” refers to…',
      'options': [
        'mức độ nhận biết thương hiệu',
        'báo giá',
        'đàm phán',
        'đường ống cơ hội',
      ],
      'correctIndex': 0,
      'explain': 'brand awareness = độ nhận biết.',
    },
    {
      'question': 'Meaning: “value proposition” is…',
      'options': [
        'đề xuất giá trị cốt lõi cho khách',
        'lời kêu gọi hành động',
        'khách tiềm năng',
        'tỷ suất lợi nhuận',
      ],
      'correctIndex': 0,
      'explain': 'value proposition = lý do thuyết phục khách hàng.',
    },
    {
      'question': 'Pick the term: Add a clear ___ to the banner.',
      'options': ['funnel', 'CTA', 'ROI', 'KPI'],
      'correctIndex': 1,
      'explain': 'CTA (call to action) = lời kêu gọi hành động.',
    },

    // 11–20
    {
      'question': 'Meaning: a “lead (n)” is a…',
      'options': ['khách tiềm năng', 'chứng thực', 'tờ rơi', 'trang đích'],
      'correctIndex': 0,
      'explain': 'lead = khách hàng tiềm năng.',
    },
    {
      'question': 'Best completion: Improve website ___ rate.',
      'options': ['conversion', 'leaflet', 'pipeline', 'segment'],
      'correctIndex': 0,
      'explain': 'conversion rate = tỷ lệ chuyển đổi.',
    },
    {
      'question': 'Choose the noun: Optimize the sales ___.',
      'options': ['testimonial', 'funnel', 'quotation', 'brochure'],
      'correctIndex': 1,
      'explain': 'sales funnel = phễu bán hàng.',
    },
    {
      'question': 'Meaning: “pipeline (n)” in sales is…',
      'options': [
        'đường ống cơ hội',
        'chỉ số hiệu suất',
        'bài chứng thực',
        'tỷ suất lợi nhuận',
      ],
      'correctIndex': 0,
      'explain': 'pipeline = chuỗi cơ hội đang xử lý.',
    },
    {
      'question': 'Pick the noun: Call three new ___ today.',
      'options': ['prospects', 'CTAs', 'funnels', 'leaflets'],
      'correctIndex': 0,
      'explain': 'prospect = khách tiềm năng (ở mức tìm kiếm/tiếp cận).',
    },
    {
      'question': 'Choose the verb: First, ___ the leads with a quick call.',
      'options': ['qualify', 'upsell', 'cross-sell', 'close'],
      'correctIndex': 0,
      'explain': 'qualify = chấm điểm đủ chuẩn.',
    },
    {
      'question': 'Meaning: “quotation (n)” is a…',
      'options': ['báo giá', 'bài chứng thực', 'trang đích', 'khuyến mãi'],
      'correctIndex': 0,
      'explain': 'quotation = báo giá.',
    },
    {
      'question': 'Context: Prepare for price ___.',
      'options': ['negotiation', 'retention', 'churn', 'awareness'],
      'correctIndex': 0,
      'explain': 'negotiation = đàm phán.',
    },
    {
      'question': 'Choose the verb: We will ___ the deal this afternoon.',
      'options': ['close', 'segment', 'qualify', 'leaflet'],
      'correctIndex': 0,
      'explain': 'close = chốt (hợp đồng/giao dịch).',
    },
    {
      'question': 'Meaning: To “upsell (v)” a customer means…',
      'options': [
        'bán thêm gói cao hơn',
        'bán chéo phụ kiện',
        'giảm churn',
        'tăng KPI',
      ],
      'correctIndex': 0,
      'explain': 'upsell = bán gói cao hơn/đắt hơn.',
    },

    // 21–30
    {
      'question': 'Meaning: To “cross-sell (v)” means…',
      'options': [
        'bán chéo sản phẩm liên quan',
        'chốt hợp đồng',
        'phân khúc thị trường',
        'đổi tờ rơi',
      ],
      'correctIndex': 0,
      'explain': 'cross-sell = bán chéo.',
    },
    {
      'question': 'Pick the noun: Focus on customer ___.',
      'options': ['retention', 'leaflet', 'brochure', 'quotation'],
      'correctIndex': 0,
      'explain': 'retention = giữ chân khách.',
    },
    {
      'question': 'Meaning: “churn (n/v)” in SaaS refers to…',
      'options': [
        'khách rời bỏ',
        'chiến dịch',
        'tỷ suất lợi nhuận',
        'kênh phân phối',
      ],
      'correctIndex': 0,
      'explain': 'churn = rời bỏ/hủy dịch vụ.',
    },
    {
      'question': 'Choose the metric: Report the campaign ___.',
      'options': ['KPI', 'ROI', 'CTA', 'A/B test'],
      'correctIndex': 1,
      'explain': 'ROI = return on investment.',
    },
    {
      'question': 'Pick the metric: Set clear sales ___.',
      'options': ['CTAs', 'KPIs', 'leaflets', 'brochures'],
      'correctIndex': 1,
      'explain': 'KPI = chỉ số hiệu suất.',
    },
    {
      'question': 'Meaning: Run an ___ on two headlines.',
      'options': ['A/B test', 'ROI', 'pipeline', 'prospect'],
      'correctIndex': 0,
      'explain': 'A/B test = thử nghiệm A/B.',
    },
    {
      'question': 'Choose the noun: Update the copy on the ___.',
      'options': ['landing page', 'quotation', 'leaflet', 'KPI'],
      'correctIndex': 0,
      'explain': 'landing page = trang đích.',
    },
    {
      'question': 'Meaning: Add two customer ___.',
      'options': ['testimonials', 'pipelines', 'segments', 'CTAs'],
      'correctIndex': 0,
      'explain': 'testimonial = lời chứng thực.',
    },
    {
      'question': 'Fill in: Launch a ___ to reward loyal shoppers.',
      'options': ['loyalty program', 'conversion', 'quotation', 'leaflet'],
      'correctIndex': 0,
      'explain': 'loyalty program = chương trình thân thiết.',
    },
    {
      'question': 'Choose the phrase: Choose better ___ for rural areas.',
      'options': [
        'distribution channels',
        'brand awareness',
        'A/B tests',
        'testimonials',
      ],
      'correctIndex': 0,
      'explain': 'distribution channel = kênh phân phối.',
    },

    // 31–40 (collocations & mini-context)
    {
      'question': 'Collocation: “target ___”.',
      'options': ['audience', 'funnel', 'pipeline', 'KPI'],
      'correctIndex': 0,
      'explain': 'target audience.',
    },
    {
      'question': 'Collocation: “increase brand ___”.',
      'options': ['awareness', 'quotation', 'leaflet', 'segment'],
      'correctIndex': 0,
      'explain': 'brand awareness.',
    },
    {
      'question': 'Completion: “refine the value ___”.',
      'options': ['proposition', 'A/B test', 'leaflet', 'pipeline'],
      'correctIndex': 0,
      'explain': 'value proposition.',
    },
    {
      'question': 'Best completion: “optimize the sales ___”.',
      'options': ['funnel', 'leaflet', 'brochure', 'KPI'],
      'correctIndex': 0,
      'explain': 'sales funnel.',
    },
    {
      'question': 'Pick one: “fill the sales ___ with new leads”.',
      'options': ['pipeline', 'CTA', 'KPI', 'ROI'],
      'correctIndex': 0,
      'explain': 'sales pipeline.',
    },
    {
      'question': 'Which fits? “qualify the ___ first”.',
      'options': ['leads', 'testimonials', 'leaflets', 'brochures'],
      'correctIndex': 0,
      'explain': 'qualify leads.',
    },
    {
      'question': 'Meaning check: “close a deal” ≈',
      'options': ['chốt hợp đồng', 'tạo tờ rơi', 'tăng KPI', 'giảm ROI'],
      'correctIndex': 0,
      'explain': 'close = chốt.',
    },
    {
      'question': 'Opposite: The opposite of “churn” is closest to…',
      'options': ['retention', 'segmentation', 'quotation', 'leaflet'],
      'correctIndex': 0,
      'explain': 'retention ↔ churn.',
    },
    {
      'question':
          'Choose the action: “___ accessories after the main purchase”.',
      'options': ['Cross-sell', 'Churn', 'Qualify', 'A/B test'],
      'correctIndex': 0,
      'explain': 'cross-sell phụ kiện.',
    },
    {
      'question': 'Choose the action: “___ premium plans to heavy users”.',
      'options': ['Upsell', 'Leaflet', 'Brochure', 'Quote'],
      'correctIndex': 0,
      'explain': 'upsell gói cao cấp.',
    },

    // 41–50 (scenarios)
    {
      'question':
          'Scenario: The ad got clicks but few purchases — improve ___.',
      'options': ['conversion', 'leaflet', 'brochure', 'testimonial'],
      'correctIndex': 0,
      'explain': 'cải thiện tỷ lệ chuyển đổi.',
    },
    {
      'question':
          'Scenario: The CEO wants to know how profitable the campaign was — show ___.',
      'options': ['KPI', 'CTA', 'ROI', 'segment'],
      'correctIndex': 2,
      'explain': 'ROI trả lời “hiệu quả đầu tư”.',
    },
    {
      'question':
          'Scenario: Create a page built just for the ad traffic — a ___.',
      'options': ['landing page', 'pipeline', 'leaflet', 'quotation'],
      'correctIndex': 0,
      'explain': 'trang đích cho chiến dịch.',
    },
    {
      'question': 'Scenario: Before scaling, test headline A vs B — run a ___.',
      'options': ['A/B test', 'brochure', 'testimonial', 'KPI'],
      'correctIndex': 0,
      'explain': 'thử nghiệm A/B.',
    },
    {
      'question':
          'Scenario: Sales has many open opportunities — the ___ is strong.',
      'options': ['pipeline', 'leaflet', 'CTA', 'ROI'],
      'correctIndex': 0,
      'explain': 'pipeline mạnh = nhiều cơ hội.',
    },
    {
      'question': 'Scenario: Add a “Buy Now” button — that’s the ___.',
      'options': ['CTA', 'KPI', 'ROI', 'segment'],
      'correctIndex': 0,
      'explain': 'CTA = call to action.',
    },
    {
      'question':
          'Scenario: Customers keep canceling after month one — high ___.',
      'options': ['churn', 'brochure', 'leaflet', 'KPI'],
      'correctIndex': 0,
      'explain': 'churn cao.',
    },
    {
      'question':
          'Scenario: “Invite top customers to an exclusive tier” — a ___ tactic.',
      'options': ['loyalty program', 'quotation', 'leaflet', 'prospect'],
      'correctIndex': 0,
      'explain': 'tăng gắn bó qua loyalty program.',
    },
    {
      'question': 'Scenario: Publish quotes from happy users — add ___.',
      'options': ['testimonials', 'segments', 'CTAs', 'A/B tests'],
      'correctIndex': 0,
      'explain': 'testimonial = lời chứng thực.',
    },
    {
      'question': 'Scenario: “We sent prices for 3 SKUs” — we sent a ___.',
      'options': ['quotation', 'KPI', 'pipeline', 'leaflet'],
      'correctIndex': 0,
      'explain': 'quotation = báo giá.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab5")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 5: Marketing & Sales Ops',
        'questionCount': vocab5Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab5Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab5Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab5")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 6: Finance & Expenses (50 câu; options đã hoán vị)
  // =========================
  final vocab6Questions = <Map<String, dynamic>>[
    // 01
    {
      'question': 'Meaning: “invoice (n)” most nearly means…',
      'options': ['biên nhận', 'hóa đơn', 'phiếu nhập kho', 'bảng lương'],
      'correctIndex': 1,
      'explain': 'invoice = hóa đơn yêu cầu thanh toán.',
    },
    // 02
    {
      'question': 'Choose the noun: Please keep the store ___ for returns.',
      'options': ['phiếu bảo hành', 'hóa đơn đỏ', 'biên lai', 'bảng kê'],
      'correctIndex': 2,
      'explain': 'receipt = biên lai.',
    },
    // 03
    {
      'question': 'Fill in: Submit your monthly ___ to Finance.',
      'options': [
        'phiếu tạm ứng',
        'bảng chấm công',
        'báo cáo chi phí',
        'bảng giá',
      ],
      'correctIndex': 2,
      'explain': 'expense report = báo cáo chi phí.',
    },
    // 04
    {
      'question': 'Closest meaning: “reimbursement (n)” ≈',
      'options': [
        'khoản chi bổ sung',
        'hoàn chi phí',
        'phí ngân hàng',
        'tín dụng cửa hàng',
      ],
      'correctIndex': 1,
      'explain': 'reimbursement = hoàn lại tiền đã chi.',
    },
    // 05
    {
      'question': 'Choose the noun/verb: We must stay within the ___.',
      'options': ['tài khoản', 'ngân sách', 'doanh thu', 'sao kê'],
      'correctIndex': 1,
      'explain': 'budget = ngân sách.',
    },
    // 06
    {
      'question': 'Pick the noun: Report the total project ___.',
      'options': ['lợi nhuận', 'chi phí', 'dòng tiền', 'số dư'],
      'correctIndex': 1,
      'explain': 'cost = chi phí.',
    },
    // 07
    {
      'question': 'Meaning: “revenue (n)” is…',
      'options': ['chi phí vận hành', 'dòng tiền vào', 'doanh thu', 'giá vốn'],
      'correctIndex': 2,
      'explain': 'revenue = doanh thu.',
    },
    // 08
    {
      'question': 'Meaning: “profit (n)” refers to…',
      'options': ['hòa vốn', 'lợi nhuận', 'lỗ', 'khấu trừ'],
      'correctIndex': 1,
      'explain': 'profit = lợi nhuận.',
    },
    // 09
    {
      'question': 'Meaning: “loss (n)” most nearly means…',
      'options': ['tăng trưởng', 'lợi nhuận gộp', 'lỗ', 'chiết khấu'],
      'correctIndex': 2,
      'explain': 'loss = thua lỗ.',
    },
    // 10
    {
      'question': 'Fill in: Check the account ___.',
      'options': ['sao kê', 'số dư', 'biên lai', 'tỷ giá'],
      'correctIndex': 1,
      'explain': 'balance = số dư.',
    },
    // 11
    {
      'question': 'Meaning: “petty cash (n)” is…',
      'options': ['tiền mặt lặt vặt', 'thuế VAT', 'phụ cấp', 'tiền đặt cọc'],
      'correctIndex': 0,
      'explain': 'petty cash = tiền lẻ cho chi tiêu nhỏ.',
    },
    // 12
    {
      'question': 'Pick the noun: A travel ___ is fixed at \$20/day.',
      'options': ['phụ cấp', 'tín dụng', 'giảm trừ', 'tạm ứng'],
      'correctIndex': 0,
      'explain': 'allowance = khoản phụ cấp.',
    },
    // 13
    {
      'question': 'Meaning: Manager ___ is required for this purchase.',
      'options': ['khoản bù', 'phê duyệt', 'khoản vay', 'sao kê'],
      'correctIndex': 1,
      'explain': 'approval = phê duyệt.',
    },
    // 14
    {
      'question': 'Choose the noun/verb: We have an external ___.',
      'options': ['kiểm toán', 'bảo hành', 'gói bồi thường', 'định giá'],
      'correctIndex': 0,
      'explain': 'audit = kiểm toán.',
    },
    // 15
    {
      'question': 'Fill in: Record it properly in the ___.',
      'options': ['phiếu chi', 'sổ cái', 'bảng lương', 'đơn hàng'],
      'correctIndex': 1,
      'explain': 'ledger = sổ cái kế toán.',
    },
    // 16
    {
      'question': 'Meaning: A monthly bank ___ shows transactions.',
      'options': ['sao kê', 'hóa đơn', 'đề nghị mua', 'chào giá'],
      'correctIndex': 0,
      'explain': 'statement = sao kê.',
    },
    // 17
    {
      'question': 'Meaning: “due date (n)” is the…',
      'options': [
        'ngày chiết khấu',
        'ngày đến hạn',
        'ngày phát hành',
        'ngày công bố',
      ],
      'correctIndex': 1,
      'explain': 'due date = ngày đến hạn thanh toán.',
    },
    // 18
    {
      'question': 'Choose the adjective: The invoice is ___.',
      'options': ['đúng hạn', 'quá hạn', 'giảm trừ', 'luỹ kế'],
      'correctIndex': 1,
      'explain': 'overdue = quá hạn.',
    },
    // 19
    {
      'question': 'Meaning: “installment (n)” most nearly means…',
      'options': ['góp vốn', 'trả góp', 'tạm ứng', 'bù trừ'],
      'correctIndex': 1,
      'explain': 'installment = kỳ trả góp.',
    },
    // 20
    {
      'question': 'Fill in: We sent a ___ to the supplier yesterday.',
      'options': ['séc', 'ủy nhiệm chi', 'chuyển khoản', 'phiếu thu'],
      'correctIndex': 2,
      'explain': 'wire transfer = chuyển khoản ngân hàng.',
    },
    // 21
    {
      'question': 'Meaning: Additional ___ may apply when using ATMs.',
      'options': ['phí ngân hàng', 'tỷ giá', 'khấu trừ', 'giảm giá'],
      'correctIndex': 0,
      'explain': 'bank fee = phí ngân hàng.',
    },
    // 22
    {
      'question': 'Meaning: “exchange rate (n)” is…',
      'options': [
        'tỷ suất lợi nhuận',
        'tỷ giá hối đoái',
        'tỷ lệ chuyển đổi',
        'tỷ lệ nợ',
      ],
      'correctIndex': 1,
      'explain': 'exchange rate = tỷ giá hối đoái.',
    },
    // 23
    {
      'question': 'Choose the noun: This price excludes ___.',
      'options': [
        'phí thanh toán',
        'thuế',
        'chi phí cố định',
        'biên lợi nhuận',
      ],
      'correctIndex': 1,
      'explain': 'tax = thuế.',
    },
    // 24
    {
      'question': 'Meaning: The company will ___ 10% tax.',
      'options': ['hoàn ứng', 'khấu trừ', 'tạm giữ', 'hoàn lại'],
      'correctIndex': 1,
      'explain': 'withhold = khấu trừ/giữ lại.',
    },
    // 25
    {
      'question': 'Pick the action: Please ___ this expense to account 642.',
      'options': ['ghi có', 'ghi nợ', 'hoàn chi', 'bù trừ'],
      'correctIndex': 1,
      'explain': 'debit = ghi nợ.',
    },
    // 26
    {
      'question': 'Pick the action: We will ___ the refund today.',
      'options': ['lập quỹ lặt vặt', 'ghi có', 'ghi nợ', 'khóa sổ'],
      'correctIndex': 1,
      'explain': 'credit (v) = ghi có.',
    },
    // 27
    {
      'question': 'Meaning: “cash flow (n)” refers to…',
      'options': ['dòng tiền', 'số dư cuối kỳ', 'tỷ giá', 'phí dịch vụ'],
      'correctIndex': 0,
      'explain': 'cash flow = dòng tiền vào/ra.',
    },
    // 28
    {
      'question': 'Meaning: “forecast (v)” most nearly means…',
      'options': ['kiểm toán', 'dự báo', 'điều chỉnh', 'phân bổ'],
      'correctIndex': 1,
      'explain': 'forecast = dự báo.',
    },
    // 29
    {
      'question': 'Choose the noun: Protect the profit ___.',
      'options': ['phí ngân hàng', 'tỷ giá', 'biên lợi nhuận', 'báo cáo quý'],
      'correctIndex': 2,
      'explain': 'margin = biên lợi nhuận.',
    },
    // 30
    {
      'question': 'Meaning: “break-even (adj/n)” is closest to…',
      'options': ['hòa vốn', 'lỗ nhẹ', 'lãi ròng', 'tăng giá vốn'],
      'correctIndex': 0,
      'explain': 'break-even = hòa vốn.',
    },
    // 31
    {
      'question':
          'Completion: The ___ shows last month’s deposits and withdrawals.',
      'options': ['invoice', 'statement', 'allowance', 'ledger'],
      'correctIndex': 1,
      'explain': 'bank statement = sao kê.',
    },
    // 32
    {
      'question': 'Completion: Please enter the transaction into the ___.',
      'options': ['ledger', 'receipt', 'margin', 'tax'],
      'correctIndex': 0,
      'explain': 'ledger = sổ cái.',
    },
    // 33
    {
      'question':
          'Scenario: The bill is unpaid after the ___ — it’s now overdue.',
      'options': ['installment', 'due date', 'wire transfer', 'audit'],
      'correctIndex': 1,
      'explain': 'quá hạn sau ngày đến hạn (due date).',
    },
    // 34
    {
      'question': 'Scenario: HR paid the taxi fare — file for ___.',
      'options': ['withholding', 'reimbursement', 'approval', 'credit'],
      'correctIndex': 1,
      'explain': 'nộp hoàn chi phí = reimbursement.',
    },
    // 35
    {
      'question': 'Scenario: Finance asked to “___ cost” before approval.',
      'options': ['forecast', 'receipt', 'installment', 'exchange rate'],
      'correctIndex': 0,
      'explain': 'forecast chi phí trước khi duyệt.',
    },
    // 36
    {
      'question': 'Scenario: We need two ___ to open petty cash.',
      'options': ['approvals', 'losses', 'taxes', 'credits'],
      'correctIndex': 0,
      'explain': 'phê duyệt để mở quỹ lặt vặt.',
    },
    // 37
    {
      'question': 'Collocation: “submit an expense ___.”',
      'options': ['margin', 'report', 'ledger', 'allowance'],
      'correctIndex': 1,
      'explain': 'expense report.',
    },
    // 38
    {
      'question': 'Collocation: “issue an ___ to the client.”',
      'options': ['installment', 'invoice', 'statement', 'balance'],
      'correctIndex': 1,
      'explain': 'issue an invoice.',
    },
    // 39
    {
      'question': 'Collocation: “request ___ for a training course.”',
      'options': ['allowance', 'credit', 'audit', 'loss'],
      'correctIndex': 0,
      'explain': 'xin phụ cấp/allowance.',
    },
    // 40
    {
      'question': 'Collocation: “protect profit ___ during sales.”',
      'options': ['margin', 'receipt', 'tax', 'ledger'],
      'correctIndex': 0,
      'explain': 'margin = biên lợi nhuận.',
    },
    // 41
    {
      'question': 'Mini-context: Quarterly ___ increased by 12%.',
      'options': ['revenue', 'petty cash', 'allowance', 'withholding'],
      'correctIndex': 0,
      'explain': 'revenue increased.',
    },
    // 42
    {
      'question': 'Mini-context: Net ___ fell slightly this quarter.',
      'options': ['profit', 'installment', 'debit', 'approval'],
      'correctIndex': 0,
      'explain': 'profit fell slightly.',
    },
    // 43
    {
      'question':
          'Mini-context: Maintain positive ___ to avoid short-term loans.',
      'options': ['cash flow', 'tax rate', 'ledger', 'receipt'],
      'correctIndex': 0,
      'explain': 'positive cash flow.',
    },
    // 44
    {
      'question':
          'Mini-context: Bank ___ will apply to international transfers.',
      'options': ['fees', 'margins', 'credits', 'receipts'],
      'correctIndex': 0,
      'explain': 'bank fees apply.',
    },
    // 45
    {
      'question': 'Identify: The 3rd ___ is due next Monday.',
      'options': ['installment', 'invoice', 'statement', 'audit'],
      'correctIndex': 0,
      'explain': 'kỳ trả góp thứ 3.',
    },
    // 46
    {
      'question': 'Identify: We need to ___ 10% for withholding tax.',
      'options': ['credit', 'withhold', 'forecast', 'balance'],
      'correctIndex': 1,
      'explain': 'withhold 10%.',
    },
    // 47
    {
      'question': 'Best completion: The account ___ is negative.',
      'options': ['margin', 'balance', 'revenue', 'allowance'],
      'correctIndex': 1,
      'explain': 'balance âm.',
    },
    // 48
    {
      'question':
          'Best completion: Please ___ the refund to the customer’s card.',
      'options': ['debit', 'audit', 'credit', 'forecast'],
      'correctIndex': 2,
      'explain': 'credit (vào) thẻ khách.',
    },
    // 49
    {
      'question': 'Which fits best? “Check the ___ to see last month’s fees.”',
      'options': ['statement', 'invoice', 'allowance', 'margin'],
      'correctIndex': 0,
      'explain': 'xem phí trong sao kê.',
    },
    // 50
    {
      'question': 'Which fits best? “We aim to ___ by Q4.”',
      'options': ['overdue', 'break even', 'withhold', 'write off'],
      'correctIndex': 1,
      'explain': 'mục tiêu hòa vốn (break even).',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab6")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 6: Finance & Expenses',
        'questionCount': vocab6Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab6Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab6Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab6")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 7: Procurement & Inventory (50 câu; options đã hoán vị)
  // =========================
  final vocab7Questions = <Map<String, dynamic>>[
    // 01-10: Khái niệm mua sắm & đấu thầu
    {
      'question': 'Meaning: “procurement (n)” most nearly means…',
      'options': ['kho bãi', 'mua sắm (doanh nghiệp)', 'vận tải', 'kiểm định'],
      'correctIndex': 1,
      'explain': 'procurement = hoạt động mua sắm trong doanh nghiệp.',
    },
    {
      'question': 'Choose the document: Issue a ___ before shipping.',
      'options': ['receipt of goods', 'purchase order', 'RMA', 'inspection'],
      'correctIndex': 1,
      'explain': 'purchase order (PO) = đơn đặt hàng chính thức.',
    },
    {
      'question': 'Pick the noun: We negotiated with a new ___.',
      'options': ['warehouse', 'supplier', 'SKU', 'lot number'],
      'correctIndex': 1,
      'explain': 'supplier = nhà cung cấp.',
    },
    {
      'question': 'Identify: “vendor (n)” is closest to…',
      'options': [
        'người mua',
        'nhà bán/nhà cung cấp',
        'người kiểm kho',
        'người bốc dỡ',
      ],
      'correctIndex': 1,
      'explain': 'vendor = nhà bán/nhà cung cấp.',
    },
    {
      'question': 'Meaning: “quotation (n)” most nearly means…',
      'options': ['báo giá', 'mã lô', 'mã hàng', 'hóa đơn nhập khẩu'],
      'correctIndex': 1,
      'explain': 'quotation = báo giá.',
    },
    {
      'question': 'Choose the word: They submitted a competitive ___.',
      'options': ['invoice', 'bid', 'warehouse', 'SKU'],
      'correctIndex': 1,
      'explain': 'bid = hồ sơ thầu/đấu thầu.',
    },
    {
      'question': 'Fill in: The project will go to ___ next month.',
      'options': ['tender', 'stockout', 'FIFO', 'RMA'],
      'correctIndex': 1,
      'explain': 'tender = quá trình đấu thầu.',
    },
    {
      'question': 'Abbrev.: We issued an ___ to vendors yesterday.',
      'options': ['RFQ', 'RFP', 'KPI', 'FIFO'],
      'correctIndex': 1,
      'explain': 'RFP = Request For Proposal (yêu cầu đề xuất).',
    },
    {
      'question': 'Abbrev.: Please send an ___ for components by noon.',
      'options': ['RFP', 'RFQ', 'ETA', 'RMA'],
      'correctIndex': 1,
      'explain': 'RFQ = Request For Quotation (yêu cầu báo giá).',
    },
    {
      'question': 'Meaning: “lead time (n)” refers to…',
      'options': [
        'mức tồn kho',
        'thời gian cung ứng',
        'đơn giá',
        'điểm đặt hàng lại',
      ],
      'correctIndex': 1,
      'explain': 'lead time = thời gian từ đặt đến nhận hàng.',
    },

    // 11-20: Giá/đơn hàng & tồn kho cơ bản
    {
      'question': 'Abbrev.: The ___ is 100 units for this item.',
      'options': ['RMA', 'MOQ', 'SKU', 'ETA'],
      'correctIndex': 1,
      'explain': 'MOQ = minimum order quantity (số lượng tối thiểu).',
    },
    {
      'question': 'Choose the term: Negotiate a lower ___ if possible.',
      'options': ['unit price', 'warehouse', 'tender', 'RFP'],
      'correctIndex': 1,
      'explain': 'unit price = đơn giá.',
    },
    {
      'question': 'Meaning: A “bulk order” is an order with…',
      'options': [
        'kiểm định gắt gao',
        'số lượng lớn',
        'nhiều nhà cung cấp',
        'không có báo giá',
      ],
      'correctIndex': 1,
      'explain': 'bulk order = đơn hàng số lượng lớn.',
    },
    {
      'question': 'Choose the noun: Current ___ levels are high.',
      'options': ['inspection', 'inventory', 'RMA', 'bid'],
      'correctIndex': 1,
      'explain': 'inventory = hàng tồn kho.',
    },
    {
      'question': 'Meaning: “stock (n/v)” most nearly means…',
      'options': [
        'kiểm tra lỗi',
        'dự trữ/hàng tồn',
        'đơn đặt hàng lại',
        'mã lô',
      ],
      'correctIndex': 1,
      'explain': 'stock = hàng tồn; to stock = dự trữ.',
    },
    {
      'question': 'Risk: We must avoid ___ during peak season.',
      'options': ['stockout', 'FIFO', 'RMA', 'RFQ'],
      'correctIndex': 1,
      'explain': 'stockout = hết hàng.',
    },
    {
      'question': 'Status: The items are currently on ___.',
      'options': ['backorder', 'tender', 'inspection', 'RFP'],
      'correctIndex': 1,
      'explain': 'backorder = đơn hàng chờ do thiếu hàng.',
    },
    {
      'question':
          'Threshold: Set a lower ___ to trigger earlier replenishment.',
      'options': ['reorder point', 'unit price', 'lead time', 'lot number'],
      'correctIndex': 1,
      'explain': 'reorder point = điểm đặt hàng lại.',
    },
    {
      'question': 'Buffer: Keep adequate ___ to handle demand spikes.',
      'options': ['safety stock', 'quotation', 'RMA', 'receipt of goods'],
      'correctIndex': 1,
      'explain': 'safety stock = tồn kho an toàn.',
    },
    {
      'question': 'Facility: Goods are stored in the ___.',
      'options': ['vendor', 'warehouse', 'RFP', 'RFQ'],
      'correctIndex': 1,
      'explain': 'warehouse = kho.',
    },

    // 21-30: Nhận hàng, kiểm định & chất lượng
    {
      'question': 'Process: Order ___ starts tomorrow morning.',
      'options': ['fulfillment', 'stockout', 'RFQ', 'backorder'],
      'correctIndex': 1,
      'explain': 'fulfillment = xử lý đơn hàng.',
    },
    {
      'question': 'Document: Please sign the ___.',
      'options': ['receipt of goods', 'lead time', 'MOQ', 'tender'],
      'correctIndex': 1,
      'explain': 'receipt of goods = biên nhận hàng hóa.',
    },
    {
      'question': 'Quality step: All items must pass ___.',
      'options': ['inspection', 'stock', 'backorder', 'RFQ'],
      'correctIndex': 1,
      'explain': 'inspection = kiểm định/chất lượng.',
    },
    {
      'question': 'Meaning: Report any ___ immediately.',
      'options': ['defects', 'MOQ', 'RFPs', 'vouchers'],
      'correctIndex': 1,
      'explain': 'defect = lỗi/sai hỏng.',
    },
    {
      'question': 'Abbrev.: Request an ___ number before sending returns.',
      'options': ['RMA', 'ETA', 'PO', 'FIFO'],
      'correctIndex': 1,
      'explain': 'RMA = Return Merchandise Authorization (mã trả hàng).',
    },
    {
      'question': 'Traceability: Record the ___.',
      'options': ['warehouse', 'lot number', 'RFP', 'MOQ'],
      'correctIndex': 1,
      'explain': 'lot number = mã lô để truy vết.',
    },
    {
      'question': 'Coding: Each ___ has a barcode in the system.',
      'options': ['SKU', 'RMA', 'PO', 'RFP'],
      'correctIndex': 1,
      'explain': 'SKU = stock keeping unit (mã hàng).',
    },
    {
      'question': 'Policy: Use ___ for perishable goods.',
      'options': ['FIFO', 'RMA', 'RFQ', 'RFP'],
      'correctIndex': 1,
      'explain': 'FIFO = nhập trước xuất trước.',
    },
    {
      'question': 'Contract: Review the ___ before paying the deposit.',
      'options': [
        'purchase agreement',
        'receipt of goods',
        'defect log',
        'SKU list',
      ],
      'correctIndex': 1,
      'explain': 'purchase agreement = hợp đồng mua.',
    },
    {
      'question': 'Legal: Check the ___ carefully (returns, liability, etc.).',
      'options': [
        'terms & conditions',
        'backorder notes',
        'RFP draft',
        'warehouse map',
      ],
      'correctIndex': 1,
      'explain': 'terms & conditions = điều khoản & điều kiện.',
    },

    // 31-40: Collocations & ứng dụng thực tế
    {
      'question': 'Collocation: “issue a purchase ___”.',
      'options': ['agreement', 'order', 'stock', 'lot number'],
      'correctIndex': 1,
      'explain': 'purchase order.',
    },
    {
      'question': 'Collocation: “request three vendor ___”.',
      'options': ['defects', 'quotations', 'warehouses', 'SKUs'],
      'correctIndex': 1,
      'explain': 'request quotations.',
    },
    {
      'question': 'Collocation: “reduce ___ time through local sourcing”.',
      'options': ['lead', 'lot', 'stock', 'queue'],
      'correctIndex': 1,
      'explain': 'reduce lead time.',
    },
    {
      'question': 'Collocation: “set a lower ___ point to avoid stockout”.',
      'options': ['reorder', 'lot', 'inspection', 'RFP'],
      'correctIndex': 1,
      'explain': 'reorder point.',
    },
    {
      'question': 'Collocation: “maintain adequate ___ stock for holidays”.',
      'options': ['safety', 'defect', 'tender', 'RMA'],
      'correctIndex': 1,
      'explain': 'safety stock.',
    },
    {
      'question': 'Collocation: “items were placed on ___ due to shortage”.',
      'options': ['SKU', 'backorder', 'RFP', 'inspection'],
      'correctIndex': 1,
      'explain': 'placed on backorder.',
    },
    {
      'question': 'Collocation: “perform incoming goods ___”.',
      'options': ['inspection', 'quotation', 'RFQ', 'RMA'],
      'correctIndex': 1,
      'explain': 'incoming inspection.',
    },
    {
      'question': 'Collocation: “record the ___ number on each carton”.',
      'options': ['lot', 'vendor', 'MOQ', 'RFP'],
      'correctIndex': 1,
      'explain': 'lot number.',
    },
    {
      'question': 'Collocation: “map each product to a unique ___”.',
      'options': ['SKU', 'RMA', 'RFP', 'PO'],
      'correctIndex': 1,
      'explain': 'unique SKU.',
    },
    {
      'question': 'Collocation: “returns require an approved ___”.',
      'options': ['RMA', 'RFQ', 'FIFO', 'MOQ'],
      'correctIndex': 1,
      'explain': 'approved RMA.',
    },

    // 41-50: Tình huống & hoàn chỉnh câu
    {
      'question': 'Scenario: The ___ states delivery within two weeks.',
      'options': ['inspection', 'quotation', 'defect log', 'RMA form'],
      'correctIndex': 1,
      'explain': 'quotation có thời gian giao dự kiến.',
    },
    {
      'question':
          'Scenario: The client asked for a formal price — send an ___.',
      'options': ['RMA', 'RFQ', 'SKU', 'invoice'],
      'correctIndex': 1,
      'explain':
          'khách hỏi giá → gửi quotation/invoice; ở đây “send an invoice” không phù hợp trước báo giá.',
    },
    {
      'question':
          'Scenario: We need proposals for the new system — issue an ___.',
      'options': ['RFP', 'RMA', 'FIFO', 'PO'],
      'correctIndex': 1,
      'explain': 'issue an RFP để nhận đề xuất.',
    },
    {
      'question':
          'Scenario: The order cannot be fulfilled now — put items on ___.',
      'options': ['warehouse', 'backorder', 'inspection', 'FIFO'],
      'correctIndex': 1,
      'explain': 'put on backorder.',
    },
    {
      'question': 'Scenario: To prevent shortages, we increased ___.',
      'options': ['RMA', 'safety stock', 'RFQ volume', 'lot numbers'],
      'correctIndex': 1,
      'explain': 'tăng safety stock.',
    },
    {
      'question': 'Completion: Goods will be stored in the main ___.',
      'options': ['RFP', 'warehouse', 'RMA', 'RFQ'],
      'correctIndex': 1,
      'explain': 'stored in warehouse.',
    },
    {
      'question': 'Completion: All perishable goods should follow ___.',
      'options': ['FIFO', 'RMA', 'RFQ', 'MOQ'],
      'correctIndex': 1,
      'explain': 'FIFO cho hàng dễ hỏng.',
    },
    {
      'question': 'Completion: Sign the ___ to confirm delivery quantity.',
      'options': ['receipt of goods', 'lead time', 'MOQ', 'SKU list'],
      'correctIndex': 1,
      'explain': 'ký biên nhận hàng.',
    },
    {
      'question':
          'Which fits best? Set the ___ to 50 units to trigger restock.',
      'options': ['lot number', 'reorder point', 'RFP', 'RMA'],
      'correctIndex': 1,
      'explain': 'reorder point = ngưỡng đặt lại.',
    },
    {
      'question': 'Which fits best? The quality team logged five ___.',
      'options': ['defects', 'RFQs', 'RMAs', 'SKUs'],
      'correctIndex': 1,
      'explain': 'log defects.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab7")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 7: Procurement & Inventory',
        'questionCount': vocab7Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab7Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab7Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab7")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 8: Facilities & Maintenance (50 câu)
  // =========================
  final vocab8Questions = <Map<String, dynamic>>[
    // 01–10: nghĩa cơ bản
    {
      'question': 'Meaning: “facility (n)” most nearly means…',
      'options': ['khuôn viên', 'cơ sở', 'lao công', 'giấy phép'],
      'correctIndex': 1,
      'explain': 'facility = cơ sở/vật chất.',
    },
    {
      'question': 'Meaning: “premises (n)” refers to…',
      'options': ['khuôn viên', 'vòi phun', 'PPE', 'bảng kiểm'],
      'correctIndex': 0,
      'explain': 'premises = khuôn viên/tòa nhà.',
    },
    {
      'question': 'Meaning: “maintenance (n)” most nearly means…',
      'options': ['bảo trì', 'giám sát', 'khe hở', 'diễn tập'],
      'correctIndex': 0,
      'explain': 'maintenance = bảo trì.',
    },
    {
      'question': 'Meaning: “repair (v/n)” is…',
      'options': ['sửa chữa', 'kiểm định', 'khoá/ghi nhãn', 'giám sát'],
      'correctIndex': 0,
      'explain': 'repair = sửa chữa.',
    },
    {
      'question': 'Meaning: “inspection (n)” most nearly means…',
      'options': ['kiểm tra', 'điện', 'chiếu sáng', 'kho vật tư'],
      'correctIndex': 0,
      'explain': 'inspection = kiểm tra/kiểm định.',
    },
    {
      'question': 'Meaning: “work order (n)” is a…',
      'options': [
        'phiếu công việc',
        'bản vẽ',
        'bình cứu hỏa',
        'cửa thoát hiểm',
      ],
      'correctIndex': 0,
      'explain': 'work order = phiếu công việc.',
    },
    {
      'question': 'Meaning: “HVAC (n)” stands for…',
      'options': [
        'điều hòa thông gió',
        'hệ thống nước',
        'bảo hộ',
        'vật cố định',
      ],
      'correctIndex': 0,
      'explain': 'HVAC = heating, ventilation, and air conditioning.',
    },
    {
      'question': 'Meaning: “plumbing (n)” is the…',
      'options': [
        'hệ thống nước',
        'hệ thống điện',
        'hệ thống báo cháy',
        'đường thoát hiểm',
      ],
      'correctIndex': 0,
      'explain': 'plumbing = hệ thống nước.',
    },
    {
      'question': 'Meaning: “electrical (adj)” relates to…',
      'options': ['điện', 'nước', 'khí', 'rác thải'],
      'correctIndex': 0,
      'explain': 'electrical = thuộc về điện.',
    },
    {
      'question': 'Meaning: “fixture (n)” most nearly means…',
      'options': ['vật cố định', 'sơn phủ', 'khoá cửa', 'đèn pin'],
      'correctIndex': 0,
      'explain': 'fixture = vật cố định (gắn vào tường/trần).',
    },

    // 11–20: an toàn – thiết bị
    {
      'question': 'Meaning: “lighting (n)” is…',
      'options': ['chiếu sáng', 'hệ thống nước', 'lao công', 'giấy phép'],
      'correctIndex': 0,
      'explain': 'lighting = chiếu sáng.',
    },
    {
      'question': 'Meaning: “fire alarm (n)” refers to…',
      'options': ['báo cháy', 'máy bơm', 'thang thoát hiểm', 'bình nén khí'],
      'correctIndex': 0,
      'explain': 'fire alarm = thiết bị báo cháy.',
    },
    {
      'question': 'Meaning: “sprinkler (n)” most nearly means…',
      'options': ['vòi phun', 'van chặn', 'chốt cửa', 'ống khói'],
      'correctIndex': 0,
      'explain': 'sprinkler = đầu phun nước chữa cháy.',
    },
    {
      'question': 'Meaning: “emergency exit (n)” is a…',
      'options': ['cửa thoát hiểm', 'cửa kho', 'cửa sổ trượt', 'cửa nạp khí'],
      'correctIndex': 0,
      'explain': 'emergency exit = cửa thoát hiểm.',
    },
    {
      'question': 'Meaning: “evacuation (n)” most nearly means…',
      'options': ['sơ tán', 'cảnh giới', 'giám sát', 'làm sạch'],
      'correctIndex': 0,
      'explain': 'evacuation = sơ tán.',
    },
    {
      'question': 'Meaning: “PPE (n)” stands for…',
      'options': ['đồ bảo hộ', 'khuôn viên', 'giấy phép', 'phiếu công việc'],
      'correctIndex': 0,
      'explain': 'PPE = personal protective equipment.',
    },
    {
      'question': 'Meaning: “hazard (n)” most nearly means…',
      'options': ['mối nguy', 'khoảng trống', 'hợp đồng', 'nhà thầu'],
      'correctIndex': 0,
      'explain': 'hazard = mối nguy.',
    },
    {
      'question': 'Meaning: “spill (n/v)” refers to…',
      'options': ['tràn đổ', 'đóng cặn', 'tắc đường ống', 'rò rỉ khí'],
      'correctIndex': 0,
      'explain': 'spill = tràn đổ (chất lỏng/hóa chất).',
    },
    {
      'question': 'Meaning: “outage (n)” is a…',
      'options': ['mất điện/ngừng dịch vụ', 'đứt cáp', 'bể bình', 'máy lỗi'],
      'correctIndex': 0,
      'explain': 'outage = gián đoạn dịch vụ (thường là mất điện).',
    },
    {
      'question': 'Meaning: “shutdown (n)” most nearly means…',
      'options': ['ngừng hoạt động', 'khởi động', 'tăng tải', 'hạ tải'],
      'correctIndex': 0,
      'explain': 'shutdown = dừng hệ thống/cơ sở.',
    },

    // 21–30: quy trình – bảo trì
    {
      'question': 'Meaning: “lockout-tagout (n)” refers to…',
      'options': [
        'quy trình khóa/ghi nhãn',
        'cửa tự động',
        'bàn giao ca',
        'tấm che an toàn',
      ],
      'correctIndex': 0,
      'explain': 'LOTO = khóa cách ly & gắn nhãn cảnh báo.',
    },
    {
      'question': 'Meaning: “preventive maintenance (n)” is…',
      'options': [
        'bảo trì phòng ngừa',
        'bảo trì khẩn cấp',
        'bảo trì ngoài giờ',
        'bảo trì tạm thời',
      ],
      'correctIndex': 0,
      'explain': 'bảo trì phòng ngừa theo lịch.',
    },
    {
      'question': 'Meaning: “predictive maintenance (n)” most nearly means…',
      'options': [
        'bảo trì dự đoán',
        'bảo trì định kỳ',
        'bảo trì thay thế',
        'bảo trì phục hồi',
      ],
      'correctIndex': 0,
      'explain': 'dựa trên dữ liệu để dự đoán hỏng hóc.',
    },
    {
      'question': 'Meaning: “workplace safety (n)” is…',
      'options': [
        'an toàn nơi làm việc',
        'phiếu phân việc',
        'sơ đồ PCCC',
        'phân loại rác',
      ],
      'correctIndex': 0,
      'explain': 'workplace safety = an toàn lao động.',
    },
    {
      'question': 'Meaning: “facility manager (n)” refers to…',
      'options': [
        'quản lý cơ sở',
        'giám sát ca',
        'quản lý sản xuất',
        'trưởng kho',
      ],
      'correctIndex': 0,
      'explain': 'facility manager = quản lý cơ sở hạ tầng.',
    },
    {
      'question': 'Meaning: “janitor (n)” most nearly means…',
      'options': ['lao công', 'bảo vệ', 'thợ điện', 'thợ nước'],
      'correctIndex': 0,
      'explain': 'janitor = lao công/tạp vụ.',
    },
    {
      'question': 'Meaning: “contractor (n)” is…',
      'options': ['nhà thầu', 'nhà cung cấp', 'nhà phân phối', 'nhà đầu tư'],
      'correctIndex': 0,
      'explain': 'contractor = nhà thầu thi công/dịch vụ.',
    },
    {
      'question': 'Meaning: “permit (n)” most nearly means…',
      'options': ['giấy phép', 'phiếu nhập kho', 'phiếu xuất', 'bằng khen'],
      'correctIndex': 0,
      'explain': 'permit = giấy phép thi công/làm việc.',
    },
    {
      'question': 'Meaning: “compliance (n)” is…',
      'options': ['tuân thủ', 'giám sát', 'mua sắm', 'xử lý sự cố'],
      'correctIndex': 0,
      'explain': 'compliance = tuân thủ quy chuẩn/quy định.',
    },
    {
      'question': 'Meaning: “checklist (n)” most nearly means…',
      'options': [
        'danh sách kiểm tra',
        'bản tin nội bộ',
        'phiếu đề xuất',
        'sổ tay ca kíp',
      ],
      'correctIndex': 0,
      'explain': 'checklist = danh sách hạng mục cần kiểm.',
    },

    // 31–40: collocations – điền từ/cụm
    {
      'question': 'Collocation: “under ___” (The facility is under ___).',
      'options': ['inspection', 'renovation', 'shutdown', 'outage'],
      'correctIndex': 1,
      'explain': 'under renovation = đang cải tạo.',
    },
    {
      'question': 'Collocation: “schedule regular ___”.',
      'options': ['evacuation', 'maintenance', 'permit', 'fixture'],
      'correctIndex': 1,
      'explain': 'schedule regular maintenance.',
    },
    {
      'question': 'Collocation: “conduct a safety ___”.',
      'options': ['work order', 'inspection', 'spill', 'outage'],
      'correctIndex': 1,
      'explain': 'conduct a safety inspection.',
    },
    {
      'question': 'Collocation: “create a ___ for HVAC”.',
      'options': ['work order', 'PPE', 'premises', 'permit'],
      'correctIndex': 0,
      'explain': 'create a work order for HVAC.',
    },
    {
      'question': 'Collocation: “report electrical ___”.',
      'options': ['hazards', 'fixtures', 'checklists', 'managers'],
      'correctIndex': 0,
      'explain': 'report electrical hazards.',
    },
    {
      'question': 'Collocation: “replace broken ___”.',
      'options': ['fixtures', 'premises', 'evacuations', 'permits'],
      'correctIndex': 0,
      'explain': 'replace broken fixtures.',
    },
    {
      'question': 'Collocation: “test the ___ weekly”.',
      'options': ['fire alarm', 'spill kit', 'PPE', 'HVAC'],
      'correctIndex': 0,
      'explain': 'test the fire alarm weekly.',
    },
    {
      'question': 'Collocation: “keep ___ exits clear”.',
      'options': ['emergency', 'storage', 'loading', 'basement'],
      'correctIndex': 0,
      'explain': 'keep emergency exits clear.',
    },
    {
      'question': 'Collocation: “wear ___ in the workshop”.',
      'options': ['PPE', 'fixtures', 'permits', 'outages'],
      'correctIndex': 0,
      'explain': 'wear PPE in the workshop.',
    },
    {
      'question': 'Collocation: “clean up the ___ immediately”.',
      'options': ['spill', 'outage', 'permit', 'fixture'],
      'correctIndex': 0,
      'explain': 'clean up the spill immediately.',
    },

    // 41–50: ngữ cảnh – tình huống
    {
      'question': 'Scenario: The building had a power ___. Lights went off.',
      'options': ['spill', 'outage', 'permit', 'fixture'],
      'correctIndex': 1,
      'explain': 'power outage = mất điện.',
    },
    {
      'question': 'Scenario: We planned a weekend ___. Machines will stop.',
      'options': ['shutdown', 'inspection', 'spill', 'evacuation'],
      'correctIndex': 0,
      'explain': 'planned shutdown.',
    },
    {
      'question': 'Scenario: Follow ___ to isolate energy before servicing.',
      'options': ['lockout-tagout', 'HVAC', 'premises', 'lighting'],
      'correctIndex': 0,
      'explain': 'LOTO để an toàn khi bảo trì.',
    },
    {
      'question': 'Scenario: We adopted ___ to reduce unexpected failures.',
      'options': [
        'preventive maintenance',
        'spill kits',
        'evacuation routes',
        'janitor shifts',
      ],
      'correctIndex': 0,
      'explain': 'bảo trì phòng ngừa.',
    },
    {
      'question': 'Scenario: Sensors predict faults — that’s ___.',
      'options': [
        'predictive maintenance',
        'workplace safety',
        'PPE rotation',
        'fixture mapping',
      ],
      'correctIndex': 0,
      'explain': 'bảo trì dự đoán bằng cảm biến/dữ liệu.',
    },
    {
      'question': 'Scenario: Smoking is not allowed on the ___.',
      'options': ['premises', 'fixtures', 'sprinklers', 'PPE'],
      'correctIndex': 0,
      'explain': 'on the premises = trong khuôn viên.',
    },
    {
      'question': 'Scenario: The ___ approved the new lighting plan.',
      'options': ['facility manager', 'contractor', 'janitor', 'permit'],
      'correctIndex': 0,
      'explain': 'facility manager = quản lý cơ sở.',
    },
    {
      'question': 'Scenario: Call the ___ to mop the hallway.',
      'options': ['janitor', 'auditor', 'bidder', 'guard'],
      'correctIndex': 0,
      'explain': 'janitor = lao công.',
    },
    {
      'question': 'Scenario: A ___ is required before drilling the wall.',
      'options': ['permit', 'spill kit', 'evacuation', 'sprinkler'],
      'correctIndex': 0,
      'explain': 'cần giấy phép công việc.',
    },
    {
      'question': 'Scenario: Ensure ___ with safety codes and regulations.',
      'options': ['compliance', 'renovation', 'fixture', 'outage'],
      'correctIndex': 0,
      'explain': 'đảm bảo tuân thủ quy chuẩn.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab8")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 8: Facilities & Maintenance',
        'questionCount': vocab8Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã HOÁN VỊ sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab8Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab8Questions[i - 1];
    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab8")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 9: IT & Tech Support (50 câu)
  // =========================
  final vocab9Questions = <Map<String, dynamic>>[
    // 01–15: Meaning / definition
    {
      'question': 'Meaning: “IT support (n)” most nearly means…',
      'options': ['nhân sự', 'hỗ trợ CNTT', 'kho vận', 'bảo trì cơ sở'],
      'correctIndex': 1,
      'explain': 'IT support = hỗ trợ kỹ thuật công nghệ thông tin.',
    },
    {
      'question': 'Meaning: “help desk (n)” refers to…',
      'options': ['bàn trợ giúp', 'bàn lễ tân', 'phòng họp', 'kho vật tư'],
      'correctIndex': 0,
      'explain': 'help desk = điểm tiếp nhận và xử lý yêu cầu hỗ trợ.',
    },
    {
      'question': 'Meaning: “ticket (n)” in support context is…',
      'options': ['phiếu hỗ trợ', 'vé vào cửa', 'biên lai', 'gói cước'],
      'correctIndex': 0,
      'explain': 'ticket = phiếu/yêu cầu hỗ trợ.',
    },
    {
      'question': 'Meaning: “login (n/v)” is…',
      'options': ['đăng xuất', 'đăng nhập', 'đổi mật khẩu', 'tạo tài khoản'],
      'correctIndex': 1,
      'explain': 'login = đăng nhập.',
    },
    {
      'question': 'Meaning: “password (n)” most nearly means…',
      'options': ['mật khẩu', 'tên hiển thị', 'mã bưu điện', 'tên miền'],
      'correctIndex': 0,
      'explain': 'password = mật khẩu.',
    },
    {
      'question': 'Meaning: “account (n)” is…',
      'options': ['máy chủ', 'tài khoản', 'tường lửa', 'mạng riêng ảo'],
      'correctIndex': 1,
      'explain': 'account = tài khoản người dùng/hệ thống.',
    },
    {
      'question': 'Meaning: “network (n)” refers to…',
      'options': ['ổ cứng', 'mạng', 'màn hình', 'máy in'],
      'correctIndex': 1,
      'explain': 'network = hệ thống mạng kết nối.',
    },
    {
      'question': 'Meaning: “router (n)” most nearly means…',
      'options': ['bộ định tuyến', 'bộ nhớ', 'bộ nguồn', 'bộ xử lý đồ họa'],
      'correctIndex': 0,
      'explain': 'router = bộ định tuyến mạng.',
    },
    {
      'question': 'Meaning: “bandwidth (n)” is…',
      'options': ['băng thông', 'bảo mật', 'bảng điều khiển', 'sao lưu'],
      'correctIndex': 0,
      'explain': 'bandwidth = băng thông kết nối.',
    },
    {
      'question': 'Meaning: “firewall (n)” refers to…',
      'options': ['tường lửa', 'cầu chì', 'quạt tản nhiệt', 'bộ mở rộng sóng'],
      'correctIndex': 0,
      'explain': 'firewall = hệ thống chặn/cho phép lưu lượng.',
    },
    {
      'question': 'Meaning: “VPN (n)” stands for…',
      'options': [
        'mạng riêng ảo',
        'mạng không dây',
        'cáp quang',
        'máy chủ bản địa',
      ],
      'correctIndex': 0,
      'explain': 'VPN = Virtual Private Network.',
    },
    {
      'question': 'Meaning: “update (n/v)” is…',
      'options': ['gỡ cài đặt', 'cập nhật', 'tắt máy', 'khởi động'],
      'correctIndex': 1,
      'explain': 'update = cập nhật phần mềm/hệ thống.',
    },
    {
      'question': 'Meaning: “patch (n/v)” most nearly means…',
      'options': ['bản vá', 'bản sao', 'bản đồ', 'bản quyền'],
      'correctIndex': 0,
      'explain': 'patch = bản vá lỗi/bảo mật.',
    },
    {
      'question': 'Meaning: “bug (n)” in software is…',
      'options': ['tính năng', 'lỗi phần mềm', 'bản vá', 'mật độ'],
      'correctIndex': 1,
      'explain': 'bug = lỗi trong phần mềm.',
    },
    {
      'question': 'Meaning: “error (n)” refers to…',
      'options': ['thông báo lỗi', 'sao lưu', 'đường truyền', 'đăng ký'],
      'correctIndex': 0,
      'explain': 'error = lỗi/hệ thống báo lỗi.',
    },

    // 16–25: Meaning 2 / reliability & performance
    {
      'question': 'Meaning: “crash (n/v)” is…',
      'options': ['tải về', 'sập ứng dụng', 'mở rộng', 'nâng cấp'],
      'correctIndex': 1,
      'explain': 'crash = ứng dụng/systems sập.',
    },
    {
      'question': 'Meaning: “lag (n/v)” most nearly means…',
      'options': ['độ trễ', 'tốc độ', 'tín hiệu', 'ngắt quãng'],
      'correctIndex': 0,
      'explain': 'lag = trễ/hụt khung hình.',
    },
    {
      'question': 'Meaning: “backup (n/v)” refers to…',
      'options': ['xóa tệp', 'sao lưu', 'ghép tệp', 'khóa tệp'],
      'correctIndex': 1,
      'explain': 'backup = sao lưu dữ liệu.',
    },
    {
      'question': 'Meaning: “restore (v)” is…',
      'options': ['khôi phục', 'lưu trữ', 'nén lại', 'đổi tên'],
      'correctIndex': 0,
      'explain': 'restore = khôi phục từ bản sao lưu.',
    },
    {
      'question': 'Meaning: “cloud storage (n)” most nearly means…',
      'options': [
        'ổ cứng di động',
        'lưu trữ đám mây',
        'bộ nhớ RAM',
        'bộ nhớ đệm',
      ],
      'correctIndex': 1,
      'explain': 'cloud storage = lưu trữ dữ liệu trên đám mây.',
    },
    {
      'question': 'Meaning: “permissions (n)” refers to…',
      'options': [
        'quyền truy cập',
        'điểm cuối API',
        'tệp cấu hình',
        'cổng mạng',
      ],
      'correctIndex': 0,
      'explain': 'permissions = quyền trên hệ thống/tài khoản.',
    },
    {
      'question': 'Meaning: “admin (n)” is…',
      'options': ['người dùng', 'quản trị viên', 'khách lạ', 'đối tác'],
      'correctIndex': 1,
      'explain': 'admin = quản trị hệ thống.',
    },
    {
      'question': 'Meaning: “endpoint (n)” most nearly means…',
      'options': [
        'điểm cuối/kết nối API',
        'điểm truy cập Wi-Fi',
        'điểm phát sóng',
        'điểm khôi phục',
      ],
      'correctIndex': 0,
      'explain': 'endpoint = điểm cuối của API/kết nối.',
    },
    {
      'question': 'Meaning: “downtime (n)” refers to…',
      'options': [
        'thời gian ngừng dịch vụ',
        'thời gian làm thêm',
        'thời gian đáp ứng',
        'thời gian chờ vá',
      ],
      'correctIndex': 0,
      'explain': 'downtime = thời gian hệ thống ngừng.',
    },
    {
      'question': 'Meaning: “SLA (n)” stands for…',
      'options': [
        'cam kết dịch vụ',
        'phần mềm miễn phí',
        'máy chủ cục bộ',
        'cổng bảo mật',
      ],
      'correctIndex': 0,
      'explain': 'SLA = Service Level Agreement.',
    },

    // 26–35: Queue / KB / security
    {
      'question': 'Meaning: “ticket queue (n)” is…',
      'options': [
        'hàng đợi phiếu hỗ trợ',
        'hàng đợi in ấn',
        'hàng đợi mạng',
        'hàng đợi CPU',
      ],
      'correctIndex': 0,
      'explain': 'ticket queue = danh sách ticket đang chờ xử lý.',
    },
    {
      'question': 'Meaning: “knowledge base (n)” most nearly means…',
      'options': ['kho tri thức', 'kho ảnh', 'kho mật khẩu', 'kho backup'],
      'correctIndex': 0,
      'explain': 'knowledge base = tài liệu hướng dẫn/FAQ.',
    },
    {
      'question': 'Meaning: “remote access (n)” refers to…',
      'options': [
        'truy cập từ xa',
        'chia sẻ tệp cục bộ',
        'đổi quyền sở hữu',
        'đổi địa chỉ IP',
      ],
      'correctIndex': 0,
      'explain': 'remote access = truy cập hệ thống từ xa.',
    },
    {
      'question': 'Meaning: “two-factor authentication (n)” is…',
      'options': [
        'xác thực hai yếu tố',
        'mã hóa tệp',
        'mạng nội bộ',
        'tự động đăng nhập',
      ],
      'correctIndex': 0,
      'explain': '2FA = xác thực bằng 2 lớp bảo mật.',
    },
    {
      'question': 'Meaning: “malware (n)” most nearly means…',
      'options': [
        'phần mềm độc hại',
        'phần mềm miễn phí',
        'tường lửa',
        'trình duyệt',
      ],
      'correctIndex': 0,
      'explain': 'malware = phần mềm độc hại.',
    },
    {
      'question': 'Meaning: “reception/signal dropped” implies…',
      'options': [
        'mất tín hiệu',
        'tăng băng thông',
        'đổi router',
        'đổi mật khẩu',
      ],
      'correctIndex': 0,
      'explain': 'signal dropped = mất tín hiệu.',
    },
    {
      'question': 'Meaning: “the network is down” means…',
      'options': [
        'mạng bị lỗi/ngưng',
        'mạng quá nhanh',
        'đổi mật khẩu Wi-Fi',
        'đang phát trực tuyến',
      ],
      'correctIndex': 0,
      'explain': 'network down = gián đoạn mạng.',
    },
    {
      'question': 'Meaning: “bandwidth is limited” suggests…',
      'options': [
        'băng thông hạn chế',
        'băng thông tăng',
        'đổi địa chỉ MAC',
        'đổi driver màn hình',
      ],
      'correctIndex': 0,
      'explain': 'limited bandwidth = dễ nghẽn/lag.',
    },
    {
      'question': 'Meaning: “admin approval required” means…',
      'options': [
        'cần quản trị viên phê duyệt',
        'tự động lưu',
        'không cần mật khẩu',
        'đã hết hạn',
      ],
      'correctIndex': 0,
      'explain': 'cần quyền/admin duyệt yêu cầu.',
    },
    {
      'question': 'Meaning: “apply a security patch” is to…',
      'options': [
        'cài bản vá bảo mật',
        'xóa bản cập nhật',
        'tắt tường lửa',
        'gỡ VPN',
      ],
      'correctIndex': 0,
      'explain': 'áp bản vá để vá lỗ hổng.',
    },

    // 36–45: Usage / collocations / completion
    {
      'question': 'Completion: Please ___ a new support ticket.',
      'options': ['create', 'decode', 'compress', 'scan'],
      'correctIndex': 0,
      'explain': 'create a ticket.',
    },
    {
      'question': 'Completion: Your login ___; try again.',
      'options': ['failed', 'backed up', 'restored', 'streamed'],
      'correctIndex': 0,
      'explain': 'login failed.',
    },
    {
      'question': 'Completion: Reset your ___ if you forget it.',
      'options': ['password', 'router', 'bandwidth', 'endpoint'],
      'correctIndex': 0,
      'explain': 'reset password.',
    },
    {
      'question': 'Completion: Restart the ___ and test again.',
      'options': ['router', 'invoice', 'brochure', 'agenda'],
      'correctIndex': 0,
      'explain': 'restart the router.',
    },
    {
      'question': 'Completion: Connect through ___ for remote work.',
      'options': ['VPN', 'PPE', 'SKU', 'KPI'],
      'correctIndex': 0,
      'explain': 'connect through VPN.',
    },
    {
      'question': 'Collocation: Install the latest system ___.',
      'options': ['updates', 'receptions', 'warehouses', 'permits'],
      'correctIndex': 0,
      'explain': 'install updates.',
    },
    {
      'question': 'Collocation: Schedule daily ___.',
      'options': ['backups', 'audits', 'quotations', 'deliverables'],
      'correctIndex': 0,
      'explain': 'schedule backups.',
    },
    {
      'question': 'Collocation: Restore from yesterday’s ___.',
      'options': ['backup', 'pipeline', 'dashboard', 'RMA'],
      'correctIndex': 0,
      'explain': 'restore from backup.',
    },
    {
      'question': 'Collocation: Adjust user ___.',
      'options': ['permissions', 'shipments', 'bookings', 'leaflets'],
      'correctIndex': 0,
      'explain': 'adjust permissions.',
    },
    {
      'question': 'Collocation: Check the ___ for common fixes.',
      'options': [
        'knowledge base',
        'ticket queue',
        'traffic light',
        'tour guide',
      ],
      'correctIndex': 0,
      'explain': 'check the knowledge base.',
    },

    // 46–50: Scenarios
    {
      'question':
          'Scenario: Video calls keep freezing at noon — this is likely ___.',
      'options': ['lag', 'backup', 'restore', 'logout'],
      'correctIndex': 0,
      'explain': 'lag on video calls.',
    },
    {
      'question': 'Scenario: The app stopped responding twice today — it ___.',
      'options': ['crashed', 'patched', 'streamed', 'encrypted'],
      'correctIndex': 0,
      'explain': 'the app crashed.',
    },
    {
      'question': 'Scenario: Files are in ___ — access them from any device.',
      'options': [
        'cloud storage',
        'ticket queue',
        'endpoint list',
        'firewall policy',
      ],
      'correctIndex': 0,
      'explain': 'files in cloud storage.',
    },
    {
      'question': 'Scenario: Service was unavailable for an hour — we had ___.',
      'options': ['downtime', 'overload', 'overage', 'overtime'],
      'correctIndex': 0,
      'explain': 'an hour of downtime.',
    },
    {
      'question': 'Scenario: Turn on ___ to secure logins with an extra step.',
      'options': [
        'two-factor authentication',
        'QR wallpaper',
        'dark mode',
        'auto-reply',
      ],
      'correctIndex': 0,
      'explain': 'enable 2FA for accounts.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab9")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 9: IT & Tech Support',
        'questionCount': vocab9Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã HOÁN VỊ sẵn, không shuffle thêm)
  for (int i = 1; i <= vocab9Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab9Questions[i - 1];
    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab9")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 10: Shipping & Delivery (50 câu)
  // =========================
  final vocab10Questions = <Map<String, dynamic>>[
    // 01–10: meaning / definition
    {
      'question': 'Meaning: “shipment (n)” most nearly means…',
      'options': ['hóa đơn', 'lô hàng', 'kho bãi', 'phiếu nhập'],
      'correctIndex': 1,
      'explain': 'shipment = lô hàng được vận chuyển.',
    },
    {
      'question': 'Meaning: “ship (v)” in logistics is…',
      'options': ['đóng gói', 'vận chuyển', 'giao nhận', 'bốc dỡ'],
      'correctIndex': 1,
      'explain': 'ship = vận chuyển hàng đi.',
    },
    {
      'question': 'Meaning: “courier (n)” refers to…',
      'options': [
        'hãng chuyển phát',
        'kho trung chuyển',
        'mã theo dõi',
        'điểm gửi',
      ],
      'correctIndex': 0,
      'explain': 'courier = hãng/nhân viên chuyển phát nhanh.',
    },
    {
      'question': 'Meaning: “tracking number (n)” is…',
      'options': ['mã theo dõi', 'mã đơn hàng', 'mã tuyến', 'mã kiện'],
      'correctIndex': 0,
      'explain': 'tracking number = mã tra cứu hành trình.',
    },
    {
      'question': 'Meaning: “waybill (n)” most nearly means…',
      'options': ['vận đơn', 'phiếu thu', 'phiếu xuất kho', 'phiếu đóng gói'],
      'correctIndex': 0,
      'explain': 'waybill = vận đơn gắn trên kiện hàng.',
    },
    {
      'question': 'Meaning: “bill of lading (n)” is…',
      'options': [
        'vận đơn đường biển',
        'hợp đồng bảo hiểm',
        'giấy phép hải quan',
        'tờ khai thuế',
      ],
      'correctIndex': 0,
      'explain': 'bill of lading = vận đơn đường biển.',
    },
    {
      'question': 'Meaning: “freight (n)” most nearly means…',
      'options': [
        'cước vận tải/hàng chở',
        'bến bãi',
        'tiền công',
        'phí lưu kho',
      ],
      'correctIndex': 0,
      'explain': 'freight = hàng chở/cước phí vận tải.',
    },
    {
      'question': 'Meaning: “carrier (n)” refers to…',
      'options': [
        'hãng vận tải',
        'điểm tập kết',
        'hợp đồng thuê',
        'kho dự phòng',
      ],
      'correctIndex': 0,
      'explain': 'carrier = hãng vận tải/chuyên chở.',
    },
    {
      'question': 'Meaning: “warehouse (n)” is…',
      'options': ['kho hàng', 'điểm trả hàng', 'cảng vụ', 'bảo thuế'],
      'correctIndex': 0,
      'explain': 'warehouse = kho chứa hàng.',
    },
    {
      'question': 'Meaning: “pick-up (n/v)” in delivery is…',
      'options': ['điểm giao', 'lấy hàng', 'điểm trả', 'điểm kiểm'],
      'correctIndex': 1,
      'explain': 'pick-up = lấy hàng/đến lấy.',
    },

    // 11–20: meaning 2 / status
    {
      'question': 'Meaning: “drop-off (n)” most nearly means…',
      'options': ['giao/điểm gửi', 'dỡ cont', 'đổi tuyến', 'gom hàng'],
      'correctIndex': 0,
      'explain': 'drop-off point = điểm gửi/giao.',
    },
    {
      'question': 'Meaning: “dispatch (n/v)” is…',
      'options': ['xuất hàng/gửi đi', 'bốc xếp', 'dán nhãn', 'đóng kiện'],
      'correctIndex': 0,
      'explain': 'dispatch = xuất hàng/gửi đi.',
    },
    {
      'question': 'Meaning: “in transit (phr)” refers to…',
      'options': [
        'đang vận chuyển',
        'đang đóng gói',
        'đang thông quan',
        'đang lưu kho',
      ],
      'correctIndex': 0,
      'explain': 'in transit = đang trên đường vận chuyển.',
    },
    {
      'question': 'Meaning: “customs (n)” is…',
      'options': ['hải quan', 'thuế vụ', 'cảng vụ', 'kiểm dịch'],
      'correctIndex': 0,
      'explain': 'customs = cơ quan hải quan.',
    },
    {
      'question': 'Meaning: “duty (n)” most nearly means…',
      'options': [
        'thuế nhập khẩu',
        'lệ phí hải quan',
        'phạt chậm thông quan',
        'phí lưu bãi',
      ],
      'correctIndex': 0,
      'explain': 'import duty = thuế nhập khẩu.',
    },
    {
      'question': 'Meaning: “clearance (n)” in customs is…',
      'options': ['thông quan', 'giải phóng hàng', 'lập vận đơn', 'gom cont'],
      'correctIndex': 0,
      'explain': 'customs clearance = thông quan.',
    },
    {
      'question': 'Meaning: “delivery (n)” refers to…',
      'options': ['giao hàng', 'đặt hàng', 'điều phối', 'gom hàng'],
      'correctIndex': 0,
      'explain': 'delivery = giao hàng.',
    },
    {
      'question': 'Meaning: “proof of delivery (n)” is…',
      'options': [
        'bằng chứng giao hàng',
        'bản kê hàng hóa',
        'hóa đơn vận tải',
        'chứng thư bảo hiểm',
      ],
      'correctIndex': 0,
      'explain': 'POD = bằng chứng giao hàng.',
    },
    {
      'question': 'Meaning: “recipient (n)” most nearly means…',
      'options': ['người nhận', 'người gửi', 'người gom', 'người-điều-phối'],
      'correctIndex': 0,
      'explain': 'recipient = người nhận.',
    },
    {
      'question': 'Meaning: “signature required (adj)” is…',
      'options': [
        'cần chữ ký khi giao',
        'cần đóng dấu kho',
        'cần mã PIN',
        'cần xác minh KYC',
      ],
      'correctIndex': 0,
      'explain': 'signature required on delivery.',
    },

    // 21–30: packing / risk / service levels
    {
      'question': 'Meaning: “fragile (adj)” most nearly means…',
      'options': ['dễ vỡ', 'cồng kềnh', 'dễ ẩm', 'dễ cháy'],
      'correctIndex': 0,
      'explain': 'fragile = dễ vỡ, cần xử lý nhẹ tay.',
    },
    {
      'question': 'Meaning: “insured (adj)” is…',
      'options': [
        'được bảo hiểm',
        'được dán nhãn',
        'được định tuyến',
        'được đóng gói',
      ],
      'correctIndex': 0,
      'explain': 'parcel is insured = có bảo hiểm hàng hóa.',
    },
    {
      'question': 'Meaning: “parcel (n)” most nearly means…',
      'options': ['bưu kiện', 'kiện pallet', 'cont 40HQ', 'lô gom LCL'],
      'correctIndex': 0,
      'explain': 'parcel = bưu kiện nhỏ.',
    },
    {
      'question': 'Meaning: “bulk (adj)” refers to…',
      'options': ['số lượng lớn', 'lẻ tẻ', 'siêu nhẹ', 'ngoại khổ'],
      'correctIndex': 0,
      'explain': 'bulk delivery = giao số lượng lớn.',
    },
    {
      'question': 'Meaning: “last-mile (n/adj)” is…',
      'options': [
        'chặng cuối',
        'giao qua biên',
        'giao nội vùng',
        'giao đa điểm',
      ],
      'correctIndex': 0,
      'explain': 'last-mile = chặng cuối đến tay người nhận.',
    },
    {
      'question': 'Meaning: “ETA (n)” stands for…',
      'options': [
        'thời gian dự kiến đến',
        'ước tính tải trọng',
        'phí cảng biển',
        'biên bản hư hỏng',
      ],
      'correctIndex': 0,
      'explain': 'ETA = Estimated Time of Arrival.',
    },
    {
      'question': 'Meaning: “return (n/v)” is…',
      'options': ['trả hàng/hoàn về', 'giao lại', 'đổi tuyến', 'gom đơn'],
      'correctIndex': 0,
      'explain': 'return shipment = lô hàng trả về.',
    },
    {
      'question': 'Meaning: “undeliverable (adj)” most nearly means…',
      'options': ['không giao được', 'giao muộn', 'giao nhầm', 'giao thiếu'],
      'correctIndex': 0,
      'explain': 'address undeliverable = không thể giao.',
    },
    {
      'question': 'Meaning: “reroute (v)” refers to…',
      'options': ['đổi tuyến', 'hủy lộ trình', 'chia nhỏ lô', 'gom tuyến'],
      'correctIndex': 0,
      'explain': 'reroute = đổi hướng vận chuyển.',
    },
    {
      'question': 'Meaning: “same-day (adj)” is…',
      'options': ['trong ngày', 'qua đêm', 'hai ngày', 'tiêu chuẩn 5–7 ngày'],
      'correctIndex': 0,
      'explain': 'same-day delivery = giao trong ngày.',
    },

    // 31–40: collocations / completion
    {
      'question': 'Collocation: “attach the ___ to the box”.',
      'options': ['waybill', 'recipient', 'duty', 'ETA'],
      'correctIndex': 0,
      'explain': 'attach the waybill.',
    },
    {
      'question': 'Collocation: “what is the ___ for order #45?”.',
      'options': ['ETA', 'duty', 'bulk', 'POD'],
      'correctIndex': 0,
      'explain': 'what is the ETA?',
    },
    {
      'question': 'Collocation: “improve ___ efficiency in crowded cities”.',
      'options': ['last-mile', 'bill of lading', 'warehouse', 'customs'],
      'correctIndex': 0,
      'explain': 'improve last-mile efficiency.',
    },
    {
      'question': 'Collocation: “obtain ___ after delivery”.',
      'options': ['proof of delivery', 'carrier', 'pick-up', 'dispatch'],
      'correctIndex': 0,
      'explain': 'obtain POD.',
    },
    {
      'question': 'Completion: The parcel is currently ___.',
      'options': ['in transit', 'insured', 'bulk', 'same-day'],
      'correctIndex': 0,
      'explain': 'parcel in transit.',
    },
    {
      'question': 'Completion: The address is ___—please contact the sender.',
      'options': ['undeliverable', 'fragile', 'last-mile', 'ETA'],
      'correctIndex': 0,
      'explain': 'address undeliverable.',
    },
    {
      'question': 'Completion: Goods left the ___.',
      'options': ['warehouse', 'waybill', 'duty', 'recipient'],
      'correctIndex': 0,
      'explain': 'left the warehouse.',
    },
    {
      'question': 'Completion: Import ___ may apply to electronics.',
      'options': ['duties', 'recipients', 'carriers', 'PODs'],
      'correctIndex': 0,
      'explain': 'import duties may apply.',
    },
    {
      'question': 'Completion: Signature ___ on delivery.',
      'options': ['required', 'rerouted', 'inspected', 'dispatched'],
      'correctIndex': 0,
      'explain': 'signature required.',
    },
    {
      'question': 'Completion: Orders were ___ this morning.',
      'options': ['dispatched', 'insured', 'returned', 'undeliverable'],
      'correctIndex': 0,
      'explain': 'orders were dispatched.',
    },

    // 41–50: scenarios
    {
      'question': 'Scenario: “Please ___ the package to HQ instead of DC.”',
      'options': ['reroute', 'bulk', 'warehouse', 'proof-of-delivery'],
      'correctIndex': 0,
      'explain': 'reroute the package.',
    },
    {
      'question': 'Scenario: “The courier will ___ the sample at 2 p.m.”',
      'options': ['pick up', 'drop off', 'dispatch', 'insure'],
      'correctIndex': 0,
      'explain': 'courier will pick up.',
    },
    {
      'question':
          'Scenario: “Use the nearest ___ point if you miss the courier.”',
      'options': ['drop-off', 'recipient', 'duty', 'ETA'],
      'correctIndex': 0,
      'explain': 'use the nearest drop-off point.',
    },
    {
      'question': 'Scenario: “Is the parcel ___? It contains glassware.”',
      'options': ['insured', 'bulk', 'same-day', 'customs'],
      'correctIndex': 0,
      'explain': 'parcel insured for fragile items.',
    },
    {
      'question': 'Scenario: “The ___ shows the cargo left port yesterday.”',
      'options': [
        'bill of lading',
        'tracking number',
        'duty invoice',
        'ETA note',
      ],
      'correctIndex': 0,
      'explain': 'information on the bill of lading.',
    },
    {
      'question': 'Scenario: “Please share the ___ so I can track it.”',
      'options': [
        'tracking number',
        'carrier name',
        'warehouse code',
        'courier ID',
      ],
      'correctIndex': 0,
      'explain': 'share the tracking number.',
    },
    {
      'question':
          'Scenario: “The order qualifies for ___ delivery in your city.”',
      'options': ['same-day', 'bulk', 'last-mile', 'insured'],
      'correctIndex': 0,
      'explain': 'qualifies for same-day.',
    },
    {
      'question': 'Scenario: “Mark the carton as ___—handle with care.”',
      'options': ['fragile', 'insured', 'dispatch', 'recipient'],
      'correctIndex': 0,
      'explain': 'mark as fragile.',
    },
    {
      'question': 'Scenario: “Customs ___ is pending due to missing forms.”',
      'options': ['clearance', 'duty', 'warehouse', 'carrier'],
      'correctIndex': 0,
      'explain': 'customs clearance pending.',
    },
    {
      'question': 'Scenario: “Get ___ signed by the recipient at the door.”',
      'options': ['proof of delivery', 'waybill', 'ETA', 'duty form'],
      'correctIndex': 0,
      'explain': 'get POD signed.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab10")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 10: Shipping & Delivery',
        'questionCount': vocab10Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đÃ HOÁN VỊ sẵn — không shuffle thêm)
  for (int i = 1; i <= vocab10Questions.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab10Questions[i - 1];

    await db
        .collection('vocab_practice')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab10")
        .collection('questions')
        .doc(id)
        .set({
          'question': q['question'],
          'options': q['options'],
          'correctIndex': q['correctIndex'],
          'explain': q['explain'],
          'order': i,
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }
}
