
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.textStyle,
    required this.onTap,
    required this.text,
    required this.linkText,
  });

  final TextTheme textStyle;
  final VoidCallback onTap;
  final String text;
  final String linkText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: text,
          style: textStyle.bodyMedium,
          children: <TextSpan>[
            TextSpan(
              text: linkText,
              style: textStyle.bodyMedium?.copyWith(
                color: mainColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}