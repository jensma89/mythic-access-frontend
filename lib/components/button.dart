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
        _pressed = true;
        _fired = false;

        // Touch >> delay for accessibility (fire after holding)
        if (details.kind == PointerDeviceKind.touch) {
          _timer = Timer(widget.delay, _fire);
          return;
        }

        // Mouse / Keyboard >> direct trigger
        _fire();
      },

      onTapUp: (_) {
        _pressed = false;
        _timer?.cancel();
        _timer = null;
      },

      onTapCancel: () {
        _pressed = false;
        _timer?.cancel();
        _timer = null;
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
  final double inset;

  TriangleClipper(this.direction, {this.inset = 5.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    switch (direction) {
      case TriangleDirection.top:
        path
          ..moveTo(size.width / 2, inset)
          ..lineTo(inset, size.height - inset)
          ..lineTo(size.width - inset, size.height - inset);
        break;

      case TriangleDirection.down:
        path
          ..moveTo(inset, inset)
          ..lineTo(size.width - inset, inset)
          ..lineTo(size.width / 2, size.height - inset);
        break;

      case TriangleDirection.left:
        path
          ..moveTo(inset, size.height / 2)
          ..lineTo(size.width - inset, inset)
          ..lineTo(size.width - inset, size.height - inset);
        break;

      case TriangleDirection.right:
        path
          ..moveTo(inset, inset)
          ..lineTo(size.width - inset, size.height / 2)
          ..lineTo(inset, size.height - inset);
        break;
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Custom painter to draw triangle border
class _TriangleBorderPainter extends CustomPainter {
  final TriangleDirection direction;
  final Color borderColor;
  final double borderWidth;
  final double inset;

  _TriangleBorderPainter({
    required this.direction,
    required this.borderColor,
    this.borderWidth = 1.5,
    this.inset = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    switch (direction) {
      case TriangleDirection.top:
        path
          ..moveTo(size.width / 2, inset)
          ..lineTo(inset, size.height - inset)
          ..lineTo(size.width - inset, size.height - inset);
        break;

      case TriangleDirection.down:
        path
          ..moveTo(inset, inset)
          ..lineTo(size.width - inset, inset)
          ..lineTo(size.width / 2, size.height - inset);
        break;

      case TriangleDirection.left:
        path
          ..moveTo(inset, size.height / 2)
          ..lineTo(size.width - inset, inset)
          ..lineTo(size.width - inset, size.height - inset);
        break;

      case TriangleDirection.right:
        path
          ..moveTo(inset, inset)
          ..lineTo(size.width - inset, size.height / 2)
          ..lineTo(inset, size.height - inset);
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Class to create a triangle button
class TriangleButton extends StatelessWidget {
  final String label;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final Color color;
  final Color? borderColor;
  final TriangleDirection direction;
  final double size;
  final FocusNode? focusNode;

  const TriangleButton({
    super.key,
    required this.label,
    required this.semanticsLabel,
    required this.onPressed,
    required this.color,
    this.borderColor,
    this.direction = TriangleDirection.top,
    this.size = 80,
    this.focusNode,
  });

  // Calculate text offset to center in the triangle's visual center
  Alignment _getTextAlignment() {
    switch (direction) {
      case TriangleDirection.left:
        return const Alignment(0.35, 0.0);
      case TriangleDirection.right:
        return const Alignment(-0.35, 0.0);
      case TriangleDirection.top:
        return const Alignment(0.0, 0.35);
      case TriangleDirection.down:
        return const Alignment(0.0, -0.35);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      button: true,
      excludeSemantics: true,
      child: Focus(
        focusNode: focusNode,
        child: Builder(
          builder: (context) {
            final hasFocus = Focus.of(context).hasFocus;
            return DelayedPressWrapper(
              onPressed: onPressed,
              child: CustomPaint(
                foregroundPainter: borderColor != null
                    ? _TriangleBorderPainter(
                        direction: direction,
                        borderColor: hasFocus
                            ? Theme.of(context).colorScheme.primary
                            : borderColor!,
                        borderWidth: hasFocus ? 3.0 : 1.5,
                      )
                    : null,
                child: ClipPath(
                  clipper: TriangleClipper(direction),
                  child: Container(
                    width: size,
                    height: size,
                    color: color,
                    alignment: _getTextAlignment(),
                    child: ExcludeSemantics(
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
