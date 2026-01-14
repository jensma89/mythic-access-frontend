// dark_theme.dart
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
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

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(35, 36, 36, 1.0),
      foregroundColor: Colors.white,
      minimumSize: const Size(160, 48),
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),

  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
