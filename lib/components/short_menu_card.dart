// short_menu_card.dart
import 'package:flutter/material.dart';

// Class for the short menu widget (fast settings for accessibility)
class ShortMenuCard extends StatefulWidget {
  const ShortMenuCard({
    super.key,
    required this.isOpen,
    required this.child,
    this.onClose,
  });

  // Controls the card is visible
  final bool isOpen;

  // Content of the card (buttons ect...)
  final Widget child;

  // Optional close callback
  final VoidCallback? onClose;

  @override
  State<ShortMenuCard> createState() => _ShortMenuCardState();
}

class _ShortMenuCardState extends State<ShortMenuCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, -0.15), // from slightly above
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    if (widget.isOpen) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant ShortMenuCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.isOpen ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    // 50 % height with sensible caps
    final double cardHeight = (media.size.height * 0.5).clamp(
      280.0,
      media.size.height * 0.75,
    );

    return IgnorePointer(
      ignoring: !widget.isOpen,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Align(
            alignment: Alignment.topCenter,
            child: Semantics(
              container: true,
              label: 'Quick settings menu',
              child: Padding(
                padding: EdgeInsets.only(
                  top: media.padding.top + 16,
                  left: 16,
                  right: 16,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 720, // Desktop / Web friendly
                    maxHeight: cardHeight,
                  ),
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        // Header (optional but recommended)
                        _Header(onClose: widget.onClose),

                        const Divider(height: 1),

                        // Content area
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: widget.child,

                            // buttons and textfields ?
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Semantics(
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text(
              'Quick Settings',
              semanticsLabel: 'Quick settings menu',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            if (onClose != null)
              IconButton(
                tooltip: 'Close settings',
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
          ],
        ),
      ),
    );
  }
}
