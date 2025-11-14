import 'package:final_project/screens/input_test/selection_page.dart';
import 'package:final_project/screens/main_navigation.dart';
import 'package:flutter/material.dart';

class OnboardingWrapper extends StatefulWidget {
  final VoidCallback onFinish;
  const OnboardingWrapper({required this.onFinish, super.key});

  @override
  State<OnboardingWrapper> createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  final List<Widget> _pages = [
    _OnboardingPage(
      title: 'Chào mừng đến với MY TOEIC',
      subtitle: 'Luyện nghe, đọc, từ vựng và test.\n Ôn luyện mọi lúc mọi nơi.',
      icon: Icons.emoji_people,
    ),
    _OnboardingPage(
      title: 'Theo dõi tiến độ',
      subtitle: 'Xem lại bài đã học và lịch các bài test.',
      icon: Icons.track_changes,
    ),
    _OnboardingPage(
      title: 'Bắt đầu học ngay',
      subtitle: 'Bấm vào nút Bắt đầu để thiết kế lộ trình học cho riêng mình.',
      icon: Icons.play_circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WELCOME',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _pageIndex = i),
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Row(
                  children: List.generate(_pages.length, (i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _pageIndex == i ? 18 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _pageIndex == i
                            ? Colors.purple
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (_pageIndex == _pages.length - 1) {
                      // widget.onFinish();
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SelectionPage(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    _pageIndex == _pages.length - 1 ? 'Bắt đầu' : 'Tiếp theo',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 180, color: Colors.purple),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
