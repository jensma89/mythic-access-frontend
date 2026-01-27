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

  // Card widget dark theme
  cardColor: const Color.fromRGBO(30, 34, 36, 1.0),

  dividerColor: const Color.fromRGBO(140, 140, 140, 1.0),

  dividerTheme: const DividerThemeData(thickness: 0.5, space: 16),

  // Font dark design
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 28),
    bodyMedium: TextStyle(fontSize: 26),
    labelLarge: TextStyle(fontSize: 30),
  ),

  // Text field & input dark design
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color.fromRGBO(46, 60, 65, 1.0),

    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 24),

    labelStyle: const TextStyle(color: Colors.white70, fontSize: 30),

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromRGBO(206, 154, 17, 1.0),
        width: 2.0,
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

  // AppButton dark design
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.pressed)) {
          return Color.fromRGBO(70, 70, 70, 1.0);
        }
        return Color.fromRGBO(56, 57, 57, 1.0);
      }),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      minimumSize: WidgetStateProperty.all(const Size(200, 50)),
      maximumSize: WidgetStateProperty.all(const Size(300, 70)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 30)),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFFFD54F), width: 2.0),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey, width: 0.3),
        );
      }),
    ),
  ),

  visualDensity: VisualDensity.standard,
  useMaterial3: true,
);
