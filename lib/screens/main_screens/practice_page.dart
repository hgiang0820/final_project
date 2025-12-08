import 'package:final_project/screens/practice_screens/LR/LR_practice_test_page.dart';
import 'package:final_project/screens/practice_screens/SW/SW_practice_test_page.dart';
import 'package:final_project/screens/practice_screens/vocab/vocab_selection_page.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'ÔN LUYỆN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fitness_center, size: 100, color: Colors.purple[300]),
            const SizedBox(height: 20),
            Text(
              'Phòng ôn luyện',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Đây là phòng ôn luyện.\nHãy chọn kĩ năng bạn muốn ôn luyện nhé!',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconAndButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LrPracticeTestPage()),
                    );
                  },
                  title: "Listening \n& Reading",
                  icon: Icon(Icons.mic),
                  color: Colors.green[400],
                ),
                IconAndButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SwPracticeTestPage()),
                    );
                  },
                  title: "Speaking \n& Writing",
                  icon: Icon(Icons.edit),
                  color: Colors.orange[400],
                ),
              ],
            ),
            const SizedBox(height: 30),
            IconAndButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VocabSelectionPage()),
                );
              },
              title: "Ôn luyện\nTừ vựng",
              icon: Icon(Icons.book),
              color: Colors.blue[300],
            ),
          ],
        ),
      ),
    );
  }
}
