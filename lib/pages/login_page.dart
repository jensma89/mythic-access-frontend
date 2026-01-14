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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/start');
                },
              ),

              SecondaryButton(
                text: 'Quit test',
                onPressed: () {
                  print('Quit test button pressed.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
