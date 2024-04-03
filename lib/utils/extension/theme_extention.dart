import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  TextTheme get textTheme => _textTheme;

  /// Color extension
  ColorScheme get _color => Theme.of(this).colorScheme;
  Color get _primary => Theme.of(this).colorScheme.primary;
  Color get _secondary => Theme.of(this).colorScheme.secondary;
  Color get _background => Theme.of(this).colorScheme.background;

  ColorScheme get color => _color;
  Color get primary => _primary;
  Color get secondary => _secondary;
  Color get background => _background;
}
