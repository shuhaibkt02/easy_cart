import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.width,
    required this.selectedIndex,
  });

  final double width;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: width - 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (selectedIndex != 0)
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: mainColor,
              ),
            ),
          if (selectedIndex == 0) const SizedBox(width: 50),
          _DotIndicator(
            activeIndex: selectedIndex,
          ),
          const CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int activeIndex;
  const _DotIndicator({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) {
          bool isActive = activeIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                  color: isActive ? mainColor : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(50)),
            ),
          );
        },
      ),
    );
  }
}
