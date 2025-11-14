import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/home_screens/home_content.dart';
import 'package:final_project/widgets/onboarding_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:final_project/screens/input_test/selection_page.dart';
// import 'package:final_project/widgets/icon_and_button.dart';

// ----- HOME PAGE (kiểm tra user doc) -----
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<bool> _userHasAnyDataAcrossCollectionsConcurrent() async {
    final user = _auth.currentUser;
    if (user == null) return false;
    final uid = user.uid;
    final firestore = FirebaseFirestore.instance;

    final collectionsToCheck = <String>[
      // 'users',
      'input_test_results',
      'practice_results',
      'practice_test_results',
      'roadmaps',
      'vocab_practice_results',
    ];

    final futures = <Future<bool>>[
      for (final col in collectionsToCheck)
        firestore
            .collection('users')
            .doc(uid)
            .collection(col)
            .limit(1)
            .get()
            .then((s) => s.docs.isNotEmpty)
            .catchError((_) => false),
    ];

    final results = await Future.wait(futures);
    return results.any((r) => r);
  }

  Future<bool> _userDocExists() async {
    return await _userHasAnyDataAcrossCollectionsConcurrent();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _userDocExists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final exists = snapshot.data ?? false;
        // print(exists);
        if (!exists) {
          // Chưa có user doc => hiển thị onboarding slider
          return OnboardingWrapper(onFinish: _onOnboardingFinished);
        } else {
          // Đã có doc => hiển thị home chính
          return HomeContent();
        }
      },
    );
  }

  // Khi user hoàn tất onboarding, tạo user document (hoặc cập nhật)
  Future<void> _onOnboardingFinished() async {
    final user = _auth.currentUser;
    if (user == null) {
      // bạn có thể điều hướng tới màn sign in ở đây nếu muốn
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vui lòng đăng nhập trước')));
      return;
    }

    final docRef = _firestore.collection('users').doc(user.uid);
    await docRef.set({
      'displayName': user.displayName ?? '',
      'createdAt': FieldValue.serverTimestamp(),
      'onboarded': true,
      // thêm các trường mặc định bạn cần
    }, SetOptions(merge: true));

    // Sau khi tạo doc, rebuild lại để hiện HomeContent
    setState(() {});
  }
}

// import 'package:final_project/screens/input_test/selection_page.dart';
// import 'package:final_project/widgets/icon_and_button.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'HOME',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.purple[50],
//         elevation: 1,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Input Test',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[800],
//               ),
//             ),
//             IconAndButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => SelectionPage()),
//                 );
//               },
//               title: "Test",
//               icon: Icon(Icons.scoreboard),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
