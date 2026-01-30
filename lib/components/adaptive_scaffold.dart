// adaptive_scaffold.dart
import 'package:flutter/material.dart';
import 'nav_bar.dart';

// Helper class for easier calls of navigation bar
class AdaptiveScaffold extends StatelessWidget {
  final Widget body;
  final NavItem? activeItem;
  final bool homeRedirect; // If true, home button redirect to start page
  final VoidCallback? onHome; // Optional override for home button
  final VoidCallback? onBack;
  final VoidCallback? onToggleCard;
  final bool isCardOpen;
  final Color backgroundColor;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    required this.activeItem,
    this.homeRedirect = false,
    this.onHome,
    this.onBack,
    this.onToggleCard,
    this.isCardOpen = false,
    this.backgroundColor = Colors.transparent,
  });
  void _handleHome(BuildContext context) {
    if (onHome != null) {
      onHome!();
      return;
    }

    if (homeRedirect) {
      Navigator.of(context).pushNamedAndRemoveUntil('/start', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // Desktop / Web
      appBar: AdaptiveNavBar(
        activeItem: activeItem,
        onBack: onBack ?? () => Navigator.of(context).maybePop(),
        onHome: () => _handleHome(context),
        onToggleCard: onToggleCard ?? () {},
        isCardOpen: isCardOpen,
      ),

      // Mobile
      bottomNavigationBar: AdaptiveBottomNavBar(
        activeItem: activeItem,
        onBack: onBack ?? () => Navigator.of(context).maybePop(),
        onHome: () => _handleHome(context),
        onToggleCard: onToggleCard ?? () {},
        isCardOpen: isCardOpen,
      ),
      body: body,
    );
  }
}
