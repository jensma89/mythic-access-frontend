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
    bodyLarge: TextStyle(fontSize: 26),
    bodyMedium: TextStyle(fontSize: 24),
    labelLarge: TextStyle(fontSize: 26),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color.fromRGBO(46, 60, 65, 1.0),

    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 22),

    labelStyle: const TextStyle(color: Colors.white70, fontSize: 26),

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromRGBO(88, 112, 120, 1.0),
        width: 1.2,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromRGBO(98, 25, 60, 1.0),
        width: 1.2,
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(56, 57, 57, 1.0),
      foregroundColor: Colors.white,
      minimumSize: const Size(200, 50), // min size of the app button
      maximumSize: const Size(300, 70), // max size of the app button
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontSize: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: const BorderSide(color: Colors.grey, width: 0.3),
    ),
  ),

  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
