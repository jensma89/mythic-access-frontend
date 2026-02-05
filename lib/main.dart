//main.dart
import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/features/campaigns/ui/campaign_list_page.dart';
import 'features/profiles/ui/profile_update_page.dart';
import 'core/theme/dark_theme.dart';
import 'features/auth/ui/login_page.dart';
import 'features/home/ui/start_page.dart';
import 'features/auth/ui/signup_page.dart';
import 'features/profiles/ui/profile_detail_page.dart';

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
        "/signup": (context) => const SignupPage(),
        "/profile": (context) => const ProfilePage(),
        "/profile_update": (context) => const ProfileUpdatePage(),
        "/campaigns_list": (context) => const ListCampaignsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
