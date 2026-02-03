// profile_detail_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/core/components/adaptive_scaffold.dart';
import '../../../core/components/button.dart';
import '../../../core/components/entity_card.dart';
import '../../../core/components/nav_bar.dart';
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

  // Content (user me data) in entity card
  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: AdaptiveScaffold(
        activeItem: null,
        homeRedirect: true,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ), // For Web / Desktop
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: EntityCard(
                  title: 'My Profile',
                  content: [
                    _buildProfileRow(context, 'Username', username),
                    const SizedBox(height: 12),
                    _buildProfileRow(context, 'E-Mail', email),
                    const SizedBox(height: 12),
                    _buildProfileRow(context, 'Role', role),
                  ],
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Buttons ...
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Content builder function
Widget _buildProfileRow(BuildContext context, String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 120, // Better alignment on Web / Desktop
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ),
    ],
  );
}
