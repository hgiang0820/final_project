import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/screens/main_navigation.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/widgets/app_button.dart';
import 'package:final_project/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BasicAppBar(),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Image.asset('assets/images/cat_1.png', height: 300),
          // ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signupText(),
                  SizedBox(height: 40),
                  TextfieldWidget(
                    // fullName
                    textHint: "Enter full name...",
                    controller: _fullName,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    // fullName
                    textHint: "Enter phone...",
                    controller: _phoneNumber,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    // email
                    textHint: "Enter email...",
                    controller: _email,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    // password
                    textHint: "Enter password...",
                    controller: _password,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    // password
                    textHint: "Confirm password...",
                    controller: _confirmPassword,
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                  SizedBox(height: 40),
                  AppButton(
                    onPressed: () {
                      signUp();
                    },
                    title: 'Sign Up',
                  ),
                  _signinText(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      textAlign: TextAlign.center,
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have an account?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SigninPage(),
                ),
              );
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  void signUp() async {
    if (_password.text != _confirmPassword.text) {
      setState(() {
        errorMessage = "Password and Confirm Password do not match.";
      });
      return;
    }

    try {
      final user = await authService.value.createAccount(
        email: _email.text.trim(),
        password: _password.text.trim(),
        fullName: _fullName.text.trim(),
        phoneNumber: _phoneNumber.text.trim(),
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MainNavigationPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Auth error';
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }
}
