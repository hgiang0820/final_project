import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/screens/settings_screens/about_page.dart';
import 'package:final_project/screens/settings_screens/help_support_page.dart';
import 'package:final_project/screens/settings_screens/profile_page.dart';
import 'package:final_project/seed/input_test/seed_input_LR.dart';
import 'package:final_project/seed/input_test/seed_input_SW.dart';
import 'package:final_project/seed/input_test/seed_input_full.dart';
import 'package:final_project/seed/practice_test/LR_test/seed_all_LR_test.dart';
import 'package:final_project/seed/study_materials/LR/seed_all_LR.dart';
import 'package:final_project/seed/study_materials/SW/seed_all_SW.dart';
import 'package:final_project/widgets/small_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'CÀI ĐẶT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Icon(Icons.settings, size: 80, color: Colors.purple[300]),
                const SizedBox(height: 16),
                Text(
                  'Cài đặt',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Profile Section
          Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple[100],
                child: Icon(Icons.person, color: Colors.purple[600]),
              ),
              title: const Text('Hồ sơ cá nhân'),
              subtitle: const Text('Xem và chỉnh sửa thông tin cá nhân'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // About
          Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.help, color: Colors.green[600]),
                  title: const Text('Trung tâm hỗ trợ'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpSupportPage(),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.blue[600]),
                  title: const Text('Giới thiệu'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // About
          Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.red[300],
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    'Đăng xuất',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Show logout confirmation
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Đăng xuất'),
                        content: const Text(
                          'Bạn có chắc chắn muốn đăng xuất không?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Huỷ'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninPage(),
                                ),
                              );
                            },
                            child: const Text('Đăng xuất'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedAllLR, title: "Seed LR Materials"),
          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedAllSW, title: "Seed SW Materials"),
          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedAllLRTest, title: "Seed LR Tests"),
          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedInputFull, title: "Seed Input Full"),
          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedInputLR, title: "Seed Input LR"),
          // const SizedBox(height: 20),
          // SmallButton(onPressed: seedInputSW, title: "Seed Input SW"),
        ],
      ),
    );
  }
}
