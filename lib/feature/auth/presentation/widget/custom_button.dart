import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.btnLabel,
    required this.onpress,
  });

  final double width;
  final String btnLabel;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return InkWell(
      onTap: onpress,
      child: Container(
        height: 57,
        width: width,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            btnLabel,
            style:
                textStyle.bodyLarge?.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
