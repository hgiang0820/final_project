import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _sendEmail(String email, String subject) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=${Uri.encodeComponent(subject)}',
    );

    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email client');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HELP & SUPPORT',
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
                Icon(Icons.help_center, size: 80, color: Colors.purple[300]),
                const SizedBox(height: 16),
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Find answers to common questions or get in touch with our support team',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // FAQ Section
          Card(
            elevation: 2,
            child: ExpansionTile(
              leading: Icon(Icons.quiz, color: Colors.blue[600]),
              title: const Text(
                'Frequently Asked Questions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                _buildFAQItem(
                  'How do I reset my password?',
                  'Go to Settings > Profile > Change Password. We will send a reset link to your email address.',
                ),
                _buildFAQItem(
                  'How do I verify my email?',
                  'Go to Settings > Profile > Verify Email. Check your inbox and spam folder for the verification email.',
                ),
                _buildFAQItem(
                  'How do I update my profile information?',
                  'Go to Settings > Profile, tap the edit icon, make your changes, and tap save.',
                ),
                _buildFAQItem(
                  'How do I delete my account?',
                  'Go to Settings > Profile > Delete Account. This action cannot be undone and will remove all your data.',
                ),
                _buildFAQItem(
                  'I\'m not receiving emails from the app',
                  'Check your spam folder. Add our email to your contacts. Ensure your email address is correct in your profile.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Contact Support
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.support_agent, color: Colors.purple[600]),
                      const SizedBox(width: 12),
                      const Text(
                        'Contact Support',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Can\'t find what you\'re looking for? Our support team is here to help!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Email Support
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.red[100],
                      child: Icon(Icons.email, color: Colors.red[600]),
                    ),
                    title: const Text('Email Support'),
                    subtitle: const Text('support@yourapp.com'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      try {
                        await _sendEmail(
                          'support@yourapp.com',
                          'Support Request',
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not open email client'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),

                  const Divider(),

                  // Live Chat
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: Icon(Icons.chat, color: Colors.green[600]),
                    ),
                    title: const Text('Live Chat'),
                    subtitle: const Text('Available 24/7'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement live chat
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Live chat will be available soon!'),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                  ),

                  const Divider(),

                  // Phone Support
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: Icon(Icons.phone, color: Colors.blue[600]),
                    ),
                    title: const Text('Phone Support'),
                    subtitle: const Text('+1 (555) 123-4567'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      try {
                        await _launchUrl('tel:+15551234567');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not make phone call'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Report a Bug
          Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Icon(Icons.bug_report, color: Colors.orange[600]),
              ),
              title: const Text(
                'Report a Bug',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Help us improve by reporting issues'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                try {
                  await _sendEmail(
                    'bugs@yourapp.com',
                    'Bug Report - ${DateTime.now().toString().split(' ')[0]}',
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Could not open email client'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 16),

          // Feature Request
          Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan[100],
                child: Icon(Icons.lightbulb, color: Colors.cyan[600]),
              ),
              title: const Text(
                'Feature Request',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Suggest new features or improvements'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                try {
                  await _sendEmail(
                    'feedback@yourapp.com',
                    'Feature Request - ${DateTime.now().toString().split(' ')[0]}',
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Could not open email client'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 32),

          // Footer
          Center(
            child: Column(
              children: [
                Text(
                  'Response Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We typically respond within 24 hours',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue[600]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'For urgent issues, please contact phone support',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
