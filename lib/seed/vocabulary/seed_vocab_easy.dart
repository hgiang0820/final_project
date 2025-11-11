import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedVocabEasy() async {
  final db = FirebaseFirestore.instance;
  const levelId = 'easy';

  // Helper: chuyển "Put on" -> "put_on.mp3"
  String _toFileName(String word) {
    final lower = word.toLowerCase();
    final snake = lower
        .replaceAll(
          RegExp(r'[^a-z0-9]+'),
          '_',
        ) // mọi ký tự không phải a-z0-9 -> _
        .replaceAll(RegExp(r'_+'), '_') // gộp nhiều _ liên tiếp
        .replaceAll(RegExp(r'^_+|_+$'), ''); // bỏ _ ở đầu/cuối
    return '$snake.mp3';
  }

  await db.collection('vocab_cards').doc(levelId).set({
    'title': 'Vocabulary Level Easy',
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
  // Vocab 1: People & Actions in Photos (30 thẻ)
  // =========================

  final vocab1 = <Map<String, dynamic>>[
    {
      'word': 'sit',
      'phonetic': '/sɪt/',
      'meaningVi': 'ngồi',
      'exampleEn': 'She is sitting at a desk.',
      'exampleVi': 'Cô ấy đang ngồi tại bàn làm việc.',
    },
    {
      'word': 'stand',
      'phonetic': '/stænd/',
      'meaningVi': 'đứng',
      'exampleEn': 'They are standing in line.',
      'exampleVi': 'Họ đang đứng xếp hàng.',
    },
    {
      'word': 'hold',
      'phonetic': '/hoʊld/',
      'meaningVi': 'cầm, nắm',
      'exampleEn': 'He is holding a folder.',
      'exampleVi': 'Anh ấy đang cầm một bìa hồ sơ.',
    },
    {
      'word': 'carry',
      'phonetic': '/ˈkæri/',
      'meaningVi': 'mang, vác',
      'exampleEn': 'She is carrying a bag.',
      'exampleVi': 'Cô ấy đang mang một chiếc túi.',
    },
    {
      'word': 'point',
      'phonetic': '/pɔɪnt/',
      'meaningVi': 'chỉ',
      'exampleEn': 'He is pointing at the board.',
      'exampleVi': 'Anh ấy đang chỉ vào bảng.',
    },
    {
      'word': 'reach',
      'phonetic': '/riːtʃ/',
      'meaningVi': 'với tới',
      'exampleEn': 'She is reaching for a book.',
      'exampleVi': 'Cô ấy đang với lấy một cuốn sách.',
    },
    {
      'word': 'wear',
      'phonetic': '/weər/',
      'meaningVi': 'mặc/đội',
      'exampleEn': 'He is wearing a hat.',
      'exampleVi': 'Anh ấy đang đội mũ.',
    },
    {
      'word': 'put on',
      'phonetic': '/ˈpʊt ɒn/',
      'meaningVi': 'mặc/đeo vào',
      'exampleEn': 'She is putting on glasses.',
      'exampleVi': 'Cô ấy đang đeo kính vào.',
    },
    {
      'word': 'take off',
      'phonetic': '/ˌteɪk ˈɒf/',
      'meaningVi': 'cởi/bỏ ra',
      'exampleEn': 'He is taking off his jacket.',
      'exampleVi': 'Anh ấy đang cởi áo khoác.',
    },
    {
      'word': 'look at',
      'phonetic': '/ˈlʊk æt/',
      'meaningVi': 'nhìn vào',
      'exampleEn': 'They are looking at a chart.',
      'exampleVi': 'Họ đang nhìn vào một biểu đồ.',
    },
    {
      'word': 'watch',
      'phonetic': '/wɒtʃ/',
      'meaningVi': 'xem, quan sát',
      'exampleEn': 'She is watching the presentation.',
      'exampleVi': 'Cô ấy đang xem bài thuyết trình.',
    },
    {
      'word': 'bend',
      'phonetic': '/bend/',
      'meaningVi': 'cúi, gập',
      'exampleEn': 'He is bending over the box.',
      'exampleVi': 'Anh ấy đang cúi xuống cái hộp.',
    },
    {
      'word': 'lean',
      'phonetic': '/liːn/',
      'meaningVi': 'tựa, nghiêng',
      'exampleEn': 'She is leaning against the wall.',
      'exampleVi': 'Cô ấy đang tựa vào tường.',
    },
    {
      'word': 'lift',
      'phonetic': '/lɪft/',
      'meaningVi': 'nhấc, nâng',
      'exampleEn': 'He is lifting a suitcase.',
      'exampleVi': 'Anh ấy đang nhấc một vali.',
    },
    {
      'word': 'push',
      'phonetic': '/pʊʃ/',
      'meaningVi': 'đẩy',
      'exampleEn': 'She is pushing a cart.',
      'exampleVi': 'Cô ấy đang đẩy một xe đẩy.',
    },
    {
      'word': 'pull',
      'phonetic': '/pʊl/',
      'meaningVi': 'kéo',
      'exampleEn': 'He is pulling the door open.',
      'exampleVi': 'Anh ấy đang kéo cửa mở ra.',
    },
    {
      'word': 'wipe',
      'phonetic': '/waɪp/',
      'meaningVi': 'lau chùi',
      'exampleEn': 'She is wiping the table.',
      'exampleVi': 'Cô ấy đang lau bàn.',
    },
    {
      'word': 'sweep',
      'phonetic': '/swiːp/',
      'meaningVi': 'quét',
      'exampleEn': 'He is sweeping the floor.',
      'exampleVi': 'Anh ấy đang quét sàn.',
    },
    {
      'word': 'mop',
      'phonetic': '/mɒp/',
      'meaningVi': 'lau sàn',
      'exampleEn': 'She is mopping the hallway.',
      'exampleVi': 'Cô ấy đang lau hành lang.',
    },
    {
      'word': 'load',
      'phonetic': '/loʊd/',
      'meaningVi': 'chất lên',
      'exampleEn': 'They are loading boxes.',
      'exampleVi': 'Họ đang chất các thùng lên.',
    },
    {
      'word': 'unload',
      'phonetic': '/ʌnˈloʊd/',
      'meaningVi': 'dỡ xuống',
      'exampleEn': 'Workers are unloading a truck.',
      'exampleVi': 'Công nhân đang dỡ hàng khỏi xe tải.',
    },
    {
      'word': 'shake hands',
      'phonetic': '/ˌʃeɪk ˈhændz/',
      'meaningVi': 'bắt tay',
      'exampleEn': 'The managers are shaking hands.',
      'exampleVi': 'Các quản lý đang bắt tay.',
    },
    {
      'word': 'hand',
      'phonetic': '/hænd/',
      'meaningVi': 'đưa cho',
      'exampleEn': 'She is handing him a document.',
      'exampleVi': 'Cô ấy đang đưa cho anh ấy một tài liệu.',
    },
    {
      'word': 'pass',
      'phonetic': '/pæs/',
      'meaningVi': 'chuyển, đưa',
      'exampleEn': 'Please pass the pen to me.',
      'exampleVi': 'Vui lòng đưa cây bút cho tôi.',
    },
    {
      'word': 'pour',
      'phonetic': '/pɔːr/',
      'meaningVi': 'rót',
      'exampleEn': 'He is pouring coffee.',
      'exampleVi': 'Anh ấy đang rót cà phê.',
    },
    {
      'word': 'sort',
      'phonetic': '/sɔːrt/',
      'meaningVi': 'phân loại',
      'exampleEn': 'She is sorting papers.',
      'exampleVi': 'Cô ấy đang phân loại giấy tờ.',
    },
    {
      'word': 'stack',
      'phonetic': '/stæk/',
      'meaningVi': 'xếp chồng',
      'exampleEn': 'Books are stacked on the shelf.',
      'exampleVi': 'Sách được xếp chồng trên kệ.',
    },
    {
      'word': 'browse',
      'phonetic': '/braʊz/',
      'meaningVi': 'xem lướt',
      'exampleEn': 'Customers are browsing the shelves.',
      'exampleVi': 'Khách đang xem lướt các kệ hàng.',
    },
    {
      'word': 'fold',
      'phonetic': '/foʊld/',
      'meaningVi': 'gấp',
      'exampleEn': 'She is folding a shirt.',
      'exampleVi': 'Cô ấy đang gấp một chiếc áo.',
    },
    {
      'word': 'adjust',
      'phonetic': '/əˈdʒʌst/',
      'meaningVi': 'điều chỉnh',
      'exampleEn': 'He is adjusting the microphone.',
      'exampleVi': 'Anh ấy đang điều chỉnh micro.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab1")
      .set({
        'topicName': 'Bài 1: People & Actions in Photos',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i <= vocab1.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab1[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab1/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab1")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 2: Daily Routines at Work (30 thẻ)
  // =========================
  final vocab2 = <Map<String, dynamic>>[
    {
      'word': 'arrive',
      'phonetic': '/əˈraɪv/',
      'meaningVi': 'đến',
      'exampleEn': 'I arrive at the office at 9.',
      'exampleVi': 'Tôi đến văn phòng lúc 9 giờ.',
    },
    {
      'word': 'leave',
      'phonetic': '/liːv/',
      'meaningVi': 'rời đi',
      'exampleEn': 'She leaves at five.',
      'exampleVi': 'Cô ấy rời đi lúc 5 giờ.',
    },
    {
      'word': 'commute',
      'phonetic': '/kəˈmjuːt/',
      'meaningVi': 'đi lại (đi làm)',
      'exampleEn': 'He commutes by subway.',
      'exampleVi': 'Anh ấy đi làm bằng tàu điện ngầm.',
    },
    {
      'word': 'clock in',
      'phonetic': '/ˌklɒk ˈɪn/',
      'meaningVi': 'chấm công vào',
      'exampleEn': 'Staff clock in at the lobby.',
      'exampleVi': 'Nhân viên chấm công ở sảnh.',
    },
    {
      'word': 'clock out',
      'phonetic': '/ˌklɒk ˈaʊt/',
      'meaningVi': 'chấm công ra',
      'exampleEn': 'We clock out at 6 p.m.',
      'exampleVi': 'Chúng tôi chấm công ra lúc 6 giờ.',
    },
    {
      'word': 'check email',
      'phonetic': '/tʃek ˈiːmeɪl/',
      'meaningVi': 'kiểm tra email',
      'exampleEn': 'She checks email first.',
      'exampleVi': 'Cô ấy kiểm tra email trước.',
    },
    {
      'word': 'reply',
      'phonetic': '/rɪˈplaɪ/',
      'meaningVi': 'trả lời',
      'exampleEn': 'I’ll reply to clients today.',
      'exampleVi': 'Tôi sẽ trả lời khách hàng hôm nay.',
    },
    {
      'word': 'make a call',
      'phonetic': '/meɪk ə kɔːl/',
      'meaningVi': 'gọi điện',
      'exampleEn': 'He’s making a call now.',
      'exampleVi': 'Anh ấy đang gọi điện bây giờ.',
    },
    {
      'word': 'take notes',
      'phonetic': '/teɪk noʊts/',
      'meaningVi': 'ghi chú',
      'exampleEn': 'She takes notes in meetings.',
      'exampleVi': 'Cô ấy ghi chú trong các cuộc họp.',
    },
    {
      'word': 'set a reminder',
      'phonetic': '/set ə rɪˈmaɪndər/',
      'meaningVi': 'đặt nhắc',
      'exampleEn': 'Set a reminder for 3 p.m.',
      'exampleVi': 'Đặt lời nhắc lúc 3 giờ chiều.',
    },
    {
      'word': 'schedule',
      'phonetic': '/ˈskedʒuːl/',
      'meaningVi': 'lên lịch; lịch',
      'exampleEn': 'We scheduled a team call.',
      'exampleVi': 'Chúng tôi đã lên lịch một cuộc gọi nhóm.',
    },
    {
      'word': 'reschedule',
      'phonetic': '/ˌriːˈskedʒuːl/',
      'meaningVi': 'dời lịch',
      'exampleEn': 'Let’s reschedule to Friday.',
      'exampleVi': 'Hãy dời lịch sang thứ Sáu.',
    },
    {
      'word': 'attend',
      'phonetic': '/əˈtend/',
      'meaningVi': 'tham dự',
      'exampleEn': 'I’ll attend the workshop.',
      'exampleVi': 'Tôi sẽ tham dự buổi hội thảo.',
    },
    {
      'word': 'host',
      'phonetic': '/hoʊst/',
      'meaningVi': 'chủ trì',
      'exampleEn': 'She is hosting the meeting.',
      'exampleVi': 'Cô ấy đang chủ trì cuộc họp.',
    },
    {
      'word': 'assign',
      'phonetic': '/əˈsaɪn/',
      'meaningVi': 'phân công',
      'exampleEn': 'The manager assigned tasks.',
      'exampleVi': 'Quản lý đã phân công nhiệm vụ.',
    },
    {
      'word': 'submit',
      'phonetic': '/səbˈmɪt/',
      'meaningVi': 'nộp, gửi',
      'exampleEn': 'Please submit the report.',
      'exampleVi': 'Vui lòng nộp báo cáo.',
    },
    {
      'word': 'follow up',
      'phonetic': '/ˌfɒloʊ ˈʌp/',
      'meaningVi': 'theo dõi/nhắc lại',
      'exampleEn': 'I’ll follow up tomorrow.',
      'exampleVi': 'Tôi sẽ theo dõi vào ngày mai.',
    },
    {
      'word': 'take a break',
      'phonetic': '/teɪk ə breɪk/',
      'meaningVi': 'nghỉ giải lao',
      'exampleEn': 'Let’s take a short break.',
      'exampleVi': 'Hãy nghỉ giải lao ngắn.',
    },
    {
      'word': 'have lunch',
      'phonetic': '/hæv lʌntʃ/',
      'meaningVi': 'ăn trưa',
      'exampleEn': 'We have lunch at noon.',
      'exampleVi': 'Chúng tôi ăn trưa lúc 12 giờ.',
    },
    {
      'word': 'brainstorm',
      'phonetic': '/ˈbreɪnstɔːrm/',
      'meaningVi': 'động não',
      'exampleEn': 'Let’s brainstorm ideas.',
      'exampleVi': 'Hãy động não ý tưởng.',
    },
    {
      'word': 'prioritize',
      'phonetic': '/praɪˈɔːrətaɪz/',
      'meaningVi': 'ưu tiên',
      'exampleEn': 'Prioritize urgent tasks.',
      'exampleVi': 'Hãy ưu tiên các việc khẩn.',
    },
    {
      'word': 'track',
      'phonetic': '/træk/',
      'meaningVi': 'theo dõi',
      'exampleEn': 'We track our progress.',
      'exampleVi': 'Chúng tôi theo dõi tiến độ.',
    },
    {
      'word': 'update',
      'phonetic': '/ˈʌpdeɪt/',
      'meaningVi': 'cập nhật; bản cập nhật',
      'exampleEn': 'I’ll update the file.',
      'exampleVi': 'Tôi sẽ cập nhật tệp.',
    },
    {
      'word': 'fix',
      'phonetic': '/fɪks/',
      'meaningVi': 'sửa, khắc phục',
      'exampleEn': 'He fixed the issue.',
      'exampleVi': 'Anh ấy đã khắc phục sự cố.',
    },
    {
      'word': 'print',
      'phonetic': '/prɪnt/',
      'meaningVi': 'in ấn',
      'exampleEn': 'Please print the forms.',
      'exampleVi': 'Vui lòng in các biểu mẫu.',
    },
    {
      'word': 'scan',
      'phonetic': '/skæn/',
      'meaningVi': 'quét (tài liệu)',
      'exampleEn': 'She scanned the contract.',
      'exampleVi': 'Cô ấy đã quét hợp đồng.',
    },
    {
      'word': 'organize',
      'phonetic': '/ˈɔːrɡənaɪz/',
      'meaningVi': 'sắp xếp, tổ chức',
      'exampleEn': 'Organize your folder.',
      'exampleVi': 'Hãy sắp xếp thư mục của bạn.',
    },
    {
      'word': 'save',
      'phonetic': '/seɪv/',
      'meaningVi': 'lưu',
      'exampleEn': 'Save the draft now.',
      'exampleVi': 'Hãy lưu bản nháp ngay.',
    },
    {
      'word': 'backup',
      'phonetic': '/ˈbækʌp/',
      'meaningVi': 'sao lưu; bản sao lưu',
      'exampleEn': 'Do you back up files daily?',
      'exampleVi': 'Bạn có sao lưu tệp hằng ngày không?',
    },
    {
      'word': 'log out',
      'phonetic': '/lɔːɡ aʊt/',
      'meaningVi': 'đăng xuất',
      'exampleEn': 'Don’t forget to log out.',
      'exampleVi': 'Đừng quên đăng xuất.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab2')
      .set({
        'topicName': 'Bài 2: Daily Routines at Work',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i <= vocab2.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab2[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab2/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc('vocab2')
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 3: Office Objects & Places (30 thẻ)
  // =========================

  final vocab3 = <Map<String, String>>[
    {
      'word': 'desk',
      'phonetic': '/desk/',
      'meaningVi': 'bàn làm việc',
      'exampleEn': 'Files are on my desk.',
      'exampleVi': 'Hồ sơ ở trên bàn của tôi.',
    },
    {
      'word': 'chair',
      'phonetic': '/tʃeər/',
      'meaningVi': 'ghế',
      'exampleEn': 'Please take a chair.',
      'exampleVi': 'Vui lòng ngồi ghế.',
    },
    {
      'word': 'printer',
      'phonetic': '/ˈprɪntər/',
      'meaningVi': 'máy in',
      'exampleEn': 'The printer is out of ink.',
      'exampleVi': 'Máy in hết mực rồi.',
    },
    {
      'word': 'copier',
      'phonetic': '/ˈkɒpiər/',
      'meaningVi': 'máy photocopy',
      'exampleEn': 'Use the copier downstairs.',
      'exampleVi': 'Dùng máy photocopy ở tầng dưới.',
    },
    {
      'word': 'keyboard',
      'phonetic': '/ˈkiːbɔːrd/',
      'meaningVi': 'bàn phím',
      'exampleEn': 'The keyboard is wireless.',
      'exampleVi': 'Bàn phím dùng không dây.',
    },
    {
      'word': 'mouse',
      'phonetic': '/maʊs/',
      'meaningVi': 'chuột máy tính',
      'exampleEn': 'The mouse isn’t working.',
      'exampleVi': 'Con chuột không hoạt động.',
    },
    {
      'word': 'monitor',
      'phonetic': '/ˈmɒnɪtər/',
      'meaningVi': 'màn hình',
      'exampleEn': 'Adjust your monitor height.',
      'exampleVi': 'Điều chỉnh độ cao màn hình.',
    },
    {
      'word': 'laptop',
      'phonetic': '/ˈlæptɒp/',
      'meaningVi': 'máy tính xách tay',
      'exampleEn': 'Charge the laptop fully.',
      'exampleVi': 'Sạc đầy laptop nhé.',
    },
    {
      'word': 'projector',
      'phonetic': '/prəˈdʒektər/',
      'meaningVi': 'máy chiếu',
      'exampleEn': 'The projector is ready.',
      'exampleVi': 'Máy chiếu đã sẵn sàng.',
    },
    {
      'word': 'whiteboard',
      'phonetic': '/ˈwaɪtbɔːrd/',
      'meaningVi': 'bảng trắng',
      'exampleEn': 'Write it on the whiteboard.',
      'exampleVi': 'Viết nó lên bảng trắng.',
    },
    {
      'word': 'marker',
      'phonetic': '/ˈmɑːrkər/',
      'meaningVi': 'bút lông',
      'exampleEn': 'The marker is dry.',
      'exampleVi': 'Bút lông khô mực rồi.',
    },
    {
      'word': 'stapler',
      'phonetic': '/ˈsteɪplər/',
      'meaningVi': 'dập ghim',
      'exampleEn': 'Pass me the stapler.',
      'exampleVi': 'Đưa tôi cái dập ghim.',
    },
    {
      'word': 'staple',
      'phonetic': '/ˈsteɪpl/',
      'meaningVi': 'ghim; ghim lại',
      'exampleEn': 'Staple the pages together.',
      'exampleVi': 'Ghim các trang lại với nhau.',
    },
    {
      'word': 'folder',
      'phonetic': '/ˈfoʊldər/',
      'meaningVi': 'bìa hồ sơ',
      'exampleEn': 'Open the blue folder.',
      'exampleVi': 'Mở bìa màu xanh đi.',
    },
    {
      'word': 'file',
      'phonetic': '/faɪl/',
      'meaningVi': 'hồ sơ; sắp xếp',
      'exampleEn': 'File the documents by date.',
      'exampleVi': 'Sắp hồ sơ theo ngày.',
    },
    {
      'word': 'cabinet',
      'phonetic': '/ˈkæbɪnɪt/',
      'meaningVi': 'tủ (hồ sơ)',
      'exampleEn': 'The cabinet is locked.',
      'exampleVi': 'Cái tủ đang khóa.',
    },
    {
      'word': 'drawer',
      'phonetic': '/drɔːr/',
      'meaningVi': 'ngăn kéo',
      'exampleEn': 'Check the top drawer.',
      'exampleVi': 'Kiểm tra ngăn kéo trên.',
    },
    {
      'word': 'stationery',
      'phonetic': '/ˈsteɪʃəneri/',
      'meaningVi': 'văn phòng phẩm',
      'exampleEn': 'Order more stationery.',
      'exampleVi': 'Đặt thêm văn phòng phẩm.',
    },
    {
      'word': 'supplies',
      'phonetic': '/səˈplaɪz/',
      'meaningVi': 'đồ dùng',
      'exampleEn': 'We need office supplies.',
      'exampleVi': 'Chúng ta cần đồ dùng văn phòng.',
    },
    {
      'word': 'reception',
      'phonetic': '/rɪˈsepʃn/',
      'meaningVi': 'lễ tân',
      'exampleEn': 'Ask at reception.',
      'exampleVi': 'Hãy hỏi ở quầy lễ tân.',
    },
    {
      'word': 'lobby',
      'phonetic': '/ˈlɒbi/',
      'meaningVi': 'sảnh',
      'exampleEn': 'Wait in the lobby.',
      'exampleVi': 'Chờ ở sảnh.',
    },
    {
      'word': 'corridor',
      'phonetic': '/ˈkɒrɪdɔːr/',
      'meaningVi': 'hành lang',
      'exampleEn': 'The corridor is narrow.',
      'exampleVi': 'Hành lang hẹp.',
    },
    {
      'word': 'cafeteria',
      'phonetic': '/ˌkæfəˈtɪriə/',
      'meaningVi': 'căng tin',
      'exampleEn': 'Meet at the cafeteria.',
      'exampleVi': 'Gặp ở căng tin.',
    },
    {
      'word': 'pantry',
      'phonetic': '/ˈpæntri/',
      'meaningVi': 'phòng đồ uống',
      'exampleEn': 'Cups are in the pantry.',
      'exampleVi': 'Cốc ở trong phòng đồ uống.',
    },
    {
      'word': 'meeting room',
      'phonetic': '/ˈmiːtɪŋ ruːm/',
      'meaningVi': 'phòng họp',
      'exampleEn': 'The meeting room is full.',
      'exampleVi': 'Phòng họp đã đầy.',
    },
    {
      'word': 'workstation',
      'phonetic': '/ˈwɜːrkˌsteɪʃn/',
      'meaningVi': 'chỗ làm việc',
      'exampleEn': 'Clean your workstation.',
      'exampleVi': 'Dọn chỗ làm việc của bạn.',
    },
    {
      'word': 'badge',
      'phonetic': '/bædʒ/',
      'meaningVi': 'thẻ (ra vào)',
      'exampleEn': 'Wear your badge.',
      'exampleVi': 'Đeo thẻ của bạn.',
    },
    {
      'word': 'outlet',
      'phonetic': '/ˈaʊtlet/',
      'meaningVi': 'ổ điện',
      'exampleEn': 'Use a safe outlet.',
      'exampleVi': 'Dùng ổ điện an toàn.',
    },
    {
      'word': 'router',
      'phonetic': '/ˈruːtər/',
      'meaningVi': 'bộ định tuyến',
      'exampleEn': 'Reset the router.',
      'exampleVi': 'Khởi động lại bộ định tuyến.',
    },
    {
      'word': 'network',
      'phonetic': '/ˈnetwɜːrk/',
      'meaningVi': 'mạng (máy tính)',
      'exampleEn': 'The network is down.',
      'exampleVi': 'Mạng đang bị lỗi.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab3')
      .set({
        'topicName': 'Bài 3: Office Objects & Places',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab3.length; i++) {
    final id = 'q${(i).toString().padLeft(2, '0')}';
    final q = vocab3[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab3/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc('vocab3')
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 4: Time, Dates & Appointments (30 thẻ)
  // =========================

  final vocab4 = <Map<String, String>>[
    {
      'word': 'schedule',
      'phonetic': '/ˈskedʒuːl/',
      'meaningVi': 'lịch; lên lịch',
      'exampleEn': 'I’ll schedule a call for 2 p.m.',
      'exampleVi': 'Tôi sẽ lên lịch một cuộc gọi lúc 2 giờ chiều.',
    },
    {
      'word': 'appointment',
      'phonetic': '/əˈpɔɪntmənt/',
      'meaningVi': 'lịch hẹn',
      'exampleEn': 'I have a dentist appointment.',
      'exampleVi': 'Tôi có lịch hẹn nha sĩ.',
    },
    {
      'word': 'meeting',
      'phonetic': '/ˈmiːtɪŋ/',
      'meaningVi': 'cuộc họp',
      'exampleEn': 'The meeting starts at ten.',
      'exampleVi': 'Cuộc họp bắt đầu lúc 10 giờ.',
    },
    {
      'word': 'deadline',
      'phonetic': '/ˈdedlaɪn/',
      'meaningVi': 'hạn chót',
      'exampleEn': 'The deadline is Friday.',
      'exampleVi': 'Hạn chót là thứ Sáu.',
    },
    {
      'word': 'postpone',
      'phonetic': '/poʊˈspoʊn/',
      'meaningVi': 'hoãn',
      'exampleEn': 'Let’s postpone the meeting.',
      'exampleVi': 'Hãy hoãn cuộc họp.',
    },
    {
      'word': 'reschedule',
      'phonetic': '/ˌriːˈskedʒuːl/',
      'meaningVi': 'dời lịch',
      'exampleEn': 'We need to reschedule to Monday.',
      'exampleVi': 'Ta cần dời lịch sang thứ Hai.',
    },
    {
      'word': 'confirm',
      'phonetic': '/kənˈfɜːrm/',
      'meaningVi': 'xác nhận',
      'exampleEn': 'Please confirm the time.',
      'exampleVi': 'Vui lòng xác nhận thời gian.',
    },
    {
      'word': 'cancel',
      'phonetic': '/ˈkænsəl/',
      'meaningVi': 'hủy',
      'exampleEn': 'She canceled the appointment.',
      'exampleVi': 'Cô ấy đã hủy lịch hẹn.',
    },
    {
      'word': 'on time',
      'phonetic': '/ɒn taɪm/',
      'meaningVi': 'đúng giờ',
      'exampleEn': 'He is always on time.',
      'exampleVi': 'Anh ấy luôn đúng giờ.',
    },
    {
      'word': 'late',
      'phonetic': '/leɪt/',
      'meaningVi': 'muộn',
      'exampleEn': 'Sorry, I’m late.',
      'exampleVi': 'Xin lỗi, tôi đến muộn.',
    },
    {
      'word': 'early',
      'phonetic': '/ˈɜːrli/',
      'meaningVi': 'sớm',
      'exampleEn': 'I arrived early.',
      'exampleVi': 'Tôi đã đến sớm.',
    },
    {
      'word': 'available',
      'phonetic': '/əˈveɪləbl/',
      'meaningVi': 'rảnh/khả dụng',
      'exampleEn': 'Are you available tomorrow?',
      'exampleVi': 'Bạn rảnh ngày mai không?',
    },
    {
      'word': 'time slot',
      'phonetic': '/taɪm slɒt/',
      'meaningVi': 'khung giờ',
      'exampleEn': 'Choose a time slot.',
      'exampleVi': 'Chọn một khung giờ.',
    },
    {
      'word': 'agenda',
      'phonetic': '/əˈdʒendə/',
      'meaningVi': 'chương trình họp',
      'exampleEn': 'What’s on the agenda?',
      'exampleVi': 'Chương trình họp có gì?',
    },
    {
      'word': 'reminder',
      'phonetic': '/rɪˈmaɪndər/',
      'meaningVi': 'lời nhắc',
      'exampleEn': 'Set a reminder for noon.',
      'exampleVi': 'Đặt lời nhắc lúc trưa.',
    },
    {
      'word': 'calendar',
      'phonetic': '/ˈkælɪndər/',
      'meaningVi': 'lịch',
      'exampleEn': 'Check your calendar.',
      'exampleVi': 'Kiểm tra lịch của bạn.',
    },
    {
      'word': 'period',
      'phonetic': '/ˈpɪriəd/',
      'meaningVi': 'khoảng thời gian',
      'exampleEn': 'A trial period is two weeks.',
      'exampleVi': 'Thời gian dùng thử là hai tuần.',
    },
    {
      'word': 'duration',
      'phonetic': '/djʊˈreɪʃn/',
      'meaningVi': 'thời lượng',
      'exampleEn': 'The duration is 30 minutes.',
      'exampleVi': 'Thời lượng là 30 phút.',
    },
    {
      'word': 'extend',
      'phonetic': '/ɪkˈstend/',
      'meaningVi': 'kéo dài',
      'exampleEn': 'We extended the deadline.',
      'exampleVi': 'Chúng tôi đã kéo dài hạn chót.',
    },
    {
      'word': 'arrange',
      'phonetic': '/əˈreɪndʒ/',
      'meaningVi': 'sắp xếp',
      'exampleEn': 'I’ll arrange a meeting.',
      'exampleVi': 'Tôi sẽ sắp xếp một cuộc họp.',
    },
    {
      'word': 'overlap',
      'phonetic': '/ˌoʊvərˈlæp/',
      'meaningVi': 'trùng (giờ)',
      'exampleEn': 'The meetings overlap.',
      'exampleVi': 'Các cuộc họp bị trùng giờ.',
    },
    {
      'word': 'shift',
      'phonetic': '/ʃɪft/',
      'meaningVi': 'ca làm; dịch chuyển',
      'exampleEn': 'I work the morning shift.',
      'exampleVi': 'Tôi làm ca sáng.',
    },
    {
      'word': 'quarterly',
      'phonetic': '/ˈkwɔːrtərli/',
      'meaningVi': 'hàng quý',
      'exampleEn': 'We meet quarterly.',
      'exampleVi': 'Chúng ta họp hàng quý.',
    },
    {
      'word': 'annually',
      'phonetic': '/ˈænjuəli/',
      'meaningVi': 'hàng năm',
      'exampleEn': 'The event is held annually.',
      'exampleVi': 'Sự kiện được tổ chức hằng năm.',
    },
    {
      'word': 'weekly',
      'phonetic': '/ˈwiːkli/',
      'meaningVi': 'hàng tuần',
      'exampleEn': 'We have a weekly call.',
      'exampleVi': 'Chúng tôi có cuộc gọi hàng tuần.',
    },
    {
      'word': 'monthly',
      'phonetic': '/ˈmʌnθli/',
      'meaningVi': 'hàng tháng',
      'exampleEn': 'A monthly meeting is planned.',
      'exampleVi': 'Một cuộc họp hàng tháng được lên kế hoạch.',
    },
    {
      'word': 'ahead of time',
      'phonetic': '/əˈhed əv taɪm/',
      'meaningVi': 'trước giờ',
      'exampleEn': 'Finish the task ahead of time.',
      'exampleVi': 'Hoàn thành nhiệm vụ trước giờ.',
    },
    {
      'word': 'time zone',
      'phonetic': '/taɪm zoʊn/',
      'meaningVi': 'múi giờ',
      'exampleEn': 'What’s your time zone?',
      'exampleVi': 'Múi giờ của bạn là gì?',
    },
    {
      'word': 'tentative',
      'phonetic': '/ˈtentətɪv/',
      'meaningVi': 'tạm thời',
      'exampleEn': 'A tentative date is June 10.',
      'exampleVi': 'Ngày tạm thời là 10/6.',
    },
    {
      'word': 'availability',
      'phonetic': '/əˌveɪləˈbɪləti/',
      'meaningVi': 'sự rảnh',
      'exampleEn': 'Please share your availability.',
      'exampleVi': 'Vui lòng chia sẻ thời gian rảnh của bạn.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab4')
      .set({
        'topicName': 'Bài 4: Time, Dates & Appointments',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab4.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab4[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab4/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab4")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 5: Numbers, Prices & Payments (30 thẻ)
  // =========================

  final vocab5 = <Map<String, String>>[
    {
      'word': 'price',
      'phonetic': '/praɪs/',
      'meaningVi': 'giá',
      'exampleEn': 'What’s the price of this bag?',
      'exampleVi': 'Giá của chiếc túi này là bao nhiêu?',
    },
    {
      'word': 'cost',
      'phonetic': '/kɔːst/',
      'meaningVi': 'chi phí; tốn',
      'exampleEn': 'It costs ten dollars.',
      'exampleVi': 'Nó tốn mười đô.',
    },
    {
      'word': 'total',
      'phonetic': '/ˈtoʊtl/',
      'meaningVi': 'tổng',
      'exampleEn': 'The total is \$30.',
      'exampleVi': 'Tổng cộng là 30 đô.',
    },
    {
      'word': 'discount',
      'phonetic': '/ˈdɪskaʊnt/',
      'meaningVi': 'giảm giá',
      'exampleEn': 'We offer a 10% discount.',
      'exampleVi': 'Chúng tôi giảm giá 10%.',
    },
    {
      'word': 'sale',
      'phonetic': '/seɪl/',
      'meaningVi': 'đợt giảm giá',
      'exampleEn': 'The store has a sale.',
      'exampleVi': 'Cửa hàng đang giảm giá.',
    },
    {
      'word': 'fee',
      'phonetic': '/fiː/',
      'meaningVi': 'phí',
      'exampleEn': 'There is a service fee.',
      'exampleVi': 'Có phí dịch vụ.',
    },
    {
      'word': 'tax',
      'phonetic': '/tæks/',
      'meaningVi': 'thuế',
      'exampleEn': 'The price includes tax.',
      'exampleVi': 'Giá đã bao gồm thuế.',
    },
    {
      'word': 'receipt',
      'phonetic': '/rɪˈsiːt/',
      'meaningVi': 'hóa đơn',
      'exampleEn': 'Keep your receipt.',
      'exampleVi': 'Giữ hóa đơn của bạn.',
    },
    {
      'word': 'invoice',
      'phonetic': '/ˈɪnvoɪs/',
      'meaningVi': 'hóa đơn đỏ',
      'exampleEn': 'Please send the invoice.',
      'exampleVi': 'Vui lòng gửi hóa đơn.',
    },
    {
      'word': 'bill',
      'phonetic': '/bɪl/',
      'meaningVi': 'hóa đơn thanh toán',
      'exampleEn': 'The bill is on the tray.',
      'exampleVi': 'Hóa đơn ở trên khay.',
    },
    {
      'word': 'cash',
      'phonetic': '/kæʃ/',
      'meaningVi': 'tiền mặt',
      'exampleEn': 'Do you accept cash?',
      'exampleVi': 'Bạn có nhận tiền mặt không?',
    },
    {
      'word': 'credit card',
      'phonetic': '/ˈkredɪt kɑːrd/',
      'meaningVi': 'thẻ tín dụng',
      'exampleEn': 'Pay by credit card.',
      'exampleVi': 'Thanh toán bằng thẻ tín dụng.',
    },
    {
      'word': 'debit card',
      'phonetic': '/ˈdebɪt kɑːrd/',
      'meaningVi': 'thẻ ghi nợ',
      'exampleEn': 'I’ll use a debit card.',
      'exampleVi': 'Tôi sẽ dùng thẻ ghi nợ.',
    },
    {
      'word': 'change',
      'phonetic': '/tʃeɪndʒ/',
      'meaningVi': 'tiền thừa',
      'exampleEn': 'Here is your change.',
      'exampleVi': 'Đây là tiền thừa của bạn.',
    },
    {
      'word': 'refund',
      'phonetic': '/ˈriːfʌnd/',
      'meaningVi': 'hoàn tiền',
      'exampleEn': 'Can I get a refund?',
      'exampleVi': 'Tôi có thể được hoàn tiền không?',
    },
    {
      'word': 'exchange',
      'phonetic': '/ɪksˈtʃeɪndʒ/',
      'meaningVi': 'đổi hàng',
      'exampleEn': 'I want to exchange this.',
      'exampleVi': 'Tôi muốn đổi món này.',
    },
    {
      'word': 'warranty',
      'phonetic': '/ˈwɒrənti/',
      'meaningVi': 'bảo hành',
      'exampleEn': 'It has a one-year warranty.',
      'exampleVi': 'Nó có bảo hành một năm.',
    },
    {
      'word': 'affordable',
      'phonetic': '/əˈfɔːrdəbl/',
      'meaningVi': 'hợp túi tiền',
      'exampleEn': 'The price is affordable.',
      'exampleVi': 'Giá cả hợp túi tiền.',
    },
    {
      'word': 'expensive',
      'phonetic': '/ɪkˈspensɪv/',
      'meaningVi': 'đắt',
      'exampleEn': 'It’s too expensive.',
      'exampleVi': 'Nó quá đắt.',
    },
    {
      'word': 'cheap',
      'phonetic': '/tʃiːp/',
      'meaningVi': 'rẻ',
      'exampleEn': 'This shirt is cheap.',
      'exampleVi': 'Chiếc áo này rẻ.',
    },
    {
      'word': 'save',
      'phonetic': '/seɪv/',
      'meaningVi': 'tiết kiệm',
      'exampleEn': 'You can save 20%.',
      'exampleVi': 'Bạn có thể tiết kiệm 20%.',
    },
    {
      'word': 'deal',
      'phonetic': '/diːl/',
      'meaningVi': 'ưu đãi',
      'exampleEn': 'That’s a good deal.',
      'exampleVi': 'Đó là một ưu đãi tốt.',
    },
    {
      'word': 'coupon',
      'phonetic': '/ˈkuːpɒn/',
      'meaningVi': 'phiếu giảm giá',
      'exampleEn': 'Use this coupon at checkout.',
      'exampleVi': 'Dùng phiếu này khi thanh toán.',
    },
    {
      'word': 'promotion',
      'phonetic': '/prəˈmoʊʃn/',
      'meaningVi': 'khuyến mãi',
      'exampleEn': 'We have a holiday promotion.',
      'exampleVi': 'Chúng tôi có khuyến mãi dịp lễ.',
    },
    {
      'word': 'estimate',
      'phonetic': '/ˈestɪmeɪt/',
      'meaningVi': 'báo giá ước tính',
      'exampleEn': 'I’ll send an estimate.',
      'exampleVi': 'Tôi sẽ gửi báo giá ước tính.',
    },
    {
      'word': 'quote',
      'phonetic': '/kwoʊt/',
      'meaningVi': 'báo giá',
      'exampleEn': 'Please request a quote.',
      'exampleVi': 'Vui lòng yêu cầu báo giá.',
    },
    {
      'word': 'due',
      'phonetic': '/duː/',
      'meaningVi': 'đến hạn',
      'exampleEn': 'The payment is due today.',
      'exampleVi': 'Thanh toán đến hạn hôm nay.',
    },
    {
      'word': 'balance',
      'phonetic': '/ˈbæl.əns/',
      'meaningVi': 'số dư',
      'exampleEn': 'Your balance is low.',
      'exampleVi': 'Số dư của bạn thấp.',
    },
    {
      'word': 'pay',
      'phonetic': '/peɪ/',
      'meaningVi': 'trả tiền',
      'exampleEn': 'You can pay online.',
      'exampleVi': 'Bạn có thể trả tiền online.',
    },
    {
      'word': 'method',
      'phonetic': '/ˈmeθəd/',
      'meaningVi': 'phương thức',
      'exampleEn': 'Choose a payment method.',
      'exampleVi': 'Chọn phương thức thanh toán.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab5')
      .set({
        'topicName': 'Bài 5: Numbers, Prices & Payments',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab5.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab5[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab5/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab5")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 6: Directions & Transportation (30 thẻ)
  // =========================

  final vocab6 = <Map<String, String>>[
    {
      'word': 'turn left/right',
      'phonetic': '/tɜːrn left/raɪt/',
      'meaningVi': 'rẽ trái/phải',
      'exampleEn': 'Turn left at the corner.',
      'exampleVi': 'Rẽ trái ở góc đường.',
    },
    {
      'word': 'go straight',
      'phonetic': '/ɡoʊ streɪt/',
      'meaningVi': 'đi thẳng',
      'exampleEn': 'Go straight two blocks.',
      'exampleVi': 'Đi thẳng hai dãy nhà.',
    },
    {
      'word': 'across from',
      'phonetic': '/əˈkrɒs frʌm/',
      'meaningVi': 'đối diện',
      'exampleEn': 'The bank is across from the park.',
      'exampleVi': 'Ngân hàng đối diện công viên.',
    },
    {
      'word': 'next to',
      'phonetic': '/ˈnekst tuː/',
      'meaningVi': 'cạnh',
      'exampleEn': 'The hotel is next to a café.',
      'exampleVi': 'Khách sạn cạnh một quán cà phê.',
    },
    {
      'word': 'between',
      'phonetic': '/bɪˈtwiːn/',
      'meaningVi': 'giữa',
      'exampleEn': 'It’s between the museum and the library.',
      'exampleVi': 'Nó ở giữa bảo tàng và thư viện.',
    },
    {
      'word': 'behind',
      'phonetic': '/bɪˈhaɪnd/',
      'meaningVi': 'phía sau',
      'exampleEn': 'The store is behind the station.',
      'exampleVi': 'Cửa hàng ở sau ga.',
    },
    {
      'word': 'in front of',
      'phonetic': '/ɪn ˈfrʌnt əv/',
      'meaningVi': 'phía trước',
      'exampleEn': 'Wait in front of the building.',
      'exampleVi': 'Chờ trước tòa nhà.',
    },
    {
      'word': 'near',
      'phonetic': '/nɪr/',
      'meaningVi': 'gần',
      'exampleEn': 'It’s near the bus stop.',
      'exampleVi': 'Nó gần trạm xe buýt.',
    },
    {
      'word': 'far',
      'phonetic': '/fɑːr/',
      'meaningVi': 'xa',
      'exampleEn': 'The hotel isn’t far.',
      'exampleVi': 'Khách sạn không xa.',
    },
    {
      'word': 'map',
      'phonetic': '/mæp/',
      'meaningVi': 'bản đồ',
      'exampleEn': 'Check the map.',
      'exampleVi': 'Kiểm tra bản đồ.',
    },
    {
      'word': 'route',
      'phonetic': '/ruːt/',
      'meaningVi': 'lộ trình',
      'exampleEn': 'Take the fastest route.',
      'exampleVi': 'Đi lộ trình nhanh nhất.',
    },
    {
      'word': 'platform',
      'phonetic': '/ˈplætfɔːrm/',
      'meaningVi': 'sân ga',
      'exampleEn': 'Wait on platform 3.',
      'exampleVi': 'Chờ ở sân ga số 3.',
    },
    {
      'word': 'timetable',
      'phonetic': '/ˈtaɪmteɪbl/',
      'meaningVi': 'lịch trình',
      'exampleEn': 'Check the train timetable.',
      'exampleVi': 'Kiểm tra lịch tàu.',
    },
    {
      'word': 'ticket',
      'phonetic': '/ˈtɪkɪt/',
      'meaningVi': 'vé',
      'exampleEn': 'Buy a ticket here.',
      'exampleVi': 'Mua vé ở đây.',
    },
    {
      'word': 'fare',
      'phonetic': '/fer/',
      'meaningVi': 'giá vé',
      'exampleEn': 'The bus fare is cheap.',
      'exampleVi': 'Giá vé xe buýt rẻ.',
    },
    {
      'word': 'shuttle',
      'phonetic': '/ˈʃʌtl/',
      'meaningVi': 'xe trung chuyển',
      'exampleEn': 'Take the airport shuttle.',
      'exampleVi': 'Đi xe trung chuyển sân bay.',
    },
    {
      'word': 'transfer',
      'phonetic': '/ˈtrænsfɜːr/',
      'meaningVi': 'chuyển tuyến',
      'exampleEn': 'Transfer at Central Station.',
      'exampleVi': 'Chuyển tuyến tại ga Trung tâm.',
    },
    {
      'word': 'delay',
      'phonetic': '/dɪˈleɪ/',
      'meaningVi': 'trì hoãn',
      'exampleEn': 'The train is delayed.',
      'exampleVi': 'Tàu bị trễ.',
    },
    {
      'word': 'cancel',
      'phonetic': '/ˈkænsəl/',
      'meaningVi': 'hủy',
      'exampleEn': 'The flight was canceled.',
      'exampleVi': 'Chuyến bay đã bị hủy.',
    },
    {
      'word': 'depart',
      'phonetic': '/dɪˈpɑːrt/',
      'meaningVi': 'khởi hành',
      'exampleEn': 'The bus departs at 7.',
      'exampleVi': 'Xe buýt khởi hành lúc 7 giờ.',
    },
    {
      'word': 'arrive',
      'phonetic': '/əˈraɪv/',
      'meaningVi': 'đến',
      'exampleEn': 'We arrive at noon.',
      'exampleVi': 'Chúng tôi đến lúc trưa.',
    },
    {
      'word': 'traffic',
      'phonetic': '/ˈtræfɪk/',
      'meaningVi': 'giao thông',
      'exampleEn': 'Heavy traffic this morning.',
      'exampleVi': 'Giao thông đông sáng nay.',
    },
    {
      'word': 'intersection',
      'phonetic': '/ˌɪntərˈsekʃn/',
      'meaningVi': 'ngã tư',
      'exampleEn': 'Turn right at the intersection.',
      'exampleVi': 'Rẽ phải ở ngã tư.',
    },
    {
      'word': 'crosswalk',
      'phonetic': '/ˈkrɔːswɔːk/',
      'meaningVi': 'vạch qua đường',
      'exampleEn': 'Use the crosswalk.',
      'exampleVi': 'Đi qua vạch qua đường.',
    },
    {
      'word': 'sidewalk',
      'phonetic': '/ˈsaɪdwɔːk/',
      'meaningVi': 'vỉa hè',
      'exampleEn': 'Walk on the sidewalk.',
      'exampleVi': 'Đi trên vỉa hè.',
    },
    {
      'word': 'lane',
      'phonetic': '/leɪn/',
      'meaningVi': 'làn đường',
      'exampleEn': 'Stay in the left lane.',
      'exampleVi': 'Đi trong làn trái.',
    },
    {
      'word': 'parking',
      'phonetic': '/ˈpɑːrkɪŋ/',
      'meaningVi': 'bãi đỗ/đỗ xe',
      'exampleEn': 'Free parking is available.',
      'exampleVi': 'Có chỗ đỗ miễn phí.',
    },
    {
      'word': 'stop',
      'phonetic': '/stɒp/',
      'meaningVi': 'điểm dừng',
      'exampleEn': 'This is the last stop.',
      'exampleVi': 'Đây là điểm dừng cuối.',
    },
    {
      'word': 'destination',
      'phonetic': '/ˌdestɪˈneɪʃn/',
      'meaningVi': 'điểm đến',
      'exampleEn': 'We reached our destination.',
      'exampleVi': 'Chúng tôi đã đến điểm đến.',
    },
    {
      'word': 'direction',
      'phonetic': '/dəˈrekʃn/',
      'meaningVi': 'chỉ dẫn/hướng',
      'exampleEn': 'Ask for directions.',
      'exampleVi': 'Hỏi chỉ đường.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab6')
      .set({
        'topicName': 'Bài 6: Directions & Transportation',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab6.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab6[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab6/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab6")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 7: Shopping & Services (30 thẻ)
  // =========================

  final vocab7 = <Map<String, String>>[
    {
      'word': 'shop',
      'phonetic': '/ʃɒp/',
      'meaningVi': 'mua sắm; cửa hàng',
      'exampleEn': 'I shop at the corner store.',
      'exampleVi': 'Tôi mua sắm ở cửa hàng góc phố.',
    },
    {
      'word': 'store',
      'phonetic': '/stɔːr/',
      'meaningVi': 'cửa hàng',
      'exampleEn': 'The store opens at 9.',
      'exampleVi': 'Cửa hàng mở lúc 9 giờ.',
    },
    {
      'word': 'customer',
      'phonetic': '/ˈkʌstəmər/',
      'meaningVi': 'khách hàng',
      'exampleEn': 'The customer needs help.',
      'exampleVi': 'Khách hàng cần trợ giúp.',
    },
    {
      'word': 'cashier',
      'phonetic': '/kæˈʃɪr/',
      'meaningVi': 'thu ngân',
      'exampleEn': 'Pay the cashier at the front.',
      'exampleVi': 'Thanh toán cho thu ngân phía trước.',
    },
    {
      'word': 'queue',
      'phonetic': '/kjuː/',
      'meaningVi': 'xếp hàng; hàng chờ',
      'exampleEn': 'Please stand in the queue.',
      'exampleVi': 'Vui lòng xếp hàng.',
    },
    {
      'word': 'checkout',
      'phonetic': '/ˈtʃek.aʊt/',
      'meaningVi': 'quầy thanh toán',
      'exampleEn': 'Go to the checkout counter.',
      'exampleVi': 'Đi tới quầy thanh toán.',
    },
    {
      'word': 'aisle',
      'phonetic': '/aɪl/',
      'meaningVi': 'lối đi giữa các kệ',
      'exampleEn': 'Milk is in aisle three.',
      'exampleVi': 'Sữa ở lối số ba.',
    },
    {
      'word': 'shelf',
      'phonetic': '/ʃelf/',
      'meaningVi': 'kệ',
      'exampleEn': 'It’s on the top shelf.',
      'exampleVi': 'Nó ở kệ trên cùng.',
    },
    {
      'word': 'price tag',
      'phonetic': '/praɪs tæɡ/',
      'meaningVi': 'nhãn giá',
      'exampleEn': 'Check the price tag.',
      'exampleVi': 'Kiểm tra nhãn giá.',
    },
    {
      'word': 'barcode',
      'phonetic': '/ˈbɑːrkoʊd/',
      'meaningVi': 'mã vạch',
      'exampleEn': 'Scan the barcode here.',
      'exampleVi': 'Quét mã vạch ở đây.',
    },
    {
      'word': 'try on',
      'phonetic': '/traɪ ɒn/',
      'meaningVi': 'thử (quần áo)',
      'exampleEn': 'You can try on this jacket.',
      'exampleVi': 'Bạn có thể thử chiếc áo khoác này.',
    },
    {
      'word': 'fitting room',
      'phonetic': '/ˈfɪtɪŋ ruːm/',
      'meaningVi': 'phòng thử đồ',
      'exampleEn': 'The fitting room is over there.',
      'exampleVi': 'Phòng thử đồ ở đằng kia.',
    },
    {
      'word': 'size',
      'phonetic': '/saɪz/',
      'meaningVi': 'kích cỡ',
      'exampleEn': 'What size do you wear?',
      'exampleVi': 'Bạn mặc cỡ nào?',
    },
    {
      'word': 'receipt',
      'phonetic': '/rɪˈsiːt/',
      'meaningVi': 'hóa đơn',
      'exampleEn': 'Keep your receipt for returns.',
      'exampleVi': 'Giữ hóa đơn để đổi trả.',
    },
    {
      'word': 'refund',
      'phonetic': '/ˈriːfʌnd/',
      'meaningVi': 'hoàn tiền',
      'exampleEn': 'I’d like a refund, please.',
      'exampleVi': 'Tôi muốn được hoàn tiền.',
    },
    {
      'word': 'exchange',
      'phonetic': '/ɪksˈtʃeɪndʒ/',
      'meaningVi': 'đổi hàng',
      'exampleEn': 'Can I exchange this shirt?',
      'exampleVi': 'Tôi có thể đổi chiếc áo này không?',
    },
    {
      'word': 'warranty',
      'phonetic': '/ˈwɒrənti/',
      'meaningVi': 'bảo hành',
      'exampleEn': 'It comes with a warranty.',
      'exampleVi': 'Sản phẩm kèm bảo hành.',
    },
    {
      'word': 'service',
      'phonetic': '/ˈsɜːrvɪs/',
      'meaningVi': 'dịch vụ',
      'exampleEn': 'Customer service is on the first floor.',
      'exampleVi': 'Dịch vụ khách hàng ở tầng một.',
    },
    {
      'word': 'repair',
      'phonetic': '/rɪˈper/',
      'meaningVi': 'sửa chữa',
      'exampleEn': 'We offer phone repair.',
      'exampleVi': 'Chúng tôi có sửa chữa điện thoại.',
    },
    {
      'word': 'available',
      'phonetic': '/əˈveɪləbl/',
      'meaningVi': 'có sẵn',
      'exampleEn': 'This color is not available.',
      'exampleVi': 'Màu này không có sẵn.',
    },
    {
      'word': 'out of stock',
      'phonetic': '/aʊt əv stɒk/',
      'meaningVi': 'hết hàng',
      'exampleEn': 'The item is out of stock.',
      'exampleVi': 'Mặt hàng này đã hết.',
    },
    {
      'word': 'restock',
      'phonetic': '/ˌriːˈstɒk/',
      'meaningVi': 'nhập lại hàng',
      'exampleEn': 'We will restock next week.',
      'exampleVi': 'Chúng tôi sẽ nhập hàng tuần sau.',
    },
    {
      'word': 'delivery',
      'phonetic': '/dɪˈlɪvəri/',
      'meaningVi': 'giao hàng',
      'exampleEn': 'Free delivery for orders over \$20.',
      'exampleVi': 'Miễn phí giao hàng cho đơn trên 20 đô.',
    },
    {
      'word': 'pickup',
      'phonetic': '/ˈpɪkʌp/',
      'meaningVi': 'lấy hàng',
      'exampleEn': 'Choose store pickup at checkout.',
      'exampleVi': 'Chọn lấy hàng tại cửa hàng khi thanh toán.',
    },
    {
      'word': 'order',
      'phonetic': '/ˈɔːrdər/',
      'meaningVi': 'đặt hàng; đơn hàng',
      'exampleEn': 'Place your order online.',
      'exampleVi': 'Đặt hàng trực tuyến.',
    },
    {
      'word': 'promotion',
      'phonetic': '/prəˈmoʊʃn/',
      'meaningVi': 'khuyến mãi',
      'exampleEn': 'There is a weekend promotion.',
      'exampleVi': 'Có khuyến mãi cuối tuần.',
    },
    {
      'word': 'discount',
      'phonetic': '/ˈdɪskaʊnt/',
      'meaningVi': 'giảm giá',
      'exampleEn': 'Get a 10% discount today.',
      'exampleVi': 'Nhận giảm giá 10% hôm nay.',
    },
    {
      'word': 'loyalty card',
      'phonetic': '/ˈlɔɪəlti kɑːrd/',
      'meaningVi': 'thẻ thành viên',
      'exampleEn': 'Do you have a loyalty card?',
      'exampleVi': 'Bạn có thẻ thành viên không?',
    },
    {
      'word': 'gift receipt',
      'phonetic': '/ɡɪft rɪˈsiːt/',
      'meaningVi': 'hóa đơn quà tặng',
      'exampleEn': 'Would you like a gift receipt?',
      'exampleVi': 'Bạn có muốn hóa đơn quà tặng không?',
    },
    {
      'word': 'return policy',
      'phonetic': '/rɪˈtɜːrn ˈpɒləsi/',
      'meaningVi': 'chính sách đổi trả',
      'exampleEn': 'Please read our return policy.',
      'exampleVi': 'Vui lòng đọc chính sách đổi trả của chúng tôi.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab7')
      .set({
        'topicName': 'Bài 7: Shopping & Services',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab7.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab7[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab7/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab7")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 8: Food & Reservations (30 thẻ)
  // =========================

  final vocab8 = <Map<String, String>>[
    {
      'word': 'menu',
      'phonetic': '/ˈmenjuː/',
      'meaningVi': 'thực đơn',
      'exampleEn': 'Could we see the menu?',
      'exampleVi': 'Cho chúng tôi xem thực đơn được không?',
    },
    {
      'word': 'order',
      'phonetic': '/ˈɔːrdər/',
      'meaningVi': 'gọi món; đơn hàng',
      'exampleEn': 'We ordered two soups.',
      'exampleVi': 'Chúng tôi gọi hai phần súp.',
    },
    {
      'word': 'dish',
      'phonetic': '/dɪʃ/',
      'meaningVi': 'món ăn',
      'exampleEn': 'This dish is popular.',
      'exampleVi': 'Món này rất được ưa chuộng.',
    },
    {
      'word': 'appetizer',
      'phonetic': '/ˈæpɪtaɪzər/',
      'meaningVi': 'món khai vị',
      'exampleEn': 'Let’s share an appetizer.',
      'exampleVi': 'Hãy gọi chung một món khai vị.',
    },
    {
      'word': 'main course',
      'phonetic': '/meɪn kɔːrs/',
      'meaningVi': 'món chính',
      'exampleEn': 'What is today’s main course?',
      'exampleVi': 'Món chính hôm nay là gì?',
    },
    {
      'word': 'dessert',
      'phonetic': '/dɪˈzɜːrt/',
      'meaningVi': 'tráng miệng',
      'exampleEn': 'Would you like dessert?',
      'exampleVi': 'Bạn có muốn món tráng miệng không?',
    },
    {
      'word': 'beverage',
      'phonetic': '/ˈbevərɪdʒ/',
      'meaningVi': 'đồ uống',
      'exampleEn': 'Beverages are listed here.',
      'exampleVi': 'Đồ uống được liệt kê ở đây.',
    },
    {
      'word': 'reservation',
      'phonetic': '/ˌrezərˈveɪʃn/',
      'meaningVi': 'đặt bàn; đặt chỗ',
      'exampleEn': 'I have a reservation at 7.',
      'exampleVi': 'Tôi có đặt bàn lúc 7 giờ.',
    },
    {
      'word': 'book a table',
      'phonetic': '/bʊk ə ˈteɪbl/',
      'meaningVi': 'đặt bàn',
      'exampleEn': 'We booked a table for four.',
      'exampleVi': 'Chúng tôi đặt bàn cho bốn người.',
    },
    {
      'word': 'available seats',
      'phonetic': '/əˈveɪləbl siːts/',
      'meaningVi': 'chỗ trống',
      'exampleEn': 'Are there any available seats?',
      'exampleVi': 'Còn chỗ trống không?',
    },
    {
      'word': 'waiter',
      'phonetic': '/ˈweɪtər/',
      'meaningVi': 'bồi bàn (nam)',
      'exampleEn': 'Call the waiter, please.',
      'exampleVi': 'Làm ơn gọi bồi bàn.',
    },
    {
      'word': 'waitress',
      'phonetic': '/ˈweɪtrəs/',
      'meaningVi': 'bồi bàn (nữ)',
      'exampleEn': 'The waitress is very friendly.',
      'exampleVi': 'Cô phục vụ rất thân thiện.',
    },
    {
      'word': 'chef',
      'phonetic': '/ʃef/',
      'meaningVi': 'bếp trưởng',
      'exampleEn': 'Our chef recommends the pasta.',
      'exampleVi': 'Bếp trưởng gợi ý món mì ống.',
    },
    {
      'word': 'cuisine',
      'phonetic': '/kwɪˈziːn/',
      'meaningVi': 'ẩm thực; phong cách nấu',
      'exampleEn': 'Do you like Vietnamese cuisine?',
      'exampleVi': 'Bạn có thích ẩm thực Việt Nam không?',
    },
    {
      'word': 'spicy',
      'phonetic': '/ˈspaɪsi/',
      'meaningVi': 'cay',
      'exampleEn': 'This soup is too spicy.',
      'exampleVi': 'Món súp này quá cay.',
    },
    {
      'word': 'vegetarian',
      'phonetic': '/ˌvedʒəˈteriən/',
      'meaningVi': 'chay',
      'exampleEn': 'Do you have vegetarian dishes?',
      'exampleVi': 'Quán có món chay không?',
    },
    {
      'word': 'allergy',
      'phonetic': '/ˈælərdʒi/',
      'meaningVi': 'dị ứng',
      'exampleEn': 'I have a peanut allergy.',
      'exampleVi': 'Tôi dị ứng với đậu phộng.',
    },
    {
      'word': 'gluten‑free',
      'phonetic': '/ˌɡluːtn ˈfriː/',
      'meaningVi': 'không gluten',
      'exampleEn': 'Is this gluten‑free?',
      'exampleVi': 'Món này có không chứa gluten không?',
    },
    {
      'word': 'takeout',
      'phonetic': '/ˈteɪkaʊt/',
      'meaningVi': 'mang đi',
      'exampleEn': 'We ordered takeout.',
      'exampleVi': 'Chúng tôi gọi món mang đi.',
    },
    {
      'word': 'delivery',
      'phonetic': '/dɪˈlɪvəri/',
      'meaningVi': 'giao tận nơi',
      'exampleEn': 'The restaurant offers delivery.',
      'exampleVi': 'Nhà hàng có giao tận nơi.',
    },
    {
      'word': 'bill (check)',
      'phonetic': '/bɪl/',
      'meaningVi': 'hóa đơn',
      'exampleEn': 'Could we have the bill, please?',
      'exampleVi': 'Cho chúng tôi xin hóa đơn.',
    },
    {
      'word': 'tip',
      'phonetic': '/tɪp/',
      'meaningVi': 'tiền tip',
      'exampleEn': 'Leave a 10% tip.',
      'exampleVi': 'Để lại tiền tip 10%.',
    },
    {
      'word': 'utensils',
      'phonetic': '/juːˈtensɪlz/',
      'meaningVi': 'dụng cụ ăn',
      'exampleEn': 'Utensils are on the table.',
      'exampleVi': 'Dụng cụ ăn ở trên bàn.',
    },
    {
      'word': 'napkin',
      'phonetic': '/ˈnæpkɪn/',
      'meaningVi': 'khăn ăn',
      'exampleEn': 'Use a napkin, please.',
      'exampleVi': 'Vui lòng dùng khăn ăn.',
    },
    {
      'word': 'reservation name',
      'phonetic': '/ˌrezəˈrveɪʃn neɪm/',
      'meaningVi': 'tên đặt bàn',
      'exampleEn': 'The reservation name is Linh.',
      'exampleVi': 'Tên đặt bàn là Linh.',
    },
    {
      'word': 'open hours',
      'phonetic': '/ˈoʊpən aʊərz/',
      'meaningVi': 'giờ mở cửa',
      'exampleEn': 'What are your open hours?',
      'exampleVi': 'Giờ mở cửa của quán là gì?',
    },
    {
      'word': 'close at',
      'phonetic': '/kloʊz æt/',
      'meaningVi': 'đóng cửa lúc',
      'exampleEn': 'We close at 10 p.m.',
      'exampleVi': 'Chúng tôi đóng cửa lúc 10 tối.',
    },
    {
      'word': 'reservation confirmed',
      'phonetic': '/kənˈfɜːrmd/',
      'meaningVi': 'đã xác nhận đặt bàn',
      'exampleEn': 'Your reservation is confirmed.',
      'exampleVi': 'Đặt bàn của bạn đã được xác nhận.',
    },
    {
      'word': 'special of the day',
      'phonetic': '/ˈspeʃl əv ðə deɪ/',
      'meaningVi': 'món đặc biệt trong ngày',
      'exampleEn': 'Try the special of the day.',
      'exampleVi': 'Thử món đặc biệt trong ngày nhé.',
    },
    {
      'word': 'food allergy notice',
      'phonetic': '/ˈfʊd ˈælərdʒi ˈnoʊtɪs/',
      'meaningVi': 'lưu ý dị ứng thực phẩm',
      'exampleEn': 'Please check the allergy notice.',
      'exampleVi': 'Vui lòng xem lưu ý dị ứng thực phẩm.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab8')
      .set({
        'topicName': 'Bài 8: Food & Reservations',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab8.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab8[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab8/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab8")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 9: Weather & Public Announcements (30 thẻ)
  // =========================

  final vocab9 = <Map<String, String>>[
    {
      'word': 'weather',
      'phonetic': '/ˈweðər/',
      'meaningVi': 'thời tiết',
      'exampleEn': 'The weather is sunny.',
      'exampleVi': 'Thời tiết nắng đẹp.',
    },
    {
      'word': 'forecast',
      'phonetic': '/ˈfɔːrkæst/',
      'meaningVi': 'dự báo',
      'exampleEn': 'The forecast says rain.',
      'exampleVi': 'Dự báo nói có mưa.',
    },
    {
      'word': 'temperature',
      'phonetic': '/ˈtemprətʃər/',
      'meaningVi': 'nhiệt độ',
      'exampleEn': 'The temperature is 30°C.',
      'exampleVi': 'Nhiệt độ là 30°C.',
    },
    {
      'word': 'degree Celsius',
      'phonetic': '/dɪˈɡriː ˈselsiəs/',
      'meaningVi': 'độ C',
      'exampleEn': 'It’s 25 degrees Celsius.',
      'exampleVi': 'Nhiệt độ 25 độ C.',
    },
    {
      'word': 'sunny',
      'phonetic': '/ˈsʌni/',
      'meaningVi': 'nắng',
      'exampleEn': 'It will be sunny today.',
      'exampleVi': 'Hôm nay trời nắng.',
    },
    {
      'word': 'cloudy',
      'phonetic': '/ˈklaʊdi/',
      'meaningVi': 'nhiều mây',
      'exampleEn': 'It’s cloudy this morning.',
      'exampleVi': 'Sáng nay nhiều mây.',
    },
    {
      'word': 'rainy',
      'phonetic': '/ˈreɪni/',
      'meaningVi': 'mưa',
      'exampleEn': 'A rainy afternoon is expected.',
      'exampleVi': 'Dự kiến chiều nay có mưa.',
    },
    {
      'word': 'storm',
      'phonetic': '/stɔːrm/',
      'meaningVi': 'bão',
      'exampleEn': 'A storm is approaching.',
      'exampleVi': 'Một cơn bão đang đến.',
    },
    {
      'word': 'thunder',
      'phonetic': '/ˈθʌndər/',
      'meaningVi': 'sấm',
      'exampleEn': 'We heard thunder.',
      'exampleVi': 'Chúng tôi nghe tiếng sấm.',
    },
    {
      'word': 'lightning',
      'phonetic': '/ˈlaɪtnɪŋ/',
      'meaningVi': 'chớp',
      'exampleEn': 'Lightning struck nearby.',
      'exampleVi': 'Tia chớp đánh gần đó.',
    },
    {
      'word': 'windy',
      'phonetic': '/ˈwɪndi/',
      'meaningVi': 'gió',
      'exampleEn': 'It’s windy on the coast.',
      'exampleVi': 'Ngoài bờ biển có gió.',
    },
    {
      'word': 'humid',
      'phonetic': '/ˈhjuːmɪd/',
      'meaningVi': 'ẩm ướt',
      'exampleEn': 'The air is very humid.',
      'exampleVi': 'Không khí rất ẩm.',
    },
    {
      'word': 'dry',
      'phonetic': '/draɪ/',
      'meaningVi': 'khô',
      'exampleEn': 'The climate is dry.',
      'exampleVi': 'Khí hậu khô.',
    },
    {
      'word': 'heatwave',
      'phonetic': '/ˈhiːtweɪv/',
      'meaningVi': 'đợt nắng nóng',
      'exampleEn': 'A heatwave will continue.',
      'exampleVi': 'Đợt nắng nóng sẽ tiếp diễn.',
    },
    {
      'word': 'cold front',
      'phonetic': '/koʊld frʌnt/',
      'meaningVi': 'khối không khí lạnh',
      'exampleEn': 'A cold front is moving in.',
      'exampleVi': 'Một khối không khí lạnh đang tràn về.',
    },
    {
      'word': 'shower',
      'phonetic': '/ˈʃaʊər/',
      'meaningVi': 'mưa rào',
      'exampleEn': 'Light showers in the evening.',
      'exampleVi': 'Mưa rào nhẹ vào buổi tối.',
    },
    {
      'word': 'drizzle',
      'phonetic': '/ˈdrɪzl/',
      'meaningVi': 'mưa phùn',
      'exampleEn': 'It’s drizzling outside.',
      'exampleVi': 'Ngoài trời đang mưa phùn.',
    },
    {
      'word': 'fog',
      'phonetic': '/fɔːɡ/',
      'meaningVi': 'sương mù',
      'exampleEn': 'Thick fog in the morning.',
      'exampleVi': 'Sương mù dày vào buổi sáng.',
    },
    {
      'word': 'haze',
      'phonetic': '/heɪz/',
      'meaningVi': 'mù, bụi mờ',
      'exampleEn': 'There is haze over the city.',
      'exampleVi': 'Có lớp mù phủ thành phố.',
    },
    {
      'word': 'announcement',
      'phonetic': '/əˈnaʊnsmənt/',
      'meaningVi': 'thông báo',
      'exampleEn': 'Listen to the station announcement.',
      'exampleVi': 'Hãy nghe thông báo ở nhà ga.',
    },
    {
      'word': 'public address',
      'phonetic': '/ˌpʌblɪk əˈdres/',
      'meaningVi': 'loa phát thanh công cộng',
      'exampleEn': 'The public address system is loud.',
      'exampleVi': 'Hệ thống loa công cộng khá to.',
    },
    {
      'word': 'advisory',
      'phonetic': '/ədˈvaɪzəri/',
      'meaningVi': 'khuyến cáo',
      'exampleEn': 'A weather advisory was issued.',
      'exampleVi': 'Đã có khuyến cáo thời tiết.',
    },
    {
      'word': 'warning',
      'phonetic': '/ˈwɔːrnɪŋ/',
      'meaningVi': 'cảnh báo',
      'exampleEn': 'A flood warning is in effect.',
      'exampleVi': 'Cảnh báo lũ đang có hiệu lực.',
    },
    {
      'word': 'delay',
      'phonetic': '/dɪˈleɪ/',
      'meaningVi': 'trì hoãn',
      'exampleEn': 'Trains are delayed due to rain.',
      'exampleVi': 'Tàu bị trễ do mưa.',
    },
    {
      'word': 'cancellation',
      'phonetic': '/ˌkænsəˈleɪʃn/',
      'meaningVi': 'hủy chuyến/sự kiện',
      'exampleEn': 'Flight cancellations are expected.',
      'exampleVi': 'Dự kiến có hủy chuyến bay.',
    },
    {
      'word': 'evacuate',
      'phonetic': '/ɪˈvækjueɪt/',
      'meaningVi': 'sơ tán',
      'exampleEn': 'Residents were told to evacuate.',
      'exampleVi': 'Người dân được yêu cầu sơ tán.',
    },
    {
      'word': 'shelter',
      'phonetic': '/ˈʃeltər/',
      'meaningVi': 'nơi trú ẩn',
      'exampleEn': 'Find shelter immediately.',
      'exampleVi': 'Tìm nơi trú ẩn ngay.',
    },
    {
      'word': 'maintenance',
      'phonetic': '/ˈmeɪntənəns/',
      'meaningVi': 'bảo trì',
      'exampleEn': 'Service maintenance tonight.',
      'exampleVi': 'Bảo trì dịch vụ vào tối nay.',
    },
    {
      'word': 'service interruption',
      'phonetic': '/ˈsɜːrvɪs ˌɪntəˈrʌpʃn/',
      'meaningVi': 'gián đoạn dịch vụ',
      'exampleEn': 'There is a service interruption.',
      'exampleVi': 'Có gián đoạn dịch vụ.',
    },
    {
      'word': 'notice board',
      'phonetic': '/ˈnoʊtɪs bɔːrd/',
      'meaningVi': 'bảng thông báo',
      'exampleEn': 'Check the notice board for updates.',
      'exampleVi': 'Xem bảng thông báo để biết cập nhật.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab9')
      .set({
        'topicName': 'Bài 9: Weather & Public Announcements',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab9.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab9[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab9/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab9")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 10: Phone & Email Basics (30 thẻ)
  // =========================

  final vocab10 = <Map<String, String>>[
    {
      'word': 'call',
      'phonetic': '/kɔːl/',
      'meaningVi': 'gọi điện; cuộc gọi',
      'exampleEn': 'I will call you later.',
      'exampleVi': 'Tôi sẽ gọi cho bạn sau.',
    },
    {
      'word': 'answer',
      'phonetic': '/ˈænsər/',
      'meaningVi': 'nhấc máy; trả lời',
      'exampleEn': 'Please answer the phone.',
      'exampleVi': 'Vui lòng nghe điện thoại.',
    },
    {
      'word': 'hang up',
      'phonetic': '/hæŋ ʌp/',
      'meaningVi': 'cúp máy',
      'exampleEn': 'He hung up suddenly.',
      'exampleVi': 'Anh ấy cúp máy đột ngột.',
    },
    {
      'word': 'hold',
      'phonetic': '/hoʊld/',
      'meaningVi': 'giữ máy',
      'exampleEn': 'Please hold for a moment.',
      'exampleVi': 'Vui lòng chờ máy một lát.',
    },
    {
      'word': 'transfer',
      'phonetic': '/ˈtrænsfɜːr/',
      'meaningVi': 'chuyển cuộc gọi',
      'exampleEn': 'I will transfer your call.',
      'exampleVi': 'Tôi sẽ chuyển cuộc gọi của bạn.',
    },
    {
      'word': 'voicemail',
      'phonetic': '/ˈvɔɪsmeɪl/',
      'meaningVi': 'hộp thư thoại',
      'exampleEn': 'He left a voicemail.',
      'exampleVi': 'Anh ấy để lại thư thoại.',
    },
    {
      'word': 'missed call',
      'phonetic': '/mɪst kɔːl/',
      'meaningVi': 'cuộc gọi nhỡ',
      'exampleEn': 'I have three missed calls.',
      'exampleVi': 'Tôi có ba cuộc gọi nhỡ.',
    },
    {
      'word': 'text message',
      'phonetic': '/tekst ˈmesɪdʒ/',
      'meaningVi': 'tin nhắn',
      'exampleEn': 'She sent a text message.',
      'exampleVi': 'Cô ấy đã gửi tin nhắn.',
    },
    {
      'word': 'attachment',
      'phonetic': '/əˈtætʃmənt/',
      'meaningVi': 'tệp đính kèm',
      'exampleEn': 'Check the email attachment.',
      'exampleVi': 'Kiểm tra tệp đính kèm email.',
    },
    {
      'word': 'attach',
      'phonetic': '/əˈtætʃ/',
      'meaningVi': 'đính kèm',
      'exampleEn': 'Please attach the file.',
      'exampleVi': 'Vui lòng đính kèm tệp.',
    },
    {
      'word': 'subject',
      'phonetic': '/ˈsʌbdʒɪkt/',
      'meaningVi': 'tiêu đề (email)',
      'exampleEn': 'Write a clear subject line.',
      'exampleVi': 'Viết tiêu đề rõ ràng.',
    },
    {
      'word': 'inbox',
      'phonetic': '/ˈɪnbɒks/',
      'meaningVi': 'hộp thư đến',
      'exampleEn': 'Your inbox is full.',
      'exampleVi': 'Hộp thư đến của bạn đầy.',
    },
    {
      'word': 'draft',
      'phonetic': '/dræft/',
      'meaningVi': 'bản nháp',
      'exampleEn': 'Save the email as a draft.',
      'exampleVi': 'Lưu email dưới dạng bản nháp.',
    },
    {
      'word': 'send',
      'phonetic': '/send/',
      'meaningVi': 'gửi',
      'exampleEn': 'I will send the report now.',
      'exampleVi': 'Tôi sẽ gửi báo cáo ngay.',
    },
    {
      'word': 'reply',
      'phonetic': '/rɪˈplaɪ/',
      'meaningVi': 'trả lời',
      'exampleEn': 'Please reply to all.',
      'exampleVi': 'Vui lòng trả lời tất cả.',
    },
    {
      'word': 'forward',
      'phonetic': '/ˈfɔːrwərd/',
      'meaningVi': 'chuyển tiếp',
      'exampleEn': 'Forward this email to HR.',
      'exampleVi': 'Chuyển tiếp email này cho HR.',
    },
    {
      'word': 'CC',
      'phonetic': '/ˌsiː ˈsiː/',
      'meaningVi': 'chỉ định CC',
      'exampleEn': 'Please CC the manager.',
      'exampleVi': 'Vui lòng CC quản lý.',
    },
    {
      'word': 'BCC',
      'phonetic': '/ˌbiː siː siː/',
      'meaningVi': 'chỉ định BCC',
      'exampleEn': 'Add HR in BCC.',
      'exampleVi': 'Thêm HR vào BCC.',
    },
    {
      'word': 'recipient',
      'phonetic': '/rɪˈsɪpiənt/',
      'meaningVi': 'người nhận',
      'exampleEn': 'Enter the recipient’s address.',
      'exampleVi': 'Nhập địa chỉ người nhận.',
    },
    {
      'word': 'address',
      'phonetic': '/əˈdres/',
      'meaningVi': 'địa chỉ (email)',
      'exampleEn': 'What is your email address?',
      'exampleVi': 'Địa chỉ email của bạn là gì?',
    },
    {
      'word': 'signature',
      'phonetic': '/ˈsɪɡnətʃər/',
      'meaningVi': 'chữ ký (email)',
      'exampleEn': 'Update your email signature.',
      'exampleVi': 'Cập nhật chữ ký email của bạn.',
    },
    {
      'word': 'spam',
      'phonetic': '/spæm/',
      'meaningVi': 'thư rác',
      'exampleEn': 'Check the spam folder.',
      'exampleVi': 'Kiểm tra thư mục thư rác.',
    },
    {
      'word': 'filter',
      'phonetic': '/ˈfɪltər/',
      'meaningVi': 'bộ lọc; lọc',
      'exampleEn': 'Create a filter for newsletters.',
      'exampleVi': 'Tạo bộ lọc cho bản tin.',
    },
    {
      'word': 'out of office',
      'phonetic': '/aʊt əv ˈɒfɪs/',
      'meaningVi': 'tự động trả lời vắng mặt',
      'exampleEn': 'Set an out‑of‑office reply.',
      'exampleVi': 'Đặt trả lời tự động khi vắng mặt.',
    },
    {
      'word': 'greeting',
      'phonetic': '/ˈɡriːtɪŋ/',
      'meaningVi': 'lời chào mở đầu',
      'exampleEn': 'Use a polite greeting.',
      'exampleVi': 'Dùng lời chào lịch sự.',
    },
    {
      'word': 'closing',
      'phonetic': '/ˈkloʊzɪŋ/',
      'meaningVi': 'lời kết thư',
      'exampleEn': 'Add a professional closing.',
      'exampleVi': 'Thêm lời kết chuyên nghiệp.',
    },
    {
      'word': 'line is busy',
      'phonetic': '/laɪn ɪz ˈbɪzi/',
      'meaningVi': 'đường dây bận',
      'exampleEn': 'The line is busy now.',
      'exampleVi': 'Đường dây đang bận.',
    },
    {
      'word': 'signal',
      'phonetic': '/ˈsɪɡnəl/',
      'meaningVi': 'tín hiệu',
      'exampleEn': 'The signal is weak here.',
      'exampleVi': 'Tín hiệu ở đây yếu.',
    },
    {
      'word': 'conference call',
      'phonetic': '/ˈkɒnfərəns kɔːl/',
      'meaningVi': 'cuộc gọi hội nghị',
      'exampleEn': 'Join the conference call at 2.',
      'exampleVi': 'Tham gia cuộc gọi hội nghị lúc 2 giờ.',
    },
    {
      'word': 'schedule send',
      'phonetic': '/ˈskedʒuːl send/',
      'meaningVi': 'hẹn giờ gửi',
      'exampleEn': 'Use schedule send for tomorrow.',
      'exampleVi': 'Dùng hẹn giờ gửi cho ngày mai.',
    },
  ];

  await db
      .collection('vocab_cards')
      .doc(levelId)
      .collection('vocab_topics')
      .doc('vocab10')
      .set({
        'topicName': 'Bài 10: Phone & Email Basics',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  for (int i = 1; i < vocab10.length; i++) {
    final id = 'q${i.toString().padLeft(2, '0')}';
    final q = vocab10[i - 1];

    final word = (q['word'] as String);
    final audioUrl = 'easy/vocab10/${_toFileName(word)}'; // ví dụ: "put_on.mp3"

    await db
        .collection('vocab_cards')
        .doc(levelId)
        .collection('vocab_topics')
        .doc("vocab10")
        .collection('cards')
        .doc(id)
        .set({
          'word': q['word'],
          'phonetic': q['phonetic'],
          'meaningVi': q['meaningVi'],
          'exampleEn': q['exampleEn'],
          'exampleVi': q['exampleVi'],
          'audioUrl': audioUrl,
        }, SetOptions(merge: true));
  }
}
