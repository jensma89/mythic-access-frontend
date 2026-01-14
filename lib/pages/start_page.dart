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
              const SizedBox(height: 24),
              AppButton(
                text: 'Campaigns',
                onPressed: () {
                  print('Campaign button pressed.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
