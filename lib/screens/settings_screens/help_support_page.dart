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
          'Trung tâm hỗ trợ',
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
                  'Tôi có thể giúp gì cho bạn?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tìm câu trả lời hoặc liên hệ với bộ phận hỗ trợ của chúng tôi',
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
                'Câu hỏi thường gặp',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                _buildFAQItem(
                  'Làm thế nào để đặt lại mật khẩu?',
                  'Vào Cài đặt > Tài khoản > Đặt lại mật khẩu. Bạn sẽ nhận được email với hướng dẫn đặt lại.',
                ),
                _buildFAQItem(
                  'Làm thế nào để xác minh địa chỉ email của tôi?',
                  'Vào Cài đặt > Tài khoản > Xác minh email và làm theo hướng dẫn để xác minh địa chỉ email của bạn.',
                ),
                _buildFAQItem(
                  'Làm thế nào để cập nhật thông tin hồ sơ của tôi?',
                  'Vào Cài đặt > Hồ sơ và chỉnh sửa thông tin cá nhân của bạn như tên, ảnh đại diện, v.v.',
                ),
                _buildFAQItem(
                  'Làm thế nào để xoá tài khoản của tôi?',
                  'Vào Cài đặt > Tài khoản > Xoá tài khoản và làm theo hướng dẫn để xoá tài khoản của bạn.',
                ),
                _buildFAQItem(
                  'Tôi không nhận được email xác nhận, tôi nên làm gì?',
                  'Kiểm tra thư mục spam hoặc quảng cáo của bạn. Nếu vẫn không thấy, hãy liên hệ với bộ phận hỗ trợ của chúng tôi.',
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
                        'Liên hệ hỗ trợ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nếu bạn cần thêm trợ giúp, vui lòng liên hệ với chúng tôi qua các kênh sau:',
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
                    title: const Text('Email hỗ trợ'),
                    subtitle: const Text('support@mytoeic.com'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement live chat
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email hỗ trợ sẽ có mặt sớm!'),
                          backgroundColor: Colors.blue,
                        ),
                      );
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
                    subtitle: const Text(
                      'Bắt đầu trò chuyện với bộ phận hỗ trợ',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement live chat
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Live chat sẽ có mặt sớm!'),
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
                    title: const Text('Số điện thoại hỗ trợ'),
                    subtitle: const Text('+84 966 125 944'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement live chat
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Số điện thoại hỗ trợ sẽ có mặt sớm!'),
                          backgroundColor: Colors.blue,
                        ),
                      );
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
                'Báo cáo lỗi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Giúp chúng tôi cải thiện ứng dụng bằng cách báo cáo lỗi',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                try {
                  await _sendEmail(
                    'bugs@mytoeic.com',
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
                'Yêu cầu tính năng',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Gửi ý tưởng để cải thiện ứng dụng của chúng tôi',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                try {
                  await _sendEmail(
                    'feedback@mytoeic.com',
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
                  'Thời gian phản hồi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Chúng tôi cố gắng phản hồi trong vòng 24 giờ.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
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
