import 'package:flutter/material.dart';
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
    return Card(
      color: Colors.white,
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
