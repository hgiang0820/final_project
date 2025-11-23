import 'package:final_project/screens/study_screens/practice_LR_page.dart';
import 'package:final_project/widgets/card/card_widget.dart';
import 'package:final_project/widgets/card/lesson_card.dart';
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
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
        // Search and Filter Bar
        Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.deepPurple[400]),
              hintText: 'Tìm kiếm bài học...',
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.filter_alt,
                  color: _hasActiveFilters()
                      ? Colors.deepPurple[600]
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
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredEntries.length,
                  itemBuilder: (context, index) {
                    final entry = filteredEntries[index];
                    final it = entry.value;
                    final originalIndex = entry.key;

                    final status = (it['status'] ?? 'todo') as String;
                    final isDone = status == 'done';
                    final lessonName = (it['lessonName'] ?? 'Lesson') as String;

                    // String part;
                    // if (it['partId'] == 'part1') {
                    //   part = 'Part 1';
                    // } else if (it['partId'] == 'part2') {
                    //   part = 'Part 2';
                    // } else if (it['partId'] == 'part3') {
                    //   part = 'Part 3';
                    // } else if (it['partId'] == 'part4') {
                    //   part = 'Part 4';
                    // } else if (it['partId'] == 'part5') {
                    //   part = 'Part 5';
                    // } else if (it['partId'] == 'part6') {
                    //   part = 'Part 6';
                    // } else if (it['partId'] == 'part7') {
                    //   part = 'Part 7';
                    // } else {
                    //   part = 'Part 8';
                    // }

                    String material;
                    if (it['materialId'] == 'LRMaterials') {
                      material = 'Listening & Reading';
                    } else if (it['materialId'] == 'SWMaterials') {
                      material = 'Speaking & Writing';
                    } else {
                      material = 'Four Skills';
                    }

                    String level;
                    if (it['levelId'] == 'lv100') {
                      level = 'Level 100+';
                    } else if (it['levelId'] == 'lv200') {
                      level = 'Level 200+';
                    } else if (it['levelId'] == 'lv300') {
                      level = 'Level 300+';
                    } else if (it['levelId'] == 'lv600') {
                      level = 'Level 600+';
                    } else if (it['levelId'] == 'lv800') {
                      level = 'Level 800+';
                    } else if (it['levelId'] == 'lv1') {
                      level = 'LR 300+ & SW 100+';
                    } else if (it['levelId'] == 'lv2') {
                      level = 'LR 600+ & SW 200+';
                    } else {
                      level = 'LR 800+ & SW 300+';
                    }

                    String part = '';
                    if (material == 'Listening & Reading' ||
                        material == 'Four Skills') {
                      if (it['partId'] == 'part1' || it['partId'] == 'lis1') {
                        part = 'Picture description';
                      } else if (it['partId'] == 'part2' ||
                          it['partId'] == 'lis2') {
                        part = 'Question & response';
                      } else if (it['partId'] == 'part3' ||
                          it['partId'] == 'lis3') {
                        part = 'Conversations';
                      } else if (it['partId'] == 'part4' ||
                          it['partId'] == 'lis4') {
                        part = 'Talks';
                      } else if (it['partId'] == 'part5' ||
                          it['partId'] == 'read1') {
                        part = 'Incomplete sentences';
                      } else if (it['partId'] == 'part6' ||
                          it['partId'] == 'read2') {
                        part = 'Text completion';
                      } else if (it['partId'] == 'part7' ||
                          it['partId'] == 'read3') {
                        part = 'Reading comprehension';
                      }
                    } else if (material == 'Speaking & Writing' ||
                        material == 'Four Skills') {
                      if (it['partId'] == 'part1' || it['partId'] == 'speak1') {
                        part = 'Read a text aloud';
                      } else if (it['partId'] == 'part2' ||
                          it['partId'] == 'speak2') {
                        part = 'Describe a picture';
                      } else if (it['partId'] == 'part3' ||
                          it['partId'] == 'speak3') {
                        part = 'Respond to questions';
                      } else if (it['partId'] == 'part4' ||
                          it['partId'] == 'speak4') {
                        part =
                            'Respond to questions using information provided';
                      } else if (it['partId'] == 'part5' ||
                          it['partId'] == 'speak5') {
                        part = 'Express an opinion';
                      } else if (it['partId'] == 'part6' ||
                          it['partId'] == 'write1') {
                        part = 'Write a sentence based on a picture';
                      } else if (it['partId'] == 'part7' ||
                          it['partId'] == 'write2') {
                        part = 'Respond to a written request';
                      } else if (it['partId'] == 'part8' ||
                          it['partId'] == 'write3') {
                        part = 'Write an opinion essay';
                      }
                    }

                    final intNumber = (it['order'] is num)
                        ? (it['order'] as num).toInt()
                        : (originalIndex + 1);
                    final orderLabel = intNumber.toString().padLeft(2, '0');
                    final kind = (it['type'] ?? 'theory') as String;

                    // Determine badge text and color based on type
                    final badgeText = kind == 'theory'
                        ? 'Lý thuyết'
                        : 'Thực hành';
                    final badgeColor = kind == 'theory'
                        ? Colors.blue
                        : Colors.orange;
                    // final test = it['partId'];

                    return LessonCard(
                      orderLabel: orderLabel,
                      lessonName: lessonName,
                      subtitle: '$material • $level • $part',
                      // subtitle: '$material $test',
                      isDone: isDone,
                      badgeText: badgeText,
                      badgeColor: badgeColor,
                      onTap: () =>
                          _handleLessonTap(context, it, kind, originalIndex),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _handleLessonTap(
    BuildContext context,
    Map<String, dynamic> it,
    String kind,
    int originalIndex,
  ) {
    if (kind == 'theory') {
      final pdfUrl = (it['pdfUrl'] ?? '') as String;
      if (pdfUrl.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Không có PDF cho bài học này.'),
            backgroundColor: Colors.red,
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

      if ([materialId, levelId, partId, lessonId].any((e) => e.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thiếu khóa Practice (material/level/part/lesson).'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (materialId == 'SWMaterials') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PracticeLRPage(
              practiceId: '$materialId|$levelId|$partId|$lessonId',
              onDone: () async => _markDone(originalIndex),
            ),
          ),
        );
        return;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PracticeLRPage(
              itemIndex: originalIndex,
              practiceId: '$materialId|$levelId|$partId|$lessonId',
              onDone: () async => _markDone(originalIndex),
            ),
          ),
        );
      }
    }
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  Icon(Icons.filter_alt, color: Colors.deepPurple[600]),
                  const SizedBox(width: 12),
                  const Text('Bộ lọc bài học'),
                ],
              ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),
            const Text(
              'Không tìm thấy bài học phù hợp',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy thử từ khóa khác hoặc điều chỉnh bộ lọc',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
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
