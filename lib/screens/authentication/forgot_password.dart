import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/widgets/app_button.dart';
import 'package:final_project/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final TextEditingController _email = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SigninPage(),
              ),
            ); // Back to SigninPage
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Khôi phục mật khẩu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/lock_and_key.png',
                          height: 70,
                        ),
                        const SizedBox(height: 40),
                        TextfieldWidget(
                          textHint: "Nhập email...",
                          controller: _email,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppButton(
                onPressed: () {
                  resetPassword();
                },
                title: 'Khôi phục mật khẩu',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword() async {
    try {
      await authService.value.resetPassword(email: _email.text);
      showSnackBar();
      setState(() {
        errorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'This is not working';
      });
    }
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Vui lòng kiểm tra email của bạn!',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
