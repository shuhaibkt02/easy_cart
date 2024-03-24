import 'package:easy_cart/feature/onboarding/presentation/logic/splash_provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashProvider().waitGo(context: context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 180,
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
