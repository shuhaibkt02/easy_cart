import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColor,
  ),
  textTheme: const TextTheme(
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
const bodyMedium = TextStyle(
  color: Color(0xFF787979),
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
const bodyLarge = TextStyle(
  color: mainTextColor,
  fontSize: 22.5,
  fontWeight: FontWeight.bold,
);
const mainColor = Color(0xFF23AA49);
const bodySmallColor = Color(0xFFC2C2C3);
const mainTextColor = Color(0xFF313131);
