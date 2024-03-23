import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 230,
          child: Image.asset(
            'assets/logo.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
