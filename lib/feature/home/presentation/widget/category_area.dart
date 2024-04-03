import 'package:easy_cart/utils/extension/sizebox_extentions.dart';
import 'package:flutter/material.dart';

class CategorieArea extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme? color;
  const CategorieArea({
    super.key,
    required this.textTheme,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelAndSeeAll(
          label: 'Categories',
          onTap: () {},
          textTheme: textTheme,
        ),
        5.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => CategoryCard(
              image: '',
              label: 'label',
              ontap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image, label;
  final VoidCallback ontap;
  const CategoryCard({
    super.key,
    required this.image,
    required this.label,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 80,
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 22,
              child: Icon(Icons.bike_scooter_outlined),
            ),
            5.height,
            Text(label),
          ],
        ),
      ),
    );
  }
}

class LabelAndSeeAll extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextTheme textTheme;

  const LabelAndSeeAll({
    super.key,
    required this.label,
    required this.onTap,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              const Text(
                'See All',
                style: TextStyle(color: Colors.green),
              ),
              5.width,
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.green,
                size: 18,
              ),
            ],
          ),
        )
      ],
    );
  }
}
