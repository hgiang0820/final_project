import 'package:final_project/screens/authentication/forgot_password.dart';
import 'package:final_project/screens/authentication/signup.dart';
import 'package:final_project/screens/main_navigation.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/widgets/app_button.dart';
import 'package:final_project/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => _SigninState();
}

class _SigninState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // BasicAppBar(),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/cat_bottom_right.png',
              height: 250,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signinText(),
                  SizedBox(height: 40),
                  TextfieldWidget(
                    textHint: "Nhập email...",
                    controller: _email,
                  ),
                  SizedBox(height: 20),
                  TextfieldWidget(
                    textHint: "Nhập password...",
                    controller: _password,
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                  _forgotPassword(context),
                  SizedBox(height: 25),
                  AppButton(
                    onPressed: () {
                      signIn();
                    },
                    title: 'Đăng nhập',
                  ),
                  _signupText(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Đăng nhập',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      textAlign: TextAlign.center,
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bạn chưa có tài khoản?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text('Đăng kí ngay!'),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ForgotPasswordPage(),
              ),
            );
          },
          child: const Text('Quên mật khẩu?'),
        ),
      ],
    );
  }

  void signIn() async {
    try {
      final user = await authService.value.signIn(
        email: _email.text,
        password: _password.text,
      );
      if (user != null) {
        final profile = await authService.value.getUserProfile(user.uid);
        print("Xin chào ${profile?['fullName']}");
      }
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainNavigationPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'This is not working';
      });
    }
  }
}
