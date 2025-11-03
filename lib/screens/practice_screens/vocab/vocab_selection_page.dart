import 'package:final_project/screens/practice_screens/vocab/vocab_page.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:flutter/material.dart';

class VocabSelectionPage extends StatelessWidget {
  const VocabSelectionPage({super.key});

  void _openLevel(BuildContext context, String levelId, String label) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VocabPage(
          levelId: levelId,
          levelLabel: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vocabulary Practice Selection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book, size: 100, color: Colors.blue[300]),
            const SizedBox(height: 20),
            Text(
              'Vocab Practice Level',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose your vocabulary practice level.\nRecommended to start from Easy level.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconAndButton(
                  onPressed: () => _openLevel(context, 'easy', 'Easy'),
                  title: "Easy",
                  icon: const Icon(Icons.auto_stories),
                  color: Colors.green[400],
                ),
                IconAndButton(
                  onPressed: () => _openLevel(context, 'medium', 'Medium'),
                  title: "Medium",
                  icon: const Icon(Icons.menu_book),
                  color: Colors.orange[400],
                ),
                IconAndButton(
                  onPressed: () => _openLevel(context, 'hard', 'Hard'),
                  title: "Hard",
                  icon: const Icon(Icons.library_books),
                  color: Colors.red[300],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
