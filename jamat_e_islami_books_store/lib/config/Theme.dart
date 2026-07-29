import 'package:flutter/material.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';

var lightTheme = ThemeData(
  // brightness: .light,
  useMaterial3: true,

  // color style define
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: backgroundColor,
      secondary: secondaryColor,
      onSecondary: backgroundColor,
      error: Colors.red,
      onError: fontColor,
      background: backgroundColor,
      onBackground: fontColor,
      surface: backgroundColor,
      onSurface: fontColor
  ),

  // text style define
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 30,
        fontWeight: .w600
    ),
    headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: .w600
    ),
    bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: .w500
    ),
    bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: .w500
    ),
    bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: .w500
    ),
    labelLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: .w400
    ),
    labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: .w400
    ),
    labelSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: .w400
    ),
  )
);