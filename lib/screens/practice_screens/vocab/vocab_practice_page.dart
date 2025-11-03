import 'package:final_project/models/vocab_models.dart';
import 'package:final_project/repositories/vocab_repository.dart';
import 'package:final_project/screens/study_screens/pdf_viewer_page.dart';
import 'package:flutter/material.dart';

class VocabPracticePage extends StatefulWidget {
  final String levelId;
  final String topicId;
  final String topicName;
  final String? pdfUrl;
  final Future<void> Function()? onDone;
  final int itemIndex;

  const VocabPracticePage({
    super.key,
    required this.levelId,
    required this.topicId,
    required this.topicName,
    this.pdfUrl,
    this.onDone,
    required this.itemIndex,
  });

  @override
  State<VocabPracticePage> createState() => _VocabPracticePageState();
}

class _VocabPracticePageState extends State<VocabPracticePage> {
  final VocabRepository vocabRepo = VocabRepository();

  List<VocabQuestion> _questions = const [];
  List<int?> _answers = const [];
  bool _loading = false;
  bool _submitted = false;
  int _correctCount = 0;
  String? _error;
  // ignore: unused_field
  String _status = 'todo';
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions({bool showSpinner = true}) async {
    if (!mounted) return;
    if (showSpinner) {
      setState(() {
        _loading = true;
        _error = null;
      });
    } else {
      setState(() {
        _error = null;
      });
    }

    try {
      final questions = await vocabRepo.getVocabQuestions(
        levelId: widget.levelId,
        topicId: widget.topicId,
      );
      final statusFuture = vocabRepo.getStatus(
        itemIndex: widget.itemIndex,
        levelId: widget.levelId,
      );
      final savedFuture = vocabRepo.getSavedResult(
        itemIndex: widget.itemIndex,
        levelId: widget.levelId,
      );

      final status = await statusFuture;
      final saved = await savedFuture;

      final defaultAnswers = List<int?>.filled(questions.length, null);
      var submitted = false;
      var correctCount = 0;
      var resolvedAnswers = defaultAnswers;
      if (saved != null) {
        final rawAnswers = Map<String, dynamic>.from(
          saved['answers'] ?? const <String, dynamic>{},
        );
        if (rawAnswers.isNotEmpty) {
          resolvedAnswers = List<int?>.generate(questions.length, (index) {
            final qId = questions[index].id;
            final val = rawAnswers[qId];
            if (val is num) return val.toInt();
            if (val is String) return int.tryParse(val);
            return null;
          }, growable: false);
          submitted = true;
        }
        final totalScore = saved['totalScore'];
        if (totalScore is num) {
          correctCount = totalScore.toInt();
        }
      }

      if (!mounted) return;
      setState(() {
        _questions = questions;
        _answers = resolvedAnswers;
        _submitted = submitted;
        _correctCount = correctCount;
        _status = status ?? 'todo';
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _submit() async {
    if (_submitted || _saving) return;
    // if (_answers.any((element) => element == null)) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Vui lòng trả lời tất cả câu hỏi trước khi nộp bài.'),
    //     ),
    //   );
    //   return;
    // }
    var score = 0;
    for (var i = 0; i < _questions.length; i++) {
      if (_answers[i] == _questions[i].correctIndex) score++;
    }
    final answerPayload = <String, int>{};
    for (var i = 0; i < _questions.length; i++) {
      final picked = _answers[i];
      if (picked != null) {
        answerPayload[_questions[i].id] = picked;
      }
    }

    setState(() {
      _submitted = true;
      _correctCount = score;
      _saving = true;
    });

    try {
      await vocabRepo.saveVocabPracticeResult(
        levelId: widget.levelId,
        testId: widget.topicId,
        totalScore: score,
        itemIndex: widget.itemIndex,
        answers: answerPayload,
      );
      try {
        await widget.onDone?.call();
      } catch (_) {}
      if (!mounted) return;
      setState(() {
        _status = 'done';
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bạn trả lời đúng $score/${_questions.length} câu.'),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _submitted = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không lưu được kết quả: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
        });
      }
    }
  }

  void _retry() {
    if (_saving) return;
    setState(() {
      _answers = List<int?>.filled(_questions.length, null);
      _submitted = false;
      _correctCount = 0;
    });
  }

  void _openPdf() {
    final url = widget.pdfUrl;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topicName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
        actions: [
          if ((widget.pdfUrl ?? '').isNotEmpty)
            IconButton(
              onPressed: _openPdf,
              icon: const Icon(Icons.picture_as_pdf),
              tooltip: 'Xem PDF',
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _loadQuestions(showSpinner: false),
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(24),
        children: [
          Icon(Icons.error_outline, size: 96, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Không tải được câu hỏi.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lỗi: $_error',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _loadQuestions(),
            icon: const Icon(Icons.refresh),
            label: const Text('Thử lại'),
          ),
        ],
      );
    }

    if (_questions.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(24),
        children: [
          Icon(Icons.menu_book, size: 96, color: Colors.purple[300]),
          const SizedBox(height: 16),
          Text(
            'Chủ đề này chưa có câu hỏi luyện tập.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        if (_submitted)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Answered correct $_correctCount / ${_questions.length} questions',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            itemCount: _questions.length,
            itemBuilder: (context, index) {
              final q = _questions[index];
              final correct = q.correctIndex;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header: số câu + nội dung câu hỏi
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question ${index + 1}:',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              q.question,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Hình (nếu có)
                      if (q.imageUrl != null && q.imageUrl!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            q.imageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return SizedBox(
                                height: 160,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: progress.expectedTotalBytes != null
                                        ? progress.cumulativeBytesLoaded /
                                              (progress.expectedTotalBytes!)
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (_, __, ___) => Container(
                              height: 160,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.broken_image, size: 40),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 8),

                      // Options giống LR_practice_part5 (RadioListTile + tô màu khi đã nộp)
                      Column(
                        children: List.generate(q.options.length, (i) {
                          final isSelected = _answers[index] == i;
                          final isCorrect = correct == i;

                          Color? color;
                          if (_submitted) {
                            if (isSelected && isCorrect) {
                              color = Colors.green;
                            } else if (isSelected && !isCorrect) {
                              color = Colors.red;
                            } else if (!isSelected && isCorrect) {
                              color = Colors.green;
                            }
                          }

                          return RadioListTile<int>(
                            value: i,
                            groupValue: _answers[index],
                            onChanged: _submitted
                                ? null
                                : (val) {
                                    setState(() {
                                      _answers[index] = val;
                                    });
                                  },
                            title: Text(
                              q.options[i],
                              style: TextStyle(
                                color: color,
                                fontWeight:
                                    _submitted && (isSelected || isCorrect)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          );
                        }),
                      ),

                      // Explain (ExpansionTile) khi đã nộp
                      if (_submitted && (q.explanation ?? '').isNotEmpty)
                        Card(
                          elevation: 2,
                          color: Colors.blue[100],
                          child: ExpansionTile(
                            initiallyExpanded: false,
                            title: Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.blue[700],
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Explain',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(q.explanation!)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget? _buildBottomBar() {
    if (_loading || _error != null || _questions.isEmpty) return null;

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: _submitted
          ? Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _saving ? null : _retry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Làm lại'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.check),
                    label: const Text('Hoàn thành'),
                  ),
                ),
              ],
            )
          : ElevatedButton.icon(
              onPressed: _saving ? null : _submit,
              icon: const Icon(Icons.check_circle),
              label: Text(_saving ? 'Đang lưu...' : 'Nộp bài'),
            ),
    );
  }
}
