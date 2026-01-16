// login_page.dart

import 'package:flutter/material.dart';
import '../components/app_dark_background.dart';
import '../components/button.dart';
import '../components/text_field.dart';

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
            children: [
              LabeledTextField(
                label: 'Username or email address:',
                placeholder: 'John20 or john@example.com ...',
                valueType: ValueType.email,
              ),
              PrimaryButton(
                text: 'Login',
                icon: Icons.login,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/start');
                },
              ),

              const SizedBox(height: 10),
              SecondaryButton(
                text: 'Signup',
                icon: Icons.app_registration,
                onPressed: () {
                  print('Signup button pressed.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
