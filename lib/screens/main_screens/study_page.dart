import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:final_project/screens/study_screens/pdf_viewer_page.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final roadmapRepo = RoadmapRepository();

  String? roadmapId;
  List<Map<String, dynamic>> items = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadLatestRoadmap();
  }

  Future<void> _loadLatestRoadmap() async {
    setState(() => loading = true);
    final latest = await roadmapRepo.getLatestRoadmap();
    if (latest == null) {
      setState(() {
        roadmapId = null;
        items = [];
        loading = false;
      });
      return;
    }

    final data = latest['data'] as Map<String, dynamic>;
    final list = List<Map<String, dynamic>>.from(data['items'] ?? []);

    // ĐẢM BẢO THỨ TỰ ỔN ĐỊNH:
    // - Nếu mỗi item đã có 'order' thì sắp theo 'order' tăng dần.
    // - Nếu chưa có 'order' thì giữ nguyên thứ tự trong mảng (không sort).
    final hasOrder = list.isNotEmpty && list.first.containsKey('order');
    final stable = [...list];
    if (hasOrder) {
      stable.sort((a, b) => (a['order'] ?? 0).compareTo(b['order'] ?? 0));
    }

    setState(() {
      roadmapId = latest['roadmapId'] as String;
      items = stable;
      loading = false;
    });
  }

  Future<void> _markDone(int index) async {
    if (roadmapId == null) return;
    await roadmapRepo.markLessonStatus(
      roadmapId: roadmapId!,
      itemIndex: index, // dùng index gốc — không có sort nên luôn ổn định
      status: 'done',
    );
    await _loadLatestRoadmap(); // reload để thấy trạng thái mới, không đổi vị trí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : (roadmapId == null || items.isEmpty)
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
            Icon(Icons.school, size: 100, color: Colors.purple[300]),
            const SizedBox(height: 16),
            Text(
              'Chưa có lộ trình học',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy tạo Study Roadmap ở trang Selection trước.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    // KHÔNG SORT THEO STATUS — giữ nguyên thứ tự
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final it = items[index];

        final status = (it['status'] ?? 'todo') as String;
        final isDone = status == 'done';
        final lessonName = (it['lessonName'] ?? 'Lesson') as String;
        final part = (it['partId'] ?? '') as String;
        final level = (it['levelId'] ?? '') as String;
        final material = (it['materialId'] ?? '') as String;
        // final pdfUrl = (it['pdfUrl'] ?? '') as String;

        // SỐ THỨ TỰ ỔN ĐỊNH:
        // - Nếu item có 'order' -> dùng order (1-based)
        // - Nếu không -> dùng (index + 1) hiện tại
        final intNumber = (it['order'] is num)
            ? (it['order'] as num).toInt()
            : (index + 1);
        final orderLabel = intNumber.toString().padLeft(2, '0');
        final kind = (it['type'] ?? 'theory') as String;

        return ListTile(
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: isDone ? Colors.green[100] : Colors.grey[300],
            child: Text(
              orderLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDone ? Colors.green[800] : Colors.grey[800],
                fontSize: 12,
              ),
            ),
          ),
          title: Row(
            children: [
              Icon(
                isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isDone ? Colors.green : Colors.grey,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  lessonName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          subtitle: Text('$material • $level • $part'),
          trailing: isDone
              ? const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(
                  'To-do',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          onTap: () {
            if (kind == 'theory') {
              final pdfUrl = (it['pdfUrl'] ?? '') as String;
              if (pdfUrl.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Không có PDF cho bài học này.'),
                  ),
                );
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PdfViewerPage(
                    pdfUrl: pdfUrl,
                    onDone: () async => _markDone(index),
                  ),
                ),
              );
            } else {
              final materialId = (it['materialId'] ?? '') as String;
              final levelId = (it['levelId'] ?? '') as String;
              final partId = (it['partId'] ?? '') as String;
              final lessonId = (it['lessonId'] ?? '') as String;

              if ([
                materialId,
                levelId,
                partId,
                lessonId,
              ].any((e) => e.isEmpty)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Thiếu khóa Practice (material/level/part/lesson).',
                    ),
                  ),
                );
                return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PracticeLRPage(
                    practiceId: '$materialId|$levelId|$partId|$lessonId',
                    onDone: () async => _markDone(index),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
