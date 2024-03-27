import 'package:easy_cart/feature/auth/presentation/widget/dropdown_custom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PhoneField<T> extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.textStyle,
    required this.width,
    required this.controller,
    this.onSelect,
    required this.dropList,
    required this.valueListenable,
  });

  final TextTheme textStyle;
  final double width;
  final TextEditingController controller;
  final void Function(String?)? onSelect;
  final List<String> dropList;
  final ValueListenable<T> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDropDown(
          // to fix only option add padding bottom -28
          textStyle: textStyle,
          width: 120,
          onSelect: onSelect,
          hintText: '',
          dropList: dropList, valueListenable: valueListenable,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
            controller: controller,
            style: textStyle.bodyMedium,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(counterText: ''),
          ),
        ),
      ],
    );
  }
}
