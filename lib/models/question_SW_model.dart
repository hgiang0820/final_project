class QuestionSW {
  final String id;
  final String? text;
  final String? imagePath; // Supabase storage path
  final int order;
  final String type; // optional
  final String sampleAnswer; // optional
  final int? prepareTime; // optional, in seconds
  final int? recordTime; // optional, in seconds
  final String directions;
  final int maxScore;

  QuestionSW({
    required this.id,
    this.text,
    this.imagePath,
    required this.order,
    required this.type,
    required this.sampleAnswer,
    this.prepareTime,
    this.recordTime,
    required this.directions,
    required this.maxScore,
  });

  factory QuestionSW.fromMap(String id, Map<String, dynamic> m) {
    return QuestionSW(
      id: id,
      text: m['text'] as String?,
      imagePath: m['imagePath'] as String?,
      order: (m['order'] ?? 0) as int,
      type: m['type'] as String,
      sampleAnswer: m['sample_answer'] as String,
      directions: m['directions'] as String,
      maxScore: m['max_score'] as int,
      prepareTime: (m['prepare_time'] ?? 0) as int,
      recordTime: (m['record_time'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toMap() => {
    'text': text,
    'imagePath': imagePath,
    'order': order,
    'type': type,
    'sample_answer': sampleAnswer,
    'prepare_time': prepareTime,
    'record_time': recordTime,
    'directions': directions,
    'max_score': maxScore,
  };
}
