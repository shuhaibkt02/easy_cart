import 'package:easy_cart/feature/onboarding/presentation/screen/onborad_screen.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    waitGo();
    super.initState();
  }

  Future<void> waitGo() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushAndRemoveUntilPage(
          const OnBoardScreen(),
        );
      },
    );
  }

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
