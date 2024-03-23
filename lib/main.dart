import 'package:easy_cart/feature/onboarding/presentation/screen/splash_screen.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Easy Cart',
      home: const SplashScreen(),
    );
  }
}