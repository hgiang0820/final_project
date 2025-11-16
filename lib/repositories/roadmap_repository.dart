import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoadmapRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /// Lưu toàn bộ roadmap của 1 lần tạo (1 document/roadmap)
  Future<String> saveRoadmap({
    required String goal,
    required List<dynamic> weakPoints,
    required int selectedIndex, // 0 LR, 1 SW, 2 Full
    required List<Map<String, dynamic>> items, // từ RoadmapService
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .doc(); // auto id

    // tính tổng theo type (nếu item có field 'type' = 'theory'|'practice')
    int theoryTotal = 0;
    int practiceTotal = 0;
    for (final it in items) {
      final t = (it['type'] ?? 'theory').toString();
      if (t == 'practice') {
        practiceTotal++;
      } else {
        theoryTotal++;
      }
    }

    await docRef.set({
      'goal': goal,
      'weakPoints': weakPoints,
      'tab': selectedIndex,
      'items':
          items, // mảng lesson (materialId, levelId, partId, lessonId, pdfUrl, ...)
      'createdAt': FieldValue.serverTimestamp(),
      'progress': {
        'done': 0,
        'total': items.length,
        'theoryDone': 0,
        'practiceDone': 0,
        'theoryTotal': theoryTotal,
        'practiceTotal': practiceTotal,
      },
    }, SetOptions(merge: true));

    return docRef.id;
  }

  /// Lấy roadmap mới nhất (id + data). Trả về null nếu chưa có.
  Future<Map<String, dynamic>?> getLatestRoadmap() async {
    final uid = _auth.currentUser!.uid;
    final q = await _db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (q.docs.isEmpty) return null;
    final d = q.docs.first;
    return {'roadmapId': d.id, 'data': d.data()};
  }

  /// Đánh dấu 1 lesson thành done/todo bằng index trong mảng items.
  Future<void> markLessonStatus({
    required String roadmapId,
    required int itemIndex,
    required String status, // 'done' | 'todo'
  }) async {
    final uid = _auth.currentUser!.uid;
    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('roadmaps')
        .doc(roadmapId);
    final snap = await docRef.get();
    if (!snap.exists) return;

    final data = snap.data() as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
    if (itemIndex < 0 || itemIndex >= items.length) return;

    items[itemIndex]['status'] = status;

    // tính lại progress chi tiết
    int total = items.length;
    int done = 0;
    int theoryDone = 0;
    int practiceDone = 0;
    int theoryTotal = 0;
    int practiceTotal = 0;

    for (final e in items) {
      final t = (e['type'] ?? 'theory').toString();
      final isDone = e['status'] == 'done';
      if (t == 'practice') {
        practiceTotal++;
        if (isDone) practiceDone++;
      } else {
        theoryTotal++;
        if (isDone) theoryDone++;
      }
      if (isDone) done++;
    }

    await docRef.set({
      'items': items,
      'progress': {
        'done': done,
        'total': total,
        'theoryDone': theoryDone,
        'practiceDone': practiceDone,
        'theoryTotal': theoryTotal,
        'practiceTotal': practiceTotal,
      },
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<Map<String, Map<String, int>>> getLessonsLearnedPerRoadmap() async {
    final user = _auth.currentUser;
    if (user == null) return {};

    final snap = await _db
        .collection('users')
        .doc(user.uid)
        .collection('roadmaps')
        .get();

    final Map<String, Map<String, int>> result = {};

    for (final doc in snap.docs) {
      final roadmapId = doc.id;
      final data = doc.data();

      final progress = data['progress'];
      if (progress is Map) {
        final doneVal = progress['done'];
        final theoryDoneVal = progress['theoryDone'];
        final practiceDoneVal = progress['practiceDone'];

        int done = 0, theoryDone = 0, practiceDone = 0;
        if (doneVal is int) {
          done = doneVal;
        } else if (doneVal is num)
          // ignore: curly_braces_in_flow_control_structures
          done = doneVal.toInt();

        if (theoryDoneVal is int) {
          theoryDone = theoryDoneVal;
        } else if (theoryDoneVal is num)
          // ignore: curly_braces_in_flow_control_structures
          theoryDone = theoryDoneVal.toInt();

        if (practiceDoneVal is int) {
          practiceDone = practiceDoneVal;
        } else if (practiceDoneVal is num)
          // ignore: curly_braces_in_flow_control_structures
          practiceDone = practiceDoneVal.toInt();

        result[roadmapId] = {
          'done': done,
          'theoryDone': theoryDone,
          'practiceDone': practiceDone,
        };
      } else {
        result[roadmapId] = {'done': 0, 'theoryDone': 0, 'practiceDone': 0};
      }
    }

    return result;
  }

  /// Tính tổng 'done' trên tất cả roadmap
  Future<Map<String, int>> getTotalLessonsLearned() async {
    final perRoadmap = await getLessonsLearnedPerRoadmap();
    var total = 0;
    var theory = 0;
    var practice = 0;
    for (final v in perRoadmap.values) {
      total += v['done'] ?? 0;
      theory += v['theoryDone'] ?? 0;
      practice += v['practiceDone'] ?? 0;
    }
    return {'total': total,'theoryDone': theory, 'practiceDone': practice};
  }

}
