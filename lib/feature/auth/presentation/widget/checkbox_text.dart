import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:flutter/material.dart';

class CheckBoxAndText extends StatelessWidget {
  const CheckBoxAndText({
    super.key,
    required this.textStyle,
    this.value,
    required this.onChanged,
  });

  final TextTheme textStyle;
  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RowText(
              textStyle: textStyle,
              onTap: () {},
              text: 'Agree with ',
              linkText: 'Terms & Condition',
            ),
          ),
        ],
      ),
    );
  }
}
