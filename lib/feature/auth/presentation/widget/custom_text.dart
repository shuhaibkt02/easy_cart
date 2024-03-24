
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.width,
    required this.textStyle,
    required this.heading,
    required this.message,
  });

  final double width;
  final TextTheme textStyle;
  final String heading;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            heading,
            style: textStyle.bodyLarge?.copyWith(
              letterSpacing: 0.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            message,
            style: textStyle.bodyMedium?.copyWith(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}