// button.dart
import 'package:flutter/material.dart';
import 'dart:async';

// Helper widget to trigger buttons after delay
class DelayedPressWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Duration delay;

  const DelayedPressWrapper({
    super.key,
    required this.child,
    required this.onPressed,
    this.delay = const Duration(milliseconds: 200),
  });
  @override
  State<DelayedPressWrapper> createState() => _DelayedPressWrapperState();
}

class _DelayedPressWrapperState extends State<DelayedPressWrapper> {
  Timer? _timer;
  bool _pressed = false;
  bool _fired = false;

  void _fire() {
    if (_fired) return;
    _fired = true;
    widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      // Adjustments for trigger button delay
      onTapDown: (_) {
        _pressed = true;
        _fired = false;
        _timer = Timer(widget.delay, () {
          if (_pressed) _fire();
        });
      },
      onTapUp: (_) {
        _pressed = false;
        _timer?.cancel();
      },
      onTapCancel: () {
        _pressed = false;
        _timer?.cancel();
      },
      onLongPress: _fire,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// Class for the main button of the app e.g. settings or profile
class AppButton extends StatelessWidget {
  final String text;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.semanticsLabel,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      button: true,
      excludeSemantics: true,
      child: DelayedPressWrapper(
        onPressed: onPressed,
        child: ElevatedButton(
          onPressed: null,
          child: icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text),
                      ExcludeSemantics(child: Icon(icon, size: 30)),
                    ],
                  ),
                )
              : Text(text),
        ),
      ),
    );
  }
}

// Class for the primary button e.g. save or submit
class PrimaryButton extends StatelessWidget {
  final String text;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.semanticsLabel,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return Semantics(
      label: semanticsLabel,
      button: true,
      excludeSemantics: true,
      child: DelayedPressWrapper(
        onPressed: onPressed,
        child: ElevatedButton(
          onPressed: null,
          style: baseStyle?.copyWith(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromRGBO(9, 72, 72, 1.0),
            ),
          ),
          child: icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text),
                      ExcludeSemantics(child: Icon(icon, size: 30)),
                    ],
                  ),
                )
              : Text(text),
        ),
      ),
    );
  }
}

// Class for secondary button e.g. for delete or cancel
class SecondaryButton extends StatelessWidget {
  final String text;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.semanticsLabel,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return Semantics(
      label: semanticsLabel,
      button: true,
      excludeSemantics: true,
      child: DelayedPressWrapper(
        onPressed: onPressed,
        child: ElevatedButton(
          onPressed: null,
          style: baseStyle?.copyWith(
            backgroundColor: WidgetStateProperty.all(
              Color.fromRGBO(46, 29, 82, 1.0),
            ),
          ),
          child: icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text),
                      ExcludeSemantics(child: Icon(icon, size: 30)),
                    ],
                  ),
                )
              : Text(text),
        ),
      ),
    );
  }
}
