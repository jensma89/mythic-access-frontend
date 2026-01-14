// login_page.dart

import 'package:flutter/material.dart';
import '../components/app_dark_background.dart';
import '../components/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: PrimaryButton(
            text: 'Login',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/start');
            },
          ),
        ),
      ),
    );
  }
}
