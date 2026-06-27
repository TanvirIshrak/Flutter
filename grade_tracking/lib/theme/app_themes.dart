import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    final scheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }

  static ThemeData darkTheme() {
    final scheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    );
    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }
}
