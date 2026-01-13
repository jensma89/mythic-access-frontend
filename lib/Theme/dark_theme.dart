// dark_theme.dart
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
  colorScheme: const ColorScheme.dark(
    primary: Colors.black,
    secondary: Colors.grey,
    surface: Colors.blueGrey,
    error: Colors.redAccent,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(fontSize: 16),
  ),
  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
