// signup_page.dart

import 'package:flutter/material.dart';
import '../components/app_dark_background.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                // Username text field
                CustomTextField(
                  label: 'Username',
                  semanticsLabel: 'Username',
                  placeholder: 'User123...',
                  valueType: ValueType.usernameOrEmail,
                ),

                const SizedBox(height: 5),

                // E-mail address text field
                CustomTextField(
                  label: 'E-Mail address',
                  semanticsLabel: 'Your email address...',
                  placeholder: 'user@test.com...',
                  valueType: ValueType.email,
                ),

                const SizedBox(height: 5),

                // Password text field
                CustomTextField(
                  label: 'Password',
                  semanticsLabel: 'Password',
                  placeholder: '',
                  valueType: ValueType.password,
                ),

                const SizedBox(height: 5),

                // Confirm password text field
                CustomTextField(
                  label: 'Confirm password',
                  semanticsLabel: 'Confirm your password.',
                  placeholder: '',
                  valueType: ValueType.password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
