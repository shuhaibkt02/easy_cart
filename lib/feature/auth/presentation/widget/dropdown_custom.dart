import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final TextTheme textStyle;
  final double width;
  final List<String> dropList;
  final void Function(String?)? onSelect;
  final ValueListenable<T> valueListenable;
  final String? hintText;
  const CustomDropDown({
    super.key,
    required this.textStyle,
    required this.width,
    required this.dropList,
    this.onSelect,
    this.hintText, required this.valueListenable,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ValueListenableBuilder<T>(
        valueListenable: valueListenable,
        builder: (context,value,child) {
          return DropdownMenu(
            hintText: hintText ?? 'Select',
            width: width - 25,
            enableFilter: true,
            onSelected: onSelect,
            textStyle: textStyle.bodyMedium?.copyWith(fontSize: 12),
            dropdownMenuEntries: List.generate(
              dropList.length,
              (index) =>
                  DropdownMenuEntry(value: dropList[index], label: dropList[index]),
            ),
          );
        }
      ),
    );
  }
}
