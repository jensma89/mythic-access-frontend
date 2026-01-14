// start_page.dart

import 'package:flutter/material.dart';
import '../components/app_dark_background.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text('Mythic-Access-DnD')),
        body: Center(
          child: Text(
            'Welcome to Mythic-Access-DnD',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
