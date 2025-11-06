import 'package:final_project/models/vocab_models.dart';
import 'package:final_project/repositories/vocab_repository.dart';
import 'package:final_project/widgets/flashcard.dart';
import 'package:flutter/material.dart';

class VocabFlashcardsPage extends StatefulWidget {
  final String levelId;
  final String topicId;
  final String topicName;

  const VocabFlashcardsPage({
    super.key,
    required this.levelId,
    required this.topicId,
    required this.topicName,
  });

  @override
  State<VocabFlashcardsPage> createState() => _VocabFlashcardsPageState();
}

class _VocabFlashcardsPageState extends State<VocabFlashcardsPage> {
  final VocabRepository _vocabRepo = VocabRepository();

  List<VocabCard> _cards = const [];
  List<int> _queue = <int>[];
  final Set<int> _learned = <int>{};

  bool _loading = true;
  String? _error;

  VocabCard? get _currentCard => _queue.isEmpty ? null : _cards[_queue.first];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final cards = await _vocabRepo.getVocabCards(
        levelId: widget.levelId,
        topicId: widget.topicId,
      );
      if (!mounted) return;
      setState(() {
        _cards = cards;
        _queue = List<int>.generate(cards.length, (i) => i);
        _learned.clear();
        _loading = false;
      });
      _showDialog();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _resetQueue() {
    if (_cards.isEmpty) return;
    setState(() {
      _queue = List<int>.generate(_cards.length, (i) => i);
      _learned.clear();
    });
  }

  void _showDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hướng dẫn'),
        content: const Text(
          '• Nhấn để lật thẻ\n• Vuốt phải: đã thuộc\n• Vuốt trái: cần học lại\n• Reset: học lại toàn bộ từ vựng',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  void _handleSwipe({required bool learned}) {
    if (_queue.isEmpty) return;
    final currentIndex = _queue.first;
    setState(() {
      _queue.removeAt(0);
      if (learned) {
        _learned.add(currentIndex);
      } else {
        _learned.remove(currentIndex);
        _queue.add(currentIndex); // đưa về cuối để học lại
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = _currentCard;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
        actions: [
          IconButton(
            onPressed: _resetQueue,
            icon: const Icon(Icons.replay),
            tooltip: 'Reset tất cả thẻ về trạng thái chưa học',
          ),
        ],
      ),
      body: _buildBody(current),
    );
  }

  Widget _buildBody(VocabCard? current) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(
                'Không tải được flashcards.\n$_error',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _loadCards,
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      );
    }
    if (_cards.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.menu_book, size: 72, color: Colors.purple[300]),
              const SizedBox(height: 12),
              const Text(
                'Chủ đề này chưa có flashcards.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    if (current == null) {
      return _buildCompletedView();
    }

    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Flashcard(
              card: current,
              onSwiped: (learned) => _handleSwipe(learned: learned),
              width: 320, // có thể chỉnh
              height: 320, // có thể chỉnh
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.topicName,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: Icon(Icons.done, color: Colors.green.shade700),
                label: Text('Đã học: ${_learned.length}/${_cards.length}'),
                backgroundColor: Colors.green.shade50,
              ),
              Chip(
                avatar: Icon(Icons.pending, color: Colors.orange.shade600),
                label: Text('Còn lại: ${_queue.length}'),
                backgroundColor: Colors.orange.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.emoji_events, size: 96, color: Colors.amber.shade600),
            const SizedBox(height: 16),
            Text(
              'Hoàn thành chủ đề!',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tất cả từ vựng đã được đánh dấu là đã thuộc.\nBạn có thể ôn lại nếu muốn.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _resetQueue,
              icon: const Icon(Icons.replay),
              label: const Text('Ôn lại'),
            ),
          ],
        ),
      ),
    );
  }
}
