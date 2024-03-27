import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditProfile<T> extends StatelessWidget {
  const EditProfile({
    super.key,
    required this.width,
    required this.imageNotifier,
    required this.onPress,
  });

  final double width;
  final ValueListenable<String> imageNotifier;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 3,
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: imageNotifier,
            builder: (context, value, child) {
              return GestureDetector(
                onTap: onPress,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 66,
                  backgroundImage: (imageNotifier.value.isNotEmpty)
                      ? FileImage(File(imageNotifier.value))
                      : null,
                  child: (imageNotifier.value.isEmpty)
                      ? null
                      : const Icon(CupertinoIcons.person_fill, size: 30),
                ),
              );
            },
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.green,
              child: Icon(
                CupertinoIcons.pencil,
                color: Colors.white,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
