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
    bodyLarge: TextStyle(fontSize: 20),
    bodyMedium: TextStyle(fontSize: 18),
    labelLarge: TextStyle(fontSize: 18),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(56, 57, 57, 1.0),
      foregroundColor: Colors.white,
      minimumSize: const Size(200, 50), // min size of the app button
      maximumSize: const Size(300, 70), // max size of the app button
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2, // Button shadow
      shadowColor: Color.fromRGBO(255, 255, 255, 0.8),
    ),
  ),

  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
