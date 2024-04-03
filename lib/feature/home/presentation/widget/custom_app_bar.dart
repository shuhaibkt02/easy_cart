import 'package:easy_cart/utils/extension/sizebox_extentions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme color;
  const CustomAppBar({
    super.key,
    required this.textTheme,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location', style: textTheme.bodySmall),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: 20,
                    color: color.primary,
                  ),
                  5.width,
                  Text(
                    'Home',
                    style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              isLabelVisible: true,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
    );
  }
}
