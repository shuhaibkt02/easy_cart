import 'dart:developer';

import 'package:easy_cart/feature/onboarding/presentation/constant.dart';
import 'package:easy_cart/feature/onboarding/presentation/widget/dot_indicator.dart';
import 'package:easy_cart/feature/onboarding/presentation/widget/pic_text.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final textstyle = Theme.of(context).textTheme;
    PageController pageController = PageController();
    ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                currentPageNotifier.value = value;
                log('$value');
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = mainList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PicAndText(
                    width: width,
                    textstyle: textstyle,
                    imageUrl: item.image,
                    list: item.titles,
                    subLabel: item.subtitle,
                  ),
                );
              },
              itemCount: mainList.length,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              return DotIndicator(width: width, selectedIndex: currentPage);
            },
          ),
        ],
      ),
    );
  }
}
