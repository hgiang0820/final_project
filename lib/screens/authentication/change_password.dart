import 'package:final_project/screens/main_screens/settings.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/widgets/app_button.dart';
import 'package:final_project/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
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
                builder: (BuildContext context) => SettingsPage(),
              ),
            ); // Back to SigninPage
          },
        ),
        // title: const Text('Forgot Password'),
        // centerTitle: true,
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
                          'Change Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/change_password.png',
                          height: 70,
                        ),
                        const SizedBox(height: 40),
                        TextfieldWidget(
                          textHint: "Enter email...",
                          controller: _email,
                        ),
                        const SizedBox(height: 20),
                        TextfieldWidget(
                          textHint: "Enter current password...",
                          controller: _currentPassword,
                        ),
                        const SizedBox(height: 20),
                        TextfieldWidget(
                          textHint: "Enter new password...",
                          controller: _newPassword,
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
                  changePassword();
                },
                title: 'Reset password',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() async {
    try {
      await authService.value.resetPasswordFromCurrentPassword(
        currentPassword: _currentPassword.text,
        newPassword: _newPassword.text,
        email: _email.text,
      );
      showSnackBarSuccess();
      setState(() {
        errorMessage = '';
      });
      _redirect();
    } on FirebaseAuthException catch (e) {
      showSnackBarFailure();
      setState(() {
        errorMessage = e.message ?? 'This is not working';
      });
    }
  }

  void showSnackBarSuccess() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Changed password succesfully!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showSnackBarFailure() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Changed password unsuccessfully!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => SettingsPage()),
    );
  }
}
