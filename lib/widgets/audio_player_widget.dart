import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String filePath;
  final VoidCallback? onStartPlaying; // Callback khi bắt đầu phát
  const AudioPlayerWidget({
    super.key,
    required this.filePath,
    this.onStartPlaying,
  });

  @override
  State<AudioPlayerWidget> createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Lắng nghe mọi thay đổi state
    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() {
        isPlaying = state.playing;

        // Nếu phát xong thì reset và dừng
        if (state.processingState == ProcessingState.completed) {
          isPlaying = false;
          _player.stop();
          _player.seek(Duration.zero);
        }
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  // Method để dừng audio từ bên ngoài
  Future<void> stopAudio() async {
    if (isPlaying) {
      await _player.stop();
      await _player.seek(Duration.zero);
      setState(() {
        isPlaying = false;
      });
    }
  }

  Future<void> _playAudio() async {
    // Thông báo cho parent widget rằng audio này sắp phát
    if (widget.onStartPlaying != null) {
      widget.onStartPlaying!();
    }

    // Luôn load lại file và phát từ đầu
    await _player.stop();
    await _player.setFilePath(widget.filePath);
    await _player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: isPlaying ? null : _playAudio, // Disable khi đang phát
        ),
        Expanded(
          child: Text(
            isPlaying ? "Playing..." : "Recorded answer",
            style: TextStyle(color: isPlaying ? Colors.blue : null),
          ),
        ),
      ],
    );
  }
}
