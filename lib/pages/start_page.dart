// start_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/components/adaptive_scaffold.dart';
import 'package:mythic_access_frontend/components/button.dart';
import '../components/app_dark_background.dart';
import '../components/nav_bar.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: AdaptiveScaffold(
        activeItem: NavItem.home,
        homeRedirect: false,
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

              // Put the buttons in the middle
              const Spacer(),

              // Button block
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campaigns button >> campaigns page
                  AppButton(
                    text: 'Campaigns',
                    semanticsLabel: 'Go to your campaigns.',
                    icon: Icons.wallpaper,
                    onPressed: () {
                      print('Campaign button pressed.');
                    },
                  ),

                  const SizedBox(height: 15),

                  // My Profile button >> user me page
                  AppButton(
                    text: 'My Profile',
                    semanticsLabel: 'My profile.',
                    icon: Icons.account_circle,
                    onPressed: () {
                      print('My My profile button pressed.');
                    },
                  ),

                  const SizedBox(height: 15),

                  // Settings button >> go to settings menu
                  AppButton(
                    text: 'Settings',
                    semanticsLabel: 'Settings.',
                    icon: Icons.settings,
                    onPressed: () {
                      print('Settings button pressed.');
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
