import 'package:flutter/material.dart';

class AppDarkBackground extends StatelessWidget {
  final Widget child;

  const AppDarkBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/backgrounds/background_mythic.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withAlpha(100), // Dark overlay for contrast
        child: child,
      ),
    );
  }
}
