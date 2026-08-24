import 'package:flutter/material.dart';

/// WhatsApp brand-inspired palette + gradients.
class AppColors {
  static const Color tealGreen = Color(0xFF075E54);
  static const Color tealGreenDark = Color(0xFF128C7E);
  static const Color lightGreen = Color(0xFF25D366);
  static const Color blueTick = Color(0xFF34B7F1);

  static const Color chatBg = Color(0xFFE5DDD5);
  static const Color bubbleMe = Color(0xFFDCF8C6);
  static const Color bubbleFriend = Color(0xFFFFFFFF);

  static const Color statusRing = Color(0xFF25D366);
  static const Color missedCall = Color(0xFFE53935);

  static const LinearGradient appBarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF075E54), Color(0xFF128C7E), Color(0xFF25D366)],
  );

  static const LinearGradient loginGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF128C7E), Color(0xFF25D366)],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF075E54), Color(0xFF128C7E)],
  );

  static const LinearGradient storyGradient = LinearGradient(
    colors: [Color(0xFF25D366), Color(0xFF128C7E)],
  );

  static const LinearGradient fabGradient = LinearGradient(
    colors: [Color(0xFF25D366), Color(0xFF128C7E)],
  );
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.tealGreen,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.tealGreen,
      primary: AppColors.tealGreen,
      secondary: AppColors.lightGreen,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.tealGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
