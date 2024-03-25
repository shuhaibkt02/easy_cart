import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final TextTheme textStyle;
  final double width;
  final List<String> dropList;
  final void Function(String?)? onSelect;
  const CustomDropDown({
    super.key,
    required this.textStyle,
    required this.width,
    required this.dropList,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: DropdownMenu(
        hintText: 'Select',
        width: width - 25,
        enableFilter: true,
        onSelected: onSelect,
        textStyle: textStyle.bodyMedium?.copyWith(fontSize: 12),
        dropdownMenuEntries: List.generate(
          dropList.length,
          (index) =>
              DropdownMenuEntry(value: dropList[index], label: dropList[index]),
        ),
      ),
    );
  }
}
