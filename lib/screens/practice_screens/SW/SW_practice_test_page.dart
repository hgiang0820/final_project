import 'package:final_project/screens/practice_screens/SW/SW_test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwPracticeTestPage extends StatefulWidget {
  const SwPracticeTestPage({super.key});

  @override
  State<SwPracticeTestPage> createState() => _SwPracticeTestPageState();
}

class _SwPracticeTestPageState extends State<SwPracticeTestPage> {
  bool loading = true;
  List<_TestItem> tests = [];

  @override
  void initState() {
    super.initState();
    _loadAllTests();
  }

  Future<void> _loadAllTests() async {
    setState(() => loading = true);
    try {
      final db = FirebaseFirestore.instance;
      final snap = await db
          .collection('practice_tests')
          .doc('SW_practice_tests')
          .collection('test_number')
          .orderBy('order', descending: false)
          .get();

      // Giữ thứ tự ổn định theo createdAt (desc). Nếu thiếu createdAt, sẽ đứng cuối.
      final items = <_TestItem>[];
      for (final d in snap.docs) {
        final data = d.data();
        final title = (data['title'] ?? d.id).toString();
        final parts = List<String>.from(data['parts'] ?? const []);
        final timeLimit = (data['timeLimitMinutes'] is num)
            ? (data['timeLimitMinutes'] as num).toInt()
            : 80; // mặc định 120 phút nếu không có
        final createdAt = data['createdAt']; // có thể là Timestamp hoặc null

        items.add(
          _TestItem(
            id: d.id,
            title: title,
            parts: parts,
            timeLimitMinutes: timeLimit,
            createdAt: createdAt is Timestamp ? createdAt.toDate() : null,
          ),
        );
      }

      setState(() {
        tests = items;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi tải danh sách đề: $e')));
      }
    }
  }

  void _openTest(String testId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SWTestPage(testId: testId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Speaking & Writing Tests',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAllTests,
            tooltip: 'Tải lại',
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
            ? 'parts: 2 (TOEIC SW)'
            : 'parts: ${it.parts.length}';
        final timeLabel = '${it.timeLimitMinutes} phút';

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
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          onTap: () => _openTest(it.id),
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

  _TestItem({
    required this.id,
    required this.title,
    required this.parts,
    required this.timeLimitMinutes,
    required this.createdAt,
  });
}
