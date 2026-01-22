// start_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/components/button.dart';
import '../components/app_dark_background.dart';
import '../components/nav_bar.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // Adaptive navigation bar for desktop/web
        appBar: AdaptiveNavBar(
          activeItem: NavItem.home,
          onBack: () => Navigator.of(context).maybePop(),
          onHome: () {},
          onToggleCard: () {
            print('Toggle card visibility');
          },
        ),

        // Adaptive navigation bar for mobile
        bottomNavigationBar: AdaptiveBottomNavBar(
          activeItem: NavItem.home,
          onBack: () => Navigator.of(context).maybePop(),
          onHome: () {},
          onToggleCard: () {
            print('Toggle card visibility');
          },
        ),

        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Mythic-Access-DnD',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 15),
              AppButton(
                text: 'Campaigns',
                semanticsLabel: 'Go to your campaigns.',
                icon: Icons.wallpaper,
                onPressed: () {
                  print('Campaign button pressed.');
                },
              ),
              const SizedBox(height: 15),
              AppButton(
                text: 'My Profile',
                semanticsLabel: 'My profile.',
                icon: Icons.account_circle,
                onPressed: () {
                  print('My My profile button pressed.');
                },
              ),
              const SizedBox(height: 15),
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
        ),
      ),
    );
  }
}
