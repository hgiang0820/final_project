/// Nguồn: Bảng quy đổi chính thức ETS TOEIC
/// https://www.anhngumshoa.com/diem-toeic-news34838.html
library;

class TOEICScoreConverter {
  // Bảng tra cứu điểm Listening chính xác từ ETS
  // Định dạng: {correct_count: toeic_score}
  static const Map<int, int> _listeningScores = {
    0: 5,
    1: 15,
    2: 20,
    3: 25,
    4: 30,
    5: 35,
    6: 40,
    7: 45,
    8: 50,
    9: 55,
    10: 60,
    11: 65,
    12: 70,
    13: 75,
    14: 80,
    15: 85,
    16: 90,
    17: 95,
    18: 100,
    19: 105,
    20: 110,
    21: 115,
    22: 120,
    23: 125,
    24: 130,
    25: 135,
    26: 140,
    27: 145,
    28: 150,
    29: 155,
    30: 160,
    31: 165,
    32: 170,
    33: 175,
    34: 180,
    35: 185,
    36: 190,
    37: 195,
    38: 200,
    39: 205,
    40: 210,
    41: 215,
    42: 220,
    43: 225,
    44: 230,
    45: 235,
    46: 240,
    47: 245,
    48: 250,
    49: 255,
    50: 260,
    51: 265,
    52: 270,
    53: 275,
    54: 280,
    55: 285,
    56: 290,
    57: 295,
    58: 300,
    59: 305,
    60: 310,
    61: 315,
    62: 320,
    63: 325,
    64: 330,
    65: 335,
    66: 340,
    67: 345,
    68: 350,
    69: 355,
    70: 360,
    71: 365,
    72: 370,
    73: 375,
    74: 380,
    75: 385,
    76: 390,
    77: 395,
    78: 405,
    79: 410,
    80: 415,
    81: 420,
    82: 425,
    83: 430,
    84: 435,
    85: 440,
    86: 445,
    87: 450,
    88: 455,
    89: 460,
    90: 465,
    91: 470,
    92: 475,
    93: 480,
    94: 485,
    95: 490,
    96: 495,
    97: 495,
    98: 495,
    99: 495,
    100: 495,
  };

  // Bảng tra cứu điểm Reading chính xác từ ETS
  static const Map<int, int> _readingScores = {
    0: 5,
    1: 5,
    2: 5,
    3: 10,
    4: 15,
    5: 20,
    6: 25,
    7: 30,
    8: 35,
    9: 40,
    10: 45,
    11: 50,
    12: 55,
    13: 60,
    14: 65,
    15: 70,
    16: 75,
    17: 80,
    18: 85,
    19: 90,
    20: 95,
    21: 100,
    22: 105,
    23: 110,
    24: 115,
    25: 120,
    26: 125,
    27: 130,
    28: 135,
    29: 140,
    30: 145,
    31: 150,
    32: 155,
    33: 160,
    34: 165,
    35: 170,
    36: 175,
    37: 180,
    38: 185,
    39: 190,
    40: 195,
    41: 200,
    42: 205,
    43: 210,
    44: 215,
    45: 220,
    46: 225,
    47: 230,
    48: 235,
    49: 240,
    50: 245,
    51: 250,
    52: 255,
    53: 260,
    54: 265,
    55: 270,
    56: 275,
    57: 280,
    58: 285,
    59: 290,
    60: 295,
    61: 300,
    62: 305,
    63: 310,
    64: 315,
    65: 320,
    66: 325,
    67: 330,
    68: 335,
    69: 340,
    70: 345,
    71: 350,
    72: 355,
    73: 360,
    74: 365,
    75: 370,
    76: 375,
    77: 380,
    78: 385,
    79: 390,
    80: 395,
    81: 400,
    82: 405,
    83: 410,
    84: 415,
    85: 420,
    86: 425,
    87: 430,
    88: 435,
    89: 440,
    90: 445,
    91: 450,
    92: 455,
    93: 460,
    94: 465,
    95: 470,
    96: 475,
    97: 480,
    98: 485,
    99: 490,
    100: 495,
  };

  // Bảng tra cứu điểm Speaking (raw score → scaled score)
  static const Map<int, int> _speakingScores = {
    0: 0,
    4: 30,
    5: 40,
    7: 50,
    8: 60,
    10: 70,
    11: 80,
    14: 100,
    15: 110,
    18: 120,
    19: 130,
    23: 150,
    24: 160,
    29: 180,
    30: 190,
    37: 200,
  };

  // Bảng tra cứu điểm Writing (raw score → scaled score)
  static const Map<int, int> _writingScores = {
    0: 0,
    4: 30,
    5: 40,
    7: 40,
    8: 50,
    10: 60,
    11: 70,
    12: 80,
    13: 90,
    14: 100,
    15: 110,
    16: 130,
    17: 140,
    19: 160,
    20: 170,
    22: 180,
    23: 190,
    28: 200,
  };

  // ============ LISTENING ============
  /// Tính tổng điểm Listening (100 câu = 495 điểm)
  /// Sử dụng bảng quy đổi chính xác từ ETS TOEIC
  static int convertTotalListening(int correctCount) {
    return _convertFromLookupTable(correctCount, _listeningScores);
  }

  // ============ READING ============
  /// Tính tổng điểm Reading (100 câu = 495 điểm)
  /// Sử dụng bảng quy đổi chính xác từ ETS TOEIC
  static int convertTotalReading(int correctCount) {
    return _convertFromLookupTable(correctCount, _readingScores);
  }

  /// Tính tổng Listening & Reading (200 câu = 990 điểm)
  static int convertTotalListeningReading(int correctCount) {
    if (correctCount <= 100) {
      return convertTotalListening(correctCount);
    } else if (correctCount <= 200) {
      final listeningScore = convertTotalListening(100);
      final readingScore = convertTotalReading(correctCount - 100);
      return listeningScore + readingScore;
    }
    return 990;
  }

  // ============ SPEAKING ============
  /// Tính điểm Speaking từ số câu đúng (11 câu = 200 điểm)
  /// Tìm mốc raw score cao hơn gần nhất rồi tính: lookupValue/lookupKey * correctCount
  /// Ví dụ: 3 câu → mốc '4: 30' → (30/4)*3 = 22.5 → làm tròn bội 10 = 20
  static int convertTotalSpeaking(int correctCount) {
    return _convertSpeakingWritingScore(correctCount, _speakingScores);
  }

  /// Chuyển đổi điểm Speaking từ score nhận từ API
  static int convertSpeakingFromScore(int totalScore, {int maxScore = 110}) {
    return _convertFromLookupTable(totalScore, _speakingScores);
  }

  // ============ WRITING ============
  /// Tính điểm Writing từ số câu đúng (8 câu = 200 điểm)
  /// Tìm mốc raw score cao hơn gần nhất rồi tính: lookupValue/lookupKey * correctCount
  /// Ví dụ: 3 câu → mốc '4: 30' → (30/4)*3 = 22.5 → làm tròn bội 10 = 20
  static int convertTotalWriting(int correctCount) {
    return _convertSpeakingWritingScore(correctCount, _writingScores);
  }

  /// Chuyển đổi điểm Writing từ score nhận từ API
  static int convertWritingFromScore(int totalScore, {int maxScore = 80}) {
    return _convertFromLookupTable(totalScore, _writingScores);
  }

  /// Tính tổng Speaking & Writing (19 câu = 400 điểm)
  static int convertTotalSpeakingWriting(int correctCount) {
    const maxScore = 400;
    const maxQuestions = 19;
    return _calculateScore(correctCount, maxQuestions, maxScore);
  }

  /// Tính tổng 4 skills (Listening + Reading + Speaking + Writing)
  /// = 200 (LR) + 400 (SW) = 600 điểm
  static int convertTotalAllSkills(int correctCount) {
    const maxScore = 600;
    const maxQuestions = 219; // 100 + 100 + 11 + 8
    return _calculateScore(correctCount, maxQuestions, maxScore);
  }

  // ============ UTILITIES ============
  /// Hàm helper để tra cứu bảng điểm dựa trên số câu đúng
  /// Sử dụng nội suy tuyến tính khi không tìm thấy giá trị chính xác
  static int _convertFromLookupTable(
    int correctCount,
    Map<int, int> scoreTable,
  ) {
    if (correctCount <= 0) return 0;

    // Tìm điểm trực tiếp từ bảng
    if (scoreTable.containsKey(correctCount)) {
      return scoreTable[correctCount]!;
    }

    // Nếu không tìm thấy, dùng phép nội suy tuyến tính
    final sortedKeys = scoreTable.keys.toList()..sort();

    for (int i = 0; i < sortedKeys.length - 1; i++) {
      final x1 = sortedKeys[i];
      final x2 = sortedKeys[i + 1];

      if (correctCount >= x1 && correctCount < x2) {
        final y1 = scoreTable[x1]!.toDouble();
        final y2 = scoreTable[x2]!.toDouble();

        // Nội suy tuyến tính: y = y1 + (x - x1) * (y2 - y1) / (x2 - x1)
        final interpolated = y1 + (correctCount - x1) * (y2 - y1) / (x2 - x1);
        return interpolated.round();
      }
    }

    // Nếu vượt quá giá trị lớn nhất
    return scoreTable[sortedKeys.last] ?? 495;
  }

  /// Hàm helper để tính điểm Speaking/Writing từ correctCount
  /// Tìm mốc raw score cao hơn gần nhất rồi tính: lookupValue/lookupKey * correctCount
  /// Ví dụ: 3 câu → mốc '4: 30' → (30/4)*3 = 22.5 → làm tròn bội 10 = 20
  static int _convertSpeakingWritingScore(
    int correctCount,
    Map<int, int> scoreTable,
  ) {
    if (correctCount <= 0) return 0;

    // Tìm mốc cao hơn gần nhất
    final sortedKeys = scoreTable.keys.toList()..sort();
    int closestKey = sortedKeys.last;

    for (final key in sortedKeys) {
      if (key >= correctCount) {
        closestKey = key;
        break;
      }
    }

    final lookupValue = scoreTable[closestKey]!;
    // Công thức: (lookupValue / closestKey) * correctCount
    final score = (lookupValue / closestKey) * correctCount;

    // Làm tròn bội 10
    return ((score / 10).round() * 10).toInt();
  }

  /// Hàm helper để tính điểm dựa trên tỷ lệ phần trăm
  static int _calculateScore(int correctCount, int maxQuestions, int maxScore) {
    if (correctCount < 0) return 0;
    if (correctCount > maxQuestions) correctCount = maxQuestions;

    final percentage = correctCount / maxQuestions;
    return (percentage * maxScore).round();
  }
}
