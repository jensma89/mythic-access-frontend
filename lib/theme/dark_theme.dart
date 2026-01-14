// dark_theme.dart
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
  colorScheme: const ColorScheme.dark(
    primary: Colors.black,
    secondary: Color.fromRGBO(88, 112, 120, 1.0),
    surface: Color.fromRGBO(46, 60, 65, 1.0),
    error: Color.fromRGBO(98, 25, 60, 1.0),
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(fontSize: 16),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(56, 57, 57, 1.0),
      foregroundColor: Colors.white,
      minimumSize: const Size(160, 48),
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),

  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
