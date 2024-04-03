import 'package:easy_cart/feature/home/presentation/widget/category_area.dart';
import 'package:easy_cart/utils/extension/sizebox_extentions.dart';
import 'package:flutter/material.dart';

class RecommendArea extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme? color;

  const RecommendArea({
    super.key,
    required this.textTheme,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: 300,
      child: Column(
        children: [
          LabelAndSeeAll(
            label: 'Categories',
            onTap: () {},
            textTheme: textTheme,
          ),
          12.height,
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
