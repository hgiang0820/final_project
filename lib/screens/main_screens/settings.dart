import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/screens/settings_screens/about_page.dart';
import 'package:final_project/screens/settings_screens/help_support_page.dart';
import 'package:final_project/screens/settings_screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
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
                  'Settings',
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
              title: const Text('Profile'),
              subtitle: const Text('Manage your account'),
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

          // Preferences
          Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.orange[600]),
                  title: const Text('Notifications'),
                  subtitle: const Text('Manage notifications'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {
                      // Toggle notifications
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.dark_mode, color: Colors.grey[600]),
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Toggle dark theme'),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // Toggle dark mode
                    },
                  ),
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
                  leading: Icon(Icons.help, color: Colors.green[600]),
                  title: const Text('Help & Support'),
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
                  title: const Text('About'),
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
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red[600]),
                  title: const Text('Sign Out'),
                  onTap: () {
                    // Show logout confirmation
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Sign Out'),
                        content: const Text(
                          'Are you sure you want to sign out?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
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
                            child: const Text('Sign Out'),
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
        ],
      ),
    );
  }
}
