// start_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/components/button.dart';
import '../components/app_dark_background.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyActions: true,
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
                  print('My Account button pressed.');
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
