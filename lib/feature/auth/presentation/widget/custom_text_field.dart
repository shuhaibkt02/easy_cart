import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.width,
    required this.textStyle,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  final double width;
  final TextTheme textStyle;
  final String label;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, top: 8),
          child: Text(label, style: textStyle.bodyMedium),
        ),
        TextFormField(
          obscureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${label.toLowerCase()}';
            }
            return null;
          },
          style: textStyle.bodySmall,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
