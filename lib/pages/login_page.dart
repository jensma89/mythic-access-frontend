// login_page.dart

import 'package:flutter/material.dart';
import '../components/app_dark_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/start');
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
