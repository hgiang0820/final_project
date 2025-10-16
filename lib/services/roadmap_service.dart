import 'package:final_project/repositories/material_repository.dart';

/// Build lộ trình tổng quát cho LR / SW / 4 skills:
/// - Tự động tạo 2 item/lesson: Theory (PDF) + Practice (không PDF)
/// - Gán 'order' tăng dần để giữ thứ tự ổn định, không bị đổi chỗ khi mark Done
/// - Mỗi item đều có: materialId, levelId, partId, lessonId, title, type, order, status
class RoadmapService {
  final MaterialRepository materials;
  RoadmapService(this.materials);

  /// selectedIndex: 0 = LR, 1 = SW, 2 = 4 skills (LR + SW)
  /// goalText, weakPoints: giữ nguyên cách bạn đang dùng để chọn level/parts.
  ///
  /// Tùy chọn:
  /// - includePractice: false nếu muốn chỉ tạo Theory
  /// - practiceFirst: true nếu muốn Practice xếp trước Theory
  Future<List<Map<String, dynamic>>> buildRoadmap({
    required int selectedIndex,
    required String goalText,
    required List<dynamic> weakPoints,
    bool includePractice = true,
    bool practiceFirst = false,
  }) async {
    final levelId = _pickLevel(goalText);
    final parts = _pickParts(selectedIndex, weakPoints);

    // Chọn nguồn materials theo tab
    final materialIds = switch (selectedIndex) {
      0 => ['LRMaterials'],
      1 => ['SWMaterials'],
      _ => ['LRMaterials', 'SWMaterials'], // 4 skills
    };

    final List<Map<String, dynamic>> items = [];
    int order = 1; // ✅ thứ tự toàn cục, tăng dần xuyên suốt toàn bộ roadmap

    for (final materialId in materialIds) {
      for (final partId in parts) {
        // Lấy danh sách lesson gốc theo đúng thứ tự mà bạn đang lưu
        final lessons = await materials.getLessons(
          materialId: materialId,
          levelId: levelId,
          partId: partId,
        );

        for (final l in lessons) {
          final lessonId = (l['lessonId'] ?? '').toString();
          final lessonName = (l['lessonName'] ?? 'Lesson').toString();
          final pdfPath = (l['pdfPath'] as String?) ?? '';
          final pdfUrl = pdfPath.isEmpty
              ? null
              : materials.publicPdfUrl(pdfPath);

          // ---- Tạo item THE0RY ----
          final theory = <String, dynamic>{
            'materialId': materialId,
            'levelId': levelId,
            'partId': partId,
            'lessonId': lessonId,
            'lessonName': '$lessonName • Theory',
            'type': 'theory',
            'pdfUrl': pdfUrl, // có thể null; StudyPage đã handle
            'order': order++, // ✅ tăng dần, giữ ổn định
            'status': 'todo',
          };

          // ---- (Tuỳ chọn) Tạo item PRACTICE ----
          final practice = <String, dynamic>{
            'materialId': materialId,
            'levelId': levelId,
            'partId': partId,
            'lessonId': lessonId,
            'lessonName': '$lessonName • Practice',
            'type': 'practice',
            // practice không cần pdfUrl — PracticeLRPage sẽ dùng 4 khóa để load data
            'order': includePractice
                ? order++
                : null, // chỉ cấp order khi có practice
            'status': 'todo',
          }..removeWhere((k, v) => v == null);

          if (includePractice) {
            if (practiceFirst) {
              items
                ..add(practice)
                ..add(theory);
              // (Lưu ý: nếu muốn practice trước theory nhưng vẫn ổn định, ta đã gán order theo thứ tự push)
            } else {
              items
                ..add(theory)
                ..add(practice);
            }
          } else {
            items.add(theory);
          }
        }
      }
    }

    return items;
  }

  // ---- helpers ----
  String _pickLevel(String goal) {
    final g = goal.toLowerCase();
    if (g.contains('800')) return 'lv800';
    if (g.contains('600')) return 'lv600';
    return 'lv300';
  }

  /// Map weakPoints -> part keys trên DB
  /// LR: part1..part7 | SW: speak1..speak4 | write1..write2 (tuỳ bạn thiết kế)
  List<String> _pickParts(int tab, List<dynamic> weakPoints) {
    final wp = weakPoints.map((e) => e.toString().toLowerCase()).toList();

    // Các “keyword” phổ biến bạn đang dùng trong kết quả test:
    final lrMap = <String, String>{
      'picture description': 'part1',
      'question & response': 'part2',
      'conversations': 'part3',
      'talks': 'part4',
      'incomplete sentences': 'part5',
      'text completion': 'part6',
      'reading comprehension': 'part7',
    };
    final swMap = <String, String>{
      'read-aloud': 'speak1',
      'describe a picture': 'speak2',
      'respond to questions': 'speak3',
      'express an opinion': 'speak4',
      'email writing': 'write1',
      'opinion essay': 'write2',
    };

    List<String> parts = [];
    if (tab == 0 || tab == 2) {
      for (final k in lrMap.keys) {
        if (_containsAny(wp, [k])) parts.add(lrMap[k]!);
      }
      if (parts.isEmpty) {
        parts = ['part2', 'part3', 'part5']; // mặc định dễ–trung bình–ngữ pháp
      }
    }

    if (tab == 1 || tab == 2) {
      final swPicked = <String>[];
      for (final k in swMap.keys) {
        if (_containsAny(wp, [k])) swPicked.add(swMap[k]!);
      }
      if (swPicked.isEmpty) {
        swPicked.addAll(['speak2', 'speak3', 'write1']); // mặc định SW
      }
      parts.addAll(swPicked);
    }

    // Loại trùng
    return parts.toSet().toList();
  }

  bool _containsAny(List<String> src, List<String> needles) {
    for (final n in needles) {
      if (src.any((s) => s.contains(n))) return true;
    }
    return false;
  }
}

// import 'package:final_project/repositories/material_repository.dart';

// /// Gom logic: chọn level theo goal, map weakPoints -> partId, lấy 5 lessons/part.
// class RoadmapService {
//   final MaterialRepository materials;

//   RoadmapService(this.materials);

//   /// selectedIndex: 0=LR, 1=SW, 2=4 skills (kết hợp LR+SW)
//   Future<List<Map<String, dynamic>>> buildRoadmap({
//     required int selectedIndex,
//     required String goalText,
//     required List<dynamic> weakPoints,
//   }) async {
//     final levelId = _pickLevel(goalText);
//     final parts = _pickParts(selectedIndex, weakPoints);

//     // Chọn nguồn materials theo tab
//     final materialIds = switch (selectedIndex) {
//       0 => ['LRMaterials'],
//       1 => ['SWMaterials'],
//       _ => ['LRMaterials', 'SWMaterials'], // 4 skills
//     };

//     final List<Map<String, dynamic>> items = [];

//     for (final materialId in materialIds) {
//       for (final partId in parts) {
//         final lessons = await materials.getLessons(
//           materialId: materialId,
//           levelId: levelId,
//           partId: partId,
//         );

//         for (final l in lessons) {
//           final pdfPath = (l['pdfPath'] as String?) ?? '';
//           items.add({
//             'materialId': materialId,
//             'levelId': levelId,
//             'partId': partId,
//             'lessonId': l['lessonId'],
//             'title': l['title'],
//             'pdfUrl': pdfPath.isEmpty ? null : materials.publicPdfUrl(pdfPath),
//             'status': 'todo', // todo | done (client có thể cập nhật sau)
//           });
//         }
//       }
//     }
//     return items;
//   }

//   // ---- helpers ngắn gọn ----
//   String _pickLevel(String goal) {
//     final g = goal.toLowerCase();
//     if (g.contains('800')) return 'lv800';
//     if (g.contains('600')) return 'lv600';
//     return 'lv300';
//   }

//   /// Map weakPoints -> part keys trên DB
//   /// LR: part1..part7 | SW: speak1..speak4 | write1..write2 (tuỳ bạn thiết kế)
//   List<String> _pickParts(int tab, List<dynamic> weakPoints) {
//     final wp = weakPoints.map((e) => e.toString().toLowerCase()).toList();

//     // Các “keyword” phổ biến bạn đang dùng trong kết quả test:
//     final lrMap = <String, String>{
//       'picture description': 'part1',
//       'question & response': 'part2',
//       'conversations': 'part3',
//       'talks': 'part4',
//       'incomplete sentences': 'part5',
//       'text completion': 'part6',
//       'reading comprehension': 'part7',
//     };
//     final swMap = <String, String>{
//       'read-aloud': 'speak1',
//       'describe a picture': 'speak2',
//       'respond to questions': 'speak3',
//       'express an opinion': 'speak4',
//       'email writing': 'write1',
//       'opinion essay': 'write2',
//     };

//     List<String> parts = [];
//     if (tab == 0 || tab == 2) {
//       for (final k in lrMap.keys) {
//         if (_containsAny(wp, [k])) parts.add(lrMap[k]!);
//       }
//       if (parts.isEmpty) {
//         parts = ['part2', 'part3', 'part5']; // mặc định dễ–trung bình–ngữ pháp
//       }
//     }

//     if (tab == 1 || tab == 2) {
//       final swPicked = <String>[];
//       for (final k in swMap.keys) {
//         if (_containsAny(wp, [k])) swPicked.add(swMap[k]!);
//       }
//       if (swPicked.isEmpty) {
//         swPicked.addAll(['speak2', 'speak3', 'write1']); // mặc định SW
//       }
//       parts.addAll(swPicked);
//     }

//     // Loại trùng
//     return parts.toSet().toList();
//   }

//   bool _containsAny(List<String> src, List<String> needles) {
//     for (final n in needles) {
//       if (src.any((s) => s.contains(n))) return true;
//     }
//     return false;
//   }
// }
