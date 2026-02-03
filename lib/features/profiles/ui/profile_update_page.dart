// profile_update_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/core/components/adaptive_scaffold.dart';
import 'package:mythic_access_frontend/core/components/text_field.dart';
import '../../../core/components/button.dart';
import '../../../core/components/entity_card.dart';
import '../../../core/components/app_dark_background.dart';

// Class for update profile page
class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  // Later for API Data
  String username = 'MythicUser';
  String email = 'user@mythic-access.com';
  String role = 'Adventurer';

  // Update user data content
  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: AdaptiveScaffold(
        activeItem: null,
        homeRedirect: true,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900, // For Web / Desktop
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title - top
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Edit Profile',
                              style: Theme.of(context).textTheme.headlineLarge,
                              semanticsLabel: 'Edit your profile page',
                            ),
                            const SizedBox(width: 12),
                            ExcludeSemantics(
                              child: Icon(
                                Icons.change_circle_outlined,
                                size: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Entity card Update user profile
                    // Update username card
                    EntityCard(
                      title: 'Username',
                      content: [
                        Column(
                          children: [
                            CustomTextField(
                              label: username,
                              semanticsLabel: 'Username: $username',
                              placeholder: 'New username...',
                              valueType: ValueType.usernameOrEmail,
                            ),
                          ],
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 14),

                    // Update e-mail card
                    EntityCard(
                      title: 'E-Mail',
                      content: [
                        Column(
                          children: [
                            CustomTextField(
                              label: email,
                              semanticsLabel: 'E-Mail: $email',
                              placeholder: 'New e-mail address...',
                              valueType: ValueType.email,
                            ),
                          ],
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 14),

                    // Update role card
                    EntityCard(
                      title: 'Role',
                      content: [
                        Column(
                          children: [
                            CustomTextField(
                              label: role,
                              semanticsLabel: 'role: $role',
                              placeholder: 'New role...',
                              valueType: ValueType.string,
                            ),
                          ],
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 14),

                    // Buttons area
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Edit profile button
                        PrimaryButton(
                          text: 'Save Profile',
                          semanticsLabel: 'Save your profile changes',
                          icon: Icons.save_alt_outlined,
                          onPressed: () {
                            // TODO: add changes saved dialog and save data + redirect
                          },
                        ),
                        const SizedBox(height: 12),

                        // Cancel and redirect to profile page button
                        SecondaryButton(
                          text: 'Cancel',
                          semanticsLabel: 'Cancel and go back to your profile',
                          icon: Icons.cancel_outlined,
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
