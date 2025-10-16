class QuestionLR {
  final String id;
  final String? question;
  final String? imagePath; // Supabase storage path
  final List<String> options;
  final int correctIndex;
  final String explain;
  final int order;

  QuestionLR({
    required this.id,
    this.question,
    this.imagePath,
    required this.options,
    required this.correctIndex,
    required this.explain,
    required this.order,
  });

  factory QuestionLR.fromMap(String id, Map<String, dynamic> m) {
    return QuestionLR(
      id: id,
      question: m['question'] as String?,
      imagePath: m['imagePath'] as String?,
      options: List<String>.from(m['options'] ?? []),
      correctIndex: (m['correctIndex'] ?? 0) as int,
      explain: m['explain'] as String,
      order: (m['order'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toMap() => {
    'question': question,
    'imagePath': imagePath,
    'options': options,
    'correctIndex': correctIndex,
    'explain': explain,
    'order': order,
  };
}
