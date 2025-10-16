import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> uploadAssetsToSupabase() async {
  final supabase = Supabase.instance.client;
  Future<void> up(String assetPath, String storagePath) async {
    final bytes = (await rootBundle.load(assetPath)).buffer.asUint8List();
    await supabase.storage.from('toeic-assets').uploadBinary(
      storagePath,
      bytes,
      fileOptions: const FileOptions(upsert: true),
    );
    print('uploaded $assetPath -> $storagePath');
  }

  // Part1 audio + images (paths must exist in assets)
  await up('assets/test1/part1/audio.mp3', 'tests/test1/part1/audio.mp3');
  for (int i=1;i<=6;i++){
    await up('assets/test1/part1/images/q${i.toString().padLeft(2,'0')}.jpg',
             'tests/test1/part1/images/q${i.toString().padLeft(2,'0')}.jpg');
  }

  // Part2 audio
  await up('assets/test1/part2/audio.mp3', 'tests/test1/part2/audio.mp3');
}
