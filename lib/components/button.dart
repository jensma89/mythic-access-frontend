// button.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';

// Default value for milliseconds by press a button
const Duration kDefaultButtonDelay = Duration(milliseconds: 200);

// Helper widget to trigger buttons after delay
class DelayedPressWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Duration delay;

  const DelayedPressWrapper({
    super.key,
    required this.child,
    required this.onPressed,
    this.delay = kDefaultButtonDelay,
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
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      // Adjustments for trigger button delay
      onTapDown: (details) {
        if (details.kind != PointerDeviceKind.touch) return;

        _pressed = true;
        _fired = false;

        // Mouse / Keyboard >> direct trigger
        if (details.kind == PointerDeviceKind.mouse) {
          _fire();
          return;
        }

        // Touch >> delay
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
          onPressed: onPressed,
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
          onPressed: onPressed,
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
          onPressed: onPressed,
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

// Collection do define the direction of the triangle as a parameter
enum TriangleDirection { top, down, left, right }

// Class to change the direction of the button
class TriangleClipper extends CustomClipper<Path> {
  final TriangleDirection direction;

  TriangleClipper(this.direction);

  @override
  Path getClip(Size size) {
    final path = Path();

    switch (direction) {
      case TriangleDirection.top:
        path
          ..moveTo(size.width / 2, 0)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height);
        break;

      case TriangleDirection.down:
        path
          ..moveTo(0, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width / 2, size.height);
        break;

      case TriangleDirection.left:
        path
          ..moveTo(0, size.height / 2)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height);
        break;

      case TriangleDirection.right:
        path
          ..moveTo(0, 0)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(0, size.height);
        break;
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Class to create a triangle button
class TriangleButton extends StatelessWidget {
  final String label;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final Color color;
  final TriangleDirection direction;
  final double size;

  const TriangleButton({
    super.key,
    required this.label,
    required this.semanticsLabel,
    required this.onPressed,
    required this.color,
    this.direction = TriangleDirection.top,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      button: true,
      excludeSemantics: true,
      child: DelayedPressWrapper(
        onPressed: onPressed,
        child: ClipPath(
          clipper: TriangleClipper(direction),
          child: Container(
            width: size,
            height: size,
            color: color,
            alignment: Alignment.center,
            child: ExcludeSemantics(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
