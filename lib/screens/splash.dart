import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/screens/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirectBasedOnAuth();
  }

  Future<void> _redirectBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 5)); // thời gian splash

    User? user = FirebaseAuth.instance.currentUser;

    if (mounted) {
      if (user != null) {
        // Đã đăng nhập
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationPage()),
        );
      } else {
        // Chưa đăng nhập
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SigninPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/cat_background.png',
              fit: BoxFit.cover,
            ),
          ),
          const Center(child: CircularProgressIndicator(color: Colors.white)),
        ],
      ),
    );
  }
}
