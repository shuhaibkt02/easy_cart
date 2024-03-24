
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Widget icon;
  final VoidCallback onpress;
  const CustomCircleAvatar({
    super.key,
    required this.icon,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
