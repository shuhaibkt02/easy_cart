import 'package:easy_cart/utils/extension/theme_extention.dart';
import 'package:flutter/material.dart';

class BottonIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String iconName;
  final VoidCallback onTap;
  const BottonIcon({
    super.key,
    required this.icon,
    required this.iconName,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeExt(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: color,
          ),
          Text(iconName, style: textTheme.bodySmall?.copyWith(color: color)),
        ],
      ),
    );
  }
}
