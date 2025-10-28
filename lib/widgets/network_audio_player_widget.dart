import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class NetworkAudioPlayerWidget extends StatefulWidget {
  final String url;
  final VoidCallback? onStartPlaying; // gọi khi bắt đầu phát (để dừng cái khác)

  const NetworkAudioPlayerWidget({
    super.key,
    required this.url,
    this.onStartPlaying,
  });

  @override
  State<NetworkAudioPlayerWidget> createState() => NetworkAudioPlayerWidgetState();
}

class NetworkAudioPlayerWidgetState extends State<NetworkAudioPlayerWidget> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  bool _isLoaded = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Load URL ngay 1 lần
    _init();

    // Lắng nghe trạng thái player để cập nhật nút Play/Pause
    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      final playing = state.playing;
      final completed = state.processingState == ProcessingState.completed;

      setState(() {
        _isPlaying = playing && !completed;
      });

      // Reset khi phát xong
      if (completed) {
        _player.seek(Duration.zero);
        _player.pause();
        if (mounted) {
          setState(() {
            _isPlaying = false;
          });
        }
      }
    });

    // Lắng nghe progress
    _player.positionStream.listen((pos) {
      if (!mounted) return;
      setState(() {
        _position = pos;
      });
    });

    _player.durationStream.listen((dur) {
      if (!mounted) return;
      setState(() {
        _duration = dur ?? Duration.zero;
      });
    });
  }

  Future<void> _init() async {
    try {
      await _player.setUrl(widget.url);
      if (mounted) setState(() => _isLoaded = true);
    } catch (e) {
      debugPrint('NetworkAudioPlayerWidget: setUrl error: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  /// Cho parent gọi để dừng audio (giống AudioPlayerWidget)
  Future<void> stopAudio() async {
    try {
      await _player.pause();
      await _player.seek(Duration.zero);
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    } catch (_) {}
  }

  Future<void> _togglePlayPause() async {
    if (!_isLoaded) return;

    // Thông báo parent để dừng các audio khác
    widget.onStartPlaying?.call();

    if (_isPlaying) {
      await _player.pause();
      setState(() => _isPlaying = false);
    } else {
      // Nếu đang ở cuối bài sau khi completed thì phát lại từ đầu
      if (_duration != Duration.zero && _position >= _duration) {
        await _player.seek(Duration.zero);
      }
      await _player.play();
      setState(() => _isPlaying = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_duration.inMilliseconds == 0)
        ? 0.0
        : (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0);

    return Row(
      children: [
        IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _isLoaded ? _togglePlayPause : null,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(value: _isLoaded ? progress : null),
              const SizedBox(height: 4),
              Text(
                _isPlaying
                    ? "Playing..."
                    : (_isLoaded ? "Recorded answer" : "Loading audio..."),
                style: TextStyle(color: _isPlaying ? Colors.blue : null),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
