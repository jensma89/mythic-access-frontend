//main.dart
import 'package:flutter/material.dart';
import 'theme/dark_theme.dart';
import 'pages/login_page.dart';
import 'pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mythic-Access-DnD',
      theme: darkTheme,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/start": (context) => const StartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
