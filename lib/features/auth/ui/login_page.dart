// login_page.dart

import 'package:flutter/material.dart';
import '../../../core/components/app_dark_background.dart';
import '../../../core/components/button.dart';
import '../../../core/components/text_field.dart';

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
                // Text field for username or email address
                CustomTextField(
                  label: 'Username or email address',
                  semanticsLabel: 'Username or email address',
                  placeholder: 'User123 or user@example.com ...',
                  valueType: ValueType.usernameOrEmail,
                ),

                const SizedBox(height: 5),

                CustomTextField(
                  label: 'Password',
                  semanticsLabel: 'Your password',
                  placeholder: '',
                  valueType: ValueType.password,
                ),

                const SizedBox(height: 50),

                // Login button
                PrimaryButton(
                  text: 'Login',
                  semanticsLabel: 'Login with your account',
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/start');
                  },
                ),

                const SizedBox(height: 24),

                // Signup button
                PrimaryButton(
                  text: 'Signup',
                  semanticsLabel: 'Signup new account',
                  icon: Icons.create,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
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
