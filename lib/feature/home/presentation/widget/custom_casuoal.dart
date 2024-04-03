import 'package:easy_cart/feature/onboarding/presentation/widget/dot_indicator.dart';
import 'package:flutter/material.dart';

class CustomCausol extends StatelessWidget {
  const CustomCausol({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> activeIndex = ValueNotifier<int>(0);
    PageController controller = PageController(viewportFraction: 0.99);
    return SizedBox(
      height: width / 2.2,
      child: ValueListenableBuilder(
          valueListenable: activeIndex,
          builder: (context, va, _) {
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: PageView.builder(
                      onPageChanged: (value) => activeIndex.value = value,
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // width: width / 2.5,
                          decoration: BoxDecoration(
                            color: Colors.accents[index],
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomDotIndicator(
                      activeIndex: activeIndex.value, total: 4),
                ),
              ],
            );
          }),
    );
  }
}
