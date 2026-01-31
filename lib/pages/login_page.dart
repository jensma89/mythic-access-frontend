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
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label: 'Username or email address:',
                  semanticsLabel: 'Username or email address.',
                  placeholder: 'John20 or john@example.com ...',
                  valueType: ValueType.usernameOrEmail,
                ),

                const SizedBox(height: 5),

                Text(
                  label: 'Password:',
                  semanticsLabel: 'Your password.',
                  placeholder: 'Enter your password...',
                  valueType: ValueType.password,
                ),

                const SizedBox(height: 50),

                PrimaryButton(
                  text: 'Login',
                  semanticsLabel: 'Login with your Account.',
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/start');
                  },
                ),

                const SizedBox(height: 10),

                PrimaryButton(
                  text: 'Signup',
                  semanticsLabel: 'Signup new account.',
                  icon: Icons.app_registration,
                  onPressed: () {
                    print('Signup button pressed.');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
