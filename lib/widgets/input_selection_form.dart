import 'package:final_project/screens/input_test/LR/LR_test_page.dart';
import 'package:final_project/screens/input_test/SW/SW_test_page.dart';
import 'package:final_project/screens/input_test/fourSkills/full_test_page.dart';
import 'package:flutter/material.dart';

class SelectionForm extends StatefulWidget {
  final int selectedIndex;
  final int? testLevel;
  final ValueChanged<String?>? onGoalChanged;

  const SelectionForm({
    required this.selectedIndex,
    this.testLevel,
    this.onGoalChanged,
    super.key,
  });

  @override
  State<SelectionForm> createState() => _SelectionFormState();
}

class _SelectionFormState extends State<SelectionForm> {
  String? selectedLevel;
  String? selectedGoal;

  final List<String> levelLR = [
    'TOEIC LR 1-295',
    'TOEIC LR 300-595',
    'TOEIC LR 600-650',
  ];
  final List<String> goalLR = [
    'TOEIC LR 300+',
    'TOEIC LR 600+',
    'TOEIC LR 800+',
  ];

  final List<String> levelSW = [
    'TOEIC SW 1-99',
    'TOEIC SW 100-199',
    'TOEIC SW 200-250',
  ];
  final List<String> goalSW = [
    'TOEIC SW 100+',
    'TOEIC SW 200+',
    'TOEIC SW 300+',
  ];

  final List<String> level4Skills = [
    'LR 1-295 & SW 1-99',
    'LR 300-595 & SW 100-199',
    'LR 600-650 & SW 200-250',
  ];
  final List<String> goal4Skills = [
    'LR 300+ & SW 100+',
    'LR 600+ & SW 200+',
    'LR 800+ & SW 300+',
  ];

  List<String> get options1 {
    switch (widget.selectedIndex) {
      case 0:
        return levelLR;
      case 1:
        return levelSW;
      case 2:
        return level4Skills;
      default:
        return [];
    }
  }

  List<String> get options2 {
    switch (widget.selectedIndex) {
      case 0:
        return goalLR;
      case 1:
        return goalSW;
      case 2:
        return goal4Skills;
      default:
        return [];
    }
  }

  Widget _getTestPage() {
    switch (widget.selectedIndex) {
      case 0:
        return LRTestPage(testId: "testLR");
      case 1:
        return SWTestPage(testId: "testSW");
      case 2:
      return FullTestPage(testId: "testFull");
      default:
        return const SizedBox();
    }
  }

  @override
  void didUpdateWidget(covariant SelectionForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      setState(() {
        selectedLevel = null;
        selectedGoal = null;
      });
    }
  }

  /// CUSTOM ROADMAP Ở ĐÂY

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Trình độ của tôi",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedLevel,
              // decoration: const InputDecoration(labelText: 'My current level'),
              items: options1.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLevel = value;
                });
              },
            ),
            const SizedBox(height: 10),
            _testText(context),
            const SizedBox(height: 20),
            Text("---------------------------------"),
            Text(
              "Mục tiêu của tôi",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedGoal,
              // decoration: const InputDecoration(labelText: 'My goal'),
              items: options2.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGoal = value;
                });
                widget.onGoalChanged?.call(value); // 👈 báo lên parent
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _testText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bạn không biết trình độ của mình?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => _getTestPage()),
              );
            },
            child: const Text('Kiểm tra ngay!'),
          ),
        ],
      ),
    );
  }
}
