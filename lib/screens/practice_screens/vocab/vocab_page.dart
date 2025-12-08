import 'package:final_project/repositories/vocab_repository.dart';
import 'package:final_project/screens/practice_screens/vocab/vocab_flashcards_page.dart';
import 'package:final_project/screens/practice_screens/vocab/vocab_practice_page.dart';
import 'package:final_project/screens/study_screens/pdf_viewer_page.dart';
import 'package:flutter/material.dart';

class VocabPage extends StatefulWidget {
  final String levelId;
  final String levelLabel;

  const VocabPage({super.key, required this.levelId, required this.levelLabel});

  @override
  State<VocabPage> createState() => _VocabPageState();
}

class _VocabPageState extends State<VocabPage> {
  final vocabRepo = VocabRepository();

  String? vocabPracticeSetId;

  bool loading = true;
  List<_VocabTopic> topics = [];

  bool _resetting = false;

  @override
  void initState() {
    super.initState();
    _loadOrCreateVocabPracticeSet();
  }

  Future<void> _loadOrCreateVocabPracticeSet() async {
    setState(() => loading = true);
    try {
      final res = await vocabRepo.getLatestOrCreateVocabPracticeSet(
        widget.levelId,
      );
      final data = Map<String, dynamic>.from(
        (res['data'] as Map<String, dynamic>? ?? {}),
      );

      final rawItems = List<Map<String, dynamic>>.from(data['items'] ?? []);
      final rawCards = List<Map<String, dynamic>>.from(data['cards'] ?? []);

      // KHÔNG sort lại: thứ tự đã cố định khi tạo practice set
      final mapped = <_VocabTopic>[];
      for (var i = 0; i < rawItems.length; i++) {
        final e = rawItems[i];
        final questionCount = (e['questionCount'] is num)
            ? (e['questionCount'] as num).toInt()
            : 0;
        final totalScore = (e['totalScore'] is num)
            ? (e['totalScore'] as num).toInt()
            : null;
        final rawPdfUrl = e['pdfUrl'];
        final pdfUrl = rawPdfUrl is String && rawPdfUrl.isNotEmpty
            ? rawPdfUrl
            : null;

        mapped.add(
          _VocabTopic(
            id: (e['topicId'] ?? '').toString(),
            topicName: (e['topicName'] ?? '').toString(),
            createdAt: null, // không cần ở màn này
            practiceStatus: (e['status'] ?? 'todo').toString(),
            cardStatus:
                (rawCards.length > i
                        ? (rawCards[i]['status'] ?? 'todo')
                        : 'todo')
                    .toString(),
            questionCount: questionCount,
            pdfUrl: pdfUrl,
            totalScore: totalScore,
          ),
        );
      }

      setState(() {
        vocabPracticeSetId = res['vocabPracticeSetId'] as String;
        topics = mapped;
        loading = false;
      });
    } catch (_) {
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _markVocabPracticeDone(int index) async {
    if (vocabPracticeSetId == null) return;
    await vocabRepo.markVocabPracticeStatus(
      levelId: widget.levelId,
      vocabPracticeSetId: vocabPracticeSetId!,
      itemIndex: index, // index theo thứ tự đã lưu → ổn định
      status: 'done',
    );
    await _loadOrCreateVocabPracticeSet(); // reload để cập nhật progress/status
  }

  void _openPractice(String levelId, int index) {
    final topic = topics[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VocabPracticePage(
          levelId: levelId,
          topicId: topic.id,
          topicName: topic.topicName,
          pdfUrl: topic.pdfUrl,
          onDone: () async => _markVocabPracticeDone(index),
          itemIndex: index,
        ),
      ),
    );
  }

  void _openFlashcards(
    String levelId,
    String topicId,
    String topicName,
    int index,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VocabFlashcardsPage(
          levelId: levelId,
          topicId: topicId,
          topicName: topicName,
          cardIndex: index,
          onDone: () async => _loadOrCreateVocabPracticeSet(),
        ),
      ),
    );
  }

  void _openPdf(_VocabTopic topic) {
    final url = topic.pdfUrl;
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không tìm thấy tài liệu PDF cho chủ đề này.'),
        ),
      );
      return;
    }
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => PdfViewerPage(pdfUrl: url)));
  }

  Future<void> _confirmAndReset() async {
    if (_resetting) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tạo bộ đề luyện tập từ vựng mới?'),
        content: const Text(
          'Hành động này sẽ tạo một bộ đề luyện tập từ vựng mới (vocabPracticeSetId mới).',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Tạo mới'),
          ),
        ],
      ),
    );

    if (ok != true) return;

    setState(() => _resetting = true);
    try {
      final res = await vocabRepo.createFreshVocabPracticeSet(widget.levelId);
      final data = Map<String, dynamic>.from(
        (res['data'] as Map<String, dynamic>? ?? {}),
      );
      final rawItems = List<Map<String, dynamic>>.from(data['items'] ?? []);
      final rawCards = List<Map<String, dynamic>>.from(data['cards'] ?? []);

      final mapped = <_VocabTopic>[];
      for (var i = 0; i < rawItems.length; i++) {
        final e = rawItems[i];
        final questionCount = (e['questionCount'] is num)
            ? (e['questionCount'] as num).toInt()
            : 0;
        final totalScore = (e['totalScore'] is num)
            ? (e['totalScore'] as num).toInt()
            : null;
        final rawPdfUrl = e['pdfUrl'];
        final pdfUrl = rawPdfUrl is String && rawPdfUrl.isNotEmpty
            ? rawPdfUrl
            : null;

        mapped.add(
          _VocabTopic(
            id: (e['topicId'] ?? '').toString(),
            topicName: (e['topicName'] ?? '').toString(),
            createdAt: null,
            practiceStatus: (e['status'] ?? 'todo').toString(),
            cardStatus:
                (rawCards.length > i
                        ? (rawCards[i]['status'] ?? 'todo')
                        : 'todo')
                    .toString(),
            questionCount: questionCount,
            pdfUrl: pdfUrl,
            totalScore: totalScore,
          ),
        );
      }

      setState(() {
        vocabPracticeSetId = res['vocabPracticeSetId'] as String;
        topics = mapped;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã tạo bộ đề mới thành công')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Không tạo được bộ mới: $e')));
      }
    } finally {
      if (mounted) setState(() => _resetting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary • ${widget.levelLabel} Level'),
        backgroundColor: Colors.purple[50],
        elevation: 1,
        actions: [
          TextButton.icon(
            onPressed: _confirmAndReset,
            icon: const Icon(Icons.replay, color: Colors.white),
            label: const Text('Tạo mới', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(backgroundColor: Colors.red[400]),
          ),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : topics.isEmpty
          ? _emptyView(context)
          : _listView(context),
    );
  }

  Widget _emptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.assignment, size: 100, color: Colors.purple[300]),
            const SizedBox(height: 16),
            Text(
              'Chưa có đề luyện tập',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy seed dữ liệu vào collection "vocab_practice_tests" trước.',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: topics.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final it = topics[index];

        final orderLabel = (index + 1).toString().padLeft(2, '0');
        final isPracticeDone = it.practiceStatus == 'done';
        final isCardDone = it.cardStatus == 'done';

        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.purple[50],
                      child: Text(
                        orderLabel,
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  it.topicName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${it.questionCount} câu hỏi luyện tập',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.picture_as_pdf),
                            color: Colors.purple[400],
                            tooltip: 'Xem PDF',
                            onPressed: () => _openPdf(it),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _openFlashcards(
                          widget.levelId,
                          it.id,
                          it.topicName,
                          index,
                        ),
                        icon: const Icon(Icons.flash_on),
                        label: const Text('Flashcards'),
                        style: isCardDone
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _openPractice(widget.levelId, index),
                        icon: const Icon(Icons.quiz),
                        label: const Text('Luyện tập'),
                        style: isPracticeDone
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VocabTopic {
  final String id;
  final String topicName;
  final DateTime? createdAt;
  final String practiceStatus;
  final String cardStatus;
  final int questionCount;
  final String? pdfUrl;
  final int? totalScore;

  _VocabTopic({
    required this.id,
    required this.topicName,
    required this.createdAt,
    required this.practiceStatus,
    required this.cardStatus,
    required this.questionCount,
    required this.pdfUrl,
    required this.totalScore,
  });
}
