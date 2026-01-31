// short_menu_card.dart
import 'package:flutter/material.dart';
import 'button.dart';

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

  // Focus nodes for keyboard/screenreader navigation
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final FocusNode _firstButtonFocus = FocusNode();

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
      _requestFocus();
    }
  }

  void _requestFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.isOpen) {
        _firstButtonFocus.requestFocus();
      }
    });
  }

  @override
  void didUpdateWidget(covariant ShortMenuCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _controller.forward();
      _requestFocus();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusScopeNode.dispose();
    _firstButtonFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;

    // Responsive sizing
    final isSmallScreen = screenWidth < 400;
    final isMediumScreen = screenWidth >= 400 && screenWidth < 600;

    // Responsive padding
    final horizontalPadding = isSmallScreen ? 8.0 : 16.0;
    final contentPadding = isSmallScreen ? 12.0 : 16.0;
    final rowSpacing = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);

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
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 720, // Desktop / Web friendly
                    maxHeight: cardHeight,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _primaryButtonColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _secondaryButtonColor.withAlpha(100),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        // Header (optional but recommended)
                        _Header(onClose: widget.onClose),

                        const Divider(height: 1),

                        // Content area
                        Flexible(
                          child: FocusScope(
                            node: _focusScopeNode,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: contentPadding + 8,
                                  vertical: contentPadding + 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text size settings
                                    _SettingsRow(
                                      title: 'Text Size',
                                      value: '16',
                                      semanticsLabel: 'Current text size: 16',
                                      decreaseLabel: 'Decrease text size',
                                      increaseLabel: 'Increase text size',
                                      onDecrease: () {}, // TODO
                                      onIncrease: () {}, // TODO
                                      firstFocusNode: _firstButtonFocus,
                                    ),

                                    SizedBox(height: rowSpacing + 8),

                                    // Contrast settings
                                    _SettingsRow(
                                      title: 'Contrast',
                                      value: '50',
                                      semanticsLabel: 'Current contrast: 50',
                                      decreaseLabel: 'Decrease contrast',
                                      increaseLabel: 'Increase contrast',
                                      onDecrease: () {}, // TODO
                                      onIncrease: () {}, // TODO
                                    ),

                                    SizedBox(height: rowSpacing + 8),

                                    // Color settings
                                    _SettingsRow(
                                      title: 'Color',
                                      value: '1',
                                      semanticsLabel: 'Current color scheme: 1',
                                      decreaseLabel: 'Previous color scheme',
                                      increaseLabel: 'Next color scheme',
                                      onDecrease: () {}, // TODO
                                      onIncrease: () {}, // TODO
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

// Button colors matching PrimaryButton and SecondaryButton
const Color _primaryButtonColor = Color.fromRGBO(9, 72, 72, 1.0);
const Color _secondaryButtonColor = Color.fromRGBO(46, 29, 82, 1.0);

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.title,
    required this.value,
    required this.semanticsLabel,
    required this.decreaseLabel,
    required this.increaseLabel,
    required this.onDecrease,
    required this.onIncrease,
    this.firstFocusNode,
  });

  final String title;
  final String value;
  final String semanticsLabel;
  final String decreaseLabel;
  final String increaseLabel;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final FocusNode? firstFocusNode;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing
    final isSmallScreen = screenWidth < 400;
    final isMediumScreen = screenWidth >= 400 && screenWidth < 600;

    final buttonSize = isSmallScreen ? 60.0 : (isMediumScreen ? 70.0 : 80.0);
    final boxWidth = isSmallScreen ? 70.0 : (isMediumScreen ? 90.0 : 110.0);
    final boxHeight = isSmallScreen ? 44.0 : (isMediumScreen ? 50.0 : 56.0);
    final spacing = isSmallScreen ? 16.0 : (isMediumScreen ? 22.0 : 28.0);

    // Border color same as container
    final borderColor = Theme.of(context).colorScheme.outline.withAlpha(80);

    // Title font size (5px larger than titleMedium default)
    final baseTitleSize = Theme.of(context).textTheme.titleMedium?.fontSize ?? 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title - closer to the container, 5px larger
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: baseTitleSize + 5,
          ),
        ),

        const SizedBox(height: 4),

        // Controls row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Minus button (purple/secondary color)
            TriangleButton(
              label: '-',
              semanticsLabel: decreaseLabel,
              onPressed: onDecrease,
              color: _secondaryButtonColor,
              borderColor: borderColor,
              direction: TriangleDirection.left,
              size: buttonSize,
              focusNode: firstFocusNode,
            ),

            SizedBox(width: spacing),

            // Value container
            Container(
              width: boxWidth,
              height: boxHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: borderColor,
                  width: 1.5,
                ),
                color: Theme.of(context).colorScheme.surface.withAlpha(60),
              ),
              child: Semantics(
                label: semanticsLabel,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(width: spacing),

            // Plus button (teal/primary color)
            TriangleButton(
              label: '+',
              semanticsLabel: increaseLabel,
              onPressed: onIncrease,
              color: _primaryButtonColor,
              borderColor: borderColor,
              direction: TriangleDirection.right,
              size: buttonSize,
            ),
          ],
        ),
      ],
    );
  }
}
