import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giới thiệu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),

          // Header
          Center(
            child: Column(
              children: [
                Icon(Icons.info, size: 80, color: Colors.purple[300]),
                const SizedBox(height: 16),
                Text(
                  'Giới thiệu về My TOEIC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),

                const SizedBox(height: 32),

                // Description
                Text(
                  'My TOEIC là ứng dụng hỗ trợ học tập và luyện thi TOEIC dành cho người mới bắt đầu '
                  'đến nâng cao. Mục tiêu của ứng dụng là mang đến trải nghiệm học tập dễ dàng, '
                  'khoa học và hiệu quả thông qua bài học, bài luyện tập và đề thi mô phỏng.'
                  'Người dùng có thể học tập theo lộ trình cá nhân hóa dựa trên trình độ và mục tiêu của mình. '
                  'Có thể học mọi lúc mọi nơi với giao diện thân thiện và dễ sử dụng, giúp người học nhanh chóng tiến bộ, rút ngắn thời gian học tập, tiết kiệm chi phí và đạt được điểm số mong muốn trong kỳ thi TOEIC.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
