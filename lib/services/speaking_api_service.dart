// lib/services/speaking_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class SpeakingApiService {
  final String baseUrl; // e.g. 'https://abcd1234.ngrok.io'
  final String? basicAuthUser;
  final String? basicAuthPass;

  SpeakingApiService({
    required this.baseUrl,
    this.basicAuthUser,
    this.basicAuthPass,
  });

  Map<String, String> _headers() {
    final headers = {'Content-Type': 'application/json'};
    if (basicAuthUser != null && basicAuthPass != null) {
      final token = base64Encode(utf8.encode('$basicAuthUser:$basicAuthPass'));
      headers['Authorization'] = 'Basic $token';
    }
    return headers;
  }

  Future<Map<String, dynamic>> submitSpeaking({
    required String question,
    required String audio_url,
    required int max_score,
  }) async {
    final uri = Uri.parse('$baseUrl/api/speaking/submit');
    final response = await http.post(
      uri,
      headers: _headers(),
      body: jsonEncode({
        'question': question,
        'audio_url': audio_url,
        'max_score': max_score,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('HTTP ${response.statusCode}: ${response.body}');
  }
}
