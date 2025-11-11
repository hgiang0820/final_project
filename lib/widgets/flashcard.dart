import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:final_project/models/vocab_models.dart';

class Flashcard extends StatefulWidget {
  const Flashcard({
    super.key,
    required this.card,
    required this.onSwiped, // callback: true = đã thuộc (vuốt phải), false = học lại (vuốt trái)
    this.width = 320,
    this.height = 320,
  });

  final VocabCard card;
  final void Function(bool learned) onSwiped;
  final double width;
  final double height;

  @override
  State<Flashcard> createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool _showFront = true;

  @override
  void didUpdateWidget(covariant Flashcard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.id != widget.card.id) {
      _showFront = true; // reset về mặt trước khi đổi card mới
    }
  }

  void _toggleFace() => setState(() => _showFront = !_showFront);

  @override
  Widget build(BuildContext context) {
    // Dùng ValueKey theo id để Dismissible reset khi đổi sang card mới
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Dismissible(
          key: ValueKey(widget.card.id),
          direction: DismissDirection.horizontal,
          onDismissed: (d) => widget.onSwiped(d == DismissDirection.startToEnd),
          background: _swipeBg(
            alignment: Alignment.centerLeft,
            color: Colors.green.shade100,
            icon: Icons.check_circle,
            label: 'Đã thuộc',
          ),
          secondaryBackground: _swipeBg(
            alignment: Alignment.centerRight,
            color: Colors.orange.shade100,
            icon: Icons.rotate_left,
            label: 'Học lại',
          ),
          child: GestureDetector(
            onTap: _toggleFace,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: _showFront
                  ? _Front(
                      card: widget.card,
                      width: widget.width,
                      height: widget.height,
                      key: const ValueKey('front'),
                    )
                  : _Back(
                      card: widget.card,
                      width: widget.width,
                      height: widget.height,
                      key: const ValueKey('back'),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _swipeBg({
    required Alignment alignment,
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _Front extends StatelessWidget {
  const _Front({
    super.key,
    required this.card,
    required this.width,
    required this.height,
  });

  final VocabCard card;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasAudio = card.audioUrl.trim().isNotEmpty;
    return Card(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card.word,
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade700,
                        ) ??
                        TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade700,
                        ),
                  ),
                  if (card.phonetic.trim().isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      card.phonetic,
                      textAlign: TextAlign.center,
                      style:
                          theme.textTheme.titleMedium?.copyWith(
                            color: Colors.deepPurple.shade300,
                            fontStyle: FontStyle.italic,
                          ) ??
                          TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple.shade300,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ],
              ),
            ),
            if (hasAudio)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, right: 4),
                  child: _FlashcardAudioButton(audioPath: card.audioUrl),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FlashcardAudioButton extends StatefulWidget {
  const _FlashcardAudioButton({required this.audioPath});

  final String audioPath;

  @override
  State<_FlashcardAudioButton> createState() => _FlashcardAudioButtonState();
}

class _FlashcardAudioButtonState extends State<_FlashcardAudioButton> {
  static const _vocabBucket = 'vocab_flashcard_audio';

  late final AudioPlayer _player;
  bool _isPlaying = false;
  bool _isLoading = false;
  late String? _resolvedUrl;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _resolvedUrl = _buildPublicUrl(widget.audioPath);

    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      final playing =
          state.playing && state.processingState != ProcessingState.completed;
      setState(() => _isPlaying = playing);

      if (state.processingState == ProcessingState.completed) {
        _player.seek(Duration.zero);
      }
    });
  }

  @override
  void didUpdateWidget(covariant _FlashcardAudioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioPath != widget.audioPath) {
      _resolvedUrl = _buildPublicUrl(widget.audioPath);
      _player.stop();
      _player.seek(Duration.zero);
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _isLoading = false;
        });
      }
    }
  }

  String? _buildPublicUrl(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;
    if (trimmed.startsWith('http')) return trimmed;
    try {
      return Supabase.instance.client.storage
          .from(_vocabBucket)
          .getPublicUrl(trimmed);
    } catch (e) {
      debugPrint('FlashcardAudioButton: failed to resolve url $e');
      return null;
    }
  }

  Future<void> _togglePlayback() async {
    if (_resolvedUrl == null) return;

    if (_isPlaying) {
      await _player.stop();
      await _player.seek(Duration.zero);
      if (mounted) setState(() => _isPlaying = false);
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _player.stop();
      await _player.setUrl(_resolvedUrl!);
      await _player.play();
    } catch (e) {
      debugPrint('FlashcardAudioButton: play error $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.colorScheme.primary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.08),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        tooltip: 'Nghe phát âm',
        iconSize: 24,
        visualDensity: VisualDensity.compact,
        onPressed: (_resolvedUrl == null || _isLoading)
            ? null
            : _togglePlayback,
        icon: _isLoading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(iconColor),
                ),
              )
            : Icon(
                _isPlaying ? Icons.volume_up : Icons.volume_down,
                color: iconColor,
              ),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({
    super.key,
    required this.card,
    required this.width,
    required this.height,
  });

  final VocabCard card;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.deepPurple.shade50,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nghĩa tiếng Việt',
              style:
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade700,
                  ) ??
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              card.meaningVi,
              textAlign: TextAlign.center,
              style:
                  theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade900,
                  ) ??
                  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade900,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ví dụ',
              style:
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade700,
                  ) ??
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              card.exampleEn,
              textAlign: TextAlign.center,
              style:
                  theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    height: 1.4,
                  ) ??
                  const TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 12),
            Text(
              card.exampleVi,
              textAlign: TextAlign.center,
              style:
                  theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    color: Colors.deepPurple.shade500,
                    height: 1.4,
                  ) ??
                  TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple.shade500,
                    height: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
