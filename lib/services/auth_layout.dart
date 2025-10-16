import 'package:final_project/screens/authentication/signin.dart';
import 'package:final_project/screens/main_screens/settings.dart';
import 'package:final_project/screens/splash.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = SigninPage();
            } else if (snapshot.hasData) {
              widget = const SettingsPage();
            } else {
              widget = pageIfNotConnected ?? const SplashPage();
            }
            return widget;
          },
        );
      },
    );
  }
}
