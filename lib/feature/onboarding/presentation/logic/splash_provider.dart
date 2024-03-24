import 'package:easy_cart/feature/onboarding/presentation/screen/onborad_screen.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashProvider extends ChangeNotifier {
  bool isLogging = false;

  Future<void> waitGo({required BuildContext context}) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushAndRemoveUntilPage(
          const OnBoardScreen(),
        );
      },
    );

    isLogging = true;
    notifyListeners();
  }
}
