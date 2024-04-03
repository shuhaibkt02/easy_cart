import 'package:easy_cart/feature/home/presentation/widget/category_area.dart';
import 'package:easy_cart/feature/home/presentation/widget/custom_app_bar.dart';
import 'package:easy_cart/feature/home/presentation/widget/custom_casuoal.dart';
import 'package:easy_cart/feature/home/presentation/widget/recommend_area.dart';
import 'package:easy_cart/feature/home/presentation/widget/search_button.dart';
import 'package:easy_cart/utils/extension/size_extention.dart';
import 'package:easy_cart/utils/extension/sizebox_extentions.dart';
import 'package:easy_cart/utils/extension/theme_extention.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeExt(context).textTheme;
    final color = ThemeExt(context).color;
    double width = DisplaySize(context).widthTo;
    ScrollController scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            8.height,
            CustomAppBar(textTheme: textTheme, color: color),
            CustomSearch(color: color),
            8.height,
            CustomCausol(width: width),
            10.height,
            CategorieArea(textTheme: textTheme),
            10.height,
            RecommendArea(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
