// nav_bar.dart
import 'package:flutter/material.dart';
import 'button.dart';

enum NavItem { back, home, cardToggle }

// Class for a adaptive navigation bar, change size by different devices
class AdaptiveNavBar extends StatelessWidget implements PreferredSizeWidget {
  final NavItem? activeItem;
  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onToggleCard;
  final bool isCardOpen;

  const AdaptiveNavBar({
    super.key,
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
    this.isCardOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    if (isMobile) {
      return const SizedBox.shrink();
    }
    return _TopNavBar(
      activeItem: activeItem,
      onBack: onBack,
      onHome: onHome,
      onToggleCard: onToggleCard,
      isCardOpen: isCardOpen,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Bottom navigation bar (mobile)
class AdaptiveBottomNavBar extends StatelessWidget {
  final NavItem? activeItem;
  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onToggleCard;
  final bool isCardOpen;

  const AdaptiveBottomNavBar({
    super.key,
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
    this.isCardOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    if (!isMobile) {
      return const SizedBox.shrink();
    }
    return _BottomNavBar(
      activeItem: activeItem,
      onBack: onBack,
      onHome: onHome,
      onToggleCard: onToggleCard,
      isCardOpen: isCardOpen,
    );
  }
}

// Top navigation bar (desktop/web)
class _TopNavBar extends StatelessWidget {
  final NavItem? activeItem;
  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onToggleCard;
  final bool isCardOpen;

  const _TopNavBar({
    required this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
    required this.isCardOpen,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Mythic Access', semanticsLabel: 'Mythic Access'),
      actions: [
        // Back button
        _NavButton(
          icon: Icons.arrow_back,
          label: 'Back',
          semanticsLabel: 'Navigate back',
          onPressed: onBack,
          showLabel: true,
        ),

        // Button for start page
        _NavButton(
          icon: Icons.home,
          label: 'Home',
          semanticsLabel: 'Go to home screen',
          onPressed: onHome,
          showLabel: true,
        ),

        // Navigation button settings
        _NavButton(
          icon: Icons.settings,
          label: 'Settings',
          semanticsLabel: 'Settings',
          onPressed: onToggleCard,
          showLabel: true,
          active: isCardOpen,
        ),
      ],
    );
  }
}

// Class for the bottom navigation bar (mobile)
class _BottomNavBar extends StatelessWidget {
  final NavItem? activeItem;
  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onToggleCard;
  final bool isCardOpen;

  const _BottomNavBar({
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
    required this.isCardOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: 'Main navigation',
      child: BottomAppBar(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavButton(
              icon: Icons.arrow_back,
              label: 'Back',
              semanticsLabel: 'Navigate back',
              onPressed: onBack,
              active: activeItem == NavItem.back,
            ),
            _NavButton(
              icon: Icons.home,
              label: 'Home',
              semanticsLabel: 'Go to home screen',
              onPressed: onHome,
              active: activeItem == NavItem.home,
            ),
            _NavButton(
              icon: Icons.style,
              label: 'Card',
              semanticsLabel: 'Show or hide quick settings menu',
              onPressed: onToggleCard,
              active: isCardOpen,
            ),
          ],
        ),
      ),
    );
  }
}

// Shared navigation button with delay and semantics
class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final bool active;
  final bool showLabel;

  const _NavButton({
    required this.icon,
    required this.label,
    required this.semanticsLabel,
    required this.onPressed,
    this.active = false,
    this.showLabel = false,
  });
  @override
  Widget build(BuildContext context) {
    final color = active
        ? Theme.of(context).colorScheme.secondary
        : Colors.white70;

    return Semantics(
      button: true,
      label: semanticsLabel,
      child: DelayedPressWrapper(
        onPressed: onPressed,
        child: Tooltip(
          message: label,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(1),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  child: Icon(icon, color: color, size: 38),
                ),
                if (showLabel) ...[const SizedBox(width: 8), Text(label)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
