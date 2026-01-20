// button.dart
import 'package:flutter/material.dart';

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
    );
  }
}
