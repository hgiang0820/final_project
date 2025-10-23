import 'package:final_project/screens/practice_screens/LR/LR_practice_test_page.dart';
import 'package:final_project/screens/practice_screens/SW/SW_practice_test_page.dart';
import 'package:final_project/seed/practice_test/LR_test/seed_all_LR_test.dart';
import 'package:final_project/seed/practice_test/SW_test/seed_all_SW_test.dart';
import 'package:final_project/widgets/icon_and_button.dart';
import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRACTICE',
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
              'Practice Tests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Test your knowledge and skills',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
              onPressed: seedAllLRTest,
              title: "Seed LR Test",
              icon: Icon(Icons.edit),
              color: Colors.orange[400],
            ),
            const SizedBox(height: 30),
            IconAndButton(
              onPressed: seedAllSWTest,
              title: "Seed SW Test",
              icon: Icon(Icons.edit),
              color: Colors.orange[400],
            ),
          ],
        ),
      ),
    );
  }
}
