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

  const AdaptiveNavBar({
    super.key,
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
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

  const AdaptiveBottomNavBar({
    super.key,
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
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
    );
  }
}

// Top navigation bar (desktop/web)
class _TopNavBar extends StatelessWidget {
  final NavItem? activeItem;
  final VoidCallback onBack;
  final VoidCallback onHome;
  final VoidCallback onToggleCard;

  const _TopNavBar({
    required this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Mythic Access'),
      actions: [
        _NavButton(
          icon: Icons.arrow_back,
          label: 'Back',
          semanticsLabel: 'Navigate back',
          onPressed: onBack,
          showLabel: true,
        ),
        _NavButton(
          icon: Icons.home,
          label: 'Home',
          semanticsLabel: 'Go to home screen',
          onPressed: onHome,
          showLabel: true,
        ),
        // Navigation button to show/hide the settings card
        _NavButton(
          icon: Icons.style,
          label: 'Card',
          semanticsLabel: 'Show or hide short setting card',
          onPressed: onToggleCard,
          showLabel: true,
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

  const _BottomNavBar({
    this.activeItem,
    required this.onBack,
    required this.onHome,
    required this.onToggleCard,
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
              semanticsLabel: 'Show or hide short setting card',
              onPressed: onToggleCard,
              active: activeItem == NavItem.cardToggle,
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
                Icon(icon, color: color, size: 28),
                if (showLabel) ...[const SizedBox(width: 8), Text(label)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
