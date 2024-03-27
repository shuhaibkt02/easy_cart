
import 'package:flutter/material.dart';

class OrText extends StatelessWidget {
  const OrText({
    super.key,
    required this.textStyle, required this.text,
  });

  final TextTheme textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: textStyle.bodySmall?.copyWith(
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
