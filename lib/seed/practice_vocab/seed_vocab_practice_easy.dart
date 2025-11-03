import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedVocabPracticeEasy() async {
  final db = FirebaseFirestore.instance;
  const levelId = 'easy';

  // Root material doc (merge-safe)
  await db.collection('vocab_practice').doc(levelId).set({
    'title': 'Practice Vocabulary Level Easy',
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

  // Vocab 1: People & Actions in Photos
  final vocab1Questions = <Map<String, dynamic>>[
    {
      'question': 'Choose the best verb: She is ___ at a desk.',
      'options': ['sitting', 'standing', 'lifting', 'loading'],
      'correctIndex': 0,
      'explain': '“sit” = ngồi; phù hợp ngữ cảnh “at a desk”.',
    },
    {
      'question': 'Choose the best verb: They are ___ in line at the counter.',
      'options': ['standing', 'mopping', 'unloading', 'folding'],
      'correctIndex': 0,
      'explain': '“stand” = đứng xếp hàng.',
    },
    {
      'question': 'Choose the best verb: He is ___ a folder in his hand.',
      'options': ['holding', 'pouring', 'sweeping', 'browsing'],
      'correctIndex': 0,
      'explain': '“hold” = cầm, nắm một vật.',
    },
    {
      'question': 'Choose the best verb: She is ___ a bag up the stairs.',
      'options': ['carrying', 'adjusting', 'taking off', 'stacking'],
      'correctIndex': 0,
      'explain': '“carry” = mang, vác.',
    },
    {
      'question': 'Choose the best verb: The presenter is ___ at the screen.',
      'options': ['pointing', 'mopping', 'loading', 'putting on'],
      'correctIndex': 0,
      'explain': '“point” = chỉ vào.',
    },
    {
      'question':
          'Choose the best verb: She is ___ for a book on the top shelf.',
      'options': ['reaching', 'shaking hands', 'sweeping', 'passing'],
      'correctIndex': 0,
      'explain': '“reach” = với tới.',
    },
    {
      'question': 'Choose the best verb: He is ___ a hat and gloves.',
      'options': ['wearing', 'wiping', 'folding', 'unloading'],
      'correctIndex': 0,
      'explain': '“wear” = mặc/đội (đang có trên người).',
    },
    {
      'question': 'Choose the best verb: The woman is ___ her glasses.',
      'options': ['putting on', 'taking off', 'leaning', 'stacking'],
      'correctIndex': 0,
      'explain': '“put on” = đeo/mặc vào.',
    },
    {
      'question':
          'Choose the best verb: He is ___ his jacket because it is warm.',
      'options': ['taking off', 'loading', 'pushing', 'watching'],
      'correctIndex': 0,
      'explain': '“take off” = cởi/bỏ ra.',
    },
    {
      'question':
          'Choose the best verb: The team is ___ a chart during the meeting.',
      'options': ['looking at', 'mopping', 'unloading', 'folding'],
      'correctIndex': 0,
      'explain': '“look at” = nhìn vào.',
    },
    {
      'question':
          'Choose the best verb: She is ___ the presentation carefully.',
      'options': ['watching', 'loading', 'pushing', 'bending'],
      'correctIndex': 0,
      'explain': '“watch” = xem/quan sát.',
    },
    {
      'question':
          'Choose the best verb: The man is ___ over to pick up the pen.',
      'options': ['bending', 'pouring', 'sorting', 'stacking'],
      'correctIndex': 0,
      'explain': '“bend” = cúi/gập người.',
    },
    {
      'question':
          'Choose the best verb: She is ___ against the wall while waiting.',
      'options': ['leaning', 'unloading', 'mopping', 'putting on'],
      'correctIndex': 0,
      'explain': '“lean” = tựa/nghiêng.',
    },
    {
      'question': 'Choose the best verb: He is ___ a heavy suitcase.',
      'options': ['lifting', 'sweeping', 'browsing', 'folding'],
      'correctIndex': 0,
      'explain': '“lift” = nhấc, nâng.',
    },
    {
      'question': 'Choose the best verb: She is ___ a cart through the aisle.',
      'options': ['pushing', 'passing', 'pouring', 'adjusting'],
      'correctIndex': 0,
      'explain': '“push” = đẩy.',
    },
    {
      'question': 'Choose the best verb: The worker is ___ the door open.',
      'options': ['pulling', 'putting on', 'watching', 'sitting'],
      'correctIndex': 0,
      'explain': '“pull” = kéo.',
    },
    {
      'question': 'Choose the best verb: She is ___ the table with a cloth.',
      'options': ['wiping', 'stacking', 'loading', 'wearing'],
      'correctIndex': 0,
      'explain': '“wipe” = lau chùi.',
    },
    {
      'question': 'Choose the best verb: He is ___ the floor with a broom.',
      'options': ['sweeping', 'passing', 'pouring', 'reaching'],
      'correctIndex': 0,
      'explain': '“sweep” = quét.',
    },
    {
      'question': 'Choose the best verb: She is ___ the hallway with a mop.',
      'options': ['mopping', 'bending', 'loading', 'leaning'],
      'correctIndex': 0,
      'explain': '“mop” = lau sàn.',
    },
    {
      'question': 'Choose the best verb: They are ___ boxes onto the truck.',
      'options': ['loading', 'taking off', 'folding', 'watching'],
      'correctIndex': 0,
      'explain': '“load” = chất lên.',
    },
    {
      'question': 'Choose the best verb: Workers are ___ a truck at the dock.',
      'options': ['unloading', 'wearing', 'wiping', 'adjusting'],
      'correctIndex': 0,
      'explain': '“unload” = dỡ xuống.',
    },
    {
      'question':
          'Choose the best verb: The managers are ___ after signing the deal.',
      'options': ['shaking hands', 'browsing', 'mopping', 'stacking'],
      'correctIndex': 0,
      'explain': '“shake hands” = bắt tay.',
    },
    {
      'question': 'Choose the best verb: She is ___ him a document.',
      'options': ['handing', 'folding', 'loading', 'sweeping'],
      'correctIndex': 0,
      'explain': '“hand” (v) = đưa cho.',
    },
    {
      'question': 'Choose the best verb: Please ___ the pen to me.',
      'options': ['pass', 'pull', 'lean', 'watch'],
      'correctIndex': 0,
      'explain': '“pass” = chuyển/đưa.',
    },
    {
      'question': 'Choose the best verb: He is ___ coffee into a cup.',
      'options': ['pouring', 'bending', 'reaching', 'shaking hands'],
      'correctIndex': 0,
      'explain': '“pour” = rót.',
    },
    {
      'question':
          'Choose the best verb: She is ___ papers into separate piles.',
      'options': ['sorting', 'mopping', 'wearing', 'taking off'],
      'correctIndex': 0,
      'explain': '“sort” = phân loại.',
    },
    {
      'question': 'Choose the best verb: Books are ___ on the shelf.',
      'options': ['stacked', 'pushed', 'wiped', 'pulled'],
      'correctIndex': 0,
      'explain': '“stack” = xếp chồng.',
    },
    {
      'question': 'Choose the best verb: Customers are ___ the shelves.',
      'options': ['browsing', 'pouring', 'folding', 'loading'],
      'correctIndex': 0,
      'explain': '“browse” = xem lướt.',
    },
    {
      'question': 'Choose the best verb: She is ___ a shirt neatly.',
      'options': ['folding', 'adjusting', 'standing', 'reaching'],
      'correctIndex': 0,
      'explain': '“fold” = gấp.',
    },
    {
      'question': 'Choose the best verb: He is ___ the microphone height.',
      'options': ['adjusting', 'pushing', 'loading', 'sweeping'],
      'correctIndex': 0,
      'explain': '“adjust” = điều chỉnh.',
    },
    {
      'question': 'Best completion: The clerk is ___ at the counter.',
      'options': ['standing', 'taking off', 'mopping', 'unloading'],
      'correctIndex': 0,
      'explain': '“stand at the counter”.',
    },
    {
      'question': 'Best completion: The audience is ___ the speaker.',
      'options': ['watching', 'folding', 'loading', 'pulling'],
      'correctIndex': 0,
      'explain': '“watch” a speaker/presentation.',
    },
    {
      'question': 'Best completion: The shopper is ___ a cart.',
      'options': ['pushing', 'pouring', 'wiping', 'bending'],
      'correctIndex': 0,
      'explain': '“push a cart”.',
    },
    {
      'question': 'Best completion: The worker is ___ the doorway rope.',
      'options': ['pulling', 'sitting', 'browsing', 'stacking'],
      'correctIndex': 0,
      'explain': '“pull” a rope/door.',
    },
    {
      'question': 'Best completion: The janitor is ___ the floor.',
      'options': ['sweeping', 'passing', 'reaching', 'wearing'],
      'correctIndex': 0,
      'explain': '“sweep the floor”.',
    },
    {
      'question': 'Best completion: The woman is ___ a gift box to him.',
      'options': ['handing', 'loading', 'mopping', 'taking off'],
      'correctIndex': 0,
      'explain': '“hand (v) something to someone”.',
    },
    {
      'question': 'Best completion: She is ___ her coat near the entrance.',
      'options': ['putting on', 'stacking', 'adjusting', 'sweeping'],
      'correctIndex': 0,
      'explain': '“put on” = mặc vào.',
    },
    {
      'question': 'Best completion: He is ___ his tie before the meeting.',
      'options': ['adjusting', 'mopping', 'pushing', 'loading'],
      'correctIndex': 0,
      'explain': 'Điều chỉnh cà vạt = “adjust”.',
    },
    {
      'question': 'Best completion: They are ___ hands to greet each other.',
      'options': ['shaking', 'bending', 'folding', 'browsing'],
      'correctIndex': 0,
      'explain': '“shake hands”.',
    },
    {
      'question':
          'Error correction: Choose the correct option for the picture action “rót cà phê”.',
      'options': ['pour', 'pull', 'push', 'pass'],
      'correctIndex': 0,
      'explain': '“pour” = rót.',
    },
    {
      'question':
          'Error correction: Choose the correct option for the action “quét sàn”.',
      'options': ['sweep', 'wear', 'watch', 'sit'],
      'correctIndex': 0,
      'explain': '“sweep” = quét.',
    },
    {
      'question': 'Meaning check: “lean against” is closest to…',
      'options': ['rest on', 'take off', 'sort out', 'load up'],
      'correctIndex': 0,
      'explain': '“lean against” ≈ “tựa vào”.',
    },
    {
      'question': 'Meaning check: “unload” is closest to…',
      'options': ['remove from', 'put on', 'look at', 'hand to'],
      'correctIndex': 0,
      'explain': '“unload” = dỡ xuống.',
    },
    {
      'question':
          'Collocation: Choose the verb that fits: “___ boxes onto pallets.”',
      'options': ['Stack', 'Sit', 'Fold', 'Wear'],
      'correctIndex': 0,
      'explain': '“stack boxes”.',
    },
    {
      'question':
          'Collocation: Choose the verb that fits: “___ documents into folders.”',
      'options': ['Sort', 'Sweep', 'Watch', 'Lean'],
      'correctIndex': 0,
      'explain': '“sort documents”.',
    },
    {
      'question': 'Picture verb choice: The man is ___ the door to enter.',
      'options': ['pulling', 'pouring', 'folding', 'sweeping'],
      'correctIndex': 0,
      'explain': '“pull the door”.',
    },
    {
      'question': 'Picture verb choice: The chef is ___ soup in the kitchen.',
      'options': ['pouring', 'bending', 'wearing', 'standing'],
      'correctIndex': 0,
      'explain': '“pour soup”.',
    },
    {
      'question': 'Context: Before the rain, she is ___ her jacket.',
      'options': ['putting on', 'taking off', 'leaning', 'stacking'],
      'correctIndex': 0,
      'explain': 'Mặc áo = “putting on”.',
    },
    {
      'question': 'Context: Inside the office, he is ___ his jacket.',
      'options': ['taking off', 'loading', 'pushing', 'watching'],
      'correctIndex': 0,
      'explain': 'Cởi áo = “taking off”.',
    },
    {
      'question': 'Context: At the library, students are ___ the shelves.',
      'options': ['browsing', 'mopping', 'folding', 'loading'],
      'correctIndex': 0,
      'explain': '“browse the shelves”.',
    },
    {
      'question': 'Context: At the warehouse, workers are ___ a truck.',
      'options': ['loading', 'sitting', 'leaning', 'watching'],
      'correctIndex': 0,
      'explain': '“load a truck”.',
    },
    {
      'question': 'Synonym: Which is closest to “wipe the table”?',
      'options': [
        'clean the surface',
        'stack the books',
        'pour the coffee',
        'fold the shirt',
      ],
      'correctIndex': 0,
      'explain': '“wipe” ≈ “clean by rubbing”.',
    },
    {
      'question': 'Opposite: Which is the opposite of “put on (a coat)”?',
      'options': ['take off', 'watch', 'pass', 'wear'],
      'correctIndex': 0,
      'explain': 'Đối nghĩa “put on” ↔ “take off”.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab1")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 1: People & Actions in Photos',
        'questionCount': vocab1Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50
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
          // Optional fields to stay consistent with your structure:
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // Vocab 2: Daily Routines at Work (arrive, leave, commute, clock in/out, check email, reply,
  // make a call, take notes, set a reminder, schedule/reschedule, attend, host, assign, submit,
  // follow up, take a break, have lunch, brainstorm, prioritize, track, update, fix, print, scan,
  // organize, save, backup, log out)
  // =========================
  final vocab2Questions = <Map<String, dynamic>>[
    {
      'question': 'Choose the best verb: I usually ___ at the office by 9 a.m.',
      'options': ['arrive', 'leave', 'fix', 'scan'],
      'correctIndex': 0,
      'explain': '“arrive” = đến nơi làm việc.',
    },
    {
      'question':
          'Choose the best verb: She often ___ at 6 p.m. to catch the bus.',
      'options': ['leaves', 'arrives', 'prints', 'hosts'],
      'correctIndex': 0,
      'explain': '“leave” = rời đi/kết thúc ca.',
    },
    {
      'question': 'Choose the best verb: He ___ to work by subway.',
      'options': ['commutes', 'submits', 'backs up', 'attends'],
      'correctIndex': 0,
      'explain': '“commute” = đi lại (đi làm).',
    },
    {
      'question':
          'Fill in the blank: Staff must ___ at the lobby when they start work.',
      'options': ['clock in', 'log out', 'take notes', 'reschedule'],
      'correctIndex': 0,
      'explain': '“clock in” = chấm công vào.',
    },
    {
      'question':
          'Fill in the blank: Don’t forget to ___ before leaving the office.',
      'options': ['clock out', 'arrive', 'host', 'prioritize'],
      'correctIndex': 0,
      'explain': '“clock out” = chấm công ra.',
    },
    {
      'question':
          'Choose the best action: Every morning I ___ first to check urgent messages.',
      'options': ['check email', 'print files', 'host meetings', 'leave'],
      'correctIndex': 0,
      'explain': 'Thói quen công sở: kiểm tra email.',
    },
    {
      'question': 'Meaning check: “reply (to a client)” is closest to…',
      'options': ['respond', 'arrive', 'organize', 'scan'],
      'correctIndex': 0,
      'explain': '“reply” ≈ “respond”.',
    },
    {
      'question': 'Choose the best verb: He is ___ to the supplier right now.',
      'options': [
        'making a call',
        'taking a break',
        'backing up',
        'logging out',
      ],
      'correctIndex': 0,
      'explain': '“make a call” = gọi điện.',
    },
    {
      'question':
          'Choose the best verb: During meetings, try to ___ carefully.',
      'options': ['take notes', 'print', 'scan', 'leave'],
      'correctIndex': 0,
      'explain': '“take notes” = ghi chú.',
    },
    {
      'question': 'Fill in the blank: I’ll ___ for 3 p.m. so we don’t forget.',
      'options': ['set a reminder', 'host', 'log out', 'commute'],
      'correctIndex': 0,
      'explain': 'Đặt lời nhắc.',
    },
    {
      'question':
          'Choose the best word: We need to ___ a team call for Thursday.',
      'options': ['schedule', 'submit', 'scan', 'arrive'],
      'correctIndex': 0,
      'explain': '“schedule” = lên lịch.',
    },
    {
      'question': 'Choose the best word: Can we ___ the meeting to Friday?',
      'options': ['reschedule', 'backup', 'clock in', 'print'],
      'correctIndex': 0,
      'explain': '“reschedule” = dời lịch.',
    },
    {
      'question': 'Choose the best verb: I’ll ___ the workshop next week.',
      'options': ['attend', 'save', 'log out', 'scan'],
      'correctIndex': 0,
      'explain': '“attend” = tham dự.',
    },
    {
      'question':
          'Choose the best verb: She will ___ the meeting this afternoon.',
      'options': ['host', 'arrive', 'commute', 'fix'],
      'correctIndex': 0,
      'explain': '“host” = chủ trì.',
    },
    {
      'question':
          'Choose the best verb: The manager will ___ tasks to each member.',
      'options': ['assign', 'leave', 'print', 'scan'],
      'correctIndex': 0,
      'explain': '“assign” = phân công.',
    },
    {
      'question': 'Fill in the blank: Please ___ the report by noon.',
      'options': ['submit', 'commute', 'host', 'arrive'],
      'correctIndex': 0,
      'explain': '“submit” = nộp/gửi.',
    },
    {
      'question': 'Meaning check: “follow up” means to…',
      'options': [
        'check again later',
        'leave immediately',
        'print the file',
        'host a party',
      ],
      'correctIndex': 0,
      'explain': 'Theo dõi/nhắc lại sau.',
    },
    {
      'question': 'Choose the best phrase: Let’s ___ and continue at 3:15.',
      'options': ['take a break', 'clock in', 'log out', 'backup'],
      'correctIndex': 0,
      'explain': '“take a break” = nghỉ giải lao.',
    },
    {
      'question': 'Choose the best verb: We usually ___ together at noon.',
      'options': ['have lunch', 'attend', 'arrive', 'print'],
      'correctIndex': 0,
      'explain': '“have lunch” = ăn trưa.',
    },
    {
      'question': 'Meaning check: “brainstorm ideas” is closest to…',
      'options': [
        'think creatively',
        'print documents',
        'scan badges',
        'clock out',
      ],
      'correctIndex': 0,
      'explain': 'Động não tìm ý tưởng.',
    },
    {
      'question': 'Choose the best verb: We must ___ urgent tasks first.',
      'options': ['prioritize', 'commute', 'leave', 'log out'],
      'correctIndex': 0,
      'explain': '“prioritize” = ưu tiên.',
    },
    {
      'question': 'Choose the best verb: We ___ our progress weekly.',
      'options': ['track', 'arrive', 'host', 'scan'],
      'correctIndex': 0,
      'explain': '“track” = theo dõi.',
    },
    {
      'question': 'Fill in the blank: I’ll ___ the file after the meeting.',
      'options': ['update', 'arrive', 'commute', 'host'],
      'correctIndex': 0,
      'explain': '“update” = cập nhật.',
    },
    {
      'question': 'Choose the best verb: The engineer will ___ the issue soon.',
      'options': ['fix', 'leave', 'print', 'log out'],
      'correctIndex': 0,
      'explain': '“fix” = sửa/khắc phục.',
    },
    {
      'question':
          'Choose the best verb: Please ___ the forms for the workshop.',
      'options': ['print', 'clock in', 'backup', 'commute'],
      'correctIndex': 0,
      'explain': '“print” = in ấn.',
    },
    {
      'question': 'Choose the best verb: She will ___ the contract to PDF.',
      'options': ['scan', 'leave', 'host', 'arrive'],
      'correctIndex': 0,
      'explain': '“scan” = quét tài liệu.',
    },
    {
      'question':
          'Choose the best verb: ___ your folder so everything is easy to find.',
      'options': ['Organize', 'Log out', 'Commute', 'Host'],
      'correctIndex': 0,
      'explain': '“organize” = sắp xếp.',
    },
    {
      'question': 'Choose the best verb: Remember to ___ the draft frequently.',
      'options': ['save', 'arrive', 'reschedule', 'scan'],
      'correctIndex': 0,
      'explain': '“save” = lưu.',
    },
    {
      'question': 'Choose the best word: Do you ___ files every day?',
      'options': ['backup', 'attend', 'host', 'leave'],
      'correctIndex': 0,
      'explain': '“backup” = sao lưu.',
    },
    {
      'question':
          'Fill in the blank: For security, always ___ of shared computers.',
      'options': ['log out', 'submit', 'arrive', 'print'],
      'correctIndex': 0,
      'explain': '“log out” = đăng xuất.',
    },
    {
      'question': 'Collocation: We need to ___ a reminder for the deadline.',
      'options': ['set', 'scan', 'arrive', 'leave'],
      'correctIndex': 0,
      'explain': '“set a reminder”.',
    },
    {
      'question': 'Collocation: Can you ___ the timeline after the meeting?',
      'options': ['update', 'host', 'commute', 'clock in'],
      'correctIndex': 0,
      'explain': '“update the timeline”.',
    },
    {
      'question': 'Closest meaning: “submit the form” ≈',
      'options': [
        'turn in the form',
        'print the form',
        'scan the form',
        'leave the form',
      ],
      'correctIndex': 0,
      'explain': '“submit” ≈ “turn in”.',
    },
    {
      'question': 'Closest meaning: “track progress” ≈',
      'options': [
        'monitor progress',
        'arrive progress',
        'host progress',
        'commute progress',
      ],
      'correctIndex': 0,
      'explain': '“track” ≈ “monitor”.',
    },
    {
      'question': 'Opposite meaning: The opposite of “log out” is…',
      'options': ['log in', 'clock in', 'arrive', 'backup'],
      'correctIndex': 0,
      'explain': '“log out” ↔ “log in”.',
    },
    {
      'question': 'Opposite meaning: The opposite of “arrive” is…',
      'options': ['leave', 'host', 'fix', 'scan'],
      'correctIndex': 0,
      'explain': 'Đến ↔ rời đi.',
    },
    {
      'question': 'Usage: Before leaving for lunch, remember to ___ your work.',
      'options': ['save', 'host', 'reschedule', 'commute'],
      'correctIndex': 0,
      'explain': 'Lưu công việc trước khi rời máy.',
    },
    {
      'question': 'Usage: After the call, please ___ with the client tomorrow.',
      'options': ['follow up', 'log out', 'clock out', 'arrive'],
      'correctIndex': 0,
      'explain': 'Theo dõi/nhắc lại sau cuộc gọi.',
    },
    {
      'question':
          'Context: We should ___ tasks so the urgent ones are done first.',
      'options': ['prioritize', 'organize', 'arrive', 'commute'],
      'correctIndex': 0,
      'explain': 'Ưu tiên công việc.',
    },
    {
      'question':
          'Context: He forgot to ___ this morning and had to report to HR.',
      'options': ['clock in', 'host', 'attend', 'backup'],
      'correctIndex': 0,
      'explain': 'Quên chấm công vào.',
    },
    {
      'question': 'Context: The team will ___ ideas for the new campaign.',
      'options': ['brainstorm', 'log out', 'print', 'scan'],
      'correctIndex': 0,
      'explain': 'Động não ý tưởng.',
    },
    {
      'question': 'Context: Please ___ the broken link on the homepage.',
      'options': ['fix', 'arrive', 'leave', 'commute'],
      'correctIndex': 0,
      'explain': 'Khắc phục sự cố.',
    },
    {
      'question': 'Context: Can we ___ the session to next Monday?',
      'options': ['reschedule', 'clock out', 'log out', 'commute'],
      'correctIndex': 0,
      'explain': 'Dời lịch buổi họp.',
    },
    {
      'question': 'Practical: We will ___ the quarterly review at 2 p.m.',
      'options': ['host', 'leave', 'scan', 'backup'],
      'correctIndex': 0,
      'explain': 'Chủ trì buổi review.',
    },
    {
      'question': 'Practical: All attendees must ___ the workshop on time.',
      'options': ['attend', 'arrive', 'print', 'save'],
      'correctIndex': 0,
      'explain': 'Tham dự đúng giờ.',
    },
    {
      'question': 'Practical: After editing, please ___ the newest version.',
      'options': ['save', 'leave', 'commute', 'clock out'],
      'correctIndex': 0,
      'explain': 'Lưu phiên bản mới nhất.',
    },
    {
      'question': 'Practical: Don’t forget to ___ important data to the cloud.',
      'options': ['backup', 'host', 'arrive', 'fix'],
      'correctIndex': 0,
      'explain': 'Sao lưu dữ liệu.',
    },
    {
      'question':
          'Usage: The assistant will ___ the handouts before the meeting.',
      'options': ['print', 'commute', 'leave', 'log out'],
      'correctIndex': 0,
      'explain': 'In tài liệu phát tay.',
    },
    {
      'question': 'Usage: Please ___ the signed contract and email it to me.',
      'options': ['scan', 'arrive', 'host', 'backup'],
      'correctIndex': 0,
      'explain': 'Quét hợp đồng đã ký.',
    },
    {
      'question':
          'Sentence completion: The team lead will ___ the new tasks this afternoon.',
      'options': ['assign', 'leave', 'arrive', 'log out'],
      'correctIndex': 0,
      'explain': 'Phân công nhiệm vụ.',
    },
    {
      'question':
          'Sentence completion: I will ___ an email to confirm your attendance.',
      'options': ['reply to', 'commute', 'print', 'clock out'],
      'correctIndex': 0,
      'explain': 'Trả lời email xác nhận.',
    },
    {
      'question': 'Closest meaning: “take a break” ≈',
      'options': [
        'rest for a short time',
        'leave permanently',
        'host a meeting',
        'print a file',
      ],
      'correctIndex': 0,
      'explain': 'Nghỉ giải lao ngắn.',
    },
    {
      'question': 'Closest meaning: “organize your folder” ≈',
      'options': [
        'arrange files neatly',
        'reply to emails',
        'log out of apps',
        'arrive earlier',
      ],
      'correctIndex': 0,
      'explain': 'Sắp xếp thư mục gọn gàng.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab2")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 2: Daily Routines at Work',
        'questionCount': vocab2Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50
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
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 3: Office Objects & Places
  // (desk, chair, printer, copier, keyboard, mouse, monitor, laptop, projector,
  // whiteboard, marker, stapler, staple, folder, file, cabinet, drawer,
  // stationery, supplies, reception, lobby, corridor, cafeteria, pantry,
  // meeting room, workstation, badge, outlet, router, network)
  // =========================
  final vocab3Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “desk” most nearly means…',
      'options': ['bàn làm việc', 'máy in', 'thẻ ra vào', 'hành lang'],
      'correctIndex': 0,
      'explain': 'desk = bàn làm việc.',
    },
    {
      'question': 'Choose the best word: Please take a ___ and wait.',
      'options': ['chair', 'printer', 'router', 'badge'],
      'correctIndex': 0,
      'explain': 'chair = ghế ngồi.',
    },
    {
      'question': 'Closest meaning: “The ___ is out of ink.”',
      'options': ['printer', 'folder', 'drawer', 'marker'],
      'correctIndex': 0,
      'explain': 'Hết mực thường nói về máy in (printer).',
    },
    {
      'question': 'Choose the item: Use the ___ downstairs to make copies.',
      'options': ['copier', 'monitor', 'mouse', 'outlet'],
      'correctIndex': 0,
      'explain': 'copier = máy photocopy.',
    },
    {
      'question':
          'Fill the blank: My ___ is wireless, so I can type from afar.',
      'options': ['keyboard', 'badge', 'cabinet', 'corridor'],
      'correctIndex': 0,
      'explain': 'keyboard = bàn phím.',
    },
    {
      'question': 'Choose the device: The ___ is not moving on the screen.',
      'options': ['mouse', 'stapler', 'folder', 'pantry'],
      'correctIndex': 0,
      'explain': 'mouse = chuột máy tính.',
    },
    {
      'question': 'Meaning: Adjust your ___ height for better posture.',
      'options': ['monitor', 'copier', 'router', 'whiteboard'],
      'correctIndex': 0,
      'explain': 'monitor = màn hình.',
    },
    {
      'question': 'Choose the item: Please charge the ___ fully before travel.',
      'options': ['laptop', 'staple', 'drawer', 'badge'],
      'correctIndex': 0,
      'explain': 'laptop = máy tính xách tay.',
    },
    {
      'question': 'Best completion: The ___ is ready for the presentation.',
      'options': ['projector', 'marker', 'outlet', 'cabinet'],
      'correctIndex': 0,
      'explain': 'projector = máy chiếu.',
    },
    {
      'question': 'Select the best word: Write it on the ___.',
      'options': ['whiteboard', 'stationery', 'router', 'corridor'],
      'correctIndex': 0,
      'explain': 'whiteboard = bảng trắng.',
    },
    {
      'question': 'Meaning: The ___ is dry; we need a new one.',
      'options': ['marker', 'printer', 'folder', 'badge'],
      'correctIndex': 0,
      'explain': 'marker = bút lông.',
    },
    {
      'question': 'Choose the tool: Pass me the ___.',
      'options': ['stapler', 'router', 'workstation', 'lobby'],
      'correctIndex': 0,
      'explain': 'stapler = dập ghim.',
    },
    {
      'question': 'Best verb-noun pair: Please ___ the pages together.',
      'options': ['staple', 'monitor', 'file', 'badge'],
      'correctIndex': 0,
      'explain': 'staple (v) = ghim lại.',
    },
    {
      'question': 'Choose the container: Open the blue ___.',
      'options': ['folder', 'copier', 'marker', 'outlet'],
      'correctIndex': 0,
      'explain': 'folder = bìa hồ sơ.',
    },
    {
      'question': 'Meaning: Please ___ the documents by date.',
      'options': ['file', 'scan', 'host', 'leave'],
      'correctIndex': 0,
      'explain': 'file (v) = sắp xếp hồ sơ.',
    },
    {
      'question': 'Choose the storage: The ___ is locked; find the key.',
      'options': ['cabinet', 'badge', 'printer', 'router'],
      'correctIndex': 0,
      'explain': 'cabinet = tủ hồ sơ.',
    },
    {
      'question': 'Select the best word: Check the top ___.',
      'options': ['drawer', 'network', 'projector', 'chair'],
      'correctIndex': 0,
      'explain': 'drawer = ngăn kéo.',
    },
    {
      'question': 'Meaning: Order more ___ such as pens and paper clips.',
      'options': ['stationery', 'laptops', 'corridors', 'badges'],
      'correctIndex': 0,
      'explain': 'stationery = văn phòng phẩm.',
    },
    {
      'question': 'Choose the plural item: We need office ___.',
      'options': ['supplies', 'monitors', 'routers', 'lobbies'],
      'correctIndex': 0,
      'explain': 'supplies = đồ dùng, vật tư.',
    },
    {
      'question': 'Meaning: Ask at ___. They can direct you.',
      'options': ['reception', 'outlet', 'drawer', 'staple'],
      'correctIndex': 0,
      'explain': 'reception = quầy lễ tân.',
    },
    {
      'question': 'Choose the place: Please wait in the ___.',
      'options': ['lobby', 'marker', 'cabinet', 'folder'],
      'correctIndex': 0,
      'explain': 'lobby = sảnh.',
    },
    {
      'question': 'Meaning: The ___ is narrow; walk carefully.',
      'options': ['corridor', 'printer', 'mouse', 'router'],
      'correctIndex': 0,
      'explain': 'corridor = hành lang.',
    },
    {
      'question': 'Choose the place: Let’s meet at the ___.',
      'options': ['cafeteria', 'cabinet', 'whiteboard', 'drawer'],
      'correctIndex': 0,
      'explain': 'cafeteria = căng tin.',
    },
    {
      'question': 'Fill in: Cups are in the ___.',
      'options': ['pantry', 'workstation', 'monitor', 'stapler'],
      'correctIndex': 0,
      'explain': 'pantry = phòng đồ uống/khu để đồ.',
    },
    {
      'question': 'Meaning: The ___ is full; we need a bigger space.',
      'options': ['meeting room', 'router', 'outlet', 'printer'],
      'correctIndex': 0,
      'explain': 'meeting room = phòng họp.',
    },
    {
      'question': 'Choose the place: Clean your ___ before you leave.',
      'options': ['workstation', 'badge', 'cabinet', 'corridor'],
      'correctIndex': 0,
      'explain': 'workstation = chỗ làm việc.',
    },
    {
      'question': 'Meaning: Wear your ___ to enter the building.',
      'options': ['badge', 'folder', 'marker', 'staple'],
      'correctIndex': 0,
      'explain': 'badge = thẻ ra/vào.',
    },
    {
      'question': 'Choose the item: Plug the charger into the ___.',
      'options': ['outlet', 'drawer', 'stapler', 'whiteboard'],
      'correctIndex': 0,
      'explain': 'outlet = ổ điện.',
    },
    {
      'question': 'Meaning: Reset the ___ if the Wi-Fi is unstable.',
      'options': ['router', 'staple', 'folder', 'marker'],
      'correctIndex': 0,
      'explain': 'router = bộ định tuyến.',
    },
    {
      'question': 'Choose the word: The ___ is down; we can’t access files.',
      'options': ['network', 'copier', 'chair', 'pantry'],
      'correctIndex': 0,
      'explain': 'network = mạng.',
    },
    {
      'question': 'Collocation: Put the forms into the green ___.',
      'options': ['folder', 'router', 'badge', 'outlet'],
      'correctIndex': 0,
      'explain': 'Hồ sơ → folder.',
    },
    {
      'question': 'Usage: Please ___ these contracts alphabetically.',
      'options': ['file', 'monitor', 'badge', 'route'],
      'correctIndex': 0,
      'explain': 'file (v) = sắp hồ sơ theo trật tự.',
    },
    {
      'question': 'Context: The ___ shows “paper jam.”',
      'options': ['printer', 'marker', 'whiteboard', 'cabinet'],
      'correctIndex': 0,
      'explain': 'Sự cố kẹt giấy thuộc về printer.',
    },
    {
      'question': 'Context: We’ll write the agenda on the ___.',
      'options': ['whiteboard', 'workstation', 'drawer', 'router'],
      'correctIndex': 0,
      'explain': 'Bảng trắng để ghi agenda.',
    },
    {
      'question': 'Meaning: Put your laptop in the top ___.',
      'options': ['drawer', 'badge', 'outlet', 'staple'],
      'correctIndex': 0,
      'explain': 'drawer = ngăn kéo.',
    },
    {
      'question': 'Closest meaning: “stationery” is…',
      'options': [
        'pens, paper, office supplies',
        'computers and routers',
        'tables and chairs',
        'stairs and corridors',
      ],
      'correctIndex': 0,
      'explain': 'Đồ văn phòng phẩm.',
    },
    {
      'question': 'Opposite: The opposite of “unlock the cabinet” is…',
      'options': [
        'lock the cabinet',
        'open the folder',
        'reset the router',
        'enter the lobby',
      ],
      'correctIndex': 0,
      'explain': 'lock ↔ unlock.',
    },
    {
      'question': 'Meaning check: A “___” connects devices to the internet.',
      'options': ['router', 'stapler', 'marker', 'folder'],
      'correctIndex': 0,
      'explain': 'Router tạo mạng nội bộ/ra internet.',
    },
    {
      'question': 'Choose the best word: He wrote the note with a ___.',
      'options': ['marker', 'badge', 'router', 'outlet'],
      'correctIndex': 0,
      'explain': 'marker để viết/đánh dấu.',
    },
    {
      'question': 'Context: Please sit on the ___ near my desk.',
      'options': ['chair', 'copier', 'router', 'cabinet'],
      'correctIndex': 0,
      'explain': 'chair = ghế.',
    },
    {
      'question': 'Sentence: Let’s meet in the big ___.',
      'options': ['meeting room', 'outlet', 'drawer', 'marker'],
      'correctIndex': 0,
      'explain': 'Phòng họp.',
    },
    {
      'question': 'Fill in: The ___ is too bright; reduce the brightness.',
      'options': ['monitor', 'folder', 'router', 'stapler'],
      'correctIndex': 0,
      'explain': 'Điều chỉnh màn hình.',
    },
    {
      'question': 'Usage: Please ___ the pages; then pass me the stapler.',
      'options': ['staple', 'badge', 'outlet', 'cabinet'],
      'correctIndex': 0,
      'explain': 'Hành động dùng kim bấm.',
    },
    {
      'question': 'Meaning: A “workstation” is best described as…',
      'options': [
        'your desk area',
        'a power socket',
        'the cafeteria',
        'the reception desk',
      ],
      'correctIndex': 0,
      'explain': 'Khu vực làm việc cá nhân.',
    },
    {
      'question': 'Context: The ___ is crowded at noon.',
      'options': ['cafeteria', 'outlet', 'drawer', 'whiteboard'],
      'correctIndex': 0,
      'explain': 'Căng tin đông vào giờ trưa.',
    },
    {
      'question': 'Choose the word: Show your ___ to the security guard.',
      'options': ['badge', 'mouse', 'printer', 'marker'],
      'correctIndex': 0,
      'explain': 'Thẻ ra vào.',
    },
    {
      'question': 'Meaning: The “lobby” is…',
      'options': [
        'the entrance hall',
        'a locked cabinet',
        'a desk drawer',
        'a wall-mounted screen',
      ],
      'correctIndex': 0,
      'explain': 'Sảnh/tiền sảnh.',
    },
    {
      'question': 'Usage: Plug the projector into that wall ___.',
      'options': ['outlet', 'folder', 'whiteboard', 'badge'],
      'correctIndex': 0,
      'explain': 'Ổ cắm điện.',
    },
    {
      'question':
          'Context: The ___ is slow today; we can’t access shared folders.',
      'options': ['network', 'copier', 'stapler', 'pantry'],
      'correctIndex': 0,
      'explain': 'Mạng chậm.',
    },
    {
      'question': 'Closest meaning: “reception” ≈',
      'options': ['front desk', 'cafeteria', 'workstation', 'cabinet'],
      'correctIndex': 0,
      'explain': 'Quầy lễ tân = front desk.',
    },
    {
      'question': 'Sentence completion: The cups and tea bags are in the ___.',
      'options': ['pantry', 'router', 'folder', 'corridor'],
      'correctIndex': 0,
      'explain': 'Khu để đồ uống.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab3")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 3: Office Objects & Places',
        'questionCount': vocab3Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50
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
  // Vocab 4: Time, Dates & Appointments (50 câu, đã đổi vị trí options)
  // =========================
  final vocab4Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “schedule (v)” is closest to…',
      'options': [
        'take notes on',
        'set a time for',
        'cancel suddenly',
        'move locations',
      ],
      'correctIndex': 1,
      'explain': '“schedule” = sắp/đặt lịch.',
    },
    {
      'question': 'Choose the best word: I have a dentist ___ at 3 p.m.',
      'options': ['reminder', 'agenda', 'duration', 'appointment'],
      'correctIndex': 3,
      'explain': '“appointment” = lịch hẹn.',
    },
    {
      'question': 'Fill in the blank: The ___ starts at ten sharp.',
      'options': ['time zone', 'period', 'meeting', 'calendar'],
      'correctIndex': 2,
      'explain': '“meeting” = cuộc họp.',
    },
    {
      'question': 'Closest meaning: “deadline” ≈',
      'options': [
        'guest list',
        'final due time',
        'internet account',
        'meeting location',
      ],
      'correctIndex': 1,
      'explain': '“deadline” = hạn chót.',
    },
    {
      'question':
          'Choose the correct action: Let’s ___ the meeting to next week.',
      'options': ['confirm', 'attend', 'postpone', 'clock in'],
      'correctIndex': 2,
      'explain': '“postpone” = hoãn lại.',
    },
    {
      'question': 'Choose the correct action: We must ___ the call to Friday.',
      'options': ['host', 'reschedule', 'print', 'cancel'],
      'correctIndex': 1,
      'explain': '“reschedule” = dời lịch.',
    },
    {
      'question': 'Meaning check: “confirm the time” means…',
      'options': [
        'make sure it is correct',
        'double the length',
        'change it later',
        'ignore it',
      ],
      'correctIndex': 0,
      'explain': '“confirm” = xác nhận.',
    },
    {
      'question': 'Usage: They had to ___ the appointment because of illness.',
      'options': ['extend', 'arrange', 'cancel', 'overlap'],
      'correctIndex': 2,
      'explain': '“cancel” = hủy.',
    },
    {
      'question': 'Choose the phrase: He is always ___ for work.',
      'options': ['time out', 'off time', 'after time', 'on time'],
      'correctIndex': 3,
      'explain': '“on time” = đúng giờ.',
    },
    {
      'question': 'Opposite meaning: The opposite of “on time” is…',
      'options': ['monthly', 'late', 'early', 'ahead of time'],
      'correctIndex': 1,
      'explain': '“late” = muộn.',
    },
    {
      'question': 'Opposite meaning: The opposite of “late” is…',
      'options': ['quarterly', 'overlap', 'early', 'tentative'],
      'correctIndex': 2,
      'explain': '“early” = sớm.',
    },
    {
      'question': 'Choose the best word: Are you ___ this afternoon?',
      'options': ['annual', 'weekly', 'tentative', 'available'],
      'correctIndex': 3,
      'explain': '“available” = rảnh/khả dụng.',
    },
    {
      'question': 'Fill in: Choose a ___ that works for you.',
      'options': ['agenda', 'duration', 'time slot', 'reminder'],
      'correctIndex': 2,
      'explain': '“time slot” = khung giờ.',
    },
    {
      'question': 'Meaning: “agenda” most nearly means…',
      'options': [
        'list of topics',
        'guest names',
        'office location',
        'time zone map',
      ],
      'correctIndex': 0,
      'explain': '“agenda” = chương trình cuộc họp.',
    },
    {
      'question': 'Choose the noun: Set a ___ for noon so we won’t forget.',
      'options': ['period', 'overlap', 'shift', 'reminder'],
      'correctIndex': 3,
      'explain': '“reminder” = lời nhắc.',
    },
    {
      'question': 'Usage: Please check your ___ before proposing a date.',
      'options': ['router', 'badge', 'calendar', 'printer'],
      'correctIndex': 2,
      'explain': '“calendar” = lịch.',
    },
    {
      'question': 'Meaning: A trial ___ is two weeks.',
      'options': ['reminder', 'period', 'agenda', 'slot'],
      'correctIndex': 1,
      'explain': '“period” = khoảng thời gian.',
    },
    {
      'question': 'Meaning: The course ___ is 30 minutes.',
      'options': ['duration', 'availability', 'deadline', 'calendar'],
      'correctIndex': 0,
      'explain': '“duration” = thời lượng.',
    },
    {
      'question': 'Choose the verb: We will ___ the deadline by two days.',
      'options': ['arrive', 'extend', 'cancel', 'confirm'],
      'correctIndex': 1,
      'explain': '“extend” = kéo dài.',
    },
    {
      'question': 'Choose the verb: I will ___ a meeting with the design team.',
      'options': ['tentative', 'monthly', 'arrange', 'overlap'],
      'correctIndex': 2,
      'explain': '“arrange” = sắp xếp.',
    },
    {
      'question': 'Meaning check: “overlap” is used when…',
      'options': [
        'the agenda is printed',
        'two events share the same time',
        'the duration is short',
        'a meeting is canceled',
      ],
      'correctIndex': 1,
      'explain': '“overlap” = trùng giờ.',
    },
    {
      'question': 'Choose the word: I work the night ___.',
      'options': ['shift', 'agenda', 'period', 'reminder'],
      'correctIndex': 0,
      'explain': '“shift” = ca làm việc.',
    },
    {
      'question': 'Adverb: We present results ___, every three months.',
      'options': ['monthly', 'annually', 'weekly', 'quarterly'],
      'correctIndex': 3,
      'explain': '“quarterly” = hàng quý.',
    },
    {
      'question': 'Adverb: The conference is held ___ in December.',
      'options': ['tentative', 'ahead of time', 'annually', 'weekly'],
      'correctIndex': 2,
      'explain': '“annually” = hàng năm.',
    },
    {
      'question': 'Adverb: We have a ___ meeting every Monday.',
      'options': ['overlap', 'annual', 'weekly', 'tentative'],
      'correctIndex': 2,
      'explain': '“weekly” = hàng tuần.',
    },
    {
      'question':
          'Adverb: A ___ review is planned for the first Friday each month.',
      'options': ['early', 'monthly', 'annually', 'quarterly'],
      'correctIndex': 1,
      'explain': '“monthly” = hàng tháng.',
    },
    {
      'question': 'Phrase: Please finish the task ___ if possible.',
      'options': ['tentative', 'ahead of time', 'on time zone', 'overlap'],
      'correctIndex': 1,
      'explain': '“ahead of time” = trước giờ.',
    },
    {
      'question': 'Choose the noun: What is your ___ so I can plan the call?',
      'options': ['time zone', 'calendar', 'reminder', 'agenda'],
      'correctIndex': 0,
      'explain': '“time zone” = múi giờ.',
    },
    {
      'question': 'Meaning: A “___ date” might change later.',
      'options': ['weekly', 'tentative', 'annual', 'monthly'],
      'correctIndex': 1,
      'explain': '“tentative” = tạm thời.',
    },
    {
      'question': 'Choose the noun: Please share your ___ for next week.',
      'options': ['deadline', 'duration', 'availability', 'agenda'],
      'correctIndex': 2,
      'explain': '“availability” = sự rảnh.',
    },
    {
      'question': 'Collocation: Let’s ___ the agenda before we start.',
      'options': ['overlap', 'cancel', 'postpone', 'confirm'],
      'correctIndex': 3,
      'explain': 'Xác nhận chương trình họp.',
    },
    {
      'question': 'Collocation: We should ___ a time slot that suits everyone.',
      'options': ['late', 'weekly', 'extend', 'choose'],
      'correctIndex': 3,
      'explain': 'Chọn khung giờ phù hợp.',
    },
    {
      'question': 'Closest meaning: “extend the deadline” ≈',
      'options': [
        'cancel permanently',
        'push the due date later',
        'start on time',
        'finish earlier',
      ],
      'correctIndex': 1,
      'explain': 'Kéo dài hạn chót.',
    },
    {
      'question': 'Closest meaning: “arrange a meeting” ≈',
      'options': [
        'take a break',
        'set up a meeting',
        'join a shift',
        'change the time zone',
      ],
      'correctIndex': 1,
      'explain': 'Sắp xếp cuộc họp.',
    },
    {
      'question': 'Opposite: The opposite of “postpone” is…',
      'options': ['bring forward', 'confirm', 'cancel', 'overlap'],
      'correctIndex': 0,
      'explain': '“bring forward” = dời sớm hơn.',
    },
    {
      'question': 'Opposite: The opposite of “cancel an appointment” is…',
      'options': [
        'extend the appointment',
        'confirm an appointment',
        'overlap the appointment',
        'change the time zone',
      ],
      'correctIndex': 1,
      'explain': 'Xác nhận thay vì hủy.',
    },
    {
      'question': 'Usage: We had to ___ because two meetings overlapped.',
      'options': ['ahead of time', 'reschedule', 'annually', 'monthly'],
      'correctIndex': 1,
      'explain': 'Dời lại khi bị trùng lịch.',
    },
    {
      'question': 'Usage: I’ll set a ___ so I won’t forget the 11 a.m. call.',
      'options': ['shift', 'reminder', 'time zone', 'period'],
      'correctIndex': 1,
      'explain': 'Đặt lời nhắc.',
    },
    {
      'question': 'Context: The ___ of the training is 45 minutes.',
      'options': ['availability', 'deadline', 'agenda', 'duration'],
      'correctIndex': 3,
      'explain': 'Thời lượng buổi đào tạo.',
    },
    {
      'question': 'Context: Please add the project kickoff to your ___.',
      'options': ['late', 'time slot', 'overlap', 'calendar'],
      'correctIndex': 3,
      'explain': 'Thêm vào lịch.',
    },
    {
      'question': 'Context: The HR briefing and the product demo ___.',
      'options': ['extend', 'cancel', 'confirm', 'overlap'],
      'correctIndex': 3,
      'explain': 'Bị trùng giờ.',
    },
    {
      'question': 'Completion: The team meets ___ to review metrics.',
      'options': ['ahead of time', 'weekly', 'late', 'tentative'],
      'correctIndex': 1,
      'explain': 'Họp hàng tuần.',
    },
    {
      'question': 'Completion: We hold a town hall ___ in March.',
      'options': ['on time', 'weekly', 'annually', 'monthly'],
      'correctIndex': 2,
      'explain': 'Họp thường niên.',
    },
    {
      'question': 'Completion: A performance review occurs ___ at month’s end.',
      'options': ['ahead of time', 'tentative', 'late', 'monthly'],
      'correctIndex': 3,
      'explain': 'Định kỳ hàng tháng.',
    },
    {
      'question': 'Scenario: If you arrive ___, you may miss the opening.',
      'options': ['weekly', 'on time', 'late', 'ahead of time'],
      'correctIndex': 2,
      'explain': 'Đến muộn có thể lỡ phần đầu.',
    },
    {
      'question': 'Scenario: If you arrive ___, you can prepare the room.',
      'options': ['monthly', 'early', 'late', 'tentative'],
      'correctIndex': 1,
      'explain': 'Đến sớm để chuẩn bị.',
    },
    {
      'question':
          'Scenario: The speaker is not ___ at 2 p.m.; choose another slot.',
      'options': ['agenda', 'available', 'quarterly', 'annual'],
      'correctIndex': 1,
      'explain': 'Không rảnh → chọn khung khác.',
    },
    {
      'question': 'Sentence: Please ___ the date with the client by email.',
      'options': ['extend', 'confirm', 'overlap', 'postpone'],
      'correctIndex': 1,
      'explain': 'Xác nhận ngày hẹn.',
    },
    {
      'question': 'Sentence: We must ___ the session because the room is busy.',
      'options': ['weekly', 'reschedule', 'monthly', 'annually'],
      'correctIndex': 1,
      'explain': 'Dời buổi vì phòng bận.',
    },
    {
      'question': 'Sentence: The invitation states a ___ start at 10:00.',
      'options': ['overlap', 'annual', 'tentative', 'late'],
      'correctIndex': 2,
      'explain': 'Bắt đầu tạm thời.',
    },
    {
      'question':
          'Which fits best? “Please pick any open ___ between 2 and 4.”',
      'options': ['deadline', 'calendar', 'time slot', 'agenda'],
      'correctIndex': 2,
      'explain': 'Chọn khung giờ trống.',
    },
    {
      'question': 'Which fits best? “This quarter’s review occurs ___.”',
      'options': ['tentative', 'late', 'ahead of time', 'quarterly'],
      'correctIndex': 3,
      'explain': 'Diễn ra hàng quý.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab4")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 4: Time, Dates & Appointments',
        'questionCount': vocab4Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (không shuffle thêm — đã sắp sẵn trong mảng)
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
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 5: Numbers, Prices & Payments (50 câu, options đã đổi vị trí)
  // =========================
  final vocab5Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “price” most nearly means…',
      'options': ['khuyến mãi', 'giá', 'thuế', 'phí dịch vụ'],
      'correctIndex': 1,
      'explain': 'price = giá.',
    },
    {
      'question': 'Choose the best word: It ___ ten dollars to enter.',
      'options': ['quotes', 'saves', 'costs', 'discounts'],
      'correctIndex': 2,
      'explain': 'cost (v) = tốn.',
    },
    {
      'question': 'Fill in: The ___ is \$45, including tax.',
      'options': ['coupon', 'invoice', 'total', 'change'],
      'correctIndex': 2,
      'explain': 'total = tổng cộng.',
    },
    {
      'question': 'Meaning: We offer a 15% ___.',
      'options': ['method', 'warranty', 'discount', 'deal'],
      'correctIndex': 2,
      'explain': 'discount = giảm giá.',
    },
    {
      'question': 'Usage: The store has a big ___ this weekend.',
      'options': ['fee', 'sale', 'balance', 'quote'],
      'correctIndex': 1,
      'explain': 'sale = đợt giảm giá.',
    },
    {
      'question': 'Choose the best word: There is a service ___.',
      'options': ['refund', 'fee', 'price', 'tax'],
      'correctIndex': 1,
      'explain': 'fee = phí.',
    },
    {
      'question': 'Meaning: The price includes ___.',
      'options': ['warranty', 'tax', 'coupon', 'cash'],
      'correctIndex': 1,
      'explain': 'tax = thuế.',
    },
    {
      'question': 'Choose the noun: Please keep your ___.',
      'options': ['sale', 'receipt', 'method', 'quote'],
      'correctIndex': 1,
      'explain': 'receipt = hóa đơn bán lẻ.',
    },
    {
      'question': 'Meaning: Please send the company ___.',
      'options': ['promotion', 'invoice', 'change', 'coupon'],
      'correctIndex': 1,
      'explain': 'invoice = hóa đơn GTGT/doanh nghiệp.',
    },
    {
      'question': 'Choose the item: The ___ is on the tray.',
      'options': ['warranty', 'bill', 'estimate', 'balance'],
      'correctIndex': 1,
      'explain': 'bill = hóa đơn thanh toán.',
    },
    {
      'question': 'Payment method: Do you accept ___?',
      'options': ['quote', 'cash', 'warranty', 'estimate'],
      'correctIndex': 1,
      'explain': 'cash = tiền mặt.',
    },
    {
      'question': 'Payment: You can pay by ___.',
      'options': ['fee', 'tax', 'credit card', 'receipt'],
      'correctIndex': 2,
      'explain': 'credit card = thẻ tín dụng.',
    },
    {
      'question': 'Payment: I’ll use a ___.',
      'options': ['coupon', 'debit card', 'invoice', 'sale'],
      'correctIndex': 1,
      'explain': 'debit card = thẻ ghi nợ.',
    },
    {
      'question': 'Meaning: Here is your ___.',
      'options': ['method', 'due', 'change', 'quote'],
      'correctIndex': 2,
      'explain': 'change = tiền thừa.',
    },
    {
      'question': 'Choose the action: Can I get a ___ for this item?',
      'options': ['tax', 'warranty', 'fee', 'refund'],
      'correctIndex': 3,
      'explain': 'refund = hoàn tiền.',
    },
    {
      'question': 'Usage: I want to ___ this for a larger size.',
      'options': ['exchange', 'quote', 'estimate', 'balance'],
      'correctIndex': 0,
      'explain': 'exchange (v) = đổi hàng.',
    },
    {
      'question': 'Meaning: It has a one-year ___.',
      'options': ['discount', 'coupon', 'warranty', 'sale'],
      'correctIndex': 2,
      'explain': 'warranty = bảo hành.',
    },
    {
      'question': 'Adjective: The price is ___.',
      'options': ['expensive', 'due', 'monthly', 'affordable'],
      'correctIndex': 3,
      'explain': 'affordable = hợp túi tiền.',
    },
    {
      'question': 'Opposite sense: It’s too ___.',
      'options': ['affordable', 'expensive', 'cheap', 'refunded'],
      'correctIndex': 1,
      'explain': 'expensive = đắt.',
    },
    {
      'question': 'Opposite sense: This shirt is ___.',
      'options': ['taxed', 'cheap', 'quoted', 'due'],
      'correctIndex': 1,
      'explain': 'cheap = rẻ.',
    },
    {
      'question': 'Verb: You can ___ 20% with this code.',
      'options': ['quote', 'save', 'pay', 'bill'],
      'correctIndex': 1,
      'explain': 'save = tiết kiệm.',
    },
    {
      'question': 'Meaning: That’s a good ___.',
      'options': ['fee', 'warranty', 'method', 'deal'],
      'correctIndex': 3,
      'explain': 'deal = ưu đãi.',
    },
    {
      'question': 'Usage: Use this ___ at checkout.',
      'options': ['receipt', 'quote', 'coupon', 'invoice'],
      'correctIndex': 2,
      'explain': 'coupon = phiếu giảm giá.',
    },
    {
      'question': 'Meaning: We have a holiday ___.',
      'options': ['promotion', 'warranty', 'change', 'method'],
      'correctIndex': 0,
      'explain': 'promotion = khuyến mãi.',
    },
    {
      'question': 'Choose the noun: I’ll send an ___.',
      'options': ['fee', 'estimate', 'bill', 'tax'],
      'correctIndex': 1,
      'explain': 'estimate = báo giá ước tính.',
    },
    {
      'question': 'Meaning: Please request a ___.',
      'options': ['coupon', 'method', 'quote', 'refund'],
      'correctIndex': 2,
      'explain': 'quote = báo giá chính thức.',
    },
    {
      'question': 'Deadline sense: The payment is ___ today.',
      'options': ['saved', 'affordable', 'due', 'cheap'],
      'correctIndex': 2,
      'explain': 'due = đến hạn.',
    },
    {
      'question': 'Banking: Your ___ is low.',
      'options': ['invoice', 'deal', 'balance', 'receipt'],
      'correctIndex': 2,
      'explain': 'balance = số dư.',
    },
    {
      'question': 'Payment verb: You can ___ online.',
      'options': ['refund', 'pay', 'quote', 'exchange'],
      'correctIndex': 1,
      'explain': 'pay = trả tiền.',
    },
    {
      'question': 'Choose the noun: Select a payment ___.',
      'options': ['warranty', 'method', 'estimate', 'sale'],
      'correctIndex': 1,
      'explain': 'method = phương thức.',
    },
    {
      'question': 'Closest meaning: “refund” ≈',
      'options': ['extra charge', 'sales tax', 'money returned', 'payment due'],
      'correctIndex': 2,
      'explain': 'refund = tiền hoàn lại.',
    },
    {
      'question': 'Closest meaning: “invoice” ≈',
      'options': [
        'coupon code',
        'small change',
        'formal bill to a company',
        'tax office',
      ],
      'correctIndex': 2,
      'explain': 'invoice = hóa đơn doanh nghiệp.',
    },
    {
      'question': 'Opposite: The opposite of “expensive” is…',
      'options': ['due', 'cheap', 'taxed', 'quoted'],
      'correctIndex': 1,
      'explain': 'cheap ↔ expensive.',
    },
    {
      'question': 'Fill in: The cashier gave me the ___ and the receipt.',
      'options': ['promotion', 'invoice', 'change', 'quote'],
      'correctIndex': 2,
      'explain': 'change = tiền thừa.',
    },
    {
      'question': 'Choose the phrase: A 10% ___ applies to members.',
      'options': ['coupon', 'fee', 'discount', 'warranty'],
      'correctIndex': 2,
      'explain': 'Giảm giá cho thành viên.',
    },
    {
      'question': 'Usage: The ___ is \$120 after discount.',
      'options': ['estimate', 'tax', 'total', 'method'],
      'correctIndex': 2,
      'explain': 'Tổng sau giảm giá.',
    },
    {
      'question': 'Context: The item is under ___.',
      'options': ['due', 'warranty', 'quote', 'sale'],
      'correctIndex': 1,
      'explain': 'Còn bảo hành.',
    },
    {
      'question': 'Context: Our ___ is positive this month.',
      'options': ['balance', 'fee', 'invoice', 'coupon'],
      'correctIndex': 0,
      'explain': 'Số dư dương.',
    },
    {
      'question': 'Context: The bill is ___ on the 15th.',
      'options': ['exchanged', 'due', 'cheap', 'quoted'],
      'correctIndex': 1,
      'explain': 'Đến hạn ngày 15.',
    },
    {
      'question': 'Collocation: Choose the best: “___ a quote.”',
      'options': ['Warrant', 'Exchange', 'Request', 'Refund'],
      'correctIndex': 2,
      'explain': 'request a quote.',
    },
    {
      'question': 'Collocation: “___ a coupon at checkout.”',
      'options': ['Bill', 'Apply', 'Save', 'Pay'],
      'correctIndex': 1,
      'explain': 'apply a coupon.',
    },
    {
      'question': 'Collocation: “___ by credit card.”',
      'options': ['Estimate', 'Pay', 'Exchange', 'Quote'],
      'correctIndex': 1,
      'explain': 'pay by credit card.',
    },
    {
      'question': 'Meaning: A “good deal” suggests…',
      'options': ['big fee', 'a favorable price', 'high tax', 'low balance'],
      'correctIndex': 1,
      'explain': 'Giá hời/ưu đãi tốt.',
    },
    {
      'question': 'Sentence: The price is too high; it’s not ___.',
      'options': ['exchanged', 'due', 'paid', 'affordable'],
      'correctIndex': 3,
      'explain': 'Không hợp túi tiền.',
    },
    {
      'question': 'Sentence: Could you send me an ___ for the repair?',
      'options': ['coupon', 'estimate', 'method', 'change'],
      'correctIndex': 1,
      'explain': 'Báo giá ước tính.',
    },
    {
      'question': 'Sentence: Please keep the ___ for returns.',
      'options': ['quote', 'receipt', 'balance', 'tax'],
      'correctIndex': 1,
      'explain': 'Cần hóa đơn khi trả hàng.',
    },
    {
      'question':
          'Sentence: If the product is faulty, they can ___ your money.',
      'options': ['balance', 'tax', 'refund', 'quote'],
      'correctIndex': 2,
      'explain': 'Hoàn tiền.',
    },
    {
      'question':
          'Choose the best completion: “___ a payment method before ordering.”',
      'options': ['Refund', 'Choose', 'Tax', 'Invoice'],
      'correctIndex': 1,
      'explain': 'Chọn phương thức thanh toán.',
    },
    {
      'question':
          'Choose the best completion: “You can ___ 15% with this promotion.”',
      'options': ['warranty', 'exchange', 'save', 'bill'],
      'correctIndex': 2,
      'explain': 'Tiết kiệm 15%.',
    },
    {
      'question': 'Choose the correct word: “The ___ will be sent tomorrow.”',
      'options': ['invoice', 'sale', 'coupon', 'change'],
      'correctIndex': 0,
      'explain': 'Gửi hóa đơn cho công ty.',
    },
    {
      'question': 'Meaning: “balance” is closest to…',
      'options': [
        'a kind of fee',
        'sales event',
        'amount of money left',
        'a type of coupon',
      ],
      'correctIndex': 2,
      'explain': 'Số dư còn lại.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab5")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 5: Numbers, Prices & Payments',
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
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 6: Directions & Transportation (50 câu, options đã đổi vị trí)
  // turn left/right, go straight, across from, next to, between, behind,
  // in front of, near, far, map, route, platform, timetable, ticket, fare,
  // shuttle, transfer, delay, cancel, depart, arrive, traffic, intersection,
  // crosswalk, sidewalk, lane, parking, stop, destination, direction
  // =========================
  final vocab6Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “turn left” is closest to…',
      'options': ['rẽ phải', 'rẽ trái', 'đi thẳng', 'quay đầu'],
      'correctIndex': 1,
      'explain': 'turn left = rẽ trái.',
    },
    {
      'question':
          'Choose the best phrase: At the corner, ___ and then go straight.',
      'options': ['turn left', 'turn around', 'turn right', 'keep back'],
      'correctIndex': 0,
      'explain': 'Rẽ trái rồi đi thẳng.',
    },
    {
      'question': 'Fill in: From here, ___ for two blocks.',
      'options': ['turn right', 'pull over', 'go straight', 'turn left'],
      'correctIndex': 2,
      'explain': 'go straight = đi thẳng.',
    },
    {
      'question': 'Meaning: “across from the park” means…',
      'options': [
        'ở sau công viên',
        'đối diện công viên',
        'gần công viên',
        'ở giữa công viên',
      ],
      'correctIndex': 1,
      'explain': 'across from = đối diện.',
    },
    {
      'question': 'Choose the preposition: The hotel is ___ a café.',
      'options': ['behind', 'between', 'far', 'next to'],
      'correctIndex': 3,
      'explain': 'next to = cạnh.',
    },
    {
      'question': 'Meaning: The library is ___ the museum and the bank.',
      'options': ['in front of', 'near', 'between', 'behind'],
      'correctIndex': 2,
      'explain': 'between = ở giữa hai nơi.',
    },
    {
      'question': 'Choose the best word: The store is ___ the station.',
      'options': ['across from', 'on', 'in front of', 'behind'],
      'correctIndex': 3,
      'explain': 'behind = phía sau.',
    },
    {
      'question': 'Meaning: Please wait ___ the building.',
      'options': ['in front of', 'behind of', 'across', 'under'],
      'correctIndex': 0,
      'explain': 'in front of = phía trước.',
    },
    {
      'question': 'Best choice: The bus stop is ___ our office.',
      'options': ['between', 'near', 'far', 'across'],
      'correctIndex': 1,
      'explain': 'near = gần.',
    },
    {
      'question': 'Opposite meaning: The hotel isn’t ___.',
      'options': ['late', 'crowded', 'cheap', 'far'],
      'correctIndex': 3,
      'explain': 'far = xa.',
    },
    {
      'question': 'Choose the noun: Check the ___ to find the museum.',
      'options': ['fare', 'stop', 'lane', 'map'],
      'correctIndex': 3,
      'explain': 'map = bản đồ.',
    },
    {
      'question': 'Meaning: Take the fastest ___.',
      'options': ['platform', 'route', 'ticket', 'parking'],
      'correctIndex': 1,
      'explain': 'route = lộ trình.',
    },
    {
      'question': 'Which word fits? Wait on ___ 3 for the train.',
      'options': ['route', 'crosswalk', 'platform', 'lane'],
      'correctIndex': 2,
      'explain': 'platform = sân ga.',
    },
    {
      'question': 'Meaning: Check the train ___.',
      'options': ['destination', 'timetable', 'intersection', 'lane'],
      'correctIndex': 1,
      'explain': 'timetable = lịch trình.',
    },
    {
      'question': 'Choose the item: Buy a ___ at the counter.',
      'options': ['map', 'ticket', 'sidewalk', 'platform'],
      'correctIndex': 1,
      'explain': 'ticket = vé.',
    },
    {
      'question': 'Meaning: The bus ___ is cheap.',
      'options': ['stop', 'fare', 'route', 'lane'],
      'correctIndex': 1,
      'explain': 'fare = giá vé.',
    },
    {
      'question': 'Best option: Take the airport ___.',
      'options': ['crosswalk', 'lane', 'shuttle', 'sidewalk'],
      'correctIndex': 2,
      'explain': 'shuttle = xe trung chuyển.',
    },
    {
      'question': 'Choose the verb: ___ at Central Station for Line 2.',
      'options': ['Arrive', 'Transfer', 'Cancel', 'Depart'],
      'correctIndex': 1,
      'explain': 'transfer = chuyển tuyến.',
    },
    {
      'question': 'Meaning: The train is ___ by 20 minutes.',
      'options': ['scheduled', 'arrived', 'delayed', 'departed'],
      'correctIndex': 2,
      'explain': 'delay = trì hoãn.',
    },
    {
      'question': 'Choose the verb: The flight was ___ due to weather.',
      'options': ['mapped', 'canceled', 'transferred', 'parked'],
      'correctIndex': 1,
      'explain': 'cancel = hủy.',
    },
    {
      'question': 'Meaning: The bus ___ at 7:00 a.m.',
      'options': ['transfers', 'departs', 'delays', 'arrives'],
      'correctIndex': 1,
      'explain': 'depart = khởi hành.',
    },
    {
      'question': 'Meaning: We ___ at noon.',
      'options': ['cancel', 'transfer', 'arrive', 'depart'],
      'correctIndex': 2,
      'explain': 'arrive = đến nơi.',
    },
    {
      'question': 'Choose the noun: Heavy ___ this morning.',
      'options': ['route', 'fare', 'traffic', 'platform'],
      'correctIndex': 2,
      'explain': 'traffic = giao thông.',
    },
    {
      'question': 'Best choice: Turn right at the ___.',
      'options': ['parking', 'intersection', 'destination', 'timetable'],
      'correctIndex': 1,
      'explain': 'intersection = ngã tư.',
    },
    {
      'question': 'Usage: Use the ___ when you cross the street.',
      'options': ['platform', 'map', 'lane', 'crosswalk'],
      'correctIndex': 3,
      'explain': 'crosswalk = vạch qua đường.',
    },
    {
      'question': 'Meaning: Walk on the ___.',
      'options': ['platform', 'sidewalk', 'route', 'timetable'],
      'correctIndex': 1,
      'explain': 'sidewalk = vỉa hè.',
    },
    {
      'question': 'Choose the word: Keep in the left ___ on the highway.',
      'options': ['lane', 'platform', 'ticket', 'fare'],
      'correctIndex': 0,
      'explain': 'lane = làn đường.',
    },
    {
      'question': 'Meaning: Free ___ is available behind the mall.',
      'options': ['intersection', 'parking', 'traffic', 'crosswalk'],
      'correctIndex': 1,
      'explain': 'parking = bãi đỗ xe.',
    },
    {
      'question': 'Fill in: Get off at the next ___.',
      'options': ['map', 'stop', 'lane', 'fare'],
      'correctIndex': 1,
      'explain': 'stop = điểm dừng.',
    },
    {
      'question': 'Meaning: What is the final ___ of this bus?',
      'options': ['direction', 'destination', 'intersection', 'platform'],
      'correctIndex': 1,
      'explain': 'destination = điểm đến.',
    },
    {
      'question': 'Meaning: Follow the tour guide’s ___.',
      'options': ['directions', 'fares', 'lanes', 'tickets'],
      'correctIndex': 0,
      'explain': 'directions = chỉ dẫn.',
    },
    {
      'question':
          'Sentence: The hotel is ___ the station — about two minutes away.',
      'options': ['far', 'between', 'behind', 'near'],
      'correctIndex': 3,
      'explain': 'near = gần.',
    },
    {
      'question': 'Sentence: The pharmacy is ___ the bank and the bakery.',
      'options': ['far from', 'across', 'between', 'on top of'],
      'correctIndex': 2,
      'explain': 'between A and B.',
    },
    {
      'question': 'Sentence: The museum is ___ the city hall.',
      'options': ['under', 'behind of', 'inside', 'across from'],
      'correctIndex': 3,
      'explain': 'across from = đối diện.',
    },
    {
      'question': 'Closest meaning: “depart” ≈',
      'options': ['arrive', 'leave', 'delay', 'cancel'],
      'correctIndex': 1,
      'explain': 'depart = rời đi/khởi hành.',
    },
    {
      'question': 'Closest meaning: “arrive” ≈',
      'options': ['detour', 'depart', 'reach', 'transfer'],
      'correctIndex': 2,
      'explain': 'arrive ≈ reach.',
    },
    {
      'question': 'Opposite meaning: The opposite of “near” is…',
      'options': ['far', 'behind', 'between', 'next to'],
      'correctIndex': 0,
      'explain': 'near ↔ far.',
    },
    {
      'question': 'Opposite meaning: The opposite of “cancel” is…',
      'options': ['confirm', 'transfer', 'delay', 'park'],
      'correctIndex': 0,
      'explain': 'Hủy ↔ xác nhận.',
    },
    {
      'question': 'Usage: Your train is ___ by 15 minutes — please wait.',
      'options': ['delayed', 'departed', 'confirmed', 'parked'],
      'correctIndex': 0,
      'explain': 'Trì hoãn 15 phút.',
    },
    {
      'question': 'Usage: We must ___ to the green line at Central.',
      'options': ['park', 'arrive', 'cancel', 'transfer'],
      'correctIndex': 3,
      'explain': 'Đổi tuyến.',
    },
    {
      'question': 'Usage: Keep walking ___ until you see the river.',
      'options': [
        'turning right',
        'going straight',
        'turning left',
        'backward',
      ],
      'correctIndex': 1,
      'explain': 'go straight.',
    },
    {
      'question': 'Usage: The station is ___ the shopping mall.',
      'options': ['in front of', 'under', 'inside of', 'over'],
      'correctIndex': 0,
      'explain': 'Trước trung tâm mua sắm.',
    },
    {
      'question': 'Context: Stand on the right ___ of the escalator.',
      'options': ['map', 'fare', 'ticket', 'lane'],
      'correctIndex': 3,
      'explain': 'Làn bên phải.',
    },
    {
      'question': 'Context: The airport ___ runs every 20 minutes.',
      'options': ['intersection', 'crosswalk', 'shuttle', 'route'],
      'correctIndex': 2,
      'explain': 'Xe trung chuyển.',
    },
    {
      'question': 'Context: The next ___ is closing; please hurry.',
      'options': ['platform', 'lane', 'parking', 'map'],
      'correctIndex': 0,
      'explain': 'Sân ga sắp đóng.',
    },
    {
      'question': 'Context: There is heavy ___ on the ring road tonight.',
      'options': ['ticket', 'fare', 'traffic', 'platform'],
      'correctIndex': 2,
      'explain': 'Giao thông đông.',
    },
    {
      'question': 'Completion: Buses ___ from Gate 2 every hour.',
      'options': ['depart', 'delay', 'arrive', 'cancel'],
      'correctIndex': 0,
      'explain': 'Khởi hành mỗi giờ.',
    },
    {
      'question': 'Completion: Trains ___ at Bay 7 on weekends.',
      'options': ['cancel', 'arrive', 'transfer', 'map'],
      'correctIndex': 1,
      'explain': 'Tàu đến Bay 7.',
    },
    {
      'question': 'Completion: The class is in Room 203, ___ the library.',
      'options': ['over', 'far from', 'behind of', 'next to'],
      'correctIndex': 3,
      'explain': 'Bên cạnh thư viện.',
    },
    {
      'question': 'Which fits best? “Use the ___ to cross safely.”',
      'options': ['crosswalk', 'platform', 'ticket', 'fare'],
      'correctIndex': 0,
      'explain': 'Qua đường an toàn.',
    },
    {
      'question': 'Which fits best? “Take the shortest ___ on the map.”',
      'options': ['fare', 'route', 'platform', 'lane'],
      'correctIndex': 1,
      'explain': 'Chọn lộ trình ngắn nhất.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab6")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 6: Directions & Transportation',
        'questionCount': vocab6Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn, không shuffle thêm)
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
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 7: Shopping & Services (50 câu, đã đổi vị trí tất cả options)
  // =========================
  final vocab7Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “size” most nearly means…',
      'options': ['màu sắc', 'kích cỡ', 'thương hiệu', 'kiểu dáng'],
      'correctIndex': 1,
      'explain': 'size = kích cỡ.',
    },
    {
      'question': 'Choose the best verb: The shoes ___ well.',
      'options': ['label', 'return', 'fit', 'queue'],
      'correctIndex': 2,
      'explain': 'fit (v) = vừa vặn.',
    },
    {
      'question': 'Fill in: Please ___ this jacket before buying.',
      'options': ['deliver', 'refund', 'customize', 'try on'],
      'correctIndex': 3,
      'explain': 'try on = thử đồ.',
    },
    {
      'question': 'Meaning: Do you have other ___?',
      'options': ['returns', 'manuals', 'colors', 'aisles'],
      'correctIndex': 2,
      'explain': 'color = màu sắc.',
    },
    {
      'question': 'Choose the noun: I like this ___.',
      'options': ['style', 'counter', 'queue', 'receipt'],
      'correctIndex': 0,
      'explain': 'style = kiểu dáng.',
    },
    {
      'question': 'Meaning: It’s a popular ___.',
      'options': ['tag', 'shelf', 'brand', 'fare'],
      'correctIndex': 2,
      'explain': 'brand = thương hiệu.',
    },
    {
      'question': 'Phrase: The item is ___ — you can buy it today.',
      'options': ['in stock', 'under warranty', 'on aisle', 'out of stock'],
      'correctIndex': 0,
      'explain': 'in stock = còn hàng.',
    },
    {
      'question': 'Opposite: The headphones are ___.',
      'options': ['out of stock', 'on sale', 'in stock', 'gift-wrapped'],
      'correctIndex': 0,
      'explain': 'out of stock = hết hàng.',
    },
    {
      'question': 'Choose the place: Please go to ___ to pay.',
      'options': ['checkout', 'warranty', 'brand', 'manual'],
      'correctIndex': 0,
      'explain': 'checkout = quầy thanh toán.',
    },
    {
      'question': 'Meaning: Ask the ___ for help.',
      'options': ['delivery', 'salesperson', 'queue', 'label'],
      'correctIndex': 1,
      'explain': 'salesperson = nhân viên bán hàng.',
    },
    {
      'question': 'Best word: Milk is in ___ 5.',
      'options': ['counter', 'style', 'aisle', 'manual'],
      'correctIndex': 2,
      'explain': 'aisle = lối đi (siêu thị).',
    },
    {
      'question': 'Meaning: It’s on the top ___.',
      'options': ['receipt', 'queue', 'price tag', 'shelf'],
      'correctIndex': 3,
      'explain': 'shelf = kệ.',
    },
    {
      'question': 'Instruction: Read the ___ carefully.',
      'options': ['brand', 'gift wrap', 'label', 'counter'],
      'correctIndex': 2,
      'explain': 'label = nhãn.',
    },
    {
      'question': 'Meaning: This TV has a two-year ___.',
      'options': ['warranty', 'queue', 'pickup', 'style'],
      'correctIndex': 0,
      'explain': 'warranty = bảo hành.',
    },
    {
      'question': 'Choose the item: Check the user ___.',
      'options': ['manual', 'counter', 'price tag', 'label'],
      'correctIndex': 0,
      'explain': 'manual = sổ hướng dẫn.',
    },
    {
      'question': 'Meaning: I would like a ___. The product is faulty.',
      'options': ['appointment', 'gift wrap', 'refund', 'brand'],
      'correctIndex': 2,
      'explain': 'refund = hoàn tiền.',
    },
    {
      'question': 'Choose the action: I want to ___ this for a bigger size.',
      'options': ['exchange', 'label', 'queue', 'deliver'],
      'correctIndex': 0,
      'explain': 'exchange (v) = đổi hàng.',
    },
    {
      'question': 'Best noun: Please keep the ___.',
      'options': ['shelf', 'receipt', 'style', 'counter'],
      'correctIndex': 1,
      'explain': 'receipt = hóa đơn.',
    },
    {
      'question': 'Meaning: It’s a real ___.',
      'options': ['manual', 'bargain', 'counter', 'brand'],
      'correctIndex': 1,
      'explain': 'bargain = món hời/giá hời.',
    },
    {
      'question': 'Choose the place: Pay at the ___.',
      'options': ['queue', 'shelf', 'counter', 'aisle'],
      'correctIndex': 2,
      'explain': 'counter = quầy.',
    },
    {
      'question': 'Sentence: Free ___ for orders over \$30.',
      'options': ['style', 'label', 'delivery', 'receipt'],
      'correctIndex': 2,
      'explain': 'delivery = giao hàng.',
    },
    {
      'question': 'Meaning: In-store ___ is available.',
      'options': ['pickup', 'brand', 'warranty', 'manual'],
      'correctIndex': 0,
      'explain': 'pickup = nhận hàng tại cửa hàng.',
    },
    {
      'question': 'Request: Could you ___ this, please?',
      'options': ['return policy', 'gift wrap', 'refund', 'queue'],
      'correctIndex': 1,
      'explain': 'gift wrap = gói quà.',
    },
    {
      'question': 'Verb: We can ___ the box to your needs.',
      'options': ['exchange', 'customize', 'counter', 'checkout'],
      'correctIndex': 1,
      'explain': 'customize = tùy chỉnh.',
    },
    {
      'question': 'Meaning: Book an ___ online for phone repair.',
      'options': ['warranty', 'appointment', 'receipt', 'label'],
      'correctIndex': 1,
      'explain': 'appointment = lịch hẹn dịch vụ.',
    },
    {
      'question': 'Choose the noun: The ___ here is excellent.',
      'options': ['queue', 'brand', 'service', 'shelf'],
      'correctIndex': 2,
      'explain': 'service = dịch vụ.',
    },
    {
      'question': 'Meaning: We ___ quality.',
      'options': ['queue', 'guarantee', 'gift wrap', 'refund'],
      'correctIndex': 1,
      'explain': 'guarantee (v) = bảo đảm.',
    },
    {
      'question': 'Choose the item: Check the ___ before paying.',
      'options': ['counter', 'price tag', 'manual', 'aisle'],
      'correctIndex': 1,
      'explain': 'price tag = nhãn giá.',
    },
    {
      'question': 'Meaning: Please form a ___.',
      'options': ['receipt', 'queue', 'brand', 'warranty'],
      'correctIndex': 1,
      'explain': 'queue = hàng chờ.',
    },
    {
      'question': 'Policy: Read the ___ before buying.',
      'options': ['label', 'return policy', 'style', 'color'],
      'correctIndex': 1,
      'explain': 'return policy = chính sách đổi trả.',
    },
    {
      'question': 'Context: These pants don’t ___. I need a larger size.',
      'options': ['deliver', 'fit', 'queue', 'gift wrap'],
      'correctIndex': 1,
      'explain': 'fit = vừa vặn.',
    },
    {
      'question': 'Context: This model isn’t available — it’s ___.',
      'options': [
        'on the counter',
        'out of stock',
        'under warranty',
        'in the queue',
      ],
      'correctIndex': 1,
      'explain': 'out of stock = hết hàng.',
    },
    {
      'question': 'Context: The milk is on the top ___, next to the yogurt.',
      'options': ['appointment', 'shelf', 'refund', 'style'],
      'correctIndex': 1,
      'explain': 'shelf = kệ.',
    },
    {
      'question': 'Context: Ask the ___ where the batteries are.',
      'options': ['warranty', 'salesperson', 'queue', 'manual'],
      'correctIndex': 1,
      'explain': 'salesperson = nhân viên bán hàng.',
    },
    {
      'question': 'Closest meaning: “bargain price” ≈',
      'options': ['giá niêm yết', 'giá lỗi', 'giá gốc', 'giá hời'],
      'correctIndex': 3,
      'explain': 'bargain price = giá hời.',
    },
    {
      'question': 'Closest meaning: “customize a box” ≈',
      'options': ['trả hàng', 'xếp hàng', 'tùy chỉnh hộp', 'đổi quà'],
      'correctIndex': 2,
      'explain': 'customize = tùy chỉnh.',
    },
    {
      'question': 'Opposite: The opposite of “in stock” is…',
      'options': ['on shelf', 'on sale', 'under service', 'out of stock'],
      'correctIndex': 3,
      'explain': 'in stock ↔ out of stock.',
    },
    {
      'question': 'Opposite: The opposite of “refund” (n) is closest to…',
      'options': ['manual', 'charge', 'brand', 'queue'],
      'correctIndex': 1,
      'explain': 'refund ↔ charge (thu tiền).',
    },
    {
      'question': 'Usage: Please keep your ___ for returns.',
      'options': ['label', 'receipt', 'style', 'color'],
      'correctIndex': 1,
      'explain': 'Cần hoá đơn khi đổi trả.',
    },
    {
      'question': 'Usage: Could you ___ this sweater for me?',
      'options': ['warranty', 'gift wrap', 'guarantee', 'queue'],
      'correctIndex': 1,
      'explain': 'gift wrap = gói quà.',
    },
    {
      'question': 'Usage: The clerk asked me to read the safety ___ first.',
      'options': ['counter', 'price tag', 'manual', 'aisle'],
      'correctIndex': 2,
      'explain': 'manual = sổ hướng dẫn.',
    },
    {
      'question': 'Completion: This phone comes with a one-year ___.',
      'options': ['brand', 'warranty', 'queue', 'style'],
      'correctIndex': 1,
      'explain': 'Bảo hành 1 năm.',
    },
    {
      'question': 'Completion: The perfume is on the ___ behind the counter.',
      'options': ['return policy', 'checkout', 'label', 'shelf'],
      'correctIndex': 3,
      'explain': 'Đặt trên kệ.',
    },
    {
      'question': 'Completion: We offer free home ___.',
      'options': ['brand', 'delivery', 'queue', 'style'],
      'correctIndex': 1,
      'explain': 'Giao hàng miễn phí.',
    },
    {
      'question': 'Completion: Please check the ___ to see the price.',
      'options': ['warranty', 'brand', 'price tag', 'manual'],
      'correctIndex': 2,
      'explain': 'Xem nhãn giá.',
    },
    {
      'question': 'Which fits best? “Customers should ___ at the entrance.”',
      'options': [
        'form a queue',
        'gift wrap the counter',
        'customize the tag',
        'read the style',
      ],
      'correctIndex': 0,
      'explain': 'Xếp hàng ở lối vào.',
    },
    {
      'question': 'Which fits best? “If it doesn’t fit, you can ___ it.”',
      'options': ['label', 'brand', 'exchange', 'queue'],
      'correctIndex': 2,
      'explain': 'Không vừa có thể đổi.',
    },
    {
      'question': 'Which fits best? “Please proceed to ___ for payment.”',
      'options': ['warranty', 'manual', 'checkout', 'aisle 12'],
      'correctIndex': 2,
      'explain': 'Ra quầy thanh toán.',
    },
    {
      'question': 'Meaning check: A “return policy” explains…',
      'options': [
        'hướng dẫn sử dụng',
        'bảo hành trọn đời',
        'điều kiện đổi/trả',
        'chiều dài hàng chờ',
      ],
      'correctIndex': 2,
      'explain': 'Chính sách đổi/trả.',
    },
    {
      'question': 'Meaning check: A “salesperson” is…',
      'options': [
        'quầy tính tiền',
        'nhân viên bán hàng',
        'nhãn giá',
        'khách xếp hàng',
      ],
      'correctIndex': 1,
      'explain': 'salesperson = nhân viên bán hàng.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab7")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 7: Shopping & Services',
        'questionCount': vocab7Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn, không shuffle thêm)
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
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 8: Food & Reservations (50 câu, options đã đổi vị trí)
  // =========================
  final vocab8Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “reservation (n)” most nearly means…',
      'options': ['đặt chỗ', 'tiền bo', 'khai vị', 'phục vụ'],
      'correctIndex': 0,
      'explain': 'reservation = đặt chỗ bàn/phòng.',
    },
    {
      'question': 'Choose the verb: Please ___ a table for 7 p.m.',
      'options': ['cancel', 'book', 'split', 'seat'],
      'correctIndex': 1,
      'explain': 'book (v) = đặt (bàn/phòng).',
    },
    {
      'question': 'Fill in: May I see the ___?',
      'options': ['tip', 'menu', 'bill', 'allergy'],
      'correctIndex': 1,
      'explain': 'menu = thực đơn.',
    },
    {
      'question': 'Closest meaning: “order (v)” ≈',
      'options': ['gọi món', 'châm thêm', 'đặt chỗ', 'xác nhận'],
      'correctIndex': 0,
      'explain': 'order = gọi món.',
    },
    {
      'question':
          'Choose the noun: Any ___ today? (small dish before the main)',
      'options': ['appetizer', 'tip', 'beverage list', 'reservation desk'],
      'correctIndex': 0,
      'explain': 'appetizer = món khai vị.',
    },
    {
      'question': 'Meaning: “main course” is…',
      'options': ['món chính', 'món tráng miệng', 'đồ uống', 'tiền thừa'],
      'correctIndex': 0,
      'explain': 'main course = món chính.',
    },
    {
      'question': 'Meaning: “dessert” most nearly means…',
      'options': ['món tráng miệng', 'đồ uống', 'món đặc biệt', 'bàn trống'],
      'correctIndex': 0,
      'explain': 'dessert = món tráng miệng.',
    },
    {
      'question': 'Pick the word: Choose a ___ (tea, juice, soda).',
      'options': ['beverage', 'server', 'allergy', 'table for two'],
      'correctIndex': 0,
      'explain': 'beverage = đồ uống.',
    },
    {
      'question': 'Sentence: The ___, please. (at the end of a meal)',
      'options': ['bill/check', 'menu', 'refill', 'special'],
      'correctIndex': 0,
      'explain': 'bill/check = hóa đơn.',
    },
    {
      'question': 'Meaning: “tip (n)” is…',
      'options': ['tiền bo', 'đặt chỗ', 'món chay', 'tên đặt chỗ'],
      'correctIndex': 0,
      'explain': 'tip = tiền bo cho phục vụ.',
    },
    {
      'question': 'Choose the person: The ___ is friendly.',
      'options': [
        'server/waiter',
        'ingredient',
        'reservation name',
        'beverage list',
      ],
      'correctIndex': 0,
      'explain': 'server/waiter = nhân viên phục vụ.',
    },
    {
      'question': 'Meaning: “reservation name” is…',
      'options': ['tên đặt chỗ', 'giờ đặt chỗ', 'quầy đặt chỗ', 'món đặc biệt'],
      'correctIndex': 0,
      'explain': 'reservation name = tên người đặt.',
    },
    {
      'question': 'Phrase: A ___ for four, please.',
      'options': ['table', 'tip', 'appetizer', 'refill'],
      'correctIndex': 0,
      'explain': 'table for … = bàn cho … người.',
    },
    {
      'question': 'Question: Are there any tables ___?',
      'options': ['available', 'spicy', 'vegetarian', 'to-go'],
      'correctIndex': 0,
      'explain': 'available = còn trống/sẵn có.',
    },
    {
      'question': 'Opposite: We are ___ tonight. (no more seats)',
      'options': ['fully booked', 'available', 'to-go', 'vegetarian'],
      'correctIndex': 0,
      'explain': 'fully booked = kín chỗ.',
    },
    {
      'question': 'Meaning: “spicy” most nearly means…',
      'options': ['cay', 'chua', 'nhạt', 'mặn'],
      'correctIndex': 0,
      'explain': 'spicy = cay.',
    },
    {
      'question': 'Meaning: “vegetarian options” are…',
      'options': ['món chay', 'món cay', 'món ngọt', 'món mang đi'],
      'correctIndex': 0,
      'explain': 'vegetarian = chay.',
    },
    {
      'question': 'Choose the word: I have a nut ___.',
      'options': ['allergy', 'special', 'refill', 'reservation desk'],
      'correctIndex': 0,
      'explain': 'allergy = dị ứng.',
    },
    {
      'question': 'Question: What are the ___ in this soup?',
      'options': ['ingredients', 'servers', 'tables', 'reservations'],
      'correctIndex': 0,
      'explain': 'ingredient = nguyên liệu.',
    },
    {
      'question': 'Polite ask: What do you ___?',
      'options': ['recommend', 'cancel', 'split', 'seat'],
      'correctIndex': 0,
      'explain': 'recommend = gợi ý.',
    },
    {
      'question': 'Meaning: Today’s ___ is pumpkin soup.',
      'options': ['special', 'check', 'allergy', 'refill'],
      'correctIndex': 0,
      'explain': 'special = món đặc biệt trong ngày.',
    },
    {
      'question': 'Request: Can I get a ___ on my coffee?',
      'options': ['refill', 'tip', 'reservation name', 'table for three'],
      'correctIndex': 0,
      'explain': 'refill = châm thêm.',
    },
    {
      'question': 'Choose the label: I’d like a latte ___ (takeaway).',
      'options': ['to-go', 'available', 'vegetarian', 'fully booked'],
      'correctIndex': 0,
      'explain': 'to-go/takeaway = mang đi.',
    },
    {
      'question': 'Sentence: Please ___ your booking by 6 p.m.',
      'options': ['confirm', 'spicy', 'order', 'tip'],
      'correctIndex': 0,
      'explain': 'confirm = xác nhận.',
    },
    {
      'question': 'Action: I need to ___ my reservation.',
      'options': ['cancel', 'refill', 'split', 'seat'],
      'correctIndex': 0,
      'explain': 'cancel = hủy.',
    },
    {
      'question': 'Phrase: Let’s ___ the bill.',
      'options': ['split', 'season', 'refill', 'recommend'],
      'correctIndex': 0,
      'explain': 'split the bill = chia tiền.',
    },
    {
      'question': 'Noun: May I see the ___? (drinks only)',
      'options': ['beverage list', 'main course', 'reservation desk', 'server'],
      'correctIndex': 0,
      'explain': 'beverage list = danh sách đồ uống.',
    },
    {
      'question': 'Verb/Noun: We will ___ you soon.',
      'options': ['seat', 'book', 'tip', 'spice'],
      'correctIndex': 0,
      'explain': 'seat (v) = xếp chỗ; (n) chỗ ngồi.',
    },
    {
      'question': 'Place: Check in at the ___.',
      'options': [
        'reservation desk',
        'kitchen',
        'dessert bar',
        'beverage list',
      ],
      'correctIndex': 0,
      'explain': 'reservation desk = quầy đặt chỗ.',
    },
    {
      'question': 'Completion: A ___ for two under the name Linh.',
      'options': ['reservation', 'refill', 'allergy', 'special'],
      'correctIndex': 0,
      'explain': 'reservation for two under Linh.',
    },
    {
      'question': 'Completion: The ___ is at 7:30.',
      'options': [
        'reservation time',
        'reservation name',
        'spicy level',
        'beverage list',
      ],
      'correctIndex': 0,
      'explain': 'reservation time = giờ đặt chỗ.',
    },
    {
      'question': 'Usage: This curry is too ___.',
      'options': ['spicy', 'available', 'vegetarian', 'fully booked'],
      'correctIndex': 0,
      'explain': 'spicy = cay.',
    },
    {
      'question': 'Usage: We have ___ seats near the window.',
      'options': ['available', 'split', 'tipped', 'booked'],
      'correctIndex': 0,
      'explain': 'available = còn trống.',
    },
    {
      'question': 'Usage: We’re ___; please come tomorrow.',
      'options': ['fully booked', 'to-go', 'vegetarian', 'refilled'],
      'correctIndex': 0,
      'explain': 'fully booked = kín chỗ.',
    },
    {
      'question': 'Meaning check: “table for four” implies…',
      'options': [
        'bàn cho 4 người',
        'bàn cạnh bếp',
        'bàn mang đi',
        'bàn món chay',
      ],
      'correctIndex': 0,
      'explain': 'table for four = bàn 4 người.',
    },
    {
      'question': 'Meaning check: A “server” is…',
      'options': [
        'nhân viên phục vụ',
        'thực đơn',
        'tiền bo',
        'món tráng miệng',
      ],
      'correctIndex': 0,
      'explain': 'server = waiter/waitress.',
    },
    {
      'question': 'Opposite: The opposite of “cancel a booking” is…',
      'options': [
        'confirm a booking',
        'order a dessert',
        'refill a drink',
        'split a bill',
      ],
      'correctIndex': 0,
      'explain': 'cancel ↔ confirm.',
    },
    {
      'question': 'Opposite: The opposite of “spicy” is closest to…',
      'options': ['nhạt/không cay', 'đặt chỗ', 'mang đi', 'tráng miệng'],
      'correctIndex': 0,
      'explain': 'not spicy/mild.',
    },
    {
      'question': 'Collocation: “___ the bill” (chia tiền).',
      'options': ['Split', 'Seat', 'Spice', 'Confirm'],
      'correctIndex': 0,
      'explain': 'split the bill.',
    },
    {
      'question': 'Collocation: “___ your booking by email.”',
      'options': ['Confirm', 'Refill', 'Order', 'Tip'],
      'correctIndex': 0,
      'explain': 'confirm a booking.',
    },
    {
      'question': 'Context: I’d like a coffee ___, please.',
      'options': ['to-go', 'vegetarian', 'available', 'fully booked'],
      'correctIndex': 0,
      'explain': 'to-go = takeaway.',
    },
    {
      'question': 'Context: The chef can prepare a ___ dish.',
      'options': ['vegetarian', 'reservation desk', 'beverage', 'bill/check'],
      'correctIndex': 0,
      'explain': 'vegetarian dish = món chay.',
    },
    {
      'question': 'Context: Could we get a ___ of water?',
      'options': ['refill', 'tip', 'special', 'menu'],
      'correctIndex': 0,
      'explain': 'refill of water.',
    },
    {
      'question': 'Context: The ___ lists juices and tea.',
      'options': ['beverage list', 'main course', 'reservation name', 'server'],
      'correctIndex': 0,
      'explain': 'danh sách đồ uống.',
    },
    {
      'question': 'Completion: Please write the ___ clearly (e.g., “Linh”).',
      'options': ['reservation name', 'appetizer', 'tip', 'ingredient'],
      'correctIndex': 0,
      'explain': 'tên người đặt.',
    },
    {
      'question': 'Completion: The ___ is chocolate cake.',
      'options': ['dessert', 'allergy', 'server', 'reservation desk'],
      'correctIndex': 0,
      'explain': 'dessert = món tráng miệng.',
    },
    {
      'question': 'Which fits best? “What do you ___ for the main course?”',
      'options': ['recommend', 'seat', 'split', 'cancel'],
      'correctIndex': 0,
      'explain': 'recommend a dish.',
    },
    {
      'question': 'Which fits best? “I’ll ___ now; we’re ready.”',
      'options': ['order', 'tip', 'confirm', 'refill'],
      'correctIndex': 0,
      'explain': 'order now = gọi món.',
    },
    {
      'question': 'Which fits best? “Could you ___ us by the window?”',
      'options': ['seat', 'spice', 'split', 'booked'],
      'correctIndex': 0,
      'explain': 'seat us = xếp chỗ.',
    },
    {
      'question': 'Meaning: “bill/check” refers to…',
      'options': ['hóa đơn thanh toán', 'thực đơn', 'tiền bo', 'quầy đặt chỗ'],
      'correctIndex': 0,
      'explain': 'bill/check = hóa đơn.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab8")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 8: Food & Reservations',
        'questionCount': vocab8Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
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
  // Vocab 9: Weather & Public Announcements (50 câu, options đã hoán vị)
  // =========================
  final vocab9Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “forecast (n)” most nearly means…',
      'options': ['thông báo', 'dự báo', 'mất điện', 'nhiệt độ'],
      'correctIndex': 1,
      'explain': 'forecast = dự báo (thời tiết, doanh số…).',
    },
    {
      'question': 'Choose the best word: The ___ is rising this afternoon.',
      'options': ['outage', 'temperature', 'closure', 'advisory'],
      'correctIndex': 1,
      'explain': 'temperature = nhiệt độ.',
    },
    {
      'question': 'Meaning check: It is ___ today (nhiều mây).',
      'options': ['windy', 'sunny', 'cloudy', 'chilly'],
      'correctIndex': 2,
      'explain': 'cloudy = nhiều mây.',
    },
    {
      'question': 'Opposite: The opposite of “cloudy” is closest to…',
      'options': ['sunny', 'humid', 'rainy', 'stormy'],
      'correctIndex': 0,
      'explain': 'sunny ↔ cloudy.',
    },
    {
      'question': 'Pick the adjective: A ___ afternoon is expected (có mưa).',
      'options': ['chilly', 'rainy', 'humid', 'sunny'],
      'correctIndex': 1,
      'explain': 'rainy = có mưa.',
    },
    {
      'question': 'Meaning: “showers” in weather refers to…',
      'options': ['sương mù', 'gió mạnh', 'mưa rào', 'bão lớn'],
      'correctIndex': 2,
      'explain': 'showers = mưa rào.',
    },
    {
      'question': 'Sentence: A ___ is approaching the coast.',
      'options': ['advisory', 'update', 'notice', 'storm'],
      'correctIndex': 3,
      'explain': 'storm = bão.',
    },
    {
      'question': 'Choose the adjective: It’s very ___ on the coast today.',
      'options': ['cloudy', 'windy', 'sunny', 'chilly'],
      'correctIndex': 1,
      'explain': 'windy = nhiều gió.',
    },
    {
      'question': 'Fill in: It feels hot and ___.',
      'options': ['cloudy', 'stormy', 'humid', 'chilly'],
      'correctIndex': 2,
      'explain': 'humid = ẩm.',
    },
    {
      'question': 'Meaning: The morning is quite ___.',
      'options': ['sunny', 'chilly', 'windy', 'humid'],
      'correctIndex': 1,
      'explain': 'chilly = se lạnh.',
    },
    {
      'question': 'Closest meaning: “heatwave” ≈',
      'options': ['đợt không khí lạnh', 'mưa rào', 'đợt nắng nóng', 'bão cát'],
      'correctIndex': 2,
      'explain': 'heatwave = đợt nắng nóng kéo dài.',
    },
    {
      'question': 'Meaning: They will ___ a delay over the speakers.',
      'options': ['resume', 'evacuate', 'announce', 'suspend'],
      'correctIndex': 2,
      'explain': 'announce = thông báo.',
    },
    {
      'question': 'Choose the noun: Please listen to the ___.',
      'options': ['temperature', 'closure', 'advisory', 'announcement'],
      'correctIndex': 3,
      'explain': 'announcement = thông báo chung.',
    },
    {
      'question': 'Pick the word: The flight is ___.',
      'options': ['cloudy', 'maintained', 'forecast', 'delayed'],
      'correctIndex': 3,
      'explain': 'delayed = bị trì hoãn.',
    },
    {
      'question': 'Opposite: The opposite of “resume service” is…',
      'options': [
        'reopen service',
        'suspend service',
        'update service',
        'operate service',
      ],
      'correctIndex': 1,
      'explain': 'resume (tiếp tục) ↔ suspend (tạm ngừng).',
    },
    {
      'question': 'Meaning: The tour was ___ due to weather.',
      'options': ['operated', 'forecast', 'resumed', 'canceled'],
      'correctIndex': 3,
      'explain': 'cancel = hủy.',
    },
    {
      'question': 'Usage: The line ___ hourly on weekends.',
      'options': ['evacuates', 'operates', 'announces', 'delays'],
      'correctIndex': 1,
      'explain': 'operate = vận hành.',
    },
    {
      'question': 'Meaning: The station is closed for ___.',
      'options': ['evacuation', 'maintenance', 'outage', 'advisory'],
      'correctIndex': 1,
      'explain': 'maintenance = bảo trì.',
    },
    {
      'question': 'Choose the noun: A power ___ occurred last night.',
      'options': ['notice', 'forecast', 'advisory', 'outage'],
      'correctIndex': 3,
      'explain': 'outage = mất điện.',
    },
    {
      'question': 'Meaning: A weather ___ warns of heavy rain.',
      'options': ['advisory', 'platform', 'detour', 'timetable'],
      'correctIndex': 0,
      'explain': 'advisory = khuyến cáo.',
    },
    {
      'question': 'Choose the term: A brief written ___ was posted.',
      'options': ['storm', 'notice', 'humidity', 'heatwave'],
      'correctIndex': 1,
      'explain': 'notice = thông báo ngắn.',
    },
    {
      'question': 'Meaning: We will post an ___ at 6 p.m.',
      'options': ['umbrella', 'shelter', 'fog', 'update'],
      'correctIndex': 3,
      'explain': 'update = bản cập nhật.',
    },
    {
      'question': 'Opposite: The opposite of “close the station” is…',
      'options': [
        'reopen the station',
        'evacuate the station',
        'delay the station',
        'flood the station',
      ],
      'correctIndex': 0,
      'explain': 'close ↔ reopen.',
    },
    {
      'question': 'Emergency: Please ___ the building immediately.',
      'options': ['forecast', 'operate', 'resume', 'evacuate'],
      'correctIndex': 3,
      'explain': 'evacuate = sơ tán.',
    },
    {
      'question': 'Meaning: Take ___ inside during the storm.',
      'options': ['tip', 'ticket', 'platform', 'shelter'],
      'correctIndex': 3,
      'explain': 'shelter = nơi trú ẩn.',
    },
    {
      'question': 'Item: Bring an ___; it may rain later.',
      'options': ['notice', 'umbrella', 'advisory', 'speaker'],
      'correctIndex': 1,
      'explain': 'umbrella = ô/dù.',
    },
    {
      'question': 'Meaning: Dense ___ reduced visibility on the highway.',
      'options': ['fog', 'shower', 'sunlight', 'drought'],
      'correctIndex': 0,
      'explain': 'fog = sương mù.',
    },
    {
      'question': 'Choose the noun: The city issued a heat ___.',
      'options': ['update', 'index', 'wave', 'advisory'],
      'correctIndex': 3,
      'explain': 'heat advisory = khuyến cáo nắng nóng.',
    },
    {
      'question': 'Fill in: The service will ___ at 9 a.m.',
      'options': ['resume', 'evacuate', 'flood', 'chill'],
      'correctIndex': 0,
      'explain': 'resume = hoạt động trở lại.',
    },
    {
      'question': 'Meaning: “high humidity” most nearly means…',
      'options': ['độ ẩm cao', 'gió mạnh', 'nhiều mây', 'nhiệt độ thấp'],
      'correctIndex': 0,
      'explain': 'humidity = độ ẩm.',
    },
    {
      'question': 'Choose the verb: Trains are ___ due to heavy rain.',
      'options': ['suspended', 'forecast', 'announced', 'operated'],
      'correctIndex': 0,
      'explain': 'suspend = tạm dừng.',
    },
    {
      'question': 'Meaning: “road closure” refers to…',
      'options': ['mở lại đường', 'đóng đường', 'đường vòng', 'khu trú ẩn'],
      'correctIndex': 1,
      'explain': 'closure = đóng cửa/đóng đường.',
    },
    {
      'question': 'Meaning: Please take the ___ via 2nd Avenue.',
      'options': ['detour', 'outage', 'notice', 'advisory'],
      'correctIndex': 0,
      'explain': 'detour = đường vòng.',
    },
    {
      'question': 'Choose the word: The rain will likely ___ by noon.',
      'options': ['clear', 'resume', 'evacuate', 'announce'],
      'correctIndex': 0,
      'explain': 'clear = tạnh/giảm.',
    },
    {
      'question': 'Meaning: “light drizzle” most nearly means…',
      'options': ['mưa phùn nhẹ', 'bão lớn', 'nắng gắt', 'tuyết rơi dày'],
      'correctIndex': 0,
      'explain': 'drizzle = mưa phùn.',
    },
    {
      'question': 'Meaning: The airport is ___ until further notice.',
      'options': ['reopened', 'operational', 'closed', 'sunny'],
      'correctIndex': 2,
      'explain': 'closed = đóng cửa.',
    },
    {
      'question': 'Usage: The announcer will ___ the platform change.',
      'options': ['forecast', 'advise', 'announce', 'evacuate'],
      'correctIndex': 2,
      'explain': 'announce a change.',
    },
    {
      'question': 'Usage: Due to flooding, buses will not ___ today.',
      'options': ['evacuate', 'operate', 'resume', 'reopen'],
      'correctIndex': 1,
      'explain': 'operate = hoạt động.',
    },
    {
      'question': 'Choose the noun: A ___ of rain is expected this evening.',
      'options': ['chance', 'index', 'speed', 'type'],
      'correctIndex': 0,
      'explain': 'a chance of rain.',
    },
    {
      'question': 'Choose the adjective: Skies will be partly ___.',
      'options': ['cloudy', 'stormy', 'humid', 'sunny'],
      'correctIndex': 0,
      'explain': 'partly cloudy.',
    },
    {
      'question': 'Meaning: “thunderstorm” refers to…',
      'options': ['giông có sấm', 'mưa phùn', 'nồm ẩm', 'nắng nóng'],
      'correctIndex': 0,
      'explain': 'thunderstorm = bão dông.',
    },
    {
      'question': 'Meaning: “hail” in weather is…',
      'options': ['mưa đá', 'sấm chớp', 'gió giật', 'sương giá'],
      'correctIndex': 0,
      'explain': 'hail = mưa đá.',
    },
    {
      'question': 'Meaning: “icy roads” indicates…',
      'options': [
        'đường trơn băng',
        'đường bụi cát',
        'đường lầy lội',
        'đường tạnh ráo',
      ],
      'correctIndex': 0,
      'explain': 'icy = đóng băng/trơn trượt.',
    },
    {
      'question': 'Context: Services will be ___ until noon.',
      'options': ['sunny', 'suspended', 'humid', 'foggy'],
      'correctIndex': 1,
      'explain': 'suspended = tạm ngưng.',
    },
    {
      'question': 'Context: We will ___ normal operations tomorrow.',
      'options': ['resume', 'evacuate', 'advise', 'flood'],
      'correctIndex': 0,
      'explain': 'resume operations.',
    },
    {
      'question': 'Context: Please follow the safety ___.',
      'options': ['advisories', 'temperatures', 'umbrellas', 'sunlights'],
      'correctIndex': 0,
      'explain': 'safety advisories.',
    },
    {
      'question': 'Completion: The 6 p.m. weather ___ will air shortly.',
      'options': ['forecast', 'outage', 'closure', 'detour'],
      'correctIndex': 0,
      'explain': 'bản dự báo thời tiết.',
    },
    {
      'question': 'Completion: Power has been ___ in most areas.',
      'options': ['resumed', 'evacuated', 'forecast', 'clouded'],
      'correctIndex': 0,
      'explain': 'power resumed = cấp điện lại.',
    },
    {
      'question': 'Completion: The station remains ___ due to maintenance.',
      'options': ['closed', 'sunny', 'humid', 'cloudy'],
      'correctIndex': 0,
      'explain': 'closed due to maintenance.',
    },
    {
      'question': 'Which fits best? “Please ___ to the nearest shelter.”',
      'options': ['evacuate', 'forecast', 'operate', 'resume'],
      'correctIndex': 0,
      'explain': 'evacuate to shelter.',
    },
    {
      'question': 'Which fits best? “The city issued a flood ___.”',
      'options': ['advisory', 'umbrella', 'noticeboard', 'temperature'],
      'correctIndex': 0,
      'explain': 'flood advisory.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab9")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 9: Weather & Public Announcements',
        'questionCount': vocab9Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
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
  // Vocab 10: Phone & Email Basics (50 câu, options đã đổi vị trí)
  // =========================
  final vocab10Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “call back (v)” most nearly means…',
      'options': [
        'chuyển tiếp email',
        'soạn bản nháp',
        'gọi lại',
        'để máy ở chế độ giữ',
      ],
      'correctIndex': 2,
      'explain': 'call back = gọi lại.',
    },
    {
      'question': 'Choose the phrase: Please stay ___ while I transfer you.',
      'options': ['draft', 'on hold', 'inbox', 'bcc'],
      'correctIndex': 1,
      'explain': 'on hold = giữ máy.',
    },
    {
      'question': 'Fill in: Leave me a ___ if I don’t answer.',
      'options': ['signature', 'message', 'coverage', 'subject'],
      'correctIndex': 1,
      'explain': 'message = tin nhắn.',
    },
    {
      'question': 'Meaning: “extension (n)” in an office phone system is…',
      'options': ['máy nhánh', 'tin rác', 'tệp đính kèm', 'mục tiêu'],
      'correctIndex': 0,
      'explain': 'extension = máy nhánh nội bộ.',
    },
    {
      'question': 'Pick the noun: I have three new ___ on my phone.',
      'options': ['bccs', 'signatures', 'voicemails', 'attachments'],
      'correctIndex': 2,
      'explain': 'voicemail = thư thoại.',
    },
    {
      'question': 'Meaning: The phone “reception” is poor means…',
      'options': ['đường dây hỏng', 'âm lượng nhỏ', 'sóng yếu', 'máy bận'],
      'correctIndex': 2,
      'explain': 'reception = chất lượng sóng.',
    },
    {
      'question': 'Choose the noun: There’s no mobile ___ in this area.',
      'options': ['subject', 'coverage', 'signature', 'inbox'],
      'correctIndex': 1,
      'explain': 'coverage = vùng phủ sóng.',
    },
    {
      'question': 'Meaning: “The signal dropped” most nearly means…',
      'options': [
        'mất tín hiệu',
        'bật tiếng',
        'tăng âm lượng',
        'đổi máy nhánh',
      ],
      'correctIndex': 0,
      'explain': 'signal = tín hiệu.',
    },
    {
      'question': 'Choose the verb: Please ___ the PDF to your email.',
      'options': ['reply', 'reach', 'attach', 'mute'],
      'correctIndex': 2,
      'explain': 'attach = đính kèm.',
    },
    {
      'question': 'Pick the noun: Check the ___ before you send.',
      'options': ['reception', 'line', 'coverage', 'attachment'],
      'correctIndex': 3,
      'explain': 'attachment = tệp đính kèm.',
    },
    {
      'question': 'Which fits best? The email ___ is missing.',
      'options': ['subject', 'signal', 'conference call', 'line'],
      'correctIndex': 0,
      'explain': 'subject = tiêu đề email.',
    },
    {
      'question': 'Meaning: Your ___ is full; delete old emails.',
      'options': ['bcc', 'extension', 'inbox', 'signature'],
      'correctIndex': 2,
      'explain': 'inbox = hộp thư đến.',
    },
    {
      'question': 'Choose the word: This message went to ___.',
      'options': ['voicemail', 'spam', 'cc', 'subject'],
      'correctIndex': 1,
      'explain': 'spam = thư rác.',
    },
    {
      'question': 'Action: I’ll ___ the email to the team.',
      'options': ['call back', 'forward', 'draft', 'mute'],
      'correctIndex': 1,
      'explain': 'forward = chuyển tiếp.',
    },
    {
      'question': 'Verb: Please ___ to my message by today.',
      'options': ['attach', 'unmute', 'bcc', 'reply'],
      'correctIndex': 3,
      'explain': 'reply = trả lời.',
    },
    {
      'question': 'Abbrev.: Please ___ the manager on this email.',
      'options': ['inbox', 'cc', 'attach', 'call back'],
      'correctIndex': 1,
      'explain': 'cc = gửi đồng thời.',
    },
    {
      'question': 'Abbrev.: I will ___ the legal team so they are hidden.',
      'options': ['reply', 'draft', 'forward', 'bcc'],
      'correctIndex': 3,
      'explain': 'bcc = ẩn người nhận.',
    },
    {
      'question': 'Choose the noun: Save your email as a ___.',
      'options': ['signal', 'draft', 'coverage', 'line'],
      'correctIndex': 1,
      'explain': 'draft = bản nháp.',
    },
    {
      'question': 'Fill in: Did you ___ the email already?',
      'options': ['send', 'mute', 'bcc', 'conference'],
      'correctIndex': 0,
      'explain': 'send = gửi.',
    },
    {
      'question': 'Meaning: I ___ your message this morning.',
      'options': ['attached', 'received', 'muted', 'forwarded'],
      'correctIndex': 1,
      'explain': 'receive = nhận.',
    },
    {
      'question': 'Pick the verb: Please ___ support if the issue continues.',
      'options': ['bcc', 'attach', 'contact', 'mute'],
      'correctIndex': 2,
      'explain': 'contact = liên hệ.',
    },
    {
      'question': 'Meaning: You can ___ me by phone anytime.',
      'options': ['reach', 'sign', 'bcc', 'draft'],
      'correctIndex': 0,
      'explain': 'reach = liên lạc/tiếp cận.',
    },
    {
      'question': 'Choose the noun: The phone ___ is busy right now.',
      'options': ['subject', 'line', 'inbox', 'cc'],
      'correctIndex': 1,
      'explain': 'line = đường dây điện thoại.',
    },
    {
      'question': 'Instruction: Please ___ for a moment while I check.',
      'options': ['cc', 'hold', 'attach', 'send'],
      'correctIndex': 1,
      'explain': 'hold = giữ máy.',
    },
    {
      'question': 'Meeting tip: If you’re not speaking, please ___.',
      'options': ['reply', 'mute', 'forward', 'bcc'],
      'correctIndex': 1,
      'explain': 'mute = tắt tiếng.',
    },
    {
      'question': 'Instruction: You can ___ now; we can’t hear you.',
      'options': ['bcc', 'attach', 'draft', 'unmute'],
      'correctIndex': 3,
      'explain': 'unmute = bật tiếng.',
    },
    {
      'question': 'Meaning: A “conference call” is…',
      'options': ['máy nhánh', 'tệp đính kèm', 'cuộc gọi hội nghị', 'thư rác'],
      'correctIndex': 2,
      'explain': 'conference call = gọi nhiều người cùng lúc.',
    },
    {
      'question': 'Meaning: “video call” refers to…',
      'options': [
        'cuộc gọi video',
        'không có sóng',
        'giữ máy',
        'chuyển tiếp email',
      ],
      'correctIndex': 0,
      'explain': 'video call = gọi có hình.',
    },
    {
      'question': 'Choose the noun: Update your email ___.',
      'options': ['inbox', 'signature', 'subject', 'coverage'],
      'correctIndex': 1,
      'explain': 'signature = chữ ký (email).',
    },
    {
      'question': 'Phrase: Set an ___ reply during your vacation.',
      'options': ['cc', 'on-hold', 'out-of-office', 'bcc'],
      'correctIndex': 2,
      'explain': 'out-of-office = trả lời vắng mặt tự động.',
    },
    {
      'question': 'Best completion: I’ll ___ after the meeting.',
      'options': [
        'bcc your manager',
        'attach the call',
        'call you back',
        'cc the team',
      ],
      'correctIndex': 2,
      'explain': 'call back = gọi lại.',
    },
    {
      'question': 'Context: The ___ in this basement is terrible.',
      'options': ['signature', 'reception', 'subject', 'draft'],
      'correctIndex': 1,
      'explain': 'reception = sóng.',
    },
    {
      'question': 'Context: Could you ___ this photo to the email?',
      'options': ['hold', 'unmute', 'bcc', 'attach'],
      'correctIndex': 3,
      'explain': 'attach = đính kèm.',
    },
    {
      'question': 'Context: Your ___ should include your title and phone.',
      'options': ['signature', 'line', 'coverage', 'spam'],
      'correctIndex': 0,
      'explain': 'signature = chữ ký email.',
    },
    {
      'question': 'Opposite: The opposite of “mute” is…',
      'options': ['unmute', 'forward', 'send', 'reply'],
      'correctIndex': 0,
      'explain': 'mute ↔ unmute.',
    },
    {
      'question': 'Opposite: The opposite of “receive an email” is…',
      'options': [
        'attach an email',
        'send an email',
        'bcc an email',
        'draft an email',
      ],
      'correctIndex': 1,
      'explain': 'receive ↔ send.',
    },
    {
      'question': 'Meaning check: “inbox is full” implies you should…',
      'options': [
        'cc người quản lý',
        'xóa/bớt email',
        'bật tiếng micro',
        'gọi lại',
      ],
      'correctIndex': 1,
      'explain': 'Dọn hộp thư đến.',
    },
    {
      'question': 'Meaning check: “bcc the team” means…',
      'options': [
        'gửi đồng thời hiển thị',
        'chuyển tiếp',
        'ẩn người nhận',
        'gọi lại',
      ],
      'correctIndex': 2,
      'explain': 'bcc = ẩn danh sách người nhận.',
    },
    {
      'question': 'Collocation: “___ the email to your supervisor.”',
      'options': ['Hold', 'Reach', 'Forward', 'Mute'],
      'correctIndex': 2,
      'explain': 'forward the email.',
    },
    {
      'question': 'Collocation: “___ to all by EOD.”',
      'options': ['Unmute', 'Attach', 'Hold', 'Reply'],
      'correctIndex': 3,
      'explain': 'reply to all.',
    },
    {
      'question': 'Completion: The call dropped because the ___ was weak.',
      'options': ['signature', 'signal', 'subject', 'inbox'],
      'correctIndex': 1,
      'explain': 'signal yếu → rớt cuộc gọi.',
    },
    {
      'question': 'Completion: Dial ___ 204 to reach HR.',
      'options': ['inbox', 'extension', 'coverage', 'spam'],
      'correctIndex': 1,
      'explain': 'extension 204 = máy nhánh.',
    },
    {
      'question': 'Which fits best? “Please put the caller ___ for a minute.”',
      'options': ['on draft', 'on hold', 'on spam', 'on video'],
      'correctIndex': 1,
      'explain': 'put on hold = giữ máy.',
    },
    {
      'question': 'Which fits best? “Set an ___ reply while traveling.”',
      'options': ['on-hold', 'cc', 'out-of-office', 'bcc'],
      'correctIndex': 2,
      'explain': 'tự động trả lời vắng mặt.',
    },
    {
      'question': 'Identify: The email’s ___ says “Meeting Agenda.”',
      'options': ['spam', 'signature', 'subject', 'inbox'],
      'correctIndex': 2,
      'explain': 'subject = tiêu đề.',
    },
    {
      'question': 'Identify: The PDF is an ___ to the message.',
      'options': ['reception', 'line', 'coverage', 'attachment'],
      'correctIndex': 3,
      'explain': 'tệp đính kèm.',
    },
    {
      'question': 'Usage: If the ___ is busy, try again later.',
      'options': ['subject', 'line', 'signature', 'inbox'],
      'correctIndex': 1,
      'explain': 'line busy = đường dây bận.',
    },
    {
      'question': 'Usage: You can ___ me at this number anytime.',
      'options': ['reach', 'attach', 'bcc', 'spam'],
      'correctIndex': 0,
      'explain': 'reach me = liên lạc được.',
    },
    {
      'question': 'Scenario: I didn’t hear you; please ___.',
      'options': ['forward', 'unmute', 'attach', 'bcc'],
      'correctIndex': 1,
      'explain': 'bật micro.',
    },
    {
      'question': 'Scenario: I missed your call—I’ll ___ in 10 minutes.',
      'options': ['cc', 'reply all', 'call back', 'draft'],
      'correctIndex': 2,
      'explain': 'gọi lại sau.',
    },
  ];

  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab10")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 10: Phone & Email Basics',
        'questionCount': vocab10Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Write questions q01..q50 (đã sắp xếp option sẵn, không shuffle thêm)
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
          // Optional fields for consistency
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }
}
