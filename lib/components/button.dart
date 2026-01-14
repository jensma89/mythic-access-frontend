// button.dart
import 'package:flutter/material.dart';

// Class for the main button of the app e.g. settings or profile
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

// Class for the primary button e.g. save or submit
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      onPressed: onPressed,
      style: baseStyle?.copyWith(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromRGBO(9, 72, 72, 1.0),
        ),
      ),
      child: Text(text),
    );
  }
}

// Class for secondary button e.g. for delete or cancel
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      onPressed: onPressed,
      style: baseStyle?.copyWith(
        backgroundColor: WidgetStateProperty.all(
          Color.fromRGBO(46, 29, 82, 1.0),
        ),
      ),
      child: Text(text),
    );
  }
}
