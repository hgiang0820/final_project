import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _client = Supabase.instance.client;
  final String bucket;

  SupabaseService({required this.bucket});

  Future<String> uploadAndGetPublicUrl({
    required String localPath,
    required String storagePath,
  }) async {
    final file = File(localPath);

    // Nếu file đã tồn tại trên bucket, xoá/ghi đè tuỳ nhu cầu
    try {
      await _client.storage.from(bucket).remove([storagePath]);
    } catch (_) {}

    await _client.storage.from(bucket).upload(storagePath, file);

    // Lấy public URL (hoặc dùng signed URL nếu muốn bảo mật hơn)
    final publicUrl = _client.storage.from(bucket).getPublicUrl(storagePath);
    return publicUrl;
  }
}
