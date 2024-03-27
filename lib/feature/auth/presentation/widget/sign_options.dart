
import 'package:easy_cart/feature/auth/presentation/widget/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

class SignOptions extends StatelessWidget {
  const SignOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircleAvatar(
          icon: const Icon(
            Icons.apple,
            size: 28,
          ),
          onpress: () {},
        ),
        const SizedBox(width: 10),
        CustomCircleAvatar(
          icon: Icon(
            Icons.g_mobiledata,
            color: Colors.greenAccent.shade700,
            size: 35,
          ),
          onpress: () {},
        ),
        const SizedBox(width: 10),
        CustomCircleAvatar(
          icon: const Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          onpress: () {},
        ),
      ],
    );
  }
}