// profile_detail_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/core/components/adaptive_scaffold.dart';
import '../../../core/components/button.dart';
import '../../../core/components/entity_card.dart';
import '../../../core/components/app_dark_background.dart';

// Class for profile page (user/me)
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Later for API Data
  String username = 'MythicUser';
  String email = 'user@mythic-access.com';
  String role = 'Adventurer';

  // Content (user me data) in entity cards
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
                              'My Profile',
                              style: Theme.of(context).textTheme.headlineLarge,
                              semanticsLabel: 'Your profile page',
                            ),
                            const SizedBox(width: 12),
                            ExcludeSemantics(
                              child: Icon(Icons.person, size: 36),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Entity cards (modular)
                    // Username card
                    EntityCard(
                      title: 'Username',
                      content: [
                        Text(
                          username,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 12),

                    // E-Mail Address card
                    EntityCard(
                      title: 'E-Mail Address',
                      content: [
                        Text(
                          email,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 12),

                    // Role card
                    EntityCard(
                      title: 'Role',
                      content: [
                        Text(
                          role,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                      footer: const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 12),

                    // Buttons area
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Edit profile button
                        AppButton(
                          text: 'Edit Profile',
                          semanticsLabel: 'Edit your profile',
                          icon: Icons.edit,
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile_update');
                          },
                        ),
                        const SizedBox(height: 12),

                        // Delete profile button
                        SecondaryButton(
                          text: 'Delete Profile',
                          semanticsLabel: 'Delete your profile',
                          icon: Icons.delete_forever_outlined,
                          onPressed: () {
                            // TODO: open confirm deletion dialog
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
