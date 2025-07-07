import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    onSurface: Colors.white,
    primary: Colors.grey.shade700,
    secondary: const Color.fromARGB(255, 57, 57, 57),
    tertiary: Colors.purple,
    inversePrimary: Colors.grey.shade300,
  )
);