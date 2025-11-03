class VocabTopic {
  final String id;
  final String levelId;
  final String topicName;
  final int order;
  final int questionCount;
  final String? pdfPath;
  final String? pdfUrl;

  const VocabTopic({
    required this.id,
    required this.levelId,
    required this.topicName,
    required this.order,
    required this.questionCount,
    this.pdfPath,
    this.pdfUrl,
  });
}

class VocabQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final int order;
  final String? explanation;
  final String? imageUrl;
  final String? audioUrl;

  const VocabQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.order,
    this.explanation,
    this.imageUrl,
    this.audioUrl,
  });
}
