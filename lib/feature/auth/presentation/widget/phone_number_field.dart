import 'package:easy_cart/feature/auth/presentation/widget/dropdown_custom.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.textStyle,
    required this.width,
    required this.controller,
  });

  final TextTheme textStyle;
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDropDown(
          textStyle: textStyle,
          width: 120,
          dropList: const ['+1', '+91'],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
            controller: controller,
            style: textStyle.bodyMedium,
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
