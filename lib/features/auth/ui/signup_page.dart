// signup_page.dart

import 'package:flutter/material.dart';
import '../../../core/components/app_dark_background.dart';
import '../../../core/components/button.dart';
import '../../../core/components/text_field.dart';

// Class for the signup page
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

// Step creation page with tracker function
class _SignupPageState extends State<SignupPage> {
  int _step = 0;
  String? _errorMessage;

  // Step forward
  void _nextStep() {
    if (_step < 2) {
      setState(() => _step++);
    }
  }

  // Step back
  void _prevStep() {
    if (_step > 0) {
      setState(() => _step--);
    }
  }

  // Build the signup page
  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title - top
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.person_add, size: 36),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Registration area (text boxes per step)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  children: [
                    // Prompt for e-mail address
                    if (_step == 0) ...[
                      CustomTextField(
                        label: 'E-Mail Address',
                        semanticsLabel: 'E-Mail address',
                        placeholder: 'user@example.com',
                        valueType: ValueType.email,
                      ),

                      const SizedBox(height: 8),

                      // Confirm e-mail address
                      CustomTextField(
                        label: 'Confirm E-Mail',
                        semanticsLabel: 'Confirm e-mail address',
                        placeholder: 'user@example.com',
                        valueType: ValueType.email,
                      ),
                    ],

                    // Prompt for user password
                    if (_step == 1) ...[
                      CustomTextField(
                        label: 'Password',
                        semanticsLabel: 'Password',
                        placeholder: '',
                        valueType: ValueType.password,
                      ),
                      const SizedBox(height: 8),

                      // Confirm password
                      CustomTextField(
                        label: 'Confirm Password',
                        semanticsLabel: 'Confirm password',
                        placeholder: '',
                        valueType: ValueType.password,
                      ),
                    ],

                    // Prompt for username
                    if (_step == 2) ...[
                      CustomTextField(
                        label: 'Username',
                        semanticsLabel: 'Username',
                        placeholder: 'User123',
                        valueType: ValueType.usernameOrEmail,
                      ),
                    ],

                    const SizedBox(height: 16),

                    // Error / info container
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _errorMessage != null
                          ? Container(
                              key: ValueKey(_errorMessage),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.withAlpha(15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                _errorMessage!,
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_step > 0)
                    SecondaryButton(
                      text: 'Back',
                      semanticsLabel: 'Navigate back',
                      onPressed: _prevStep,
                      icon: Icons.arrow_back,
                    ),

                  const SizedBox(width: 12),

                  PrimaryButton(
                    text: _step == 2 ? 'Create Account' : 'Next',
                    icon: _step == 2 ? Icons.check : Icons.arrow_forward,
                    semanticsLabel: _step == 2 ? 'Create account' : 'Next step',
                    onPressed: () {
                      if (_step == 2) {
                        print('Create Account');
                      } else {
                        _nextStep();
                      }
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
