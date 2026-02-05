// start_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/core/components/adaptive_scaffold.dart';
import 'package:mythic_access_frontend/core/components/button.dart';
import '../../../core/components/app_dark_background.dart';
import '../../../core/components/nav_bar.dart';

// Class for the start (home) page
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: AdaptiveScaffold(
        activeItem: NavItem.home,
        homeRedirect: false,
        body: Stack(
          children: [
            Center(
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
                            'Home',
                            style: Theme.of(context).textTheme.headlineLarge,
                            semanticsLabel: 'Your home page',
                          ),
                          const SizedBox(width: 12),
                          ExcludeSemantics(child: Icon(Icons.home, size: 36)),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Button block
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Button for campaign page
                      AppButton(
                        text: 'Campaigns',
                        semanticsLabel: 'Go to your campaigns.',
                        icon: Icons.wallpaper,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 15),

                      // Profile button (user me)
                      AppButton(
                        text: 'My Profile',
                        semanticsLabel: 'My profile.',
                        icon: Icons.person,
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                      const SizedBox(height: 15),

                      // Button for settings page
                      AppButton(
                        text: 'Settings',
                        semanticsLabel: 'Settings.',
                        icon: Icons.settings,
                        onPressed: () {},
                      ),

                      const SizedBox(height: 34),

                      // Button for feedback page
                      AppButton(
                        text: 'Feedback',
                        semanticsLabel: 'Go to feedback page',
                        icon: Icons.feedback_outlined,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 10),

                      // Button for about/impressum page
                      AppButton(
                        text: 'About',
                        semanticsLabel: 'Go to about page',
                        icon: Icons.info_outlined,
                        onPressed: () {},
                      ),

                      // Button for logout
                      const SizedBox(height: 34),

                      SecondaryButton(
                        text: 'Logout',
                        semanticsLabel: 'Logout',
                        icon: Icons.power_settings_new,
                        onPressed: () {
                          // TODO: Logout current profile and go to login page
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
