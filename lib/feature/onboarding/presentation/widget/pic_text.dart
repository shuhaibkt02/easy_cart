import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';

class PicAndText extends StatelessWidget {
  const PicAndText({
    super.key,
    required this.width,
    required this.textstyle,
    required this.imageUrl,
    required this.list,
    required this.subLabel,
  });

  final double width;
  final String imageUrl;
  final TextTheme textstyle;
  final List<String> list;
  final String subLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: textstyle.bodyLarge,
            children: <TextSpan>[
              ...List.generate(
                list.length,
                (index) => TextSpan(
                  text: list[index],
                  style: textstyle.bodyLarge?.copyWith(
                      color: index.isEven ? Colors.black : mainColor),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Text(
          subLabel,
          style: textstyle.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
