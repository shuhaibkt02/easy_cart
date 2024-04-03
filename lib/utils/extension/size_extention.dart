import 'package:flutter/material.dart';

extension DisplaySize on BuildContext {
  Size get _mediaQuery => MediaQuery.sizeOf(this);

  double get heightTo => _mediaQuery.height;
  double get widthTo => _mediaQuery.width;
}
