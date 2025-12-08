import 'package:final_project/screens/main_screens/home_page.dart';
import 'package:final_project/screens/main_screens/practice_page.dart';
import 'package:final_project/screens/main_screens/settings.dart';
import 'package:final_project/screens/main_screens/study_page.dart';
import 'package:flutter/material.dart';

class MainNavigationPage extends StatefulWidget {
  final int? pageIndex;
  const MainNavigationPage({this.pageIndex, super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.pageIndex ??
        0; // <-- nếu truyền pageIndex thì set, không thì = 0
  }

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const StudyPage(),
    const PracticePage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 8,
        selectedItemColor: Colors.purple[500],
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 12,
        unselectedFontSize: 11,
        backgroundColor: Colors.purple[50],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Học tập',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            activeIcon: Icon(Icons.fitness_center),
            label: 'Ôn luyện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}
