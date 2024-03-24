import 'package:easy_cart/feature/auth/presentation/screen/login_screen.dart';
import 'package:easy_cart/feature/onboarding/constant.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardFunctions extends ChangeNotifier {
  PageController pageController = PageController();
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  void onPageChanged({required int value}) => currentPageNotifier.value = value;

  void previousPage({required int currentPage}) {
    if (currentPage > 0) {
      currentPageNotifier.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void forwardPage({
    required int currentPage,
    required BuildContext context,
    required List<OnboardModel> mainList,
  }) {
    if (currentPage < mainList.length - 1) {
      currentPageNotifier.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntilPage(
        const LoginScreen(),
      );
    }
  }
}
