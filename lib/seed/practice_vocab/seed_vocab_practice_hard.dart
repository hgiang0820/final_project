import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> seedVocabPracticeHard() async {
  final db = FirebaseFirestore.instance;
  const levelId = 'hard';

  // Root doc (merge-safe)
  await db.collection('vocab_practice').doc(levelId).set({
    'title': 'Practice Vocabulary Level Hard',
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
  // Vocab 1: Reports & Data Insights (50 câu; đáp án đúng không cố định ở index 0)
  // =========================
  final vocab1Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “trend (n)” most nearly means…',
      'options': ['điểm bất thường', 'xu hướng', 'phụ lục', 'bảng biểu'],
      'correctIndex': 1,
      'explain': 'trend = xu hướng.',
    },
    {
      'question': 'Identify: “variance (n)” in statistics refers to…',
      'options': [
        'độ biến thiên/chênh lệch',
        'tốc độ tăng trưởng',
        'tóm tắt',
        'đồ thị đường',
      ],
      'correctIndex': 0,
      'explain': 'variance = độ biến thiên.',
    },
    {
      'question': 'Choose the best: The “average (n/adj)” score is…',
      'options': ['trung bình', 'trung vị', 'cao nhất', 'chuẩn so sánh'],
      'correctIndex': 0,
      'explain': 'average = trung bình.',
    },
    {
      'question': 'Meaning: “median (n)” is the…',
      'options': [
        'giá trị phổ biến nhất',
        'giá trị giữa dãy đã sắp xếp',
        'giá trị nhỏ nhất',
        'chuẩn so sánh',
      ],
      'correctIndex': 1,
      'explain': 'median = trung vị.',
    },
    {
      'question': 'Closest meaning: “benchmark (n)” ≈',
      'options': ['mẫu ngẫu nhiên', 'chuẩn so sánh', 'điểm nhấn', 'phụ lục'],
      'correctIndex': 1,
      'explain': 'benchmark = chuẩn so sánh.',
    },
    {
      'question': 'Fill in: We track key ___ to measure performance.',
      'options': ['KPIs', 'appendices', 'figures', 'metrics'],
      'correctIndex': 3,
      'explain': 'metrics = chỉ số đo lường.',
    },
    {
      'question': 'Meaning: “KPI (n)” is best described as…',
      'options': [
        'chỉ số hiệu suất',
        'đồ thị đường',
        'bộ dữ liệu',
        'diễn giải',
      ],
      'correctIndex': 0,
      'explain': 'KPI = Key Performance Indicator.',
    },
    {
      'question': 'Choose the noun: Share your market “insight (n)”.',
      'options': [
        'hiểu biết chuyên sâu',
        'tốc độ tăng trưởng',
        'phụ lục',
        'báo cáo tổng hợp',
      ],
      'correctIndex': 0,
      'explain': 'insight = hiểu biết chuyên sâu.',
    },
    {
      'question': 'Meaning: “finding (n)” in a report is…',
      'options': [
        'kết quả phát hiện',
        'bảng số liệu',
        'hình minh họa',
        'điểm bất thường',
      ],
      'correctIndex': 0,
      'explain': 'finding = kết quả phát hiện.',
    },
    {
      'question': 'Definition: A “dataset (n)” is…',
      'options': ['bộ dữ liệu', 'bài tóm tắt', 'điểm nhấn', 'biểu đồ tròn'],
      'correctIndex': 0,
      'explain': 'dataset = bộ dữ liệu.',
    },
    {
      'question': 'Usage: We collected a random ___ of 1,000 users.',
      'options': ['figure', 'sample', 'appendix', 'summary'],
      'correctIndex': 1,
      'explain': 'sample = mẫu.',
    },
    {
      'question': 'Concept: A strong “correlation (n)” indicates…',
      'options': ['quan hệ nhân quả', 'tương quan', 'phụ lục', 'đồ thị đường'],
      'correctIndex': 1,
      'explain': 'correlation = tương quan (không khẳng định nhân quả).',
    },
    {
      'question': 'Choose the verb: Revenues ___ by 8% last quarter.',
      'options': ['fluctuated', 'decreased', 'increased', 'summarized'],
      'correctIndex': 2,
      'explain': 'increase = tăng.',
    },
    {
      'question': 'Choose the verb: Costs slightly ___ in May.',
      'options': ['decreased', 'benchmarked', 'projected', 'interpreted'],
      'correctIndex': 0,
      'explain': 'decrease = giảm.',
    },
    {
      'question': 'Meaning: “fluctuate (v)” means to…',
      'options': ['dao động', 'tăng đều', 'giảm sâu', 'giữ nguyên'],
      'correctIndex': 0,
      'explain': 'fluctuate = dao động.',
    },
    {
      'question': 'Word choice: We “___ (v/n)” steady growth next year.',
      'options': ['trend', 'forecast', 'figure', 'highlight'],
      'correctIndex': 1,
      'explain': 'forecast = dự báo.',
    },
    {
      'question': 'Closest meaning: “projection (n)” ≈',
      'options': ['dự phóng', 'phụ lục', 'bài tóm tắt', 'hình minh họa'],
      'correctIndex': 0,
      'explain': 'projection = dự phóng.',
    },
    {
      'question': 'Meaning: “growth rate (n)” is…',
      'options': [
        'tốc độ tăng trưởng',
        'xu hướng',
        'chuẩn so sánh',
        'tương quan',
      ],
      'correctIndex': 0,
      'explain': 'growth rate = tốc độ tăng trưởng.',
    },
    {
      'question': 'Pick the chart: A “pie chart (n)” shows…',
      'options': [
        'tỷ trọng phần trăm',
        'xu hướng theo thời gian',
        'quan hệ tương quan',
        'độ biến thiên',
      ],
      'correctIndex': 0,
      'explain': 'pie chart = biểu đồ tròn.',
    },
    {
      'question': 'Identify: A “bar chart (n)” best for…',
      'options': [
        'so sánh các hạng mục',
        'hiển thị tỷ trọng phần trăm',
        'sơ đồ mạng',
        'bản đồ nhiệt',
      ],
      'correctIndex': 0,
      'explain': 'bar chart = so sánh hạng mục.',
    },
    {
      'question': 'Choose the graphic: A “line graph (n)” shows…',
      'options': [
        'phần trăm theo nhóm',
        'xu hướng theo thời gian',
        'tương quan rời rạc',
        'bảng tổng hợp',
      ],
      'correctIndex': 1,
      'explain': 'line graph = đồ thị đường theo thời gian.',
    },
    {
      'question': 'Vocabulary: Refer to the ___ for raw numbers.',
      'options': ['table', 'figure', 'appendix', 'summary'],
      'correctIndex': 0,
      'explain': 'table = bảng dữ liệu.',
    },
    {
      'question': 'Meaning: In reports, a “figure (n)” often means…',
      'options': ['hình/đồ thị', 'mục lục', 'tóm tắt điều hành', 'bài luận'],
      'correctIndex': 0,
      'explain': 'figure = hình/đồ thị minh hoạ.',
    },
    {
      'question': 'Locate info: Data is in the ___.',
      'options': ['appendix', 'trend', 'finding', 'KPI'],
      'correctIndex': 0,
      'explain': 'appendix = phụ lục.',
    },
    {
      'question': 'Meaning: Provide an “interpretation (n)” means…',
      'options': [
        'đưa ra diễn giải',
        'thêm phụ lục',
        'vẽ biểu đồ',
        'đính kèm bảng',
      ],
      'correctIndex': 0,
      'explain': 'interpretation = diễn giải.',
    },
    {
      'question': 'Choose the noun: “implication (n)” is…',
      'options': ['hàm ý/hệ quả', 'bảng biểu', 'điểm nhấn', 'tóm tắt'],
      'correctIndex': 0,
      'explain': 'implication = hàm ý.',
    },
    {
      'question': 'Meaning: Write a short “summary (n)” =',
      'options': [
        'bản tóm tắt',
        'biểu đồ cột',
        'bài kết luận',
        'mẫu ngẫu nhiên',
      ],
      'correctIndex': 0,
      'explain': 'summary = tóm tắt.',
    },
    {
      'question': 'Term: “executive summary (n)” is…',
      'options': [
        'tóm tắt điều hành',
        'bảng phụ lục',
        'đồ thị chính',
        'dữ liệu thô',
      ],
      'correctIndex': 0,
      'explain': 'executive summary = tóm tắt điều hành.',
    },
    {
      'question': 'Usage: Please ___ the key results in bold.',
      'options': ['interpret', 'highlight', 'forecast', 'sample'],
      'correctIndex': 1,
      'explain': 'highlight = làm nổi bật.',
    },
    {
      'question': 'Meaning check: “anomaly (n)” means…',
      'options': [
        'điểm bất thường',
        'tốc độ tăng trưởng',
        'bảng số liệu',
        'tóm tắt',
      ],
      'correctIndex': 0,
      'explain': 'anomaly = bất thường.',
    },
    {
      'question': 'Sentence: The sales ___ is upward this quarter.',
      'options': ['median', 'trend', 'appendix', 'figure'],
      'correctIndex': 1,
      'explain': 'trend = xu hướng.',
    },
    {
      'question': 'Sentence: The ___ is significant, so we must explain it.',
      'options': ['variance', 'table', 'figure', 'summary'],
      'correctIndex': 0,
      'explain': 'variance đáng kể cần giải thích.',
    },
    {
      'question': 'Complete: The ___ shows revenue by region.',
      'options': ['bar chart', 'median', 'appendix', 'KPI'],
      'correctIndex': 0,
      'explain': 'bar chart so sánh theo khu vực.',
    },
    {
      'question': 'Choose: Please add an ___ for busy readers.',
      'options': ['executive summary', 'anomaly', 'correlation', 'dataset'],
      'correctIndex': 0,
      'explain': 'executive summary cho lãnh đạo.',
    },
    {
      'question': 'Closest meaning: “insight (n)” ≈',
      'options': ['diễn giải', 'hiểu biết chuyên sâu', 'tóm tắt', 'bảng biểu'],
      'correctIndex': 1,
      'explain': 'insight = hiểu biết chuyên sâu.',
    },
    {
      'question': 'Opposite intent: If results do not “increase”, they…',
      'options': ['interpret', 'fluctuate', 'decrease', 'forecast'],
      'correctIndex': 2,
      'explain': 'decrease = giảm.',
    },
    {
      'question': 'Pick the best verb: Prices ___ all year due to demand.',
      'options': ['fluctuated', 'benchmarked', 'summarized', 'projected'],
      'correctIndex': 0,
      'explain': 'fluctuate = dao động.',
    },
    {
      'question': 'Context: We found an ___ in Q2 conversion.',
      'options': ['anomaly', 'appendix', 'table', 'KPI'],
      'correctIndex': 0,
      'explain': 'anomaly = bất thường.',
    },
    {
      'question': 'Usage: Set a new ___ for customer service.',
      'options': ['median', 'benchmark', 'figure', 'sample'],
      'correctIndex': 1,
      'explain': 'benchmark = chuẩn so sánh.',
    },
    {
      'question': 'Fill in: There’s a strong ___ between ads and sales.',
      'options': ['correlation', 'appendix', 'table', 'summary'],
      'correctIndex': 0,
      'explain': 'correlation = tương quan.',
    },
    {
      'question': 'Meaning: “figure (n)” in “See Figure 4.” means…',
      'options': ['hình/đồ thị', 'bảng phụ lục', 'tốc độ tăng', 'tóm tắt'],
      'correctIndex': 0,
      'explain': 'figure = hình/đồ thị.',
    },
    {
      'question': 'Choose the best: The “median” is ___ to outliers.',
      'options': [
        'less sensitive',
        'equal to mean',
        'a pie chart',
        'a raw dataset',
      ],
      'correctIndex': 0,
      'explain': 'median ít nhạy với ngoại lệ hơn mean.',
    },
    {
      'question': 'Completion: Please refer to ___ 2 for raw numbers.',
      'options': ['Figure', 'Table', 'Trend', 'KPI'],
      'correctIndex': 1,
      'explain': 'Table = bảng số liệu.',
    },
    {
      'question': 'Closest meaning: “summary (n)” ≈',
      'options': ['tóm tắt', 'đồ thị', 'phụ lục', 'mẫu'],
      'correctIndex': 0,
      'explain': 'summary = tóm tắt.',
    },
    {
      'question': 'Usage: The ___ slowed from 12% to 7%.',
      'options': ['growth rate', 'appendix', 'figure', 'median'],
      'correctIndex': 0,
      'explain': 'growth rate = tốc độ tăng trưởng.',
    },
    {
      'question': 'Choose: The CFO asked for three key ___.',
      'options': ['KPIs', 'figures', 'tables', 'appendices'],
      'correctIndex': 0,
      'explain': 'KPI = chỉ số hiệu suất.',
    },
    {
      'question': 'Meaning check: “interpretation (n)” is the…',
      'options': [
        'phân tích số liệu thô',
        'phần diễn giải ý nghĩa',
        'phụ lục tài liệu',
        'đồ thị cột',
      ],
      'correctIndex': 1,
      'explain': 'interpretation = diễn giải.',
    },
    {
      'question': 'Sentence: Please ___ key results for the board.',
      'options': ['highlight', 'appendix', 'dataset', 'median'],
      'correctIndex': 0,
      'explain': 'highlight = làm nổi bật.',
    },
    {
      'question': 'Pick one: The ___ includes raw CSV files.',
      'options': ['appendix', 'summary', 'figure', 'median'],
      'correctIndex': 0,
      'explain': 'appendix chứa dữ liệu thô đính kèm.',
    },
    {
      'question': 'Usage: The line graph clearly shows a positive ___.',
      'options': ['trend', 'anomaly', 'variance', 'table'],
      'correctIndex': 0,
      'explain': 'trend = xu hướng.',
    },
    {
      'question': 'Meaning: “finding (n)” differs from “insight (n)” because…',
      'options': [
        'finding = quan sát/kết quả; insight = diễn giải giá trị',
        'finding = tóm tắt; insight = dữ liệu thô',
        'finding = biểu đồ; insight = phụ lục',
        'cả hai là như nhau',
      ],
      'correctIndex': 0,
      'explain': 'finding là kết quả; insight là hiểu biết rút ra.',
    },
    {
      'question': 'Choose the term: A “pie chart” divides a circle into…',
      'options': ['segments', 'lines', 'tables', 'appendices'],
      'correctIndex': 0,
      'explain': 'pie chart → segments/phần trăm.',
    },
    {
      'question': 'Fill in the blank: We will present the Q4 sales ___.',
      'options': ['projection', 'appendix', 'median', 'sample'],
      'correctIndex': 0,
      'explain': 'projection = dự phóng.',
    },
    {
      'question':
          'Pick the best completion: The team prepared an executive ___.',
      'options': ['summary', 'trend', 'figure', 'dataset'],
      'correctIndex': 0,
      'explain': 'executive summary = tóm tắt điều hành.',
    },
    {
      'question': 'Context: A high ___ without context can be misleading.',
      'options': ['variance', 'table', 'figure', 'appendix'],
      'correctIndex': 0,
      'explain': 'variance cao cần diễn giải.',
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
        'topicName': 'Bài 1: Reports & Data Insights',
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
  // Vocab 2: Budgeting & Forecasting (50 câu; đáp án đúng không cố định ở index 0)
  // =========================
  final vocab2Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “budget (n)” most nearly means…',
      'options': ['chi phí cố định', 'ngân sách', 'biên lợi nhuận', 'dự phóng'],
      'correctIndex': 1,
      'explain': 'budget = ngân sách.',
    },
    {
      'question': 'Verb use: To “allocate (v)” funds means to…',
      'options': ['cắt giảm', 'phân bổ', 'phê duyệt', 'khấu hao'],
      'correctIndex': 1,
      'explain': 'allocate = phân bổ ngân sách/tài nguyên.',
    },
    {
      'question': 'Identify: “expenditure (n)” refers to…',
      'options': ['khoản chi', 'doanh thu', 'lợi tức đầu tư', 'thặng dư'],
      'correctIndex': 0,
      'explain': 'expenditure = chi tiêu/khoản chi.',
    },
    {
      'question': 'Choose the noun: Quarterly “revenue (n)” is…',
      'options': ['chi phí', 'dòng tiền', 'doanh thu', 'số dư'],
      'correctIndex': 2,
      'explain': 'revenue = doanh thu.',
    },
    {
      'question': 'Meaning: “cost (n)” is closest to…',
      'options': ['chi phí', 'vốn', 'dự phòng', 'chuẩn cơ sở'],
      'correctIndex': 0,
      'explain': 'cost = chi phí.',
    },
    {
      'question': 'Usage: Travel “expenses (n)” should be…',
      'options': [
        'khấu hao hằng năm',
        'theo dõi và báo cáo',
        'chuyển thành thặng dư',
        'đưa vào vốn',
      ],
      'correctIndex': 1,
      'explain': 'expense = khoản chi; cần tracking/report.',
    },
    {
      'question': 'Term: “overhead (n)” usually means…',
      'options': [
        'chi phí cố định/gián tiếp',
        'lợi nhuận gộp',
        'giả định',
        'số dư âm',
      ],
      'correctIndex': 0,
      'explain': 'overhead = chi phí cố định/gián tiếp.',
    },
    {
      'question': 'Pick the time unit: “fiscal year (n)” is…',
      'options': ['quý', 'năm tài chính', 'tháng kế toán', 'chu kỳ khấu hao'],
      'correctIndex': 1,
      'explain': 'fiscal year = năm tài chính.',
    },
    {
      'question': 'Choose the period: A “quarter (n)” equals…',
      'options': ['1 tháng', '3 tháng', '6 tháng', '12 tháng'],
      'correctIndex': 1,
      'explain': 'quarter = 3 tháng.',
    },
    {
      'question': 'Meaning: “projection (n)” most nearly means…',
      'options': ['dự phóng', 'phụ lục', 'khấu hao', 'vốn lưu động'],
      'correctIndex': 0,
      'explain': 'projection = dự phóng kết quả.',
    },
    {
      'question': 'Fill in: Provide a cost ___.',
      'options': ['approval', 'estimate', 'baseline', 'break-even'],
      'correctIndex': 1,
      'explain': 'estimate = ước tính.',
    },
    {
      'question': 'Meaning: “assumption (n)” in a model is…',
      'options': ['giả định', 'thặng dư', 'khấu hao', 'doanh thu'],
      'correctIndex': 0,
      'explain': 'assumption = giả định.',
    },
    {
      'question': 'Choose the best: Add a ___ fund for risks.',
      'options': ['variance', 'contingency', 'margin', 'baseline'],
      'correctIndex': 1,
      'explain': 'contingency fund = quỹ dự phòng.',
    },
    {
      'question': 'Opposite: “surplus (n)” is the opposite of…',
      'options': ['deficit', 'ROI', 'revenue', 'approval'],
      'correctIndex': 0,
      'explain': 'surplus ↔ deficit.',
    },
    {
      'question': 'Meaning: “deficit (n)” is…',
      'options': ['thâm hụt', 'thặng dư', 'khấu hao', 'phê duyệt'],
      'correctIndex': 0,
      'explain': 'deficit = thâm hụt.',
    },
    {
      'question': 'Context: Monitor “cash flow (n)” to ensure…',
      'options': [
        'tốc độ tăng trưởng',
        'dòng tiền dương',
        'khấu hao thấp',
        'chi phí cố định cao',
      ],
      'correctIndex': 1,
      'explain': 'cash flow = dòng tiền.',
    },
    {
      'question': 'Choose: Reach ___ point by Q4.',
      'options': ['variance', 'break-even', 'baseline', 'contingency'],
      'correctIndex': 1,
      'explain': 'break-even = hòa vốn.',
    },
    {
      'question': 'Abbreviation: “ROI (n)” stands for…',
      'options': [
        'Rate of Interest',
        'Return on Investment',
        'Revenue of Industry',
        'Risk of Investment',
      ],
      'correctIndex': 1,
      'explain': 'ROI = Return on Investment (lợi tức đầu tư).',
    },
    {
      'question': 'Meaning: “margin (n)” in finance is…',
      'options': [
        'biên lợi nhuận',
        'chi phí cố định',
        'hạn mức',
        'tỷ suất thuế',
      ],
      'correctIndex': 0,
      'explain': 'profit margin = biên lợi nhuận.',
    },
    {
      'question': 'Distinguish: “gross (adj)” vs “net (adj)” refer to…',
      'options': [
        'trước & sau khấu trừ',
        'doanh thu & chi phí',
        'vốn & nợ',
        'quý & năm',
      ],
      'correctIndex': 0,
      'explain': 'gross = gộp; net = ròng.',
    },
    {
      'question': 'Meaning: “net income (n)” is income…',
      'options': [
        'trước thuế',
        'sau khấu trừ/thuế',
        'chưa hạch toán',
        'dự kiến',
      ],
      'correctIndex': 1,
      'explain': 'net income = thu nhập ròng.',
    },
    {
      'question': 'Usage: Keep a positive account ___.',
      'options': ['variance', 'balance', 'approval', 'baseline'],
      'correctIndex': 1,
      'explain': 'balance = số dư.',
    },
    {
      'question': 'Meaning: Explain the “variance (n)”.',
      'options': ['chênh lệch', 'khoản chi', 'dự phòng', 'phụ lục'],
      'correctIndex': 0,
      'explain': 'variance = chênh lệch so với kế hoạch.',
    },
    {
      'question': 'Verb: We need to ___ the forecast after Q2.',
      'options': ['revise', 'allocate', 'approve', 'depreciate'],
      'correctIndex': 0,
      'explain': 'revise = điều chỉnh/dò lại.',
    },
    {
      'question': 'Process: Budget “approval (n)” means…',
      'options': ['từ chối', 'phê duyệt', 'trì hoãn', 'cắt giảm'],
      'correctIndex': 1,
      'explain': 'approval = phê duyệt.',
    },
    {
      'question': 'Meaning: “capital (n)” refers to…',
      'options': ['vốn', 'lãi suất', 'chi phí gián tiếp', 'doanh thu'],
      'correctIndex': 0,
      'explain': 'capital = vốn.',
    },
    {
      'question': 'Pick the phrase: “operating costs (n)” are…',
      'options': [
        'chi phí vận hành',
        'chi phí một lần',
        'vốn vay',
        'thuế suất',
      ],
      'correctIndex': 0,
      'explain': 'operating costs = chi phí vận hành.',
    },
    {
      'question': 'Accounting: Record annual “depreciation (n)”.',
      'options': ['khấu hao', 'khấu trừ thuế', 'tái cấp vốn', 'thanh lý'],
      'correctIndex': 0,
      'explain': 'depreciation = khấu hao.',
    },
    {
      'question': 'Choose the verb: We “___ (v/n)” expenses monthly.',
      'options': ['forecast', 'baseline', 'allocate', 'capitalize'],
      'correctIndex': 0,
      'explain': 'forecast = dự báo.',
    },
    {
      'question': 'Meaning: A cost “baseline (n)” is…',
      'options': ['chuẩn cơ sở', 'thặng dư', 'tài sản', 'khấu trừ'],
      'correctIndex': 0,
      'explain': 'baseline = đường chuẩn để so sánh.',
    },
    {
      'question': 'Usage: The board requested a 10% ___ in overhead.',
      'options': ['approval', 'reduction', 'assumption', 'variance'],
      'correctIndex': 1,
      'explain': 'reduction in overhead = giảm chi phí cố định.',
    },
    {
      'question': 'Completion: Cash flow turned ___.',
      'options': ['positive', 'gross', 'approved', 'operating'],
      'correctIndex': 0,
      'explain': 'positive cash flow = dòng tiền dương.',
    },
    {
      'question': 'Context: The company posted a budget ___.',
      'options': ['deficit', 'capital', 'ROI', 'baseline'],
      'correctIndex': 0,
      'explain': 'budget deficit = thâm hụt ngân sách.',
    },
    {
      'question': 'Term check: “surplus (n)” in budgeting is…',
      'options': ['thặng dư', 'giả định', 'khấu hao', 'vốn'],
      'correctIndex': 0,
      'explain': 'surplus = thặng dư.',
    },
    {
      'question': 'Choose the best: We target a 25% ___.',
      'options': ['variance', 'ROI', 'overhead', 'baseline'],
      'correctIndex': 1,
      'explain': 'ROI = lợi tức đầu tư.',
    },
    {
      'question': 'Fill in: Our gross ___ rose last quarter.',
      'options': ['margin', 'approval', 'baseline', 'contingency'],
      'correctIndex': 0,
      'explain': 'gross margin = biên lợi nhuận gộp.',
    },
    {
      'question': 'Usage: Please ___ funds to R&D.',
      'options': ['depreciate', 'allocate', 'revise', 'approve'],
      'correctIndex': 1,
      'explain': 'allocate funds = phân bổ ngân sách.',
    },
    {
      'question': 'Meaning: “estimate (v)” most nearly means…',
      'options': ['ước tính', 'phân bổ', 'khấu hao', 'phê duyệt'],
      'correctIndex': 0,
      'explain': 'estimate = ước tính.',
    },
    {
      'question': 'Select: The Q3 report shows higher operating ___.',
      'options': ['costs', 'capital', 'variance', 'baseline'],
      'correctIndex': 0,
      'explain': 'operating costs = chi phí vận hành.',
    },
    {
      'question': 'Which is true? “Gross profit” is calculated…',
      'options': [
        'trước khấu trừ/chi phí',
        'sau mọi chi phí',
        'sau thuế thu nhập',
        'chỉ từ dòng tiền',
      ],
      'correctIndex': 0,
      'explain': 'gross = trước các khấu trừ.',
    },
    {
      'question': 'Meaning: “net (adj)” income excludes…',
      'options': [
        'chưa trừ chi phí',
        'đã trừ chi phí/thuế',
        'doanh thu bán hàng',
        'giá vốn',
      ],
      'correctIndex': 1,
      'explain': 'net = sau khấu trừ.',
    },
    {
      'question': 'Choose the best: Tighten the travel ___.',
      'options': ['budget', 'ROI', 'capital', 'baseline'],
      'correctIndex': 0,
      'explain': 'travel budget = ngân sách đi lại.',
    },
    {
      'question': 'Closest meaning: “assumption (n)” ≈',
      'options': ['giả định', 'thặng dư', 'khấu hao', 'vốn hóa'],
      'correctIndex': 0,
      'explain': 'assumption = giả định.',
    },
    {
      'question': 'Usage: The CFO requested forecast ___.',
      'options': ['revenue', 'revisions', 'capital', 'depreciation'],
      'correctIndex': 1,
      'explain': 'forecast revisions = điều chỉnh dự báo.',
    },
    {
      'question': 'Pick one: We must seek budget ___.',
      'options': ['approval', 'variance', 'surplus', 'quarter'],
      'correctIndex': 0,
      'explain': 'budget approval = phê duyệt ngân sách.',
    },
    {
      'question': 'Context: Increase the contingency ___ by 5%.',
      'options': ['fund', 'ROI', 'capital', 'quarter'],
      'correctIndex': 0,
      'explain': 'contingency fund = quỹ dự phòng.',
    },
    {
      'question': 'Complete: The board approved new ___.',
      'options': ['capital', 'depreciation', 'variance', 'break-even'],
      'correctIndex': 0,
      'explain': 'raise/approve new capital = vốn.',
    },
    {
      'question': 'Concept: A negative cash flow may still occur with…',
      'options': [
        'thặng dư',
        'lợi nhuận ròng dương',
        'khấu hao cao',
        'vốn hóa',
      ],
      'correctIndex': 2,
      'explain': 'khấu hao cao có thể làm giảm dòng tiền.',
    },
    {
      'question': 'Which fits best? The firm aims to hit ___ in Q3.',
      'options': ['baseline', 'break-even', 'variance', 'surplus'],
      'correctIndex': 1,
      'explain': 'điểm hòa vốn = break-even.',
    },
    {
      'question': 'Meaning: “baseline (n)” in planning is…',
      'options': [
        'chuẩn cơ sở để so sánh',
        'chi phí gián tiếp',
        'dòng tiền âm',
        'vốn chủ sở hữu',
      ],
      'correctIndex': 0,
      'explain': 'baseline = chuẩn so sánh.',
    },
    {
      'question': 'Usage: We need to justify the cost ___.',
      'options': ['variance', 'capital', 'quarter', 'ROI'],
      'correctIndex': 0,
      'explain': 'giải thích chênh lệch chi phí.',
    },
    {
      'question': 'Completion: The company reported higher Q2 ___.',
      'options': ['revenue', 'assumptions', 'depreciation', 'baseline'],
      'correctIndex': 0,
      'explain': 'revenue = doanh thu.',
    },
    {
      'question': 'Closest meaning: “overhead (n)” ≈',
      'options': [
        'chi phí cố định/gián tiếp',
        'lợi nhuận sau thuế',
        'dự phóng',
        'thặng dư',
      ],
      'correctIndex': 0,
      'explain': 'overhead = fixed/indirect costs.',
    },
    {
      'question': 'Fill in: The plan includes conservative ___.',
      'options': ['projections', 'quarters', 'capitals', 'surpluses'],
      'correctIndex': 0,
      'explain': 'conservative projections = dự phóng thận trọng.',
    },
  ];

  // Ghi metadata của bài luyện vocab2
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab2")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 2: Budgeting & Forecasting',
        'questionCount': vocab2Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 3: Contracts & Legal Terms (50 câu; đáp án đúng không cố định ở index 0)
  // =========================
  final vocab3Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “clause (n)” most nearly means…',
      'options': ['điều khoản', 'tranh chấp', 'hòa giải', 'đối giá'],
      'correctIndex': 0,
      'explain': 'clause = điều khoản trong hợp đồng.',
    },
    {
      'question': 'Identify: “liability (n)” refers to…',
      'options': ['bảo hành', 'trách nhiệm pháp lý', 'gia hạn', 'trọng tài'],
      'correctIndex': 1,
      'explain': 'liability = trách nhiệm pháp lý.',
    },
    {
      'question': 'Verb: To “indemnify (v)” a client means…',
      'options': ['bồi thường', 'chấm dứt', 'gia hạn', 'hủy bỏ toàn bộ'],
      'correctIndex': 0,
      'explain': 'indemnify = bồi thường thiệt hại.',
    },
    {
      'question': 'Noun: An “indemnity (n)” is…',
      'options': [
        'điều khoản cấm bán lại',
        'khoản bồi thường',
        'bản sửa đổi',
        'điều khoản toàn bộ thỏa thuận',
      ],
      'correctIndex': 1,
      'explain': 'indemnity = khoản bồi thường.',
    },
    {
      'question': 'Choose the best: A one-year “warranty (n)” is…',
      'options': [
        'bảo hành',
        'trọng tài',
        'thỏa thuận không tiết lộ',
        'bất khả kháng',
      ],
      'correctIndex': 0,
      'explain': 'warranty = bảo hành.',
    },
    {
      'question': 'Meaning: A “representation (n)” in a contract is…',
      'options': [
        'điều khoản không cạnh tranh',
        'lời cam đoan',
        'bản ký tương ứng',
        'tính tách biệt điều khoản',
      ],
      'correctIndex': 1,
      'explain': 'representation = lời cam đoan/sự trình bày sự thật.',
    },
    {
      'question': 'Meaning: A “covenant (n)” most nearly means…',
      'options': [
        'cam kết ràng buộc',
        'trọng tài',
        'đối giá',
        'tòa có thẩm quyền',
      ],
      'correctIndex': 0,
      'explain': 'covenant = cam kết ràng buộc.',
    },
    {
      'question': 'Usage: They are in ___ of contract.',
      'options': ['renewal', 'breach', 'assignment', 'remedy'],
      'correctIndex': 1,
      'explain': 'breach of contract = vi phạm hợp đồng.',
    },
    {
      'question': 'Verb: Either party may ___ the agreement.',
      'options': ['terminate', 'mediate', 'append', 'counterpart'],
      'correctIndex': 0,
      'explain': 'terminate = chấm dứt.',
    },
    {
      'question': 'Noun: “termination (n)” is the act of…',
      'options': ['chấm dứt', 'điều chỉnh', 'chuyển nhượng', 'gia hạn'],
      'correctIndex': 0,
      'explain': 'termination = sự chấm dứt.',
    },
    {
      'question': 'Verb: We will ___ the agreement for another year.',
      'options': ['breach', 'renew', 'indemnify', 'amend'],
      'correctIndex': 1,
      'explain': 'renew = gia hạn.',
    },
    {
      'question': 'Noun: “renewal (n)” means…',
      'options': [
        'trọng tài',
        'gia hạn',
        'không tiết lộ',
        'điều khoản tách biệt',
      ],
      'correctIndex': 1,
      'explain': 'renewal = việc gia hạn.',
    },
    {
      'question': 'Meaning: “assignment (n)” of a contract is…',
      'options': [
        'chuyển nhượng',
        'điều khoản toàn bộ thỏa thuận',
        'trọng tài',
        'đối giá',
      ],
      'correctIndex': 0,
      'explain': 'assignment = chuyển nhượng quyền/nghĩa vụ.',
    },
    {
      'question': 'Choose: The “governing law (n)” clause sets…',
      'options': [
        'quy trình hòa giải',
        'luật điều chỉnh',
        'phụ lục kỹ thuật',
        'điều khoản bảo hành',
      ],
      'correctIndex': 1,
      'explain': 'governing law = luật điều chỉnh hợp đồng.',
    },
    {
      'question': 'Term: “jurisdiction (n)” refers to…',
      'options': [
        'thẩm quyền tòa',
        'đối giá',
        'không cạnh tranh',
        'bản ký tương ứng',
      ],
      'correctIndex': 0,
      'explain': 'jurisdiction = thẩm quyền xét xử.',
    },
    {
      'question': 'Meaning: “force majeure (n)” covers…',
      'options': [
        'bất khả kháng',
        'biện pháp khắc phục',
        'điều khoản bảo mật',
        'điều khoản sửa đổi',
      ],
      'correctIndex': 0,
      'explain': 'force majeure = bất khả kháng.',
    },
    {
      'question': 'Term: “confidentiality (n)” is about…',
      'options': ['gia hạn', 'bảo mật', 'bảo hành', 'trọng tài'],
      'correctIndex': 1,
      'explain': 'confidentiality = bảo mật.',
    },
    {
      'question': 'Identify: Sign an “NDA (non-disclosure agreement)” to…',
      'options': ['không tiết lộ', 'không cạnh tranh', 'chấm dứt', 'gia hạn'],
      'correctIndex': 0,
      'explain': 'non-disclosure = không tiết lộ.',
    },
    {
      'question': 'Term: A “non-compete (n)” clause means…',
      'options': [
        'không cạnh tranh',
        'không tiết lộ',
        'bản sửa đổi',
        'điều khoản toàn bộ thỏa thuận',
      ],
      'correctIndex': 0,
      'explain': 'non-compete = không cạnh tranh.',
    },
    {
      'question': 'Meaning: “consideration (n)” in contract law is…',
      'options': [
        'đối giá/giá trị trao đổi',
        'thẩm quyền',
        'hòa giải',
        'trọng tài',
      ],
      'correctIndex': 0,
      'explain': 'consideration = đối giá.',
    },
    {
      'question': 'Term: Sign in two “counterparts (n)” means…',
      'options': [
        'hai bản ký tương ứng',
        'hai bản sửa đổi',
        'hai điều khoản bảo mật',
        'hai tòa án thẩm quyền',
      ],
      'correctIndex': 0,
      'explain': 'counterparts = các bản ký tương ứng.',
    },
    {
      'question': 'Meaning: “severability (n)” protects…',
      'options': [
        'tính tách biệt điều khoản',
        'gia hạn tự động',
        'bản ký tương ứng',
        'trọng tài bắt buộc',
      ],
      'correctIndex': 0,
      'explain': 'severability = điều khoản còn lại vẫn có hiệu lực.',
    },
    {
      'question': 'Phrase: The “entire agreement (n)” clause means…',
      'options': [
        'toàn bộ thỏa thuận',
        'không cạnh tranh',
        'bản sửa đổi',
        'hòa giải',
      ],
      'correctIndex': 0,
      'explain': 'entire agreement = toàn bộ thỏa thuận giữa các bên.',
    },
    {
      'question': 'Verb: Parties may ___ the contract in writing.',
      'options': ['amend', 'terminate', 'indemnify', 'mediate'],
      'correctIndex': 0,
      'explain': 'amend = sửa đổi.',
    },
    {
      'question': 'Noun: An “amendment (n)” is a…',
      'options': [
        'bản sửa đổi',
        'bản ký tương ứng',
        'biện pháp khắc phục',
        'điều khoản bảo hành',
      ],
      'correctIndex': 0,
      'explain': 'amendment = bản sửa đổi.',
    },
    {
      'question': 'Meaning: A “dispute (n)” is a…',
      'options': ['tranh chấp', 'điều khoản bảo mật', 'đối giá', 'gia hạn'],
      'correctIndex': 0,
      'explain': 'dispute = tranh chấp.',
    },
    {
      'question': 'Term: “arbitration (n)” is…',
      'options': ['trọng tài', 'hòa giải', 'khởi kiện công khai', 'thẩm quyền'],
      'correctIndex': 0,
      'explain': 'arbitration = trọng tài (ràng buộc).',
    },
    {
      'question': 'Term: “mediation (n)” usually occurs…',
      'options': [
        'sau xét xử',
        'trước hoặc thay kiện tụng',
        'song song khởi kiện',
        'sau gia hạn',
      ],
      'correctIndex': 1,
      'explain': 'mediation = hòa giải, thường trước tố tụng.',
    },
    {
      'question': 'Meaning: A legal “remedy (n)” is…',
      'options': [
        'biện pháp khắc phục',
        'điều khoản toàn bộ thỏa thuận',
        'bản sửa đổi',
        'điều khoản tách biệt',
      ],
      'correctIndex': 0,
      'explain': 'remedy = biện pháp khắc phục (tiền/phi tiền).',
    },
    {
      'question': 'Term: “liquidated damages (n)” are…',
      'options': [
        'tiền phạt định trước',
        'phí trọng tài',
        'đối giá',
        'phí bảo hành',
      ],
      'correctIndex': 0,
      'explain': 'liquidated damages = mức phạt định sẵn khi vi phạm.',
    },
    {
      'question': 'Usage: A court order to stop an act is an…',
      'options': ['injunction', 'assignment', 'counterpart', 'renewal'],
      'correctIndex': 0,
      'explain': 'injunction = lệnh cấm (một dạng remedy).',
    },
    {
      'question': 'Choose: A promise about present fact is a…',
      'options': ['representation', 'covenant', 'amendment', 'jurisdiction'],
      'correctIndex': 0,
      'explain': 'representation mô tả sự thật hiện tại.',
    },
    {
      'question': 'Choose: A promise to do (or not do) something is a…',
      'options': ['covenant', 'warranty', 'counterpart', 'severability'],
      'correctIndex': 0,
      'explain': 'covenant = cam kết hành vi.',
    },
    {
      'question': 'Completion: “This Agreement shall be governed by ___ law.”',
      'options': ['governing', 'counterpart', 'severability', 'arbitration'],
      'correctIndex': 0,
      'explain': 'governed by governing law = luật điều chỉnh.',
    },
    {
      'question': 'Pick the best: “Exclusive ___ of the courts of Singapore.”',
      'options': ['jurisdiction', 'remedy', 'consideration', 'renewal'],
      'correctIndex': 0,
      'explain': 'exclusive jurisdiction = thẩm quyền riêng.',
    },
    {
      'question': 'Meaning: “counterparts” allow parties to…',
      'options': [
        'ký ở nhiều bản tương ứng',
        'gia hạn tự động',
        'chuyển nhượng miễn chấp thuận',
        'bảo hành trọn đời',
      ],
      'correctIndex': 0,
      'explain': 'counterparts = ký ở nhiều bản giống nhau.',
    },
    {
      'question': 'Opposite: The opposite of “breach” is…',
      'options': ['performance', 'termination', 'assignment', 'amendment'],
      'correctIndex': 0,
      'explain': 'performance = thực hiện đúng hợp đồng.',
    },
    {
      'question':
          'Usage: A clause that keeps other terms valid if one is void is…',
      'options': ['severability', 'warranty', 'injunction', 'renewal'],
      'correctIndex': 0,
      'explain': 'severability bảo vệ phần còn lại.',
    },
    {
      'question': 'Meaning: “entire agreement” prevents…',
      'options': [
        'các thỏa thuận miệng trước đó được viện dẫn',
        'gia hạn tự động',
        'chuyển nhượng bắt buộc',
        'trọng tài bắt buộc',
      ],
      'correctIndex': 0,
      'explain': 'chỉ văn bản hiện tại chi phối.',
    },
    {
      'question':
          'Choose the verb: Parties may ___ disputes by mediation first.',
      'options': ['settle', 'renew', 'assign', 'terminate'],
      'correctIndex': 0,
      'explain': 'settle disputes = giải quyết tranh chấp.',
    },
    {
      'question': 'Meaning: A “non-compete” typically applies…',
      'options': [
        'trong/ sau thời gian làm việc',
        'chỉ trong thời gian bảo hành',
        'trong quá trình ký đối giá',
        'khi hủy gia hạn',
      ],
      'correctIndex': 0,
      'explain': 'không cạnh tranh trong/ sau employment.',
    },
    {
      'question': 'Identify: “consideration” must be…',
      'options': [
        'có giá trị trao đổi',
        'do tòa chỉ định',
        'mang tính miễn trừ',
        'không cần trong hợp đồng',
      ],
      'correctIndex': 0,
      'explain': 'đối giá là điều kiện hình thành hợp đồng.',
    },
    {
      'question': 'Completion: Delays will trigger ___ damages.',
      'options': ['liquidated', 'confidential', 'governing', 'entire'],
      'correctIndex': 0,
      'explain': 'liquidated damages khi chậm trễ.',
    },
    {
      'question':
          'Pick the best: A promise about product quality is usually a…',
      'options': ['warranty', 'covenant', 'injunction', 'counterpart'],
      'correctIndex': 0,
      'explain': 'warranty = bảo hành/chất lượng.',
    },
    {
      'question': 'Meaning: “assignment requires consent” implies…',
      'options': [
        'không được tự ý chuyển nhượng',
        'được tự do chuyển nhượng',
        'bắt buộc hòa giải',
        'tự động gia hạn',
      ],
      'correctIndex': 0,
      'explain': 'cần chấp thuận mới chuyển nhượng.',
    },
    {
      'question': 'Usage: “Without prejudice to other ___ available at law.”',
      'options': ['remedies', 'counterparts', 'renewals', 'jurisdictions'],
      'correctIndex': 0,
      'explain': 'remedies = biện pháp khắc phục.',
    },
    {
      'question': 'Choose: Confidentiality obligations usually survive…',
      'options': ['termination', 'assignment', 'consideration', 'counterparts'],
      'correctIndex': 0,
      'explain': 'bảo mật thường sống sót sau chấm dứt.',
    },
    {
      'question': 'Meaning: “Time is of the essence” makes deadlines…',
      'options': [
        'mang tính trọng yếu',
        'mang tính tham khảo',
        'không ràng buộc',
        'chỉ áp dụng khi gia hạn',
      ],
      'correctIndex': 0,
      'explain': 'vi phạm thời hạn = vi phạm trọng yếu.',
    },
    {
      'question': 'Context: “Specific performance” requires a party to…',
      'options': [
        'thực hiện đúng nghĩa vụ',
        'bồi thường tiền',
        'chấm dứt hợp đồng',
        'hòa giải bắt buộc',
      ],
      'correctIndex': 0,
      'explain': 'biện pháp buộc thực hiện đúng cam kết.',
    },
    {
      'question': 'Usage: “Material breach” is a breach that…',
      'options': [
        'ảnh hưởng trọng yếu',
        'không đáng kể',
        'chỉ liên quan bảo mật',
        'chỉ khi bất khả kháng',
      ],
      'correctIndex': 0,
      'explain': 'material = trọng yếu, có thể dẫn đến chấm dứt.',
    },
    {
      'question': 'Meaning: “Survive termination” means a clause…',
      'options': [
        'vẫn có hiệu lực sau chấm dứt',
        'hết hiệu lực khi ký',
        'chỉ áp dụng trước khi ký',
        'tự động vô hiệu',
      ],
      'correctIndex': 0,
      'explain': 'survival clause duy trì hiệu lực.',
    },
    {
      'question':
          'Choose: “Governing law” differs from “jurisdiction” because…',
      'options': [
        'luật áp dụng ≠ tòa có thẩm quyền',
        'cả hai đều là bảo mật',
        'đều là đối giá',
        'đều là hòa giải',
      ],
      'correctIndex': 0,
      'explain': 'law áp dụng vs. nơi giải quyết.',
    },
    {
      'question': 'Completion: “This amendment shall form part of the ___.”',
      'options': ['Agreement', 'Remedy', 'Jurisdiction', 'Counterpart'],
      'correctIndex': 0,
      'explain': 'amendment là một phần của Agreement.',
    },
    {
      'question': 'Pick the best: “Arbitration is binding” means the award…',
      'options': [
        'có hiệu lực ràng buộc',
        'chỉ mang tính khuyến nghị',
        'không cần thi hành',
        'bị vô hiệu ngay',
      ],
      'correctIndex': 0,
      'explain': 'binding award = phải thi hành.',
    },
    {
      'question': 'Meaning: “Notice (n)” clause sets rules for…',
      'options': [
        'cách thức gửi thông báo',
        'điều khoản bảo hành',
        'điều khoản bất khả kháng',
        'điều khoản không cạnh tranh',
      ],
      'correctIndex': 0,
      'explain': 'notice = quy định thông báo hợp lệ.',
    },
  ];

  // Ghi metadata của bài luyện vocab3
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab3")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 3: Contracts & Legal Terms',
        'questionCount': vocab3Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
          'imagePath': null,
          'audioPath': null,
        }, SetOptions(merge: true));
  }

  // =========================
  // Vocab 4: Procurement Advanced (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab4Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “vendor evaluation (n)” most nearly means…',
      'options': [
        'kết nạp nhà bán',
        'đánh giá nhà bán',
        'yêu cầu thông tin',
        'đơn đặt theo khung',
      ],
      'correctIndex': 1,
      'explain': 'vendor evaluation = đánh giá nhà cung cấp/nhà bán.',
    },
    {
      'question': 'Identify: A “supplier shortlist (n)” is…',
      'options': [
        'danh sách rút gọn NCC',
        'thư mời thầu',
        'hợp đồng khung',
        'điều khoản thanh toán theo mốc',
      ],
      'correctIndex': 0,
      'explain': 'shortlist = danh sách rút gọn.',
    },
    {
      'question': 'Term: “prequalification (n)” refers to…',
      'options': [
        'điều chỉnh giá',
        'tiền thẩm định',
        'bàn giao',
        'leo thang xử lý',
      ],
      'correctIndex': 1,
      'explain': 'prequalification = tiền thẩm định năng lực.',
    },
    {
      'question':
          'Choose the noun: Provide detailed “technical specification(s)”.',
      'options': [
        'thông số kỹ thuật',
        'điều khoản thương mại',
        'điều kiện giao hàng',
        'điều khoản phạt',
      ],
      'correctIndex': 0,
      'explain': 'technical specifications = thông số kỹ thuật.',
    },
    {
      'question': 'Meaning: “commercial terms (n)” are…',
      'options': [
        'điều khoản thương mại',
        'điều khoản pháp lý',
        'hồ sơ phát hành',
        'yêu cầu thông tin',
      ],
      'correctIndex': 0,
      'explain': 'commercial terms = điều khoản thương mại (giá, thanh toán…).',
    },
    {
      'question': 'Identify: “Incoterms (n)” define…',
      'options': [
        'thẩm quyền tòa',
        'điều kiện thương mại quốc tế',
        'quy trình nghiệm thu',
        'khung giờ dịch vụ',
      ],
      'correctIndex': 1,
      'explain':
          'Incoterms = quy định trách nhiệm, rủi ro, chi phí khi giao hàng quốc tế.',
    },
    {
      'question': 'Pick the correct: Price is quoted ___ Hanoi.',
      'options': ['CIF', 'SLA', 'FOB', 'KPI'],
      'correctIndex': 2,
      'explain': 'FOB Hanoi = Giao lên tàu tại Hà Nội.',
    },
    {
      'question': 'Meaning: An offer including insurance & freight is…',
      'options': ['FOB', 'CIF', 'EXW', 'FCA'],
      'correctIndex': 1,
      'explain': 'CIF = Cost, Insurance and Freight.',
    },
    {
      'question': 'Term: A “bid bond (n)” is…',
      'options': [
        'bảo lãnh dự thầu',
        'bảo lãnh thực hiện',
        'tiền phạt định trước',
        'điều khoản mức dịch vụ',
      ],
      'correctIndex': 0,
      'explain': 'bid bond bảo đảm năng lực/thiện chí dự thầu.',
    },
    {
      'question': 'Meaning: A “performance bond (n)” guarantees…',
      'options': [
        'thanh toán theo mốc',
        'thực hiện hợp đồng',
        'điều chỉnh giá',
        'giao theo khung',
      ],
      'correctIndex': 1,
      'explain': 'performance bond = bảo lãnh thực hiện.',
    },
    {
      'question': 'Choose: “liquidated damages (n)” are…',
      'options': [
        'phạt vi phạm tiến độ định trước',
        'cước vận chuyển',
        'phí lưu kho',
        'phí bốc dỡ',
      ],
      'correctIndex': 0,
      'explain': 'LDs = mức phạt định sẵn (thường do chậm trễ).',
    },
    {
      'question': 'Identify: “service level agreement (SLA)” specifies…',
      'options': [
        'thời gian hoạt động, chỉ tiêu dịch vụ',
        'điều kiện giao hàng',
        'thẩm quyền',
        'điều khoản bảo mật',
      ],
      'correctIndex': 0,
      'explain': 'SLA quy định mức dịch vụ/uptime/resp time.',
    },
    {
      'question': 'Term: A “penalty schedule (n)” is a…',
      'options': [
        'bảng phạt',
        'lịch bàn giao',
        'bảng thông số',
        'bảng ngân sách',
      ],
      'correctIndex': 0,
      'explain': 'penalty schedule = bảng phạt.',
    },
    {
      'question': 'Meaning: A “deliverable (n)” in a contract is…',
      'options': [
        'hạng mục giao hàng',
        'khung giờ dịch vụ',
        'phụ lục kỹ thuật',
        'giá cơ sở',
      ],
      'correctIndex': 0,
      'explain': 'deliverable = đầu ra phải bàn giao.',
    },
    {
      'question': 'Choose: “milestone payment (n)” means payment…',
      'options': [
        'khi hoàn tất từng mốc',
        'khi kết thúc toàn bộ',
        'trả trước 100%',
        'sau nghiệm thu 90 ngày',
      ],
      'correctIndex': 0,
      'explain': 'thanh toán theo mốc hoàn thành.',
    },
    {
      'question': 'Term: A “change order (n)” is an order to…',
      'options': [
        'điều chỉnh phạm vi',
        'tăng cước vận chuyển',
        'gia hạn bảo hành',
        'thay địa điểm giao',
      ],
      'correctIndex': 0,
      'explain': 'change order = lệnh thay đổi (scope/price/time).',
    },
    {
      'question': 'Meaning: “acceptance test (n)” is a test for…',
      'options': ['nghiệm thu', 'tiền thẩm định', 'bảo hành', 'khóa NCC'],
      'correctIndex': 0,
      'explain': 'acceptance test = kiểm tra nghiệm thu.',
    },
    {
      'question': 'Choose the noun: “handover (n)” refers to…',
      'options': [
        'bàn giao',
        'thanh toán',
        'điều chỉnh giá',
        'điều khoản khung',
      ],
      'correctIndex': 0,
      'explain': 'handover = bàn giao.',
    },
    {
      'question': 'Identify: “service window (n)” means…',
      'options': [
        'khung giờ dịch vụ',
        'cửa sổ thanh toán',
        'cửa sổ đặt hàng',
        'cửa sổ giảm giá',
      ],
      'correctIndex': 0,
      'explain': 'service window = khung giờ phục vụ/bảo trì.',
    },
    {
      'question': 'Meaning: “escalation (n)” in support is…',
      'options': [
        'leo thang xử lý',
        'điều chỉnh giá',
        'điều chỉnh lịch',
        'rút gọn danh sách',
      ],
      'correctIndex': 0,
      'explain': 'escalation path = lộ trình leo thang xử lý sự cố.',
    },
    {
      'question': 'Pick the risk: “vendor lock-in (n)” describes…',
      'options': [
        'phụ thuộc 1 NCC',
        'mua từ 2 nguồn',
        'so sánh chuẩn',
        'tổng chi phí sở hữu',
      ],
      'correctIndex': 0,
      'explain': 'vendor lock-in = phụ thuộc 1 nhà cung cấp.',
    },
    {
      'question': 'Term: “dual sourcing (n)” means…',
      'options': [
        'mua từ 2 nguồn',
        'mua theo khung',
        'mua trả trước',
        'mua giao ngay',
      ],
      'correctIndex': 0,
      'explain': 'dual sourcing = mua từ hai nguồn để giảm rủi ro.',
    },
    {
      'question': 'Meaning: “benchmarking (n)” is…',
      'options': [
        'so sánh chuẩn',
        'tối ưu tồn kho',
        'định tuyến vận tải',
        'định mức lao động',
      ],
      'correctIndex': 0,
      'explain': 'price benchmarking = so sánh với mức chuẩn thị trường.',
    },
    {
      'question': 'Choose: “total cost of ownership (TCO) (n)” includes…',
      'options': [
        'chỉ giá mua',
        'mọi chi phí vòng đời',
        'chỉ phí vận chuyển',
        'chỉ chi phí bảo hành',
      ],
      'correctIndex': 1,
      'explain': 'TCO = tổng chi phí sở hữu toàn vòng đời.',
    },
    {
      'question': 'Identify: “request for information (RFI) (n)” is used to…',
      'options': [
        'thu thập thông tin',
        'đề nghị báo giá ràng buộc',
        'ra lệnh thay đổi',
        'phạt vi phạm',
      ],
      'correctIndex': 0,
      'explain': 'RFI = bước đầu thu thập thông tin thị trường.',
    },
    {
      'question': 'Meaning: “vendor onboarding (n)” is…',
      'options': [
        'kết nạp nhà bán',
        'đánh giá nhà bán',
        'đơn đặt theo khung',
        'gia hạn bảo hành',
      ],
      'correctIndex': 0,
      'explain': 'onboarding = quy trình kết nạp/thiết lập NCC.',
    },
    {
      'question': 'Term: “SLAs & KPIs (n)” should be…',
      'options': [
        'có thể đo lường',
        'mang tính tham khảo',
        'không ràng buộc',
        'bảo mật tuyệt đối',
      ],
      'correctIndex': 0,
      'explain': 'SLA & KPI cần measurable.',
    },
    {
      'question': 'Meaning: A “framework agreement (n)” is…',
      'options': [
        'thỏa thuận khung',
        'bản sửa đổi',
        'bảo lãnh thực hiện',
        'điều khoản tách biệt',
      ],
      'correctIndex': 0,
      'explain': 'framework agreement = khung pháp lý/điều khoản chung.',
    },
    {
      'question': 'Choose: A “call-off order (n)” is an order…',
      'options': [
        'theo thỏa thuận khung',
        'giao ngay',
        'đấu giá ngược',
        'trả trước 100%',
      ],
      'correctIndex': 0,
      'explain': 'call-off: đơn phát sinh dựa trên hợp đồng khung.',
    },
    {
      'question': 'Meaning: “price adjustment (n)” clause allows…',
      'options': [
        'điều chỉnh giá',
        'điều chỉnh lịch',
        'điều chỉnh chất lượng',
        'điều chỉnh thẩm quyền',
      ],
      'correctIndex': 0,
      'explain': 'price adjustment = cơ chế đổi giá theo chỉ số/biến động.',
    },
    {
      'question': 'Usage: We finished the ___ for three bidders.',
      'options': [
        'vendor evaluation',
        'service window',
        'call-off order',
        'acceptance test',
      ],
      'correctIndex': 0,
      'explain': 'hoàn tất đánh giá nhà bán.',
    },
    {
      'question': 'Fill in: Create a supplier ___.',
      'options': ['shortlist', 'lock-in', 'escalation', 'onboarding'],
      'correctIndex': 0,
      'explain': 'danh sách rút gọn NCC.',
    },
    {
      'question': 'Choose the best: Run ___ checks before inviting bids.',
      'options': ['prequalification', 'handover', 'SLA', 'price adjustment'],
      'correctIndex': 0,
      'explain': 'tiền thẩm định trước khi mời thầu.',
    },
    {
      'question': 'Completion: Provide detailed technical ___.',
      'options': ['specifications', 'penalties', 'benchmarks', 'call-offs'],
      'correctIndex': 0,
      'explain': 'thông số kỹ thuật.',
    },
    {
      'question': 'Pick one: Negotiate fair ___ terms.',
      'options': ['commercial', 'jurisdiction', 'lock-in', 'handover'],
      'correctIndex': 0,
      'explain': 'điều khoản thương mại.',
    },
    {
      'question': 'Identify: Under ___, the seller covers insurance & freight.',
      'options': ['FOB', 'CIF', 'EXW', 'DDP'],
      'correctIndex': 1,
      'explain': 'CIF bao gồm bảo hiểm & cước.',
    },
    {
      'question': 'Meaning: Submit a ___ bond with your tender.',
      'options': ['bid', 'performance', 'service', 'framework'],
      'correctIndex': 0,
      'explain': 'bid bond kèm hồ sơ thầu.',
    },
    {
      'question': 'Choose: A ___ bond is required after contract award.',
      'options': ['performance', 'bid', 'penalty', 'price'],
      'correctIndex': 0,
      'explain': 'bảo lãnh thực hiện khi trúng thầu.',
    },
    {
      'question': 'Completion: LDs apply for delivery ___.',
      'options': ['delays', 'prequalification', 'onboarding', 'shortlist'],
      'correctIndex': 0,
      'explain': 'phạt chậm tiến độ.',
    },
    {
      'question': 'Usage: The ___ defines uptime and response time.',
      'options': ['SLA', 'RFI', 'TCO', 'KPI'],
      'correctIndex': 0,
      'explain': 'SLA quy định mức dịch vụ.',
    },
    {
      'question': 'Meaning: List all project ___.',
      'options': ['deliverables', 'call-offs', 'Incoterms', 'onboardings'],
      'correctIndex': 0,
      'explain': 'deliverables = hạng mục giao.',
    },
    {
      'question': 'Context: Payment will be made by project ___.',
      'options': ['milestones', 'windows', 'benchmarks', 'lock-ins'],
      'correctIndex': 0,
      'explain': 'thanh toán theo mốc.',
    },
    {
      'question': 'Choose: Approve a ___ order to add extra scope.',
      'options': ['change', 'call-off', 'framework', 'acceptance'],
      'correctIndex': 0,
      'explain': 'change order = bổ sung/thay đổi scope.',
    },
    {
      'question': 'Fill in: Schedule the final ___ test next week.',
      'options': ['acceptance', 'escrow', 'margin', 'variance'],
      'correctIndex': 0,
      'explain': 'kiểm tra nghiệm thu.',
    },
    {
      'question': 'Usage: Prepare for system ___.',
      'options': ['handover', 'lock-in', 'prequal', 'benchmark'],
      'correctIndex': 0,
      'explain': 'bàn giao hệ thống.',
    },
    {
      'question': 'Term: Set a weekend service ___.',
      'options': ['window', 'bond', 'shortlist', 'call-off'],
      'correctIndex': 0,
      'explain': 'khung giờ dịch vụ.',
    },
    {
      'question': 'Choose: Define the ___ path for critical incidents.',
      'options': ['escalation', 'onboarding', 'framework', 'deliverable'],
      'correctIndex': 0,
      'explain': 'lộ trình leo thang.',
    },
    {
      'question': 'Risk control: Avoid vendor ___.',
      'options': ['lock-in', 'handover', 'acceptance', 'incoterms'],
      'correctIndex': 0,
      'explain': 'tránh phụ thuộc duy nhất 1 NCC.',
    },
    {
      'question': 'Strategy: Adopt ___ sourcing for key parts.',
      'options': ['dual', 'single', 'random', 'spot'],
      'correctIndex': 0,
      'explain': 'dual sourcing = 2 nguồn.',
    },
    {
      'question': 'Analytics: Do price ___.',
      'options': ['benchmarking', 'handover', 'call-off', 'onboarding'],
      'correctIndex': 0,
      'explain': 'so sánh chuẩn.',
    },
    {
      'question': 'Finance: Calculate 3-year ___.',
      'options': ['TCO', 'RFI', 'SLA', 'FOB'],
      'correctIndex': 0,
      'explain': 'tổng chi phí sở hữu.',
    },
    {
      'question': 'Process: Send an ___ first to understand the market.',
      'options': ['RFI', 'SLA', 'LD', 'PO'],
      'correctIndex': 0,
      'explain': 'Request For Information.',
    },
    {
      'question': 'Operations: Speed up vendor ___.',
      'options': ['onboarding', 'lock-in', 'escalation', 'call-off'],
      'correctIndex': 0,
      'explain': 'kết nạp NCC.',
    },
    {
      'question': 'Governance: SLAs and KPIs should be…',
      'options': ['measurable', 'secret', 'optional', 'verbal only'],
      'correctIndex': 0,
      'explain': 'đo lường được.',
    },
    {
      'question': 'Legal form: Sign a ___ agreement for long-term supply.',
      'options': ['framework', 'penalty', 'RFI', 'window'],
      'correctIndex': 0,
      'explain': 'thỏa thuận khung.',
    },
    {
      'question': 'Procurement: Issue monthly ___ orders under the frame.',
      'options': ['call-off', 'change', 'acceptance', 'benchmark'],
      'correctIndex': 0,
      'explain': 'đơn đặt theo khung.',
    },
    {
      'question': 'Contracting: Include a “___ adjustment” clause.',
      'options': ['price', 'time', 'quality', 'location'],
      'correctIndex': 0,
      'explain': 'điều chỉnh giá.',
    },
  ];

  // Ghi metadata của bài luyện vocab4
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab4")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 4: Procurement Advanced',
        'questionCount': vocab4Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 5: Quality & Audits (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab5Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “quality standard (n)” most nearly means…',
      'options': [
        'danh sách kiểm',
        'tiêu chuẩn chất lượng',
        'mẫu thử',
        'chứng nhận',
      ],
      'correctIndex': 1,
      'explain': 'quality standard = tiêu chuẩn chất lượng cần đáp ứng.',
    },
    {
      'question': 'Choose the noun: Follow the product “specification (n)”.',
      'options': ['thông số kỹ thuật', 'dung sai', 'độ lệch', 'chứng nhận'],
      'correctIndex': 0,
      'explain': 'specification = thông số kỹ thuật.',
    },
    {
      'question': 'Identify: “tolerance (n)” in engineering refers to…',
      'options': ['danh sách kiểm', 'dung sai', 'bảo hành', 'mức phạt'],
      'correctIndex': 1,
      'explain': 'tolerance = khoảng sai số cho phép (ví dụ ±0.2mm).',
    },
    {
      'question': 'Meaning: A minor “defect (n)” is a…',
      'options': ['điểm không phù hợp', 'mẫu kiểm', 'lỗi', 'vết kiểm toán'],
      'correctIndex': 2,
      'explain': 'defect = lỗi sản phẩm/quy trình.',
    },
    {
      'question': 'Term: “nonconformity (n)” best means…',
      'options': [
        'không phù hợp',
        'hướng dẫn công việc',
        'mức chuẩn',
        'bảo lãnh',
      ],
      'correctIndex': 0,
      'explain': 'nonconformity = không phù hợp với yêu cầu.',
    },
    {
      'question': 'Usage: Analyze the “root cause (n)”.',
      'options': [
        'độ lệch',
        'nguyên nhân gốc',
        'tiêu chí chấp nhận',
        'khoảng đo',
      ],
      'correctIndex': 1,
      'explain': 'root cause = nguyên nhân gốc của vấn đề.',
    },
    {
      'question': 'Meaning: “CAPA (n)” stands for…',
      'options': [
        'Corrective & Preventive Actions',
        'Control And Process Audit',
        'Calibration & Approval',
        'Continuous Assessment',
      ],
      'correctIndex': 0,
      'explain': 'CAPA = hành động khắc phục & phòng ngừa.',
    },
    {
      'question': 'Choose: Perform incoming “inspection (n)” means…',
      'options': [
        'kiểm tra đầu vào',
        'kiểm tra đầu ra',
        'lấy mẫu gia tăng',
        'chứng nhận bên ngoài',
      ],
      'correctIndex': 0,
      'explain': 'incoming inspection = kiểm tra hàng đến.',
    },
    {
      'question': 'Meaning: Use random “sampling (n)” to…',
      'options': [
        'lập checklist',
        'chọn mẫu ngẫu nhiên',
        'hiệu chuẩn dụng cụ',
        'xác minh vết kiểm toán',
      ],
      'correctIndex': 1,
      'explain': 'sampling = lấy mẫu kiểm tra.',
    },
    {
      'question': 'Term: Approve the production “batch (n)”.',
      'options': ['mẫu thử', 'lô hàng', 'bảng tiêu chuẩn', 'cổng chất lượng'],
      'correctIndex': 1,
      'explain': 'batch = lô sản xuất.',
    },
    {
      'question': 'Identify: An internal “audit (n)” is a…',
      'options': [
        'đánh giá nội bộ',
        'đánh giá khách hàng',
        'đánh giá nhà nước',
        'điều tra chất lượng',
      ],
      'correctIndex': 0,
      'explain': 'audit = đánh giá hệ thống theo chuẩn.',
    },
    {
      'question': 'Choose the role: An “auditor (n)” is…',
      'options': [
        'người đánh giá/kiểm toán',
        'người vận hành',
        'người chứng nhận',
        'khách hàng',
      ],
      'correctIndex': 0,
      'explain': 'auditor = người thực hiện đánh giá.',
    },
    {
      'question': 'Meaning: “certification (n)” refers to…',
      'options': ['chứng nhận', 'điều khoản', 'tiêu chuẩn', 'mức phạt'],
      'correctIndex': 0,
      'explain': 'certification = chứng nhận (ví dụ ISO).',
    },
    {
      'question': 'Pick the noun: “compliance (n)” means…',
      'options': ['tuân thủ', 'định cỡ', 'lấy mẫu', 'báo cáo'],
      'correctIndex': 0,
      'explain': 'compliance = tuân thủ yêu cầu/chuẩn.',
    },
    {
      'question': 'Meaning: Document all “procedures (n)”.',
      'options': ['quy trình', 'mẫu thử', 'lô hàng', 'tiêu chuẩn'],
      'correctIndex': 0,
      'explain': 'procedures = quy trình.',
    },
    {
      'question': 'Term: A “work instruction (n)” is…',
      'options': [
        'hướng dẫn công việc',
        'tiêu chí chấp nhận',
        'vết kiểm toán',
        'độ lệch',
      ],
      'correctIndex': 0,
      'explain': 'work instruction = hướng dẫn thao tác.',
    },
    {
      'question': 'Select: Use a “checklist (n)” to…',
      'options': [
        'ghi nhận điểm kiểm',
        'tăng dung sai',
        'giảm chuẩn',
        'tạo lỗi',
      ],
      'correctIndex': 0,
      'explain': 'checklist = danh sách kiểm.',
    },
    {
      'question': 'Meaning: Maintain “traceability (n)” means…',
      'options': [
        'truy xuất nguồn gốc',
        'chứng nhận nâng cao',
        'tối ưu dung sai',
        'đo kiểm nâng cao',
      ],
      'correctIndex': 0,
      'explain': 'traceability = khả năng truy xuất nguồn gốc.',
    },
    {
      'question': 'Term: “calibration (n)” is the process of…',
      'options': [
        'hiệu chuẩn thiết bị đo',
        'kiểm tra lô',
        'lấy mẫu ngẫu nhiên',
        'điều tra lỗi',
      ],
      'correctIndex': 0,
      'explain': 'calibration = hiệu chuẩn.',
    },
    {
      'question': 'Identify: A “specimen (n)” in testing is…',
      'options': ['mẫu thử', 'lô sản xuất', 'vết kiểm toán', 'tiêu chuẩn'],
      'correctIndex': 0,
      'explain': 'specimen = mẫu thử.',
    },
    {
      'question': 'Meaning: To “benchmark (v)” performance is to…',
      'options': [
        'so sánh với chuẩn',
        'hiệu chuẩn dụng cụ',
        'tăng tần suất kiểm',
        'đề xuất CAPA',
      ],
      'correctIndex': 0,
      'explain': 'benchmark = so sánh với mức chuẩn/đối thủ.',
    },
    {
      'question': 'Choose: “continuous improvement (n)” promotes…',
      'options': [
        'cải tiến liên tục',
        'đột xuất',
        'tăng dung sai',
        'ngừng kiểm',
      ],
      'correctIndex': 0,
      'explain': 'CI = cải tiến liên tục.',
    },
    {
      'question': 'Meaning: Add a “quality gate (n)” before shipping to…',
      'options': [
        'lọc chất lượng cuối',
        'giảm số mẫu',
        'tăng dung sai',
        'bỏ kiểm tải',
      ],
      'correctIndex': 0,
      'explain': 'quality gate = điểm chặn kiểm soát chất lượng.',
    },
    {
      'question': 'Term: Define “acceptance criteria (n)”. They are…',
      'options': [
        'tiêu chí chấp nhận',
        'danh sách kiểm',
        'chứng chỉ',
        'mức phạt',
      ],
      'correctIndex': 0,
      'explain': 'acceptance criteria = tiêu chí nhận sản phẩm.',
    },
    {
      'question': 'Meaning: A “deviation (n)” is a…',
      'options': [
        'độ lệch/ngoại lệ so chuẩn',
        'mã truy xuất',
        'lỗi đo lường',
        'mức phạt',
      ],
      'correctIndex': 0,
      'explain': 'deviation = lệch khỏi yêu cầu.',
    },
    {
      'question': 'Identify: A “waiver (n)” in quality is a…',
      'options': [
        'miễn trừ chấp nhận ngoại lệ',
        'mẫu thử bổ sung',
        'đo kiểm lại',
        'chứng nhận nội bộ',
      ],
      'correctIndex': 0,
      'explain': 'waiver = miễn trừ cho phép khác chuẩn có kiểm soát.',
    },
    {
      'question': 'Choose the noun: Update the “risk register (n)”.',
      'options': [
        'sổ đăng ký rủi ro',
        'bài học kinh nghiệm',
        'tiêu chuẩn',
        'mã vết',
      ],
      'correctIndex': 0,
      'explain': 'risk register = sổ ghi rủi ro & biện pháp.',
    },
    {
      'question': 'Meaning: Keep a full “audit trail (n)”.',
      'options': ['vết kiểm toán', 'mẫu đối chứng', 'bảng chuẩn', 'độ lặp lại'],
      'correctIndex': 0,
      'explain': 'audit trail = lịch sử thay đổi/ghi vết.',
    },
    {
      'question': 'Term: “non-destructive testing (NDT) (n)” means…',
      'options': [
        'thử nghiệm không phá hủy',
        'hiệu chuẩn tức thời',
        'kiểm định áp lực',
        'đốt mẫu',
      ],
      'correctIndex': 0,
      'explain': 'NDT = thử nghiệm không làm hỏng mẫu.',
    },
    {
      'question': 'Meaning: “gauge R&R (n)” evaluates…',
      'options': [
        'độ lặp lại & tái lập phép đo',
        'dung sai',
        'mức phạt',
        'độ lệch',
      ],
      'correctIndex': 0,
      'explain': 'Gauge R&R = Repeatability & Reproducibility.',
    },
    // ----- Biến thể vận dụng/ngữ cảnh để đủ 50 câu -----
    {
      'question': 'Context: The tolerance is ±0.1 mm. The part at +0.12 mm is…',
      'options': ['out of spec (OOS)', 'chuẩn', 'mẫu đối chứng', 'đạt'],
      'correctIndex': 0,
      'explain': 'Vượt quá tolerance ⇒ OOS.',
    },
    {
      'question': 'Usage: Raise an NCR for a detected “nonconformity”. NCR =',
      'options': [
        'Nonconformity Report',
        'New Control Record',
        'Nominal Calibration Ratio',
        'Normal Check Routine',
      ],
      'correctIndex': 0,
      'explain': 'NCR = biên bản không phù hợp.',
    },
    {
      'question': 'Choose: 5 Whys/Ishikawa are tools for…',
      'options': [
        'root cause analysis',
        'sampling',
        'calibration',
        'acceptance testing',
      ],
      'correctIndex': 0,
      'explain': 'Dùng để phân tích nguyên nhân gốc.',
    },
    {
      'question': 'Meaning: “Corrective action” aims to…',
      'options': [
        'loại bỏ nguyên nhân gốc',
        'ngăn ngừa mối nguy tương lai',
        'tăng dung sai',
        'giảm mẫu',
      ],
      'correctIndex': 0,
      'explain': 'Khắc phục = loại bỏ nguyên nhân gốc của sự cố đã xảy ra.',
    },
    {
      'question': 'Meaning: “Preventive action” aims to…',
      'options': [
        'ngăn sự cố xảy ra',
        'sửa lỗi đã xảy ra',
        'xác định mẫu',
        'giảm tần suất audit',
      ],
      'correctIndex': 0,
      'explain': 'Phòng ngừa cho rủi ro tiềm ẩn.',
    },
    {
      'question': 'Choose: “Final inspection” occurs…',
      'options': [
        'trước giao hàng',
        'sau giao hàng',
        'trước nhập kho nguyên liệu',
        'trong khi đóng gói',
      ],
      'correctIndex': 0,
      'explain': 'Final inspection = kiểm cuối trước ship.',
    },
    {
      'question': 'Identify: “In-process inspection” happens…',
      'options': [
        'trong khi sản xuất',
        'sau khi giao hàng',
        'trước khi đặt hàng',
        'sau khi hiệu chuẩn',
      ],
      'correctIndex': 0,
      'explain': 'Kiểm tra trong công đoạn sản xuất.',
    },
    {
      'question': 'Meaning: “AQL (n)” in sampling stands for…',
      'options': [
        'Acceptable Quality Level',
        'Average Quantity Lot',
        'Approved Qualification List',
        'Audit Quality Ledger',
      ],
      'correctIndex': 0,
      'explain': 'AQL = mức chất lượng chấp nhận được.',
    },
    {
      'question': 'Choose the best: A “calibration sticker” usually shows…',
      'options': [
        'ngày hiệu chuẩn & hạn',
        'mức phạt',
        'số lô',
        'danh sách kiểm',
      ],
      'correctIndex': 0,
      'explain': 'Tem hiệu chuẩn nêu ngày hiệu chuẩn & đến hạn.',
    },
    {
      'question': 'Usage: “Traceability code” commonly links to…',
      'options': [
        'batch & lot',
        'ISO auditor',
        'deviation form',
        'waiver owner',
      ],
      'correctIndex': 0,
      'explain': 'Mã truy xuất liên kết lô/batch.',
    },
    {
      'question': 'Meaning: “Acceptance criteria” help decide…',
      'options': [
        'pass/fail',
        'tần suất audit',
        'số lượng mẫu',
        'ngày hiệu chuẩn',
      ],
      'correctIndex': 0,
      'explain': 'Để quyết định đạt hay không.',
    },
    {
      'question': 'Choose: “Audit finding” can be classified as…',
      'options': [
        'major/minor/observation',
        'pass/fail',
        'AQL/LOT',
        'R&R/CAPA',
      ],
      'correctIndex': 0,
      'explain': 'Phân loại kết quả audit.',
    },
    {
      'question': 'Meaning: “Audit trail” is critical for…',
      'options': [
        'truy vết thay đổi',
        'tăng năng suất',
        'giảm dung sai',
        'định giá',
      ],
      'correctIndex': 0,
      'explain': 'Ghi vết ai/bao giờ/điều gì thay đổi.',
    },
    {
      'question': 'Context: “Rework” differs from “repair” because…',
      'options': [
        'rework khôi phục để đạt chuẩn; repair khắc phục hư hỏng',
        'rework là loại bỏ; repair là thay thế',
        'rework là kiểm; repair là đo',
        'không khác nhau',
      ],
      'correctIndex': 0,
      'explain': 'Rework: làm lại cho đạt; Repair: sửa hỏng.',
    },
    {
      'question': 'Meaning: “Scrap” refers to…',
      'options': [
        'loại bỏ không sử dụng',
        'lô đạt chuẩn',
        'mẫu đối chứng',
        'tăng dung sai',
      ],
      'correctIndex': 0,
      'explain': 'Scrap = loại bỏ phế phẩm.',
    },
    {
      'question': 'Choose: “Disposition” of nonconforming product may be…',
      'options': [
        'rework/repair/scrap/waiver',
        'audit/certify/approve',
        'sample/calc/inspect',
        'ship/return/invoice',
      ],
      'correctIndex': 0,
      'explain': 'Các quyết định xử lý sản phẩm không phù hợp.',
    },
    {
      'question': 'Identify: A “deviation form” is used to…',
      'options': [
        'xin chấp nhận ngoại lệ có kiểm soát',
        'đánh giá nội bộ',
        'hiệu chuẩn',
        'tạo checklist',
      ],
      'correctIndex': 0,
      'explain': 'Đề nghị chấp nhận khác chuẩn tạm thời.',
    },
    {
      'question':
          'Choose: “External auditors will visit next week.” Here “external” means…',
      'options': [
        'bên ngoài tổ chức',
        'nội bộ',
        'khách hàng nội bộ',
        'nhà máy',
      ],
      'correctIndex': 0,
      'explain': 'Auditor từ tổ chức bên ngoài.',
    },
    {
      'question': 'Meaning: “Certification is required.” implies…',
      'options': [
        'phải có chứng nhận',
        'chỉ cần checklist',
        'chỉ cần audit trail',
        'không cần ISO',
      ],
      'correctIndex': 0,
      'explain': 'Yêu cầu chứng nhận (ví dụ ISO 9001).',
    },
    {
      'question': 'Usage: “Benchmark against peers” means…',
      'options': [
        'so sánh với doanh nghiệp tương tự',
        'kiểm tra nội bộ',
        'đo mẫu thử',
        'xin miễn trừ',
      ],
      'correctIndex': 0,
      'explain': 'So sánh hiệu năng/chi phí với đối thủ cùng ngành.',
    },
    {
      'question': 'Choose: “Quality gate before shipping” helps…',
      'options': [
        'ngăn lỗi lọt ra ngoài',
        'tăng dung sai',
        'giảm mẫu',
        'bỏ chứng nhận',
      ],
      'correctIndex': 0,
      'explain': 'Điểm chặn cuối để ngăn lỗi.',
    },
    {
      'question': 'Meaning: “Traceability records” should…',
      'options': [
        'cho phép truy ngược nguồn gốc',
        'giảm số lượng audit',
        'tăng AQL',
        'thay checklist',
      ],
      'correctIndex': 0,
      'explain': 'Hồ sơ phải giúp truy xuất nguồn gốc.',
    },
    {
      'question': 'Identify: “Calibration is overdue.” => Action?',
      'options': [
        'ngừng dùng thiết bị để hiệu chuẩn',
        'tăng mẫu',
        'xin miễn trừ chất lượng',
        'giao hàng trước',
      ],
      'correctIndex': 0,
      'explain': 'Thiết bị quá hạn hiệu chuẩn cần dừng để hiệu chuẩn.',
    },
    {
      'question': 'Meaning: “Acceptance sampling” is used to…',
      'options': [
        'quyết định nhận/loại lô dựa trên mẫu',
        'tối ưu dung sai',
        'kiểm 100%',
        'hiệu chuẩn',
      ],
      'correctIndex': 0,
      'explain': 'Lấy mẫu theo AQL để quyết định lô.',
    },
  ];

  // Ghi metadata của bài luyện vocab5
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab5")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 5: Quality & Audits',
        'questionCount': vocab5Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 6: Corporate Strategy & Change (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab6Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “initiative (n)” most nearly means…',
      'options': ['kế hoạch triển khai', 'sáng kiến', 'đào tạo', 'định vị'],
      'correctIndex': 1,
      'explain': 'initiative = sáng kiến (thường nhằm cải thiện/đổi mới).',
    },
    {
      'question': 'Identify: A product “roadmap (n)” is a…',
      'options': [
        'bài học kinh nghiệm',
        'lộ trình',
        'bảng KPI',
        'mô hình vận hành',
      ],
      'correctIndex': 1,
      'explain': 'roadmap = lộ trình sản phẩm theo thời gian.',
    },
    {
      'question': 'Choose the noun: Set clear project “objective(s) (n)”.',
      'options': ['khác biệt hóa', 'mục tiêu', 'chuyển đổi', 'định vị'],
      'correctIndex': 1,
      'explain': 'objective = mục tiêu cụ thể cần đạt.',
    },
    {
      'question': 'Abbrev: “OKR” stands for…',
      'options': [
        'Objectives & Key Results',
        'Operational Key Reviews',
        'Organizational KPI Ratings',
        'Official Knowledge Repository',
      ],
      'correctIndex': 0,
      'explain': 'OKR = Objectives & Key Results.',
    },
    {
      'question': 'Pick the metric: “KPI (n)” is…',
      'options': [
        'chỉ số hiệu suất',
        'kế hoạch truyền thông',
        'luận chứng kinh doanh',
        'khẩu vị rủi ro',
      ],
      'correctIndex': 0,
      'explain': 'KPI = Key Performance Indicator.',
    },
    {
      'question': 'Meaning: Cross-team “alignment (n)” refers to…',
      'options': ['sự đồng bộ', 'sự phản kháng', 'khác biệt hóa', 'định vị'],
      'correctIndex': 0,
      'explain': 'alignment = đồng bộ mục tiêu/cách làm.',
    },
    {
      'question': 'Term: Secure stakeholder “buy-in (n)” means…',
      'options': [
        'đạt ủng hộ của bên liên quan',
        'mua lại cổ phần',
        'bán danh mục',
        'đóng dự án',
      ],
      'correctIndex': 0,
      'explain': 'buy-in = sự ủng hộ/cam kết từ stakeholders.',
    },
    {
      'question': 'Meaning: “go-to-market (n)” is a plan to…',
      'options': [
        'đưa sản phẩm ra thị trường',
        'tối ưu danh mục',
        'đào tạo nhân viên',
        'ngưng sản phẩm cũ',
      ],
      'correctIndex': 0,
      'explain': 'GTM = chiến lược đưa SP ra thị trường.',
    },
    {
      'question': 'Choose: Refine brand “positioning (n)” means…',
      'options': ['định vị', 'khác biệt hóa', 'đồng bộ', 'đào tạo'],
      'correctIndex': 0,
      'explain': 'positioning = định vị trong tâm trí khách hàng.',
    },
    {
      'question': 'Closest meaning: “differentiation (n)” ≈',
      'options': [
        'khác biệt hóa',
        'hợp lực',
        'chỉ số sao bắc đẩu',
        'ngưng dịch vụ',
      ],
      'correctIndex': 0,
      'explain': 'differentiation = tạo khác biệt so với đối thủ.',
    },
    {
      'question': 'Select the best: Optimize our product “portfolio (n)”.',
      'options': [
        'sổ tay chiến thuật',
        'danh mục',
        'bản đồ bên liên quan',
        'mô hình vận hành',
      ],
      'correctIndex': 1,
      'explain': 'portfolio = danh mục sản phẩm/dịch vụ.',
    },
    {
      'question': 'Meaning: Find “synergy (n)” across units means…',
      'options': [
        'hiệu ứng cộng hưởng',
        'rủi ro hệ thống',
        'phản kháng',
        'chiến lược thoái lui',
      ],
      'correctIndex': 0,
      'explain': 'synergy = giá trị cộng hưởng lớn hơn tổng lẻ.',
    },
    {
      'question': 'Term: Lead a digital “transformation (n)” =',
      'options': [
        'chuyển đổi số',
        'kết thúc dự án',
        'đánh giá sau dự án',
        'ngưng sản phẩm',
      ],
      'correctIndex': 0,
      'explain': 'transformation = chuyển đổi ở tầm hệ thống.',
    },
    {
      'question': 'Meaning: Invest in “change management (n)”.',
      'options': [
        'quản trị thay đổi',
        'quản trị rủi ro',
        'quản trị dữ liệu',
        'quản trị danh mục',
      ],
      'correctIndex': 0,
      'explain':
          'change management = quản trị con người/quy trình khi thay đổi.',
    },
    {
      'question': 'Identify: Track user “adoption (n)”.',
      'options': [
        'chấp nhận/áp dụng',
        'khẩu vị rủi ro',
        'khác biệt hóa',
        'định vị',
      ],
      'correctIndex': 0,
      'explain': 'adoption = mức độ người dùng áp dụng.',
    },
    {
      'question': 'Usage: Plan a phased “rollout (n)”.',
      'options': ['triển khai', 'ngưng dịch vụ', 'đào tạo', 'định vị'],
      'correctIndex': 0,
      'explain': 'rollout = triển khai theo giai đoạn.',
    },
    {
      'question': 'Opposite idea: Overcome employee “resistance (n)”.',
      'options': ['sự kháng cự', 'sự đồng bộ', 'sự cộng hưởng', 'sự khác biệt'],
      'correctIndex': 0,
      'explain': 'resistance = kháng cự thay đổi.',
    },
    {
      'question': 'Choose the activity: Schedule “training (n)”.',
      'options': [
        'đào tạo',
        'bài học kinh nghiệm',
        'kế hoạch truyền thông',
        'định vị',
      ],
      'correctIndex': 0,
      'explain': 'training = đào tạo con người/kỹ năng.',
    },
    {
      'question': 'Meaning: Strengthen data “governance (n)”.',
      'options': ['quản trị', 'định vị', 'đào tạo', 'đồng bộ'],
      'correctIndex': 0,
      'explain': 'governance = khung quy tắc/quyền & trách nhiệm.',
    },
    {
      'question': 'Term: Create a change “playbook (n)”.',
      'options': [
        'sổ tay chiến thuật',
        'chỉ số hiệu suất',
        'mô hình vận hành',
        'bản đồ stakeholders',
      ],
      'correctIndex': 0,
      'explain': 'playbook = sổ tay quy trình/bước làm chuẩn.',
    },
    {
      'question': 'Choose: Build a strong “business case (n)”.',
      'options': [
        'luận chứng kinh doanh',
        'kế hoạch truyền thông',
        'mẫu đánh giá sau dự án',
        'khẩu vị rủi ro',
      ],
      'correctIndex': 0,
      'explain': 'business case = lập luận lợi ích/chi phí/khả thi.',
    },
    {
      'question': 'Meaning: Run a “cost-benefit analysis (n)”.',
      'options': [
        'phân tích chi phí-lợi ích',
        'đánh giá sau dự án',
        'định vị',
        'khác biệt hóa',
      ],
      'correctIndex': 0,
      'explain': 'CBA so sánh cost vs benefit.',
    },
    {
      'question': 'Term: Define your “risk appetite (n)”.',
      'options': [
        'khẩu vị rủi ro',
        'chỉ số sao bắc đẩu',
        'điểm khác biệt',
        'bản đồ stakeholders',
      ],
      'correctIndex': 0,
      'explain': 'risk appetite = mức rủi ro tổ chức chấp nhận.',
    },
    {
      'question': 'Meaning: We may “pivot (v)” the strategy.',
      'options': ['đổi hướng', 'ngưng sản phẩm', 'đào tạo', 'chuẩn hóa KPI'],
      'correctIndex': 0,
      'explain': 'pivot = đổi hướng chiến lược.',
    },
    {
      'question': 'Usage: “Sunset (v)” legacy products means…',
      'options': [
        'ngưng (kết thúc vòng đời)',
        'đưa ra thị trường',
        'định vị lại',
        'đào tạo nội bộ',
      ],
      'correctIndex': 0,
      'explain': 'sunset = ngưng sản phẩm/dịch vụ cũ.',
    },
    {
      'question': 'Concept: The “north star metric (n)” is…',
      'options': [
        'chỉ số định hướng',
        'chỉ số chi phí',
        'một playbook',
        'một bản đồ stakeholders',
      ],
      'correctIndex': 0,
      'explain': 'NSM = chỉ số dẫn dắt tăng trưởng.',
    },
    {
      'question': 'Pick one: Redesign the “operating model (n)”.',
      'options': [
        'mô hình vận hành',
        'danh mục',
        'kế hoạch truyền thông',
        'sổ tay chiến thuật',
      ],
      'correctIndex': 0,
      'explain': 'Operating model = cách tổ chức vận hành tạo giá trị.',
    },
    {
      'question': 'Meaning: Build a stakeholder “map (n)”.',
      'options': [
        'bản đồ bên liên quan',
        'mục tiêu chính',
        'chỉ số sao bắc đẩu',
        'đào tạo',
      ],
      'correctIndex': 0,
      'explain': 'Stakeholder map = liệt kê/quy chiếu mức ảnh hưởng.',
    },
    {
      'question': 'Choose: Share the “communication plan (n)”.',
      'options': [
        'kế hoạch truyền thông',
        'luận chứng kinh doanh',
        'đánh giá sau dự án',
        'khác biệt hóa',
      ],
      'correctIndex': 0,
      'explain': 'Communication plan = ai nói gì/khi nào/cho ai.',
    },
    {
      'question': 'Meaning: Hold a project “post-mortem (n)”.',
      'options': [
        'đánh giá sau dự án',
        'đào tạo đầu vào',
        'ngưng sản phẩm',
        'đổi hướng',
      ],
      'correctIndex': 0,
      'explain': 'post-mortem = rút kinh nghiệm sau dự án.',
    },
    // ----- Vận dụng theo ngữ cảnh để đủ 50 câu -----
    {
      'question': 'Fill in: Launch a cost-saving ___.',
      'options': ['playbook', 'initiative', 'portfolio', 'governance'],
      'correctIndex': 1,
      'explain': 'cost-saving initiative = sáng kiến tiết kiệm chi phí.',
    },
    {
      'question': 'Completion: Publish the product ___.',
      'options': ['roadmap', 'post-mortem', 'training', 'synergy'],
      'correctIndex': 0,
      'explain': 'Publish the product roadmap.',
    },
    {
      'question': 'Choose the best: Define quarterly ___.',
      'options': ['OKRs', 'sunsets', 'maps', 'playbooks'],
      'correctIndex': 0,
      'explain': 'Define OKRs quarterly.',
    },
    {
      'question': 'Usage: Align team KPIs with ___.',
      'options': ['strategy', 'post-mortem', 'sunset', 'pivot'],
      'correctIndex': 0,
      'explain': 'KPI cần ăn khớp với chiến lược.',
    },
    {
      'question': 'Which fits? Ensure cross-team ___.',
      'options': ['alignment', 'resistance', 'sunset', 'pivot'],
      'correctIndex': 0,
      'explain': 'cross-team alignment.',
    },
    {
      'question': 'Collocation: Secure stakeholder ___.',
      'options': ['buy-in', 'synergy', 'portfolio', 'CBA'],
      'correctIndex': 0,
      'explain': 'stakeholder buy-in.',
    },
    {
      'question': 'Meaning: Plan the ___. (market entry strategy)',
      'options': [
        'go-to-market',
        'post-mortem',
        'operating model',
        'governance',
      ],
      'correctIndex': 0,
      'explain': 'go-to-market plan.',
    },
    {
      'question': 'Context: Create clear brand ___.',
      'options': ['positioning', 'training', 'governance', 'playbook'],
      'correctIndex': 0,
      'explain': 'brand positioning.',
    },
    {
      'question': 'Closest meaning: “Create clear ___.” (unique value)',
      'options': ['differentiation', 'adoption', 'resistance', 'roadmap'],
      'correctIndex': 0,
      'explain': 'clear differentiation.',
    },
    {
      'question': 'Pick the noun: Optimize the product ___.',
      'options': ['portfolio', 'north star metric', 'post-mortem', 'pivot'],
      'correctIndex': 0,
      'explain': 'product portfolio.',
    },
    {
      'question': 'Usage: Seek __ across business units.',
      'options': ['synergies', 'sunsets', 'maps', 'mortems'],
      'correctIndex': 0,
      'explain': 'seek synergies.',
    },
    {
      'question': 'Meaning: Invest in __ management for smoother change.',
      'options': ['change', 'risk appetite', 'post-mortem', 'positioning'],
      'correctIndex': 0,
      'explain': 'change management.',
    },
    {
      'question': 'Choose: Measure user __ after release.',
      'options': ['adoption', 'alignment', 'portfolio', 'playbook'],
      'correctIndex': 0,
      'explain': 'measure adoption.',
    },
    {
      'question': 'Fill in: Plan a phased __ for v2.',
      'options': ['rollout', 'post-mortem', 'portfolio', 'map'],
      'correctIndex': 0,
      'explain': 'phased rollout.',
    },
    {
      'question': 'Opposite sense: Handle employee __ to change.',
      'options': ['resistance', 'alignment', 'adoption', 'synergy'],
      'correctIndex': 0,
      'explain': 'handle resistance.',
    },
    {
      'question': 'Training context: Schedule onboarding __.',
      'options': ['sessions', 'maps', 'sunsets', 'pivots'],
      'correctIndex': 0,
      'explain': 'training sessions.',
    },
    {
      'question': 'Governance: Strengthen data __ controls.',
      'options': ['governance', 'OKR', 'CBA', 'sunset'],
      'correctIndex': 0,
      'explain': 'data governance controls.',
    },
    {
      'question': 'Playbook: Create a change __ for managers.',
      'options': ['playbook', 'portfolio', 'post-mortem', 'roadmap'],
      'correctIndex': 0,
      'explain': 'change playbook.',
    },
    {
      'question': 'Analysis: Build a strong __ to justify investment.',
      'options': ['business case', 'sunset', 'map', 'positioning'],
      'correctIndex': 0,
      'explain': 'business case.',
    },
    {
      'question': 'Decision tool: Run a cost-benefit __.',
      'options': ['analysis', 'alignment', 'adoption', 'playbook'],
      'correctIndex': 0,
      'explain': 'cost-benefit analysis.',
    },
    {
      'question': 'Risk: Define a clear __ for bold bets.',
      'options': [
        'risk appetite',
        'north star metric',
        'portfolio',
        'post-mortem',
      ],
      'correctIndex': 0,
      'explain': 'define risk appetite.',
    },
    {
      'question': 'Strategic move: We might __ to enterprise customers.',
      'options': ['pivot', 'sunset', 'post-mortem', 'governance'],
      'correctIndex': 0,
      'explain': 'pivot to a new segment.',
    },
    {
      'question': 'Lifecycle: Plan to __ a legacy feature.',
      'options': ['sunset', 'align', 'differentiate', 'govern'],
      'correctIndex': 0,
      'explain': 'sunset = ngưng.',
    },
    {
      'question': 'Guiding metric: Choose a __ metric.',
      'options': ['north star', 'resistance', 'portfolio', 'playbook'],
      'correctIndex': 0,
      'explain': 'north star metric.',
    },
    {
      'question': 'Operating: Redesign the __ to cut handoffs.',
      'options': ['operating model', 'business case', 'post-mortem', 'roadmap'],
      'correctIndex': 0,
      'explain': 'operating model.',
    },
    {
      'question': 'Stakeholders: Build a __ to map influence.',
      'options': ['stakeholder map', 'playbook', 'OKR', 'sunset plan'],
      'correctIndex': 0,
      'explain': 'stakeholder map.',
    },
    {
      'question': 'Comms: Share the __ with all teams.',
      'options': ['communication plan', 'CBA', 'NSM', 'portfolio'],
      'correctIndex': 0,
      'explain': 'communication plan.',
    },
    {
      'question': 'After action: Run a project __ to learn.',
      'options': ['post-mortem', 'pivot', 'alignment', 'synergy'],
      'correctIndex': 0,
      'explain': 'post-mortem meeting.',
    },
  ];

  // Ghi metadata của bài luyện vocab6
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab6")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 6: Corporate Strategy & Change',
        'questionCount': vocab6Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp option sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 7: Operations & Supply Chain (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab7Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “throughput (n)” most nearly means…',
      'options': [
        'nút thắt',
        'năng lực xử lý/đầu ra',
        'chu kỳ xử lý',
        'tồn kho an toàn',
      ],
      'correctIndex': 1,
      'explain':
          'throughput = khối lượng xử lý/đầu ra trong một khoảng thời gian.',
    },
    {
      'question': 'Identify: A “bottleneck (n)” is…',
      'options': [
        'điểm tắc nghẽn',
        'đơn chờ hàng',
        'đúng hạn đúng đủ',
        'kế hoạch nhu cầu',
      ],
      'correctIndex': 0,
      'explain': 'bottleneck = nút thắt cổ chai hạn chế năng lực hệ thống.',
    },
    {
      'question': 'Meaning: “lead time (n)” refers to…',
      'options': [
        'thời gian cung ứng',
        'tỷ lệ đáp ứng đơn',
        'mức sử dụng',
        'tỷ lệ đầu ra đạt',
      ],
      'correctIndex': 0,
      'explain': 'lead time = thời gian từ đặt hàng đến nhận hàng/hoàn tất.',
    },
    {
      'question': 'Choose the metric: “cycle time (n)” is…',
      'options': [
        'thời gian chu kỳ xử lý một đơn vị',
        'tỷ lệ lỗi',
        'tồn kho an toàn',
        'mức dịch vụ',
      ],
      'correctIndex': 0,
      'explain': 'cycle time = thời gian hoàn tất một đơn vị công việc.',
    },
    {
      'question': 'Term: “WIP (work-in-process) (n)” means…',
      'options': ['hàng đang làm', 'đơn chờ', 'hậu cần ngược', 'bảng Kanban'],
      'correctIndex': 0,
      'explain': 'WIP = hàng đang trong quá trình sản xuất.',
    },
    {
      'question': 'Meaning: “throughput yield (n)” is…',
      'options': [
        'tỷ lệ đầu ra đạt',
        'tỷ lệ trả hàng',
        'tỷ lệ đáp ứng đơn',
        'tỷ lệ chính xác dự báo',
      ],
      'correctIndex': 0,
      'explain': 'Throughput yield = % đầu ra đạt chuẩn.',
    },
    {
      'question': 'Pick the KPI: “utilization (n)” measures…',
      'options': [
        'mức sử dụng tài nguyên',
        'dòng chảy liên tục',
        'đơn chờ',
        'mức dịch vụ',
      ],
      'correctIndex': 0,
      'explain': 'Utilization = % thời gian/khả năng được sử dụng.',
    },
    {
      'question': 'Choose: “capacity (n)” most nearly means…',
      'options': [
        'công suất',
        'đơn chờ',
        'kích cỡ lô',
        'đối tác logistics 3PL',
      ],
      'correctIndex': 0,
      'explain': 'Capacity = công suất/khả năng tối đa.',
    },
    {
      'question': 'Meaning: Improve production “scheduling (n)” means…',
      'options': [
        'lập lịch sản xuất',
        'trung chuyển',
        'định vị thương hiệu',
        'khấu hao',
      ],
      'correctIndex': 0,
      'explain': 'Scheduling = sắp xếp lịch công việc/tài nguyên.',
    },
    {
      'question': 'Term: “Kanban (n)” is a…',
      'options': [
        'phương pháp kéo bằng thẻ',
        'báo cáo tài chính',
        'điều khoản giao hàng',
        'chuẩn chất lượng',
      ],
      'correctIndex': 0,
      'explain': 'Kanban = hệ thống kéo trực quan kiểm soát WIP.',
    },
    {
      'question': 'JIT: “just-in-time (n)” focuses on…',
      'options': [
        'giảm tồn kho bằng giao đúng lúc',
        'tăng dung sai',
        'đẩy hàng ra kho',
        'định tuyến bán hàng',
      ],
      'correctIndex': 0,
      'explain': 'JIT = giao đúng lúc, giảm tồn kho.',
    },
    {
      'question': 'Meaning: “safety stock (n)” is…',
      'options': [
        'tồn kho an toàn',
        'đơn chờ',
        'mức sử dụng',
        'kế hoạch nhu cầu',
      ],
      'correctIndex': 0,
      'explain': 'Safety stock = lớp đệm chống biến động cung-cầu.',
    },
    {
      'question': 'Abbrev: “MRP (n)” stands for…',
      'options': [
        'Material Requirements Planning',
        'Monthly Replenishment Plan',
        'Manufacturing Route Plan',
        'Marketing Resource Planning',
      ],
      'correctIndex': 0,
      'explain': 'MRP = hoạch định nhu cầu vật tư.',
    },
    {
      'question': 'Term: “batch size (n)” means…',
      'options': [
        'cỡ lô',
        'đơn chờ',
        'tỷ lệ đáp ứng đơn',
        'chuỗi cung ứng đảo chiều',
      ],
      'correctIndex': 0,
      'explain': 'Batch size = số lượng sản xuất mỗi lô.',
    },
    {
      'question': 'Meaning: “order fulfillment (n)” is…',
      'options': [
        'xử lý & hoàn tất đơn hàng',
        'định giá',
        'kế hoạch ngân sách',
        'chấm dứt hợp đồng',
      ],
      'correctIndex': 0,
      'explain': 'Order fulfillment = xử lý đơn từ nhận đến giao.',
    },
    {
      'question': 'Identify: “cross-docking (n)” refers to…',
      'options': [
        'trung chuyển trực tiếp',
        'giao cuối chặng',
        'gom hàng theo đợt',
        'hậu cần ngược',
      ],
      'correctIndex': 0,
      'explain': 'Cross-docking = bốc dỡ chéo, không lưu kho lâu.',
    },
    {
      'question': 'Term: “3PL (third-party logistics) (n)” is…',
      'options': [
        'đối tác logistics bên thứ ba',
        'đối tác tài chính',
        'đối tác pháp lý',
        'đối tác công nghệ',
      ],
      'correctIndex': 0,
      'explain': '3PL = nhà cung cấp dịch vụ logistics.',
    },
    {
      'question': 'Meaning: “SKU rationalization (n)” aims to…',
      'options': [
        'tinh gọn danh mục SKU',
        'tăng số SKU',
        'đóng SKU bán chạy',
        'chỉ giao JIT',
      ],
      'correctIndex': 0,
      'explain': 'SKU rationalization = loại bớt SKU kém hiệu quả.',
    },
    {
      'question': 'Abbrev: “S&OP (n)” stands for…',
      'options': [
        'Sales & Operations Planning',
        'Stock & Orders Pipeline',
        'Service & Ops Protocol',
        'Supply & Order Pricing',
      ],
      'correctIndex': 0,
      'explain': 'S&OP = hoạch định bán hàng & vận hành tích hợp.',
    },
    {
      'question': 'Metric: “forecast accuracy (n)” measures…',
      'options': [
        'độ chính xác dự báo',
        'mức tồn kho',
        'chi phí vận tải',
        'tỷ lệ hư hỏng',
      ],
      'correctIndex': 0,
      'explain': 'Forecast accuracy = độ đúng dự báo so với thực tế.',
    },
    {
      'question': 'Meaning: “demand planning (n)” is…',
      'options': [
        'hoạch định nhu cầu',
        'lập lịch bảo trì',
        'định giá vận tải',
        'kho bãi chuyên sâu',
      ],
      'correctIndex': 0,
      'explain': 'Demand planning = dự báo & lập kế hoạch nhu cầu.',
    },
    {
      'question': 'Identify: “supply risk (n)” relates to…',
      'options': [
        'rủi ro cung ứng',
        'rủi ro pháp lý',
        'rủi ro tín dụng',
        'rủi ro lãi suất',
      ],
      'correctIndex': 0,
      'explain': 'Supply risk = rủi ro gián đoạn nguồn cung.',
    },
    {
      'question': 'Choose: “single-source (v/adj)” means…',
      'options': [
        'mua từ 1 nguồn',
        'mua từ 2 nguồn',
        'mua tại chỗ',
        'mua gia công',
      ],
      'correctIndex': 0,
      'explain': 'Single-source = chỉ một nhà cung cấp.',
    },
    {
      'question': 'Choose: “dual-source (v/adj)” means…',
      'options': [
        'mua từ 2 nguồn',
        'mua từ 1 nguồn',
        'mua giao ngay',
        'mua theo khung',
      ],
      'correctIndex': 0,
      'explain': 'Dual-source = hai nguồn để giảm rủi ro.',
    },
    {
      'question': 'Meaning: “backorder (n/v)” is…',
      'options': ['đơn chờ hàng', 'đơn hủy', 'đơn đổi trả', 'đơn nội bộ'],
      'correctIndex': 0,
      'explain': 'Backorder = đơn chưa đáp ứng do thiếu hàng.',
    },
    {
      'question': 'KPI: “fill rate (n)” measures…',
      'options': [
        'tỷ lệ đáp ứng đơn',
        'tỷ lệ trả hàng',
        'tỷ lệ hỏng',
        'tỷ lệ tồn kho',
      ],
      'correctIndex': 0,
      'explain': 'Fill rate = % đơn được đáp ứng ngay.',
    },
    {
      'question': 'Abbrev: “OTIF (n)” stands for…',
      'options': [
        'On-Time In-Full',
        'Order To Inventory Flow',
        'Outage Time In Factory',
        'On-Trend In Forecast',
      ],
      'correctIndex': 0,
      'explain': 'OTIF = giao Đúng Hẹn, Đủ Số Lượng.',
    },
    {
      'question': 'Meaning: “returns processing (n)” covers…',
      'options': ['xử lý hàng trả', 'đóng gói', 'soạn đơn', 'gom lô'],
      'correctIndex': 0,
      'explain': 'Returns processing = quy trình nhận & xử lý hàng trả.',
    },
    {
      'question': 'Meaning: “reverse logistics (n)” is…',
      'options': [
        'hậu cần ngược',
        'giao chặng cuối',
        'kho ngoại quan',
        'đóng gói tối ưu',
      ],
      'correctIndex': 0,
      'explain': 'Reverse logistics = luồng hàng từ khách về.',
    },
    {
      'question': 'Meaning: “continuous flow (n)” aims for…',
      'options': [
        'dòng chảy liên tục',
        'đẩy hàng theo đợt',
        'giảm năng lực',
        'tăng WIP',
      ],
      'correctIndex': 0,
      'explain': 'Continuous flow = dòng chảy nhỏ, đều, tránh chờ đợi.',
    },
    // —— 20 câu vận dụng/ngữ cảnh để đạt 50 —— //
    {
      'question': 'Context: To fix a bottleneck, you should first…',
      'options': [
        'đo cycle time tại công đoạn tắc',
        'tăng SKU',
        'giảm OTIF',
        'dừng S&OP',
      ],
      'correctIndex': 0,
      'explain': 'Đo & phân tích nút thắt trước khi tăng tài nguyên.',
    },
    {
      'question': 'Completion: Reduce ___ by synchronizing suppliers.',
      'options': ['lead time', 'fill rate', 'OTIF', 'WIP'],
      'correctIndex': 0,
      'explain': 'Đồng bộ chuỗi cung ứng để giảm lead time.',
    },
    {
      'question': 'Choose the best: To improve “forecast accuracy”, you can…',
      'options': [
        'kết hợp S&OP hàng tháng',
        'tăng batch size vô hạn',
        'đẩy WIP tối đa',
        'chỉ dùng 1 nguồn',
      ],
      'correctIndex': 0,
      'explain': 'Chu trình S&OP nâng độ chính xác dự báo.',
    },
    {
      'question': 'Fill in: Raise “safety stock” when ___ variability is high.',
      'options': ['demand', 'brand', 'color', 'layout'],
      'correctIndex': 0,
      'explain': 'Biến động nhu cầu cao ⇒ cần tăng tồn đệm.',
    },
    {
      'question': 'Identify: “ABC analysis” classifies items by…',
      'options': [
        'giá trị sử dụng/giá trị tồn kho',
        'màu sắc',
        'kích thước',
        'nhãn hiệu',
      ],
      'correctIndex': 0,
      'explain': 'ABC dựa trên giá trị (A quan trọng nhất).',
    },
    {
      'question': 'Meaning: “reorder point (ROP)” is the level to…',
      'options': ['đặt hàng lại', 'ngừng bán', 'đổi SKU', 'gom lô'],
      'correctIndex': 0,
      'explain': 'ROP = mức tồn đạt đến thì phát lệnh đặt.',
    },
    {
      'question': 'Choose: Higher “batch size” often increases…',
      'options': [
        'WIP & lead time',
        'OTIF',
        'fill rate tức thời',
        'độ chính xác dự báo',
      ],
      'correctIndex': 0,
      'explain': 'Lô lớn ⇒ WIP/đợi nhiều ⇒ lead time tăng.',
    },
    {
      'question': 'Meaning: “inventory turnover” measures…',
      'options': [
        'vòng quay hàng tồn',
        'tỷ lệ trả hàng',
        'tỷ lệ hư hỏng',
        'tỷ lệ lỗi',
      ],
      'correctIndex': 0,
      'explain': 'Turnover = số lần hàng “quay vòng” trong kỳ.',
    },
    {
      'question': 'Concept: The “bullwhip effect” is when…',
      'options': [
        'dao động nhu cầu khuếch đại ngược dòng',
        'OTIF tăng',
        'fill rate luôn 100%',
        'WIP = 0',
      ],
      'correctIndex': 0,
      'explain': 'Nhu cầu biến động nhỏ ở cuối làm khuếch đại ở đầu chuỗi.',
    },
    {
      'question': 'Operation: “picking & packing” occurs in…',
      'options': ['kho vận', 'sản xuất', 'mua hàng', 'kế toán'],
      'correctIndex': 0,
      'explain': 'Hoạt động soạn & đóng gói đơn tại kho.',
    },
    {
      'question': 'Warehouse: “slotting (n)” means…',
      'options': [
        'bố trí vị trí lưu kho tối ưu',
        'đẩy hàng ra cross-dock',
        'định tuyến vận tải',
        'gom lô',
      ],
      'correctIndex': 0,
      'explain': 'Slotting = sắp vị trí kệ để giảm quãng đường pick.',
    },
    {
      'question': 'Term: “put-away (n/v)” is the process of…',
      'options': ['đưa hàng vào vị trí kệ', 'xuất hàng', 'đếm tồn', 'gom lô'],
      'correctIndex': 0,
      'explain': 'Put-away = nhập & đặt hàng vào vị trí lưu trữ.',
    },
    {
      'question': 'KPI link: Improving OTIF typically requires…',
      'options': [
        'kế hoạch năng lực & lịch vận tải tốt',
        'tăng lỗi',
        'giảm forecast',
        'tắt S&OP',
      ],
      'correctIndex': 0,
      'explain': 'OTIF cần năng lực, lịch vận tải & phối hợp tốt.',
    },
    {
      'question': 'Decision: Use “dual-sourcing” mainly to reduce…',
      'options': ['supply risk', 'MRP run time', 'WIP', 'SKU'],
      'correctIndex': 0,
      'explain': 'Hai nguồn giúp giảm rủi ro gián đoạn.',
    },
    {
      'question': 'Completion: Cross-docking helps minimize…',
      'options': ['thời gian lưu kho', 'OTIF', 'fill rate', 'kích cỡ lô'],
      'correctIndex': 0,
      'explain': 'Tránh lưu kho lâu, hàng đi thẳng qua bến.',
    },
    {
      'question': 'Meaning: A “stockout (n)” is…',
      'options': ['hết hàng', 'thừa hàng', 'đơn chờ', 'hủy đơn'],
      'correctIndex': 0,
      'explain': 'Stockout = không có hàng để giao.',
    },
    {
      'question': 'Choose: “MOQ (minimum order quantity)” is…',
      'options': [
        'số lượng đặt tối thiểu',
        'mức tồn tối đa',
        'tỷ lệ hỏng',
        'mã lô',
      ],
      'correctIndex': 0,
      'explain': 'MOQ = lượng nhỏ nhất để đặt hàng.',
    },
    {
      'question': 'Calculation: Fill rate improves when you reduce…',
      'options': ['backorders', 'OTIF', 'MRP', 'dual-sourcing'],
      'correctIndex': 0,
      'explain': 'Giảm đơn chờ ⇒ tăng % đơn đáp ứng ngay.',
    },
    {
      'question': 'Practice: To stabilize flow, prefer…',
      'options': [
        'continuous flow & lô nhỏ',
        'lô cực lớn',
        'đẩy hàng theo quý',
        'dừng JIT',
      ],
      'correctIndex': 0,
      'explain': 'Dòng liên tục với lô nhỏ giảm chờ đợi.',
    },
    {
      'question': 'Improvement: To raise utilization safely, also track…',
      'options': [
        'WIP & lead time',
        'màu palette',
        'tỷ giá',
        'hashtag marketing',
      ],
      'correctIndex': 0,
      'explain': 'Tăng sử dụng dễ kéo theo WIP/lead time—cần kiểm soát.',
    },
    // —— 50 —— //
  ];

  // Metadata của bài luyện vocab7
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab7")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 7: Operations & Supply Chain',
        'questionCount': vocab7Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 8: Risk & Compliance (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab8Questions = <Map<String, dynamic>>[
    {
      'question': 'Meaning: “mitigate (v)” most nearly means…',
      'options': ['báo cáo', 'giảm thiểu', 'tuân thủ', 'thanh tra'],
      'correctIndex': 1,
      'explain': 'mitigate = giảm thiểu rủi ro/tác động.',
    },
    {
      'question': 'Identify: A “risk assessment (n)” is…',
      'options': [
        'kế hoạch dự phòng',
        'đánh giá rủi ro',
        'bảng điều khiển',
        'chứng thực',
      ],
      'correctIndex': 1,
      'explain': 'risk assessment = đánh giá rủi ro.',
    },
    {
      'question': 'Choose: Update the “risk register (n)” means…',
      'options': [
        'sổ đăng ký rủi ro',
        'bản quy tắc ứng xử',
        'hồ sơ thuế',
        'biên bản họp',
      ],
      'correctIndex': 0,
      'explain': 'risk register = sổ theo dõi rủi ro.',
    },
    {
      'question': 'Meaning: “likelihood (n)” refers to…',
      'options': ['biên độ', 'khả năng xảy ra', 'mức phạt', 'tốc độ'],
      'correctIndex': 1,
      'explain': 'likelihood = xác suất xảy ra.',
    },
    {
      'question': 'Meaning: “impact (n)” refers to…',
      'options': [
        'mức độ ảnh hưởng',
        'mức phạt',
        'quyền riêng tư',
        'giá trị còn lại',
      ],
      'correctIndex': 0,
      'explain': 'impact = mức độ tác động nếu xảy ra.',
    },
    {
      'question': 'Term: Strengthen internal “controls (n)” means…',
      'options': ['biện pháp kiểm soát', 'chế tài', 'hướng dẫn', 'điều tra'],
      'correctIndex': 0,
      'explain': 'controls = kiểm soát nội bộ.',
    },
    {
      'question': 'Meaning: “governance (n)” is…',
      'options': ['quản trị', 'giám sát', 'kiểm định', 'chứng nhận'],
      'correctIndex': 0,
      'explain': 'governance = khuôn khổ quản trị.',
    },
    {
      'question': 'Usage: Review the compliance “policy (n)”.',
      'options': ['quy trình', 'chính sách', 'bằng chứng', 'bản đồ rủi ro'],
      'correctIndex': 1,
      'explain': 'policy = chính sách.',
    },
    {
      'question': 'Choose the noun: Document all “procedures (n)”.',
      'options': ['quy trình', 'chế tài', 'khắc phục', 'nộp hồ sơ'],
      'correctIndex': 0,
      'explain': 'procedures = quy trình.',
    },
    {
      'question': 'Meaning: A “compliance audit (n)” is an audit of…',
      'options': ['tuân thủ', 'tài chính', 'an ninh mạng', 'HR'],
      'correctIndex': 0,
      'explain': 'đánh giá mức độ tuân thủ.',
    },
    {
      'question': 'Term: “due diligence (n)” most nearly means…',
      'options': [
        'thẩm tra (đầu tư/mua bán)',
        'nộp phạt',
        'điều tra hình sự',
        'đào tạo',
      ],
      'correctIndex': 0,
      'explain': 'due diligence = thẩm tra kỹ.',
    },
    {
      'question': 'Meaning: New “regulations (n)” were issued.',
      'options': ['quy định', 'phản biện', 'nghi vấn', 'đơn khiếu nại'],
      'correctIndex': 0,
      'explain': 'regulation = quy định pháp lý.',
    },
    {
      'question': 'Term: “sanction (n)” refers to…',
      'options': ['chế tài', 'bảo mật', 'bằng chứng', 'định vị'],
      'correctIndex': 0,
      'explain': 'sanctions = chế tài/xử phạt.',
    },
    {
      'question': 'Identify: A “whistleblower (n)” is…',
      'options': [
        'người tố giác',
        'kiểm toán viên',
        'điều tra viên',
        'cố vấn pháp lý',
      ],
      'correctIndex': 0,
      'explain': 'whistleblower = người tố giác sai phạm.',
    },
    {
      'question': 'Meaning: “fraud (n)” is…',
      'options': ['gian lận', 'hối lộ', 'bồi thường', 'thanh tra'],
      'correctIndex': 0,
      'explain': 'fraud = gian lận.',
    },
    {
      'question': 'Term: “bribery (n)” is…',
      'options': ['hối lộ', 'khiếu nại', 'kỷ luật', 'kháng cáo'],
      'correctIndex': 0,
      'explain': 'bribery = hành vi đưa/nhận hối lộ.',
    },
    {
      'question': 'Meaning: A “conflict of interest (n)” is…',
      'options': [
        'xung đột lợi ích',
        'xung đột lao động',
        'xung đột pháp lý',
        'xung đột thời gian',
      ],
      'correctIndex': 0,
      'explain': 'conflict of interest = lợi ích riêng ảnh hưởng quyết định.',
    },
    {
      'question': 'Term: “code of conduct (n)” refers to…',
      'options': ['quy tắc ứng xử', 'mã kiểm soát', 'mã nhân viên', 'mã dự án'],
      'correctIndex': 0,
      'explain': 'code of conduct = bộ quy tắc ứng xử.',
    },
    {
      'question': 'Meaning: “anti-money laundering (AML) (n)” focuses on…',
      'options': [
        'chống rửa tiền',
        'chống phá giá',
        'chống gian lận thuế',
        'chống spam',
      ],
      'correctIndex': 0,
      'explain': 'AML = chống rửa tiền.',
    },
    {
      'question': 'Abbrev: “KYC (n)” stands for…',
      'options': [
        'Know Your Customer',
        'Keep Your Compliance',
        'Key Yearly Check',
        'Know Your Code',
      ],
      'correctIndex': 0,
      'explain': 'KYC = xác minh khách hàng.',
    },
    {
      'question': 'Meaning: “data privacy (n)” is about…',
      'options': [
        'quyền riêng tư dữ liệu',
        'bảo trì dữ liệu',
        'nén dữ liệu',
        'mất dữ liệu',
      ],
      'correctIndex': 0,
      'explain': 'data privacy = bảo vệ dữ liệu cá nhân.',
    },
    {
      'question': 'Term: Comply with “GDPR (n)” means…',
      'options': [
        'Tuân thủ quy định bảo vệ dữ liệu EU',
        'Đóng thuế EU',
        'Theo ISO 14001',
        'Theo PCI-DSS',
      ],
      'correctIndex': 0,
      'explain': 'GDPR = EU General Data Protection Regulation.',
    },
    {
      'question': 'Meaning: Log the “incident (n)” immediately.',
      'options': ['sự cố', 'biên bản', 'chế tài', 'bằng chứng'],
      'correctIndex': 0,
      'explain': 'incident = sự cố cần ghi nhận.',
    },
    {
      'question': 'Term: Start “remediation (n)” steps means…',
      'options': ['khắc phục', 'phòng ngừa', 'điều tra', 'nộp hồ sơ'],
      'correctIndex': 0,
      'explain': 'remediation = khắc phục hậu quả.',
    },
    {
      'question': 'Meaning: Test the “business continuity (n)” plan =',
      'options': [
        'kế hoạch liên tục kinh doanh',
        'kế hoạch đào tạo',
        'kế hoạch doanh thu',
        'kế hoạch lương',
      ],
      'correctIndex': 0,
      'explain': 'BCP = duy trì hoạt động khi có sự cố.',
    },
    {
      'question': 'Term: Maintain a “contingency plan (n)”.',
      'options': [
        'kế hoạch dự phòng',
        'kế hoạch truyền thông',
        'kế hoạch bán hàng',
        'kế hoạch nghỉ phép',
      ],
      'correctIndex': 0,
      'explain': 'contingency plan = dự phòng khi rủi ro xảy ra.',
    },
    {
      'question': 'Meaning: Set “risk tolerance (n)” levels.',
      'options': [
        'ngưỡng chịu rủi ro',
        'mức phạt',
        'mức tín nhiệm',
        'mức chi phí',
      ],
      'correctIndex': 0,
      'explain': 'risk tolerance = ngưỡng chấp nhận rủi ro.',
    },
    {
      'question': 'Term: Define “escalation (n)” procedures.',
      'options': ['leo thang xử lý', 'giảm thiểu', 'đình chỉ', 'chuyển nhượng'],
      'correctIndex': 0,
      'explain': 'escalation = lộ trình đưa việc lên cấp cao hơn.',
    },
    {
      'question': 'Meaning: Annual “attestation (n)” is required.',
      'options': [
        'xác nhận/chứng thực',
        'bảo chứng tài sản',
        'đánh giá công việc',
        'đề xuất ngân sách',
      ],
      'correctIndex': 0,
      'explain': 'attestation = xác nhận tuân thủ định kỳ.',
    },
    {
      'question': 'Term: Submit “regulatory filings (n)”.',
      'options': [
        'hồ sơ nộp cơ quan quản lý',
        'báo cáo doanh thu',
        'bộ câu hỏi khảo sát',
        'báo cáo nội bộ',
      ],
      'correctIndex': 0,
      'explain': 'regulatory filing = hồ sơ theo yêu cầu cơ quan quản lý.',
    },

    // —— 20 câu vận dụng/ngữ cảnh để đủ 50 —— //
    {
      'question': 'Context: To mitigate fraud risk, first…',
      'options': [
        'tăng kiểm soát nội bộ',
        'giảm tần suất audit',
        'gỡ bỏ policy',
        'tắt nhật ký sự cố',
      ],
      'correctIndex': 0,
      'explain': 'Tăng controls giúp giảm rủi ro gian lận.',
    },
    {
      'question': 'Completion: A high likelihood & high impact risk is…',
      'options': [
        'ưu tiên xử lý cao',
        'ưu tiên thấp',
        'bỏ qua',
        'chuyển giao ngay',
      ],
      'correctIndex': 0,
      'explain': 'Rủi ro cao-cao cần xử lý trước.',
    },
    {
      'question': 'Choose the best: Conflicts of interest should be…',
      'options': [
        'khai báo & quản lý',
        'ủy quyền chi tiêu',
        'đóng băng hồ sơ',
        'ẩn khỏi audit',
      ],
      'correctIndex': 0,
      'explain': 'Phải khai báo để kiểm soát.',
    },
    {
      'question': 'Meaning: Whistleblowers must be…',
      'options': ['bảo vệ', 'kỷ luật', 'vô hiệu', 'chuyển công tác'],
      'correctIndex': 0,
      'explain': 'Chính sách bảo vệ người tố giác.',
    },
    {
      'question': 'Usage: AML programs commonly require…',
      'options': [
        'KYC & giám sát giao dịch',
        'nghỉ phép bắt buộc',
        'đổi tiền tệ',
        'tăng batch size',
      ],
      'correctIndex': 0,
      'explain': 'AML đi kèm KYC và monitoring.',
    },
    {
      'question': 'Fill in: Data privacy policies protect…',
      'options': ['thông tin cá nhân', 'tồn kho', 'thời gian giao', 'điểm bán'],
      'correctIndex': 0,
      'explain': 'Bảo vệ PII/ dữ liệu cá nhân.',
    },
    {
      'question': 'Choose: GDPR requires a lawful basis for…',
      'options': [
        'xử lý dữ liệu cá nhân',
        'giảm giá bán',
        'đặt hàng',
        'giao nhận',
      ],
      'correctIndex': 0,
      'explain': 'Phải có căn cứ pháp lý khi xử lý dữ liệu.',
    },
    {
      'question': 'Scenario: A system outage is an…',
      'options': ['incident', 'attestation', 'sanction', 'code of conduct'],
      'correctIndex': 0,
      'explain': 'Outage = sự cố cần ghi nhận.',
    },
    {
      'question': 'Action: After an incident, teams should start…',
      'options': ['remediation', 'sanctions', 'bribery', 'attestation'],
      'correctIndex': 0,
      'explain': 'Bắt đầu khắc phục.',
    },
    {
      'question': 'BCP: To improve business continuity, you should…',
      'options': ['diễn tập định kỳ', 'bỏ kiểm thử', 'khóa log', 'giảm policy'],
      'correctIndex': 0,
      'explain': 'BCP cần diễn tập.',
    },
    {
      'question': 'Planning: A contingency plan is activated when…',
      'options': [
        'rủi ro xảy ra',
        'doanh thu tăng',
        'tháng có 31 ngày',
        'thay đổi KPI',
      ],
      'correctIndex': 0,
      'explain': 'Kế hoạch dự phòng dùng khi rủi ro xảy ra.',
    },
    {
      'question': 'Risk matrix: If impact is low but likelihood is high, then…',
      'options': [
        'giảm xác suất xảy ra',
        'tăng doanh thu',
        'tăng giá',
        'khai báo PEP',
      ],
      'correctIndex': 0,
      'explain': 'Tập trung biện pháp giảm xác suất.',
    },
    {
      'question': 'Escalation: Major breaches should be…',
      'options': ['leo thang ngay', 'đợi quý sau', 'ẩn đi', 'chuyển kho'],
      'correctIndex': 0,
      'explain': 'Phải escalate theo quy trình.',
    },
    {
      'question': 'Attestation: Employees annually…',
      'options': [
        'xác nhận đọc & tuân thủ policy',
        'tắt logging',
        'đổi KPI',
        'nộp đơn nghỉ',
      ],
      'correctIndex': 0,
      'explain': 'Attestation hằng năm với policy/CoC.',
    },
    {
      'question': 'Regulatory filing: Companies must…',
      'options': [
        'nộp hồ sơ đúng hạn',
        'dừng hoạt động',
        'bán tài sản',
        'thay đổi thương hiệu',
      ],
      'correctIndex': 0,
      'explain': 'Filings phải đúng hạn/đúng chuẩn.',
    },
    {
      'question': 'Controls: Segregation of duties helps…',
      'options': [
        'giảm gian lận',
        'giảm doanh thu',
        'tăng lead time',
        'tăng batch size',
      ],
      'correctIndex': 0,
      'explain': 'Phân tách nhiệm vụ để giảm rủi ro.',
    },
    {
      'question': 'Policy vs Procedure: A policy is…',
      'options': [
        'nguyên tắc định hướng',
        'bước thao tác chi tiết',
        'mức phạt',
        'bảng KPI',
      ],
      'correctIndex': 0,
      'explain': 'Policy = định hướng; Procedure = cách làm cụ thể.',
    },
    {
      'question': 'Code of conduct typically covers…',
      'options': [
        'đạo đức & ứng xử',
        'chỉ tiêu bán hàng',
        'kích cỡ lô',
        'định mức tồn kho',
      ],
      'correctIndex': 0,
      'explain': 'Quy tắc ứng xử/đạo đức nghề nghiệp.',
    },
    {
      'question': 'Conflicts of interest should be…',
      'options': ['disclosed & managed', 'tuyệt mật', 'khuyến khích', 'bỏ qua'],
      'correctIndex': 0,
      'explain': 'Phải khai báo và kiểm soát.',
    },
    {
      'question': 'Sanctions: If a vendor is on a sanctions list, you should…',
      'options': [
        'dừng giao dịch & báo cáo',
        'tăng hạn mức',
        'giảm kiểm soát',
        'bỏ audit',
      ],
      'correctIndex': 0,
      'explain': 'Tuân thủ danh sách chế tài.',
    },
  ];

  // Ghi metadata của bài luyện vocab8
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab8")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 8: Risk & Compliance',
        'questionCount': vocab8Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 9: Advanced Marketing & ROI (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab9Questions = <Map<String, dynamic>>[
    // --- Core terms (1–30) ---
    {
      'question': 'Meaning: “segmentation (n)” most nearly means…',
      'options': [
        'định vị',
        'phân khúc',
        'giá trị đề xuất',
        'chân dung khách hàng',
      ],
      'correctIndex': 1,
      'explain': 'segmentation = phân khúc khách hàng.',
    },
    {
      'question': 'Meaning: “positioning (n)” is…',
      'options': [
        'định vị thương hiệu/sản phẩm',
        'phân khúc',
        'tệp tương tự',
        'ý nghĩa thống kê',
      ],
      'correctIndex': 0,
      'explain': 'positioning = định vị trong tâm trí khách hàng.',
    },
    {
      'question': 'Term: “brand equity (n)” refers to…',
      'options': [
        'giá trị thương hiệu',
        'thị phần',
        'giá trị vòng đời',
        'chi phí/lead',
      ],
      'correctIndex': 0,
      'explain': 'brand equity = giá trị thương hiệu tích luỹ theo thời gian.',
    },
    {
      'question': 'Meaning: “value proposition (n)” is…',
      'options': [
        'giá trị đề xuất',
        'đầu phễu',
        'tỷ lệ nhấp',
        'độ co giãn giá',
      ],
      'correctIndex': 0,
      'explain': 'value proposition = lời hứa giá trị cốt lõi.',
    },
    {
      'question': 'Meaning: “persona (n)” in marketing is…',
      'options': [
        'chân dung khách hàng',
        'phễu',
        'ngân sách media',
        'đầu phễu',
      ],
      'correctIndex': 0,
      'explain': 'persona = hồ sơ người mua đại diện.',
    },
    {
      'question': 'Meaning: “attribution (n)” most nearly means…',
      'options': [
        'quy gán hiệu quả',
        'tối ưu phễu',
        'tệp tương tự',
        'đầu tư mạo hiểm',
      ],
      'correctIndex': 0,
      'explain': 'attribution = quy gán đóng góp kênh/điểm chạm.',
    },
    {
      'question': 'Abbrev: “LTV (n)” stands for…',
      'options': [
        'Lifetime Value',
        'Lead Time Value',
        'Listed Target Value',
        'Local Trend Value',
      ],
      'correctIndex': 0,
      'explain': 'LTV = giá trị vòng đời khách hàng.',
    },
    {
      'question': 'Abbrev: “CAC (n)” stands for…',
      'options': [
        'Customer Acquisition Cost',
        'Customer Average Cost',
        'Campaign Average Cost',
        'Conversion Attribution Coef.',
      ],
      'correctIndex': 0,
      'explain': 'CAC = chi phí thu hút khách hàng.',
    },
    {
      'question': 'Meaning: “churn rate (n)” is…',
      'options': [
        'tỷ lệ rời bỏ',
        'tỷ lệ nhấp',
        'mức tăng chuyển đổi',
        'chi phí/1000 hiển thị',
      ],
      'correctIndex': 0,
      'explain': 'churn rate = phần trăm khách rời đi.',
    },
    {
      'question': 'Term: “A/B testing (n)” refers to…',
      'options': [
        'thử nghiệm A/B',
        'thí nghiệm R&D',
        'đo lường tồn kho',
        'định vị giá',
      ],
      'correctIndex': 0,
      'explain': 'A/B testing = so sánh 2 biến thể.',
    },
    {
      'question': 'Meaning: “statistical significance (n)” is…',
      'options': [
        'ý nghĩa thống kê',
        'độ phủ thương hiệu',
        'tệp tương tự',
        'chi phí/lead',
      ],
      'correctIndex': 0,
      'explain': 'Significance = khác biệt khó do ngẫu nhiên.',
    },
    {
      'question': 'Meaning: “confidence interval (n)” refers to…',
      'options': [
        'khoảng tin cậy',
        'độ co giãn giá',
        'cuối phễu',
        'mức tăng chuyển đổi',
      ],
      'correctIndex': 0,
      'explain': 'CI = khoảng giá trị ước lượng với độ tin cậy.',
    },
    {
      'question': 'Meaning: “funnel (n)” in marketing is…',
      'options': [
        'phễu chuyển đổi',
        'giá trị đề xuất',
        'thị phần',
        'độ co giãn giá',
      ],
      'correctIndex': 0,
      'explain': 'funnel = hành trình từ nhận biết → mua.',
    },
    {
      'question': 'Meaning: “top-of-funnel (n)” (TOFU) is…',
      'options': ['đầu phễu', 'giữa phễu', 'cuối phễu', 'ngoài phễu'],
      'correctIndex': 0,
      'explain': 'TOFU = giai đoạn nhận biết.',
    },
    {
      'question': 'Meaning: “bottom-of-funnel (n)” (BOFU) is…',
      'options': ['cuối phễu', 'đầu phễu', 'phân khúc', 'tệp tương tự'],
      'correctIndex': 0,
      'explain': 'BOFU = gần chuyển đổi/mua.',
    },
    {
      'question': 'Meaning: “retargeting (n)” is…',
      'options': [
        'tiếp thị bám đuổi',
        'định vị',
        'phân khúc',
        'đo lường thị phần',
      ],
      'correctIndex': 0,
      'explain': 'retargeting = nhắm lại người đã tương tác.',
    },
    {
      'question': 'Meaning: “lookalike audience (n)” is…',
      'options': [
        'tệp tương tự',
        'khán giả cao cấp',
        'đối thủ cạnh tranh',
        'tệp cốt lõi',
      ],
      'correctIndex': 0,
      'explain': 'lookalike = nhóm giống khách hiện hữu.',
    },
    {
      'question': 'Term: “marketing mix (n)” refers to…',
      'options': [
        'phối thức marketing',
        'phân tích cohort',
        'brand lift',
        'incrementality',
      ],
      'correctIndex': 0,
      'explain': 'Marketing mix = 4P/7P.',
    },
    {
      'question': 'Meaning: “media spend (n)” is…',
      'options': [
        'ngân sách truyền thông',
        'chi phí logistics',
        'chi phí vận hành',
        'ngân sách R&D',
      ],
      'correctIndex': 0,
      'explain': 'media spend = chi phí chạy media.',
    },
    {
      'question': 'Abbrev: “ROI (n)” stands for…',
      'options': [
        'Return on Investment',
        'Rate of Impressions',
        'Reach over Interest',
        'Return on Incrementality',
      ],
      'correctIndex': 0,
      'explain': 'ROI = lợi tức đầu tư.',
    },
    {
      'question': 'Abbrev: “ROAS (n)” stands for…',
      'options': [
        'Return on Ad Spend',
        'Reach of Audience Size',
        'Rate of Average Sales',
        'Revenue over Active Subs',
      ],
      'correctIndex': 0,
      'explain': 'ROAS = lợi tức chi cho quảng cáo.',
    },
    {
      'question': 'Abbrev: “CPL (n)” means…',
      'options': [
        'Cost per Lead',
        'Cost per Like',
        'Conversion per Landing',
        'Cost per Lifetime',
      ],
      'correctIndex': 0,
      'explain': 'CPL = chi phí/lead.',
    },
    {
      'question': 'Abbrev: “CPM (n)” means…',
      'options': [
        'Cost per 1000 impressions',
        'Conversion per Minute',
        'Cost per Mail',
        'Clicks per Mille',
      ],
      'correctIndex': 0,
      'explain': 'CPM = chi phí cho 1000 hiển thị.',
    },
    {
      'question': 'Abbrev: “CTR (n)” means…',
      'options': [
        'Click-Through Rate',
        'Cost-to-Revenue',
        'Customer Time Retained',
        'Channel Trend Ratio',
      ],
      'correctIndex': 0,
      'explain': 'CTR = tỷ lệ nhấp.',
    },
    {
      'question': 'Meaning: “conversion lift (n)” is…',
      'options': [
        'mức tăng chuyển đổi',
        'tỷ lệ rời bỏ',
        'độ co giãn giá',
        'thị phần',
      ],
      'correctIndex': 0,
      'explain': 'conversion lift = tăng thêm do tác động chiến dịch.',
    },
    {
      'question': 'Meaning: “incrementality (n)” refers to…',
      'options': [
        'tính gia tăng do chiến dịch',
        'tính mùa vụ',
        'tính phân đoạn',
        'tính suy giảm',
      ],
      'correctIndex': 0,
      'explain': 'incrementality = tác động “thêm” so với baseline.',
    },
    {
      'question': 'Meaning: “cohort analysis (n)” is…',
      'options': [
        'phân tích theo nhóm khách',
        'phân tích đối thủ',
        'phân tích kênh bán',
        'phân tích SKU',
      ],
      'correctIndex': 0,
      'explain': 'cohort analysis = nhóm người dùng theo thời điểm/thể loại.',
    },
    {
      'question': 'Meaning: “brand lift (n)” is…',
      'options': [
        'mức nâng nhận biết/thái độ',
        'mức tăng CTR',
        'mức tăng tồn kho',
        'mức tăng chi phí',
      ],
      'correctIndex': 0,
      'explain': 'brand lift = thay đổi về nhận biết/ý định.',
    },
    {
      'question': 'Meaning: “market share (n)” is…',
      'options': [
        'thị phần',
        'giá trị thương hiệu',
        'tệp tương tự',
        'đầu phễu',
      ],
      'correctIndex': 0,
      'explain': 'market share = % doanh số của thị trường.',
    },
    {
      'question': 'Meaning: “pricing elasticity (n)” is…',
      'options': [
        'độ co giãn giá',
        'giá trị đề xuất',
        'chi phí/lead',
        'đầu phễu',
      ],
      'correctIndex': 0,
      'explain': 'elasticity = mức thay đổi cầu khi giá thay đổi.',
    },

    // --- Applied / context questions (31–50) ---
    {
      'question': 'Context: To lower CAC while keeping growth, you should…',
      'options': [
        'tối ưu phễu & nhắm mục tiêu',
        'giảm CTR',
        'tăng CPM không giới hạn',
        'bỏ đo lường',
      ],
      'correctIndex': 0,
      'explain': 'Nhắm đúng + tối ưu funnel giúp giảm CAC.',
    },
    {
      'question': 'Completion: Increase LTV by focusing on…',
      'options': [
        'giữ chân & bán thêm',
        'giảm ROAS',
        'tăng churn',
        'giảm A/B testing',
      ],
      'correctIndex': 0,
      'explain': 'Retention, upsell, cross-sell → LTV tăng.',
    },
    {
      'question': 'Choose the best: A/B tests should reach…',
      'options': [
        'ý nghĩa thống kê',
        'CPM thấp nhất',
        'CPL cao nhất',
        'BOFU ngay lập tức',
      ],
      'correctIndex': 0,
      'explain': 'Phải đủ power để có significance.',
    },
    {
      'question': 'Meaning: A 95% confidence interval tells you…',
      'options': [
        'khoảng ước lượng có 95% độ tin cậy',
        'dữ liệu đúng 95%',
        'ROI chắc chắn 95%',
        'CTR = 95%',
      ],
      'correctIndex': 0,
      'explain': 'Diễn giải đúng của CI 95%.',
    },
    {
      'question':
          'Scenario: A campaign raises conversion lift but ROAS falls. Likely cause?',
      'options': [
        'media spend tăng nhanh hơn doanh thu',
        'CTR tăng quá mạnh',
        'CPM quá thấp',
        'churn = 0',
      ],
      'correctIndex': 0,
      'explain': 'Chi tiêu tăng nhanh hơn kết quả → ROAS giảm.',
    },
    {
      'question': 'Decision: To grow top-of-funnel traffic, prioritize…',
      'options': [
        'nhận biết & reach',
        'chốt sale ngay',
        'giảm hiển thị',
        'bỏ nhắm mục tiêu',
      ],
      'correctIndex': 0,
      'explain': 'TOFU tập trung reach/awareness.',
    },
    {
      'question': 'Optimization: Improve bottom-of-funnel CR by…',
      'options': [
        'tối ưu landing & offer',
        'tăng CPM',
        'giảm số biến thể test',
        'chỉ nhắm tệp tương tự',
      ],
      'correctIndex': 0,
      'explain': 'BOFU cần tối ưu trải nghiệm & ưu đãi.',
    },
    {
      'question': 'Attribution: Multi-touch attribution helps…',
      'options': [
        'đánh giá nhiều điểm chạm',
        'giảm churn trực tiếp',
        'tăng CPM',
        'định giá sản phẩm',
      ],
      'correctIndex': 0,
      'explain': 'Phân bổ công lao nhiều kênh/điểm chạm.',
    },
    {
      'question': 'Targeting: Use a lookalike audience to…',
      'options': [
        'mở rộng tệp chất lượng giống tệp gốc',
        'giảm reach',
        'tăng churn',
        'bỏ segmentation',
      ],
      'correctIndex': 0,
      'explain': 'Lookalike mở rộng khách tương tự khách tốt.',
    },
    {
      'question': 'Metric link: If CTR is high but CVR is low, fix…',
      'options': ['landing page/offer', 'CPM', 'reach', 'brand equity'],
      'correctIndex': 0,
      'explain': 'Nút thắt sau click (LP/offer) cần tối ưu.',
    },
    {
      'question': 'Budgeting: To improve ROAS, you typically…',
      'options': [
        'phân bổ lại media spend vào kênh hiệu quả',
        'tăng CPM chung',
        'giảm A/B testing',
        'bỏ đo lường incrementality',
      ],
      'correctIndex': 0,
      'explain': 'Dồn ngân sách cho kênh có hiệu suất cao.',
    },
    {
      'question': 'Cohorts: A cohort analysis by signup month can reveal…',
      'options': [
        'giữ chân theo thời gian',
        'CPM theo ngày',
        'màu sắc ưa thích',
        'định vị thương hiệu',
      ],
      'correctIndex': 0,
      'explain': 'Cohort cho thấy retention theo batch.',
    },
    {
      'question': 'Brand study: Brand lift measures changes in…',
      'options': ['nhận biết/ý định', 'CPM', 'CPL', 'CAC'],
      'correctIndex': 0,
      'explain': 'Brand lift = awareness/consideration/intent.',
    },
    {
      'question': 'Market share rises fastest when you…',
      'options': [
        'tăng doanh số nhanh hơn ngành',
        'giảm ROAS xuống 0',
        'tăng churn',
        'chỉ làm TOFU',
      ],
      'correctIndex': 0,
      'explain': 'Thị phần = tỉ lệ doanh số trong toàn thị trường.',
    },
    {
      'question':
          'Elasticity: If demand is highly elastic, a small price cut may…',
      'options': [
        'tăng mạnh lượng bán',
        'không đổi lượng bán',
        'tăng CAC',
        'tăng CPM',
      ],
      'correctIndex': 0,
      'explain': 'Cầu co giãn cao → nhạy với giá.',
    },
    {
      'question': 'Performance: A sustainable way to lower CPL is…',
      'options': [
        'cải thiện nhắm mục tiêu & sáng tạo',
        'mua hiển thị đắt hơn',
        'giảm tần suất test',
        'tắt theo dõi chuyển đổi',
      ],
      'correctIndex': 0,
      'explain': 'Nhắm mục tiêu + creative tốt → CPL giảm.',
    },
    {
      'question': 'Testing: When running A/B tests, you should also…',
      'options': [
        'kiểm tra power & sample size',
        'tăng CPM',
        'ẩn CTR',
        'bỏ CI',
      ],
      'correctIndex': 0,
      'explain': 'Power/sample size đảm bảo kết luận đáng tin.',
    },
    {
      'question': 'Funnel: A sudden TOFU spike with flat BOFU often means…',
      'options': [
        'chất lượng traffic thấp/LP kém',
        'brand lift tăng',
        'market share tăng',
        'elasticity cao',
      ],
      'correctIndex': 0,
      'explain': 'Đầu phễu tăng nhưng cuối phễu không đổi → chất lượng/LP.',
    },
    {
      'question': 'Incrementality test helps you…',
      'options': [
        'đo tác động “thêm” so với baseline',
        'đo CPM',
        'đếm phiên',
        'vẽ bản đồ thị phần',
      ],
      'correctIndex': 0,
      'explain': 'Phân tách hiệu ứng nhân quả của chiến dịch.',
    },
    {
      'question': 'If CAC > LTV, you should…',
      'options': [
        'dừng/điều chỉnh chiến dịch & tối ưu retention',
        'tăng chi tiêu ngay',
        'bỏ theo dõi churn',
        'chỉ làm TOFU',
      ],
      'correctIndex': 0,
      'explain': 'Unit economics âm → cần điều chỉnh ngay.',
    },
  ];

  // Ghi metadata của bài luyện vocab9
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab9")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 9: Advanced Marketing & ROI',
        'questionCount': vocab9Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50 (đã sắp xếp options sẵn; UI có thể shuffle thêm nếu muốn)
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
  // Vocab 10: Formal Correspondence Pro+ (50 câu; đáp án đúng KHÔNG cố định ở index 0)
  // =========================
  final vocab10Questions = <Map<String, dynamic>>[
    // ===== Core terms from the list =====
    {
      'question': 'Meaning: “hereby (adv)” most nearly means…',
      'options': ['tại đây', 'bằng văn bản này', 'kể từ nay', 'đến đây'],
      'correctIndex': 1,
      'explain': 'hereby = bằng văn bản này (We hereby confirm…).',
    },
    {
      'question': 'Meaning: “herewith (adv)” is used to mean…',
      'options': ['kèm theo đây', 'trong đó', 'do đó', 'vì vậy'],
      'correctIndex': 0,
      'explain': 'herewith = kèm theo đây (Please find herewith…).',
    },
    {
      'question': 'Meaning: “thereof (adv)” refers to…',
      'options': ['trong đó', 'của cái đó', 'bên trên', 'bên dưới'],
      'correctIndex': 1,
      'explain': 'thereof = của cái đó (terms and conditions thereof).',
    },
    {
      'question': 'Meaning: “therein (adv)” is…',
      'options': [
        'ở đó/trong đó',
        'tại đây',
        'ngay sau đây',
        'bằng văn bản này',
      ],
      'correctIndex': 0,
      'explain': 'therein = trong đó (as specified therein).',
    },
    {
      'question': 'Meaning: “hereto (adv)” most nearly means…',
      'options': [
        'đính kèm vào văn kiện này',
        'từ đây trở đi',
        'đến hạn',
        'ngay lập tức',
      ],
      'correctIndex': 0,
      'explain': 'hereto = đính kèm văn kiện này (Annex A hereto).',
    },
    {
      'question': 'Meaning: “aforementioned (adj)” is…',
      'options': ['nêu trên', 'đáng kể', 'liên quan', 'tạm thời'],
      'correctIndex': 0,
      'explain': 'aforementioned = đã nêu trên.',
    },
    {
      'question': 'Meaning: “notwithstanding (prep)” ≈',
      'options': ['bất chấp/mặc dù', 'do vậy', 'vì thế', 'tuy nhiên'],
      'correctIndex': 0,
      'explain': 'notwithstanding = mặc dù.',
    },
    {
      'question': 'Meaning: “pursuant to (prep)” most nearly means…',
      'options': ['trước khi', 'theo như/phù hợp với', 'ngoài ra', 'mặc dù'],
      'correctIndex': 1,
      'explain': 'pursuant to = theo như (Pursuant to your request…).',
    },
    {
      'question': 'Verb: To “enclose (v)” in a letter means…',
      'options': ['đính kèm', 'xóa bỏ', 'giải thích', 'xử lý'],
      'correctIndex': 0,
      'explain': 'enclose = đính kèm tài liệu.',
    },
    {
      'question': 'Verb: To “acknowledge (v)” a letter is to…',
      'options': ['bác bỏ', 'xác nhận đã nhận', 'chuyển tiếp', 'từ chối'],
      'correctIndex': 1,
      'explain': 'acknowledge = xác nhận.',
    },
    {
      'question': 'Verb: To “endorse (v)” a plan is to…',
      'options': ['phản đối', 'tạm hoãn', 'chứng thực/tán thành', 'sửa đổi'],
      'correctIndex': 2,
      'explain': 'endorse = tán thành/chứng thực.',
    },
    {
      'question': '“consent (n/v)” in formal writing is…',
      'options': ['khiếu nại', 'đồng ý/chấp thuận', 'tự ý', 'bảo lưu'],
      'correctIndex': 1,
      'explain': 'consent = chấp thuận, thường bằng văn bản.',
    },
    {
      'question': 'Verb: “undertake (v)” most nearly means…',
      'options': ['cam kết thực hiện', 'trì hoãn', 'giảm nhẹ', 'bãi bỏ'],
      'correctIndex': 0,
      'explain': 'undertake = cam kết.',
    },
    {
      'question': 'Adverb: “nonetheless (adv)” is closest to…',
      'options': ['mặt khác', 'tuy nhiên', 'vì thế', 'hơn nữa'],
      'correctIndex': 1,
      'explain': 'nonetheless = tuy nhiên.',
    },
    {
      'question': 'Conjunction: “whereas” is often used to mean…',
      'options': ['xét rằng', 'mặc dù', 'đến nỗi', 'miễn là'],
      'correctIndex': 0,
      'explain': 'whereas = xét rằng (mở đầu điều khoản).',
    },
    {
      'question': 'Adverb: “hereinafter” is used to mean…',
      'options': [
        'từ nay về sau (trong văn bản này)',
        'ngay lập tức',
        'tùy nghi',
        'theo đó',
      ],
      'correctIndex': 0,
      'explain': 'hereinafter = sau đây trong văn bản.',
    },
    {
      'question': 'Adj: “forthcoming” in letters most nearly means…',
      'options': ['quá hạn', 'sắp tới', 'đầy đủ', 'chính xác'],
      'correctIndex': 1,
      'explain': 'forthcoming response = phản hồi sắp tới.',
    },
    {
      'question': 'Verb: “expedite” an order means…',
      'options': ['đẩy nhanh', 'hủy bỏ', 'tái phát hành', 'khiếu nại'],
      'correctIndex': 0,
      'explain': 'expedite = tăng tốc xử lý/giao.',
    },
    {
      'question': 'Verb: “defer” a meeting means…',
      'options': [
        'hủy vĩnh viễn',
        'chuyển sang online',
        'hoãn lại',
        'giảm thời lượng',
      ],
      'correctIndex': 2,
      'explain': 'defer = hoãn.',
    },
    {
      'question': 'Verb: “rectify” an error means…',
      'options': ['sửa sai', 'bỏ qua', 'tường trình', 'khiếu nại'],
      'correctIndex': 0,
      'explain': 'rectify = chỉnh sửa lỗi.',
    },
    {
      'question': '“redress (n/v)” most nearly means…',
      'options': ['khắc phục/đền bù', 'tái cấu trúc', 'phản hồi', 'ủy quyền'],
      'correctIndex': 0,
      'explain': 'seek redress for losses = yêu cầu đền bù.',
    },
    {
      'question': 'Adj: “pertinent” details are…',
      'options': ['khẩn cấp', 'liên quan', 'tuyệt mật', 'khó hiểu'],
      'correctIndex': 1,
      'explain': 'pertinent = có liên quan.',
    },
    {
      'question': 'Phrase: “aforementioned parties” means…',
      'options': [
        'các bên nêu trên',
        'các bên thứ ba',
        'các bên mới',
        'bên nhận uỷ thác',
      ],
      'correctIndex': 0,
      'explain': 'aforementioned parties = các bên nêu trên.',
    },
    {
      'question': 'Adj: An “overdue” invoice is…',
      'options': ['đã quá hạn', 'tạm khóa', 'đang soạn', 'đã hủy'],
      'correctIndex': 0,
      'explain': 'overdue = quá hạn thanh toán.',
    },
    {
      'question': 'Verb: Please “remit” the balance means…',
      'options': ['đối soát', 'chuyển tiền', 'khấu trừ', 'hoãn lại'],
      'correctIndex': 1,
      'explain': 'remit = chuyển tiền.',
    },
    {
      'question': 'Noun: An “enquiry” in formal letters is…',
      'options': [
        'thư hỏi thông tin',
        'đơn khiếu nại',
        'biên bản họp',
        'biên lai',
      ],
      'correctIndex': 0,
      'explain': 'enquiry = yêu cầu thông tin.',
    },
    {
      'question': 'Noun: “courtesy” in this context is…',
      'options': ['nhã ý/thiện chí', 'lời cảm ơn', 'xin lỗi', 'điều kiện'],
      'correctIndex': 0,
      'explain': 'as a courtesy = như một nhã ý.',
    },
    {
      'question': 'Noun: File a formal “grievance” means to…',
      'options': ['khiếu nại', 'kiến nghị', 'biểu quyết', 'ủy quyền'],
      'correctIndex': 0,
      'explain': 'grievance = khiếu nại chính thức.',
    },
    {
      'question': '“annex (n/v)” in documents is…',
      'options': ['phụ lục/đính kèm', 'bút phê', 'bảng kê', 'mã hóa'],
      'correctIndex': 0,
      'explain': 'annex = phụ lục; to annex = đính kèm.',
    },
    {
      'question': 'Verb: Kindly “convey” our thanks.',
      'options': ['truyền đạt', 'xem xét', 'tạm giữ', 'ủy quyền'],
      'correctIndex': 0,
      'explain': 'convey = truyền đạt/chuyển lời.',
    },

    // ===== Applied/context items to reach 50 =====
    {
      'question': 'Completion: We ___ acknowledge receipt of your letter.',
      'options': ['herewith', 'hereby', 'thereof', 'hereto'],
      'correctIndex': 1,
      'explain': 'We hereby acknowledge… (bằng văn bản này).',
    },
    {
      'question': 'Choose the best: Please find ___ the signed contract.',
      'options': ['hereto', 'herewith', 'hereinafter', 'therein'],
      'correctIndex': 1,
      'explain': 'herewith = kèm theo đây.',
    },
    {
      'question': 'Fill in: Terms and conditions ___ apply.',
      'options': ['hereinafter', 'thereof', 'hereto', 'whereas'],
      'correctIndex': 1,
      'explain': 'thereof = của tài liệu đó.',
    },
    {
      'question': 'Clause use: “The Supplier, ___ referred to as ‘Vendor’.”',
      'options': ['whereas', 'notwithstanding', 'hereinafter', 'herewith'],
      'correctIndex': 2,
      'explain': 'hereinafter = sau đây gọi là.',
    },
    {
      'question':
          'Meaning in context: “___ the delay, we proceed with shipment.”',
      'options': ['Pursuant to', 'Notwithstanding', 'Herewith', 'Thereof'],
      'correctIndex': 1,
      'explain': 'notwithstanding = mặc dù.',
    },
    {
      'question': 'Legal style: “___ your request, we enclose Annex A.”',
      'options': ['Hereby', 'Pursuant to', 'Nonetheless', 'Therein'],
      'correctIndex': 1,
      'explain': 'Pursuant to your request…',
    },
    {
      'question': 'Polite action: We ___ to deliver on time.',
      'options': ['endorse', 'undertake', 'remit', 'rectify'],
      'correctIndex': 1,
      'explain': 'undertake = cam kết thực hiện.',
    },
    {
      'question': 'Register: As a ___, we extended the payment term.',
      'options': ['grievance', 'courtesy', 'annex', 'consent'],
      'correctIndex': 1,
      'explain': 'as a courtesy = như một nhã ý.',
    },
    {
      'question': 'Usage: Kindly ___ payment at your earliest convenience.',
      'options': ['grieve', 'rectify', 'remit', 'endorse'],
      'correctIndex': 2,
      'explain': 'remit = chuyển tiền.',
    },
    {
      'question': 'Scenario: “Your invoice is ___; please arrange payment.”',
      'options': ['forthcoming', 'overdue', 'hereto', 'thereof'],
      'correctIndex': 1,
      'explain': 'overdue = quá hạn.',
    },
    {
      'question': 'Tone: “We will ___ the shipment to meet your launch date.”',
      'options': ['defer', 'expedite', 'annex', 'acknowledge'],
      'correctIndex': 1,
      'explain': 'expedite = đẩy nhanh.',
    },
    {
      'question': 'Register check: “Please see the ___ for details.”',
      'options': ['aforementioned', 'annex', 'consent', 'rectify'],
      'correctIndex': 1,
      'explain': 'see the annex = xem phụ lục.',
    },
    {
      'question': 'Precision: “Provide all ___ details to process the claim.”',
      'options': ['pertinent', 'overdue', 'hereto', 'thereof'],
      'correctIndex': 0,
      'explain': 'pertinent = liên quan.',
    },
    {
      'question': 'Style: “We seek ___ for the losses caused.”',
      'options': ['courtesy', 'redress', 'remit', 'annex'],
      'correctIndex': 1,
      'explain': 'seek redress = yêu cầu đền bù.',
    },
    {
      'question': 'Opening: “___, the parties agree as follows…”',
      'options': ['Whereas', 'Herewith', 'Therein', 'Hereto'],
      'correctIndex': 0,
      'explain': 'whereas = xét rằng.',
    },
    {
      'question': 'Email phrase: “Please ___ your consent by Friday.”',
      'options': ['acknowledge', 'endorse', 'convey', 'provide'],
      'correctIndex': 3,
      'explain': 'provide consent = cung cấp chấp thuận.',
    },
    {
      'question':
          'Correct pair: “We found an error and will ___ it immediately.”',
      'options': ['remit', 'rectify', 'endorse', 'defer'],
      'correctIndex': 1,
      'explain': 'rectify an error = sửa lỗi.',
    },
    {
      'question': 'Register: “We respond to your ___ dated 12 May.”',
      'options': ['enquiry', 'grievance', 'annex', 'hereby'],
      'correctIndex': 0,
      'explain': 'respond to your enquiry.',
    },
    {
      'question': 'Choice: Which is most formal to “attach”:',
      'options': ['enclose', 'clip', 'put in', 'tie'],
      'correctIndex': 0,
      'explain': 'enclose = đính kèm (formal).',
    },
    {
      'question': 'Closing line: “Kindly ___ our appreciation to your team.”',
      'options': ['undertake', 'convey', 'endorse', 'defer'],
      'correctIndex': 1,
      'explain': 'convey our appreciation = chuyển lời cảm ơn.',
    },
  ];

  // Metadata cho bài luyện vocab10
  await db
      .collection('vocab_practice')
      .doc(levelId)
      .collection('vocab_topics')
      .doc("vocab10")
      .set({
        'type': 'Vocab MCQ',
        'topicName': 'Bài 10: Formal Correspondence Pro+',
        'questionCount': vocab10Questions.length,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

  // Ghi câu hỏi q01..q50
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
