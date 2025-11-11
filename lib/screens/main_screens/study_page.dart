import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/repositories/roadmap_repository.dart';
import 'package:final_project/screens/study_screens/pdf_viewer_page.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final roadmapRepo = RoadmapRepository();
  final TextEditingController _searchController = TextEditingController();

  String? roadmapId;
  List<Map<String, dynamic>> items = [];
  bool loading = true;
  String searchQuery = '';
  String? selectedPart;
  String? selectedStatus;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _loadLatestRoadmap();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadLatestRoadmap() async {
    setState(() => loading = true);
    final latest = await roadmapRepo.getLatestRoadmap();
    if (latest == null) {
      setState(() {
        roadmapId = null;
        items = [];
        loading = false;
      });
      return;
    }

    final data = latest['data'] as Map<String, dynamic>;
    final list = List<Map<String, dynamic>>.from(data['items'] ?? []);

    // ĐẢM BẢO THỨ TỰ ỔN ĐỊNH:
    // - Nếu mỗi item đã có 'order' thì sắp theo 'order' tăng dần.
    // - Nếu chưa có 'order' thì giữ nguyên thứ tự trong mảng (không sort).
    final hasOrder = list.isNotEmpty && list.first.containsKey('order');
    final stable = [...list];
    if (hasOrder) {
      stable.sort((a, b) => (a['order'] ?? 0).compareTo(b['order'] ?? 0));
    }

    final partOptions = _collectOptions(
      stable,
      (it) => (it['partId'] ?? '').toString(),
    );
    final statusOptions = _collectOptions(
      stable,
      (it) => (it['status'] ?? 'todo').toString(),
    );
    final typeOptions = _collectOptions(
      stable,
      (it) => (it['type'] ?? 'theory').toString(),
    );

    setState(() {
      roadmapId = latest['roadmapId'] as String;
      items = stable;
      loading = false;
      if (selectedPart != null && !partOptions.contains(selectedPart)) {
        selectedPart = null;
      }
      if (selectedStatus != null && !statusOptions.contains(selectedStatus)) {
        selectedStatus = null;
      }
      if (selectedType != null && !typeOptions.contains(selectedType)) {
        selectedType = null;
      }
    });
  }

  Future<void> _markDone(int index) async {
    if (roadmapId == null) return;
    await roadmapRepo.markLessonStatus(
      roadmapId: roadmapId!,
      itemIndex: index, // dùng index gốc — không có sort nên luôn ổn định
      status: 'done',
    );
    await _loadLatestRoadmap(); // reload để thấy trạng thái mới, không đổi vị trí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : (roadmapId == null || items.isEmpty)
          ? _emptyView(context)
          : _listView(context),
    );
  }

  Widget _emptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school, size: 100, color: Colors.purple[300]),
            const SizedBox(height: 16),
            Text(
              'Chưa có lộ trình học',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy tạo Study Roadmap ở trang Selection trước.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    final query = searchQuery.trim().toLowerCase();
    final partOptions = _collectOptions(
      items,
      (it) => (it['partId'] ?? '').toString(),
    );
    final statusOptions = _collectOptions(
      items,
      (it) => (it['status'] ?? 'todo').toString(),
    );
    final typeOptions = _collectOptions(
      items,
      (it) => (it['type'] ?? 'theory').toString(),
    );

    final filteredEntries = items
        .asMap()
        .entries
        .where((entry) {
          if (query.isEmpty) return true;
          final lessonName = (entry.value['lessonName'] ?? '').toString();
          return lessonName.toLowerCase().contains(query);
        })
        .where((entry) {
          final item = entry.value;
          final part = (item['partId'] ?? '').toString();
          final status = (item['status'] ?? 'todo').toString();
          final type = (item['type'] ?? 'theory').toString();

          final matchesPart =
              selectedPart == null ||
              selectedPart!.isEmpty ||
              part == selectedPart;
          final matchesStatus =
              selectedStatus == null ||
              selectedStatus!.isEmpty ||
              status == selectedStatus;
          final matchesType =
              selectedType == null ||
              selectedType!.isEmpty ||
              type == selectedType;
          return matchesPart && matchesStatus && matchesType;
        })
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Tìm kiếm bài học...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.filter_alt,
                  color: _hasActiveFilters()
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
                tooltip: 'Bộ lọc',
                onPressed: () => _showFilterDialog(
                  partOptions: partOptions,
                  statusOptions: statusOptions,
                  typeOptions: typeOptions,
                ),
              ),
            ),
            onChanged: (value) => setState(() => searchQuery = value),
          ),
        ),
        Expanded(
          child: filteredEntries.isEmpty
              ? _emptySearchResult()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: filteredEntries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final entry = filteredEntries[index];
                    final it = entry.value;
                    final originalIndex = entry.key;

                    final status = (it['status'] ?? 'todo') as String;
                    final isDone = status == 'done';
                    final lessonName = (it['lessonName'] ?? 'Lesson') as String;
                    final part = (it['partId'] ?? '') as String;
                    final level = (it['levelId'] ?? '') as String;
                    final material = (it['materialId'] ?? '') as String;
                    // final pdfUrl = (it['pdfUrl'] ?? '') as String;

                    // SỐ THỨ TỰ ỔN ĐỊNH:
                    // - Nếu item có 'order' -> dùng order (1-based)
                    // - Nếu không -> dùng (index + 1) dựa trên vị trí lọc
                    final intNumber = (it['order'] is num)
                        ? (it['order'] as num).toInt()
                        : (originalIndex + 1);
                    final orderLabel = intNumber.toString().padLeft(2, '0');
                    final kind = (it['type'] ?? 'theory') as String;

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: isDone
                            ? Colors.green[100]
                            : Colors.grey[300],
                        child: Text(
                          orderLabel,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDone
                                ? Colors.green[800]
                                : Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Icon(
                            isDone
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isDone ? Colors.green : Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              lessonName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text('$material • $level • $part'),
                      trailing: isDone
                          ? const Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'To-do',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onTap: () {
                        if (kind == 'theory') {
                          final pdfUrl = (it['pdfUrl'] ?? '') as String;
                          if (pdfUrl.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Không có PDF cho bài học này.'),
                              ),
                            );
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PdfViewerPage(
                                pdfUrl: pdfUrl,
                                onDone: () async => _markDone(originalIndex),
                              ),
                            ),
                          );
                        } else {
                          final materialId = (it['materialId'] ?? '') as String;
                          final levelId = (it['levelId'] ?? '') as String;
                          final partId = (it['partId'] ?? '') as String;
                          final lessonId = (it['lessonId'] ?? '') as String;

                          if ([
                            materialId,
                            levelId,
                            partId,
                            lessonId,
                          ].any((e) => e.isEmpty)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Thiếu khóa Practice (material/level/part/lesson).',
                                ),
                              ),
                            );
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PracticeLRPage(
                                practiceId:
                                    '$materialId|$levelId|$partId|$lessonId',
                                onDone: () async => _markDone(originalIndex),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Future<void> _showFilterDialog({
    required List<String> partOptions,
    required List<String> statusOptions,
    required List<String> typeOptions,
  }) async {
    String? tempPart = selectedPart;
    String? tempStatus = selectedStatus;
    String? tempType = selectedType;

    final hasAnyFilter =
        partOptions.isNotEmpty ||
        statusOptions.isNotEmpty ||
        typeOptions.isNotEmpty;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setLocalState) {
            Widget buildDropdown({
              required String label,
              required String? value,
              required List<String> options,
              required ValueChanged<String?> onChanged,
            }) {
              return _buildDropdownFilter(
                label: label,
                value: value,
                options: options,
                onChanged: onChanged,
              );
            }

            return AlertDialog(
              title: const Text('Bộ lọc bài học'),
              content: hasAnyFilter
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (partOptions.isNotEmpty)
                            buildDropdown(
                              label: 'Part',
                              value: tempPart,
                              options: partOptions,
                              onChanged: (value) =>
                                  setLocalState(() => tempPart = value),
                            ),
                          if (partOptions.isNotEmpty)
                            const SizedBox(height: 12),
                          if (statusOptions.isNotEmpty)
                            buildDropdown(
                              label: 'Trạng thái',
                              value: tempStatus,
                              options: statusOptions,
                              onChanged: (value) =>
                                  setLocalState(() => tempStatus = value),
                            ),
                          if (statusOptions.isNotEmpty)
                            const SizedBox(height: 12),
                          if (typeOptions.isNotEmpty)
                            buildDropdown(
                              label: 'Loại bài học',
                              value: tempType,
                              options: typeOptions,
                              onChanged: (value) =>
                                  setLocalState(() => tempType = value),
                            ),
                        ],
                      ),
                    )
                  : const Text('Không có bộ lọc khả dụng.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Đóng'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!mounted) return;
                    setState(() {
                      selectedPart = tempPart;
                      selectedStatus = tempStatus;
                      selectedType = tempType;
                    });
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Áp dụng'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  bool _hasActiveFilters() =>
      selectedPart != null || selectedStatus != null || selectedType != null;

  Widget _buildDropdownFilter({
    required String label,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    final dropdownItems = <DropdownMenuItem<String?>>[
      const DropdownMenuItem<String?>(value: null, child: Text('Tất cả')),
      ...options.map(
        (option) =>
            DropdownMenuItem<String?>(value: option, child: Text(option)),
      ),
    ];

    return DropdownButtonFormField<String?>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: dropdownItems,
      onChanged: onChanged,
    );
  }

  Widget _emptySearchResult() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 48, color: Colors.grey[500]),
            const SizedBox(height: 12),
            const Text(
              'Không tìm thấy bài học phù hợp.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              'Hãy thử từ khóa khác.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _collectOptions(
    List<Map<String, dynamic>> source,
    String Function(Map<String, dynamic>) extractor,
  ) {
    final set = <String>{};
    for (final it in source) {
      final value = extractor(it).trim();
      if (value.isEmpty) continue;
      set.add(value);
    }
    final list = set.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }
}
