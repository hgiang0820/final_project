import 'package:final_project/screens/main_navigation.dart';
import 'package:final_project/screens/main_screens/home_page.dart';
import 'package:flutter/material.dart';

// Repositories & Services
import 'package:final_project/repositories/result_repository.dart';
import 'package:final_project/repositories/material_repository.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:final_project/services/roadmap_service.dart';

// Widgets
import 'package:final_project/widgets/small_button.dart';
import 'package:final_project/widgets/input_selection_form.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectionState();
}

class _SelectionState extends State<SelectionPage> {
  // Repos/Service
  final _resultRepo = ResultRepository();
  final _materialRepo = MaterialRepository();
  final _roadmapRepo = RoadmapRepository();
  late final RoadmapService _roadmapService;

  // UI state
  int _selectedIndex = 0; // 0 = LR, 1 = SW, 2 = 4 Skills
  String? _selectedGoal;

  @override
  void initState() {
    super.initState();
    _roadmapService = RoadmapService(_materialRepo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kiểm tra trình độ & Chọn mục tiêu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          children: [
            Text(
              '• Hãy lựa chọn bài test kĩ năng bạn muốn để kiểm tra trình độ hiện tại và chọn mục tiêu của bạn.\n• Nếu bạn đã biết chính xác trình độ của mình thì hãy điền form dưới đây.\n• Khuyến khích bạn nên làm bài test để có lộ trình học phù hợp nhất.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[500],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SmallButton(
                    onPressed: () => setState(() => _selectedIndex = 0),
                    title: "Lis & Read",
                    isSelected: _selectedIndex == 0,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () => setState(() => _selectedIndex = 1),
                    title: "Speak & Wri",
                    isSelected: _selectedIndex == 1,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SmallButton(
                    onPressed: () => setState(() => _selectedIndex = 2),
                    title: "4 Skills",
                    isSelected: _selectedIndex == 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Form chọn goal (component của bạn)
            SelectionForm(
              selectedIndex: _selectedIndex,
              onGoalChanged: (v) => _selectedGoal = v,
            ),

            const SizedBox(height: 20),
            SmallButton(
              onPressed: _handleShowStudyRoadmap,
              title: "Xem lộ trình học",
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Helpers ----------
  String _testIdFor(int index) => switch (index) {
    0 => 'testLR',
    1 => 'testSW',
    _ => 'testFull',
  };

  List<dynamic> _defaultWeakPointsFor(int index) {
    switch (index) {
      case 0: // LR
        return [
          "Picture description",
          "Question & Response",
          "Conversations",
          "Talks",
          "Incomplete sentences",
          "Text completion",
          "Reading comprehension",
        ];
      case 1: // SW
        return [
          "Read a text aloud",
          "Describe a picture",
          "Respond to questions",
          "Respond to questions using information provided",
          "Express an opinion",
          "Write a sentence based on a picture",
          "Respond to a written request",
          "Write an opinion essay",
        ];
      case 2: // 4 Skills
        return [
          "Picture description",
          "Question & Response",
          "Conversations",
          "Talks",
          "Incomplete sentences",
          "Text completion",
          "Reading comprehension",
          "Read a text aloud",
          "Describe a picture",
          "Respond to questions",
          "Respond to questions using information provided",
          "Express an opinion",
          "Write a sentence based on a picture",
          "Respond to a written request",
          "Write an opinion essay",
        ];
      default:
        return [];
    }
  }

  List<dynamic> _extractWeakPoints(dynamic raw) {
    if (raw == null) return [];
    if (raw is List) return raw;
    if (raw is String) {
      return raw
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }
    if (raw is Map) return raw.keys.toList();
    return [raw.toString()];
  }

  Future<void> _handleShowStudyRoadmap() async {
    if (_selectedGoal == null) {
      await showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Thiếu mục tiêu'),
          content: Text('Hãy chọn "My goal" trước khi tạo lộ trình.'),
        ),
      );
      return;
    }

    // 1) Lấy weakPoints gần nhất
    final latest = await _resultRepo.getLatestResult(
      testId: _testIdFor(_selectedIndex),
    );

    // 2) Nếu latest == null => dùng default weakPoints theo testId
    List<dynamic> weakPoints;
    if (latest == null || latest['data'] == null) {
      weakPoints = _defaultWeakPointsFor(_selectedIndex);
    } else {
      final data = latest['data'] as Map<String, dynamic>;
      weakPoints = _extractWeakPoints(data['weakPoints']);
    }

    // 3) Build roadmap (goal + weakPoints + tab)
    final items = await _roadmapService.buildRoadmap(
      selectedIndex: _selectedIndex,
      goalText: _selectedGoal!,
      weakPoints: weakPoints,
    );

    // 4) Save vào Firestore (cá nhân hoá theo user)
    final roadmapId = await _roadmapRepo.saveRoadmap(
      goal: _selectedGoal!,
      weakPoints: weakPoints,
      selectedIndex: _selectedIndex,
      items: items,
    );

    if (!mounted) return;

    // 5) Show preview
    final preview = items
        .take(8)
        .map((it) {
          final m = it['materialId'];
          final lv = it['levelId'];
          final p = it['partId'];
          final t = it['title'];
          return '• $m / $lv / $p / $t';
        })
        .join('\n');

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Study roadmap saved successfully!'),
        content: Text(
          preview.isEmpty
              ? 'Không tìm thấy bài phù hợp. Hãy kiểm tra cấu trúc materials trong DB.'
              : 'Lộ trình của bạn đã được tạo: (ID: $roadmapId)\n\nĐi tới trang Học tập để bắt đầu học ngay!',
        ),
        actions: [
          TextButton(
            // onPressed: () => Navigator.pop(context),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainNavigationPage(pageIndex: 1),
              ),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
