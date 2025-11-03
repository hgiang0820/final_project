import 'package:final_project/repositories/vocab_repository.dart';
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
      final raw = List<Map<String, dynamic>>.from(data['items'] ?? []);

      // KHÔNG sort lại: thứ tự đã cố định khi tạo practice set
      final mapped = raw.map((e) {
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

        return _VocabTopic(
          id: (e['topicId'] ?? '').toString(),
          topicName: (e['topicName'] ?? '').toString(),
          createdAt: null, // không cần ở màn này
          status: (e['status'] ?? 'todo').toString(),
          questionCount: questionCount,
          pdfUrl: pdfUrl,
          totalScore: totalScore,
        );
      }).toList();

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

  Future<void> _markDone(int index) async {
    if (vocabPracticeSetId == null) return;
    await vocabRepo.markStatus(
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
          onDone: () async => _markDone(index),
          itemIndex: index,
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
        title: const Text('Reset vocabulary practice?'),
        content: const Text(
          'Hành động này sẽ tạo một bộ đề luyện tập từ vựng mới (vocabPracticeSetId mới). '
          'Bộ cũ sẽ được giữ lại để xem lịch sử.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Create new set'),
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
      final raw = List<Map<String, dynamic>>.from(data['items'] ?? []);

      final mapped = raw.map((e) {
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

        return _VocabTopic(
          id: (e['topicId'] ?? '').toString(),
          topicName: (e['topicName'] ?? '').toString(),
          createdAt: null,
          status: (e['status'] ?? 'todo').toString(),
          questionCount: questionCount,
          pdfUrl: pdfUrl,
          totalScore: totalScore,
        );
      }).toList();

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
        title: Text(
          'Vocabulary • ${widget.levelLabel} Level',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
        actions: [
          TextButton.icon(
            onPressed: _confirmAndReset,
            icon: const Icon(Icons.replay, color: Colors.white),
            label: const Text('Reset', style: TextStyle(color: Colors.white)),
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

        // số thứ tự ổn định theo vị trí hiddddển thị
        final orderLabel = (index + 1).toString().padLeft(2, '0');
        final status = (it.status);
        final isDone = status == 'done';

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
                        onPressed: () => _openPractice(widget.levelId, index),
                        icon: const Icon(Icons.quiz),
                        label: const Text('Luyện tập'),
                        style: isDone
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _openPractice(it.id, index),
                        icon: const Icon(Icons.flash_on),
                        label: const Text('Flashcards'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // return ListTile(
          //   leading: CircleAvatar(
          //     radius: 16,
          //     backgroundColor: Colors.purple[100],
          //     child: Text(
          //       orderLabel,
          //       style: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Color(0xFF4A148C),
          //         fontSize: 12,
          //       ),
          //     ),
          //   ),
          //   title: Text(
          //     it.topicName,
          //     style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          //   ),
          //   subtitle: Text('$questionLabel$scoreLabel$created'),
          // trailing: Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     if (it.pdfUrl != null)
          //       IconButton(
          //         icon: const Icon(Icons.picture_as_pdf),
          //         color: Colors.red[400],
          //         tooltip: 'Xem PDF',
          //         onPressed: () => _openPdf(it),
          //       ),
          //     Chip(
          //       label: Text(isDone ? 'Done' : 'To-do'),
          //       backgroundColor: isDone
          //           ? Colors.green[100]
          //           : Colors.orange[100],
          //       labelStyle: TextStyle(
          //         color: isDone ? Colors.green[800] : Colors.orange[800],
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ],
          // ),
          // onTap: () => _openPractice(it.id, index),
        );
      },
    );
  }
}

class _VocabTopic {
  final String id;
  final String topicName;
  final DateTime? createdAt;
  final String status;
  final int questionCount;
  final String? pdfUrl;
  final int? totalScore;

  _VocabTopic({
    required this.id,
    required this.topicName,
    required this.createdAt,
    required this.status,
    required this.questionCount,
    required this.pdfUrl,
    required this.totalScore,
  });
}

// import 'package:final_project/models/vocab_models.dart';
// import 'package:final_project/repositories/vocab_repository.dart';
// import 'package:final_project/screens/practice_screens/vocab/vocab_practice_page.dart';
// import 'package:final_project/screens/study_screens/pdf_viewer_page.dart';
// import 'package:flutter/material.dart';

// class VocabPage extends StatefulWidget {
//   final String levelId;
//   final String levelLabel;

//   const VocabPage({super.key, required this.levelId, required this.levelLabel});

//   @override
//   State<VocabPage> createState() => _VocabPageState();
// }

// class _VocabPageState extends State<VocabPage> {
//   final VocabRepository _vocabRepo = VocabRepository();

//   List<VocabTopic> _topics = const [];
//   bool _loading = false;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _loadTopics();
//   }

//   Future<void> _loadTopics({bool showSpinner = true}) async {
//     if (!mounted) return;
//     if (showSpinner) {
//       setState(() {
//         _loading = true;
//         _error = null;
//       });
//     }
//     try {
//       final topics = await _vocabRepo.getVocabTopics(levelId: widget.levelId);
//       if (!mounted) return;
//       setState(() {
//         _topics = topics..sort((a, b) => a.order.compareTo(b.order));
//         _loading = false;
//         _error = null;
//       });
//     } catch (e) {
//       if (!mounted) return;
//       setState(() {
//         _loading = false;
//         _error = e.toString();
//       });
//     }
//   }

//   void _openPdf(VocabTopic topic) {
//     final url =
//         topic.pdfUrl ??
//         (topic.pdfPath != null ? _vocabRepo.publicPdfUrl(topic.pdfPath!) : '');
//     if (url.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Không tìm thấy tài liệu PDF cho chủ đề này.'),
//         ),
//       );
//       return;
//     }
//     Navigator.of(
//       context,
//     ).push(MaterialPageRoute(builder: (_) => PdfViewerPage(pdfUrl: url)));
//   }

//   void _openPractice(VocabTopic topic) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => VocabPracticePage(
//           levelId: widget.levelId,
//           topicId: topic.id,
//           topicName: topic.topicName,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Vocabulary • ${widget.levelLabel} Level',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.purple[50],
//         elevation: 1,
//       ),
//       body: RefreshIndicator(
//         onRefresh: () => _loadTopics(showSpinner: false),
//         child: _buildBody(),
//       ),
//     );
//   }

//   Widget _buildBody() {
//     if (_loading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (_error != null) {
//       return ListView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         padding: const EdgeInsets.all(24),
//         children: [
//           Icon(Icons.error_outline, size: 96, color: Colors.red[300]),
//           const SizedBox(height: 16),
//           Text(
//             'Không tải được dữ liệu.',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[800],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Lỗi: $_error',
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton.icon(
//             onPressed: () => _loadTopics(),
//             icon: const Icon(Icons.refresh),
//             label: const Text('Thử lại'),
//           ),
//         ],
//       );
//     }

//     if (_topics.isEmpty) {
//       return ListView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         padding: const EdgeInsets.all(24),
//         children: [
//           Icon(Icons.menu_book, size: 96, color: Colors.purple[300]),
//           const SizedBox(height: 16),
//           Text(
//             'Chưa có chủ đề từ vựng cho cấp độ này.',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[800],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Vui lòng quay lại sau.',
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.grey[600]),
//           ),
//         ],
//       );
//     }

//     return ListView.separated(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
//       itemCount: _topics.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 12),
//       itemBuilder: (context, index) {
//         final topic = _topics[index];
//         final orderLabel = (topic.order > 0 ? topic.order : index + 1)
//             .toString()
//             .padLeft(2, '0');

//         return Card(
//           elevation: 1,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 20,
//                       backgroundColor: Colors.purple[50],
//                       child: Text(
//                         orderLabel,
//                         style: TextStyle(
//                           color: Colors.purple[700],
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             topic.topicName,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             '${topic.questionCount} câu hỏi luyện tập',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: topic.pdfPath == null
//                             ? null
//                             : () => _openPdf(topic),
//                         icon: const Icon(Icons.picture_as_pdf),
//                         label: const Text('Xem PDF'),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: () => _openPractice(topic),
//                         icon: const Icon(Icons.quiz),
//                         label: const Text('Luyện tập'),
//                       ),
//                     ),
//                     // const SizedBox(width: 12),
//                     // Expanded(
//                     //   child: ElevatedButton.icon(
//                     //     onPressed: () => _openPractice(topic),
//                     //     icon: const Icon(Icons.quiz),
//                     //     label: const Text('Luyện tập'),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
