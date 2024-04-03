import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColor,
    primary: mainColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    helperStyle: TextStyle(color: Colors.grey.shade400),
    border: inputDecorationBorder,
    enabledBorder: inputDecorationBorder,
    focusedBorder: inputDecorationBorder,
  ),
  textTheme: TextTheme(
    bodySmall: bodySmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
  ),
);
const bodySmall = TextStyle(
  color: bodySmallColor,
  fontSize: 12.5,
  fontWeight: FontWeight.w500,
);
TextStyle bodyMedium = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
const bodyLarge = TextStyle(
  color: mainTextColor,
  fontSize: 22.5,
  fontWeight: FontWeight.bold,
);

OutlineInputBorder inputDecorationBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Colors.grey.shade300),
);
const mainColor = Color(0xFF23AA49);
const bodySmallColor = Color(0xFFC2C2C3);
const mainTextColor = Color(0xFF313131);
