import 'package:final_project/repositories/practice_test_repository.dart';
import 'package:final_project/screens/practice_screens/SW/SW_test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwPracticeTestPage extends StatefulWidget {
  const SwPracticeTestPage({super.key});

  @override
  State<SwPracticeTestPage> createState() => _SwPracticeTestPageState();
}

class _SwPracticeTestPageState extends State<SwPracticeTestPage> {
  final practiceRepo = PracticeTestRepository();

  final db = FirebaseFirestore.instance;
  String? practiceSetId;
  List<Map<String, dynamic>> items = [];

  bool loading = true;
  List<_TestItem> tests = [];
  List<Map<String, dynamic>> rawItems = [];

  bool _resetting = false;

  @override
  void initState() {
    super.initState();
    _loadOrCreatePracticeSet();
  }

  Future<void> _loadOrCreatePracticeSet() async {
    setState(() => loading = true);
    try {
      final res = await practiceRepo.getLatestOrCreatePracticeSet(
        'SW_practice_tests',
      );
      final data = res['data'] as Map<String, dynamic>;
      final raw = List<Map<String, dynamic>>.from(data['items'] ?? []);

      // KHÔNG sort lại: thứ tự đã cố định khi tạo practice set
      final mapped = raw.map((e) {
        return _TestItem(
          id: (e['testId'] ?? '').toString(),
          title: (e['title'] ?? '').toString(),
          parts: List<String>.from(e['parts'] ?? const []),
          timeLimitMinutes: (e['timeLimitMinutes'] is num)
              ? (e['timeLimitMinutes'] as num).toInt()
              : 80,
          createdAt: null, // không cần ở màn này
          status: (e['status'] ?? 'todo').toString(),
        );
      }).toList();

      setState(() {
        practiceSetId = res['practiceSetId'] as String;
        items = raw;
        tests = mapped;
        loading = false;
      });
    } catch (_) {
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _markDone(int index) async {
    if (practiceSetId == null) return;
    await practiceRepo.markTestStatus(
      testType: "SW_practice_tests",
      practiceSetId: practiceSetId!,
      itemIndex: index, // index theo thứ tự đã lưu → ổn định
      status: 'done',
    );
    await _loadOrCreatePracticeSet(); // reload để cập nhật progress/status
  }

  void _openTest(String testId, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SWTestPage(
          testId: testId,
          onDone: () async => _markDone(index),
          itemIndex: index,
        ),
      ),
    );
  }

  Future<void> _confirmAndReset() async {
    if (_resetting) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tạo bộ đề luyện tập mới'),
        content: const Text(
          'Hành động này sẽ tạo một bộ đề luyện tập mới (practiceSetId mới). '
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
      final res = await practiceRepo.createFreshPracticeSet(
        "SW_practice_tests",
      );
      final data = res['data'] as Map<String, dynamic>? ?? {};
      final raw = List<Map<String, dynamic>>.from(data['items'] ?? []);

      final mapped = raw.map((e) {
        return _TestItem(
          id: (e['testId'] ?? '').toString(),
          title: (e['title'] ?? '').toString(),
          parts: List<String>.from(e['parts'] ?? const []),
          timeLimitMinutes: (e['timeLimitMinutes'] is num)
              ? (e['timeLimitMinutes'] as num).toInt()
              : 80,
          createdAt: null,
          status: (e['status'] ?? 'todo').toString(),
        );
      }).toList();

      setState(() {
        practiceSetId = res['practiceSetId'] as String;
        items = raw;
        tests = mapped;
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
        title: const Text(
          'TOEIC Speaking & Writing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
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
          : tests.isEmpty
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
              'Hãy seed dữ liệu vào collection "practice_tests" trước.',
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
      itemCount: tests.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final it = tests[index];

        // số thứ tự ổn định theo vị trí hiddddển thị
        final orderLabel = (index + 1).toString().padLeft(2, '0');

        // hiển thị meta: thời gian & số part
        final partsLabel = it.parts.isEmpty
            ? 'Parts: 2 (TOEIC SW)'
            : 'Parts: ${it.parts.length}';
        final timeLabel = '${it.timeLimitMinutes} phút';
        final status = (it.status);
        final isDone = status == 'done';

        final created = it.createdAt != null
            ? ' • ${_formatDate(it.createdAt!)}'
            : '';

        return ListTile(
          leading: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.purple[100],
            child: Text(
              orderLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
                fontSize: 12,
              ),
            ),
          ),
          title: Text(
            it.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          subtitle: Text('$timeLabel • $partsLabel$created'),
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
          onTap: () => _openTest(it.id, index),
        );
      },
    );
  }

  String _formatDate(DateTime dt) {
    // dd/MM/yyyy
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final y = dt.year.toString();
    return '$d/$m/$y';
  }
}

class SWTest {}

class _TestItem {
  final String id;
  final String title;
  final List<String> parts;
  final int timeLimitMinutes;
  final DateTime? createdAt;
  final String status;

  _TestItem({
    required this.id,
    required this.title,
    required this.parts,
    required this.timeLimitMinutes,
    required this.createdAt,
    required this.status,
  });
}
