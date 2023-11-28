import 'package:flutter/material.dart';

import 'theme_store.dart';

class FlutterPadTheme {
  final light = ThemeStore(
    primary: const Color(0xFF46CAFE),
    secondary: const Color(0xFF54CEFE),
    tertiary: const Color(0xFF030081),
    surface: const Color(0xFFF1F5F9),
    surfaceVariant: const Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  final dark = ThemeStore(
    primary: const Color(0xFF46CAFE),
    secondary: const Color(0xFF54CEFE),
    tertiary: const Color(0xFF030081),
    surface: const Color(0xFF121212),
    surfaceVariant: const Color(0xFF1E1E1E),
    brightness: Brightness.dark,
  );

  ThemeData getLightThemeData(BuildContext context) {
    return light.getThemeData(context);
  }

  ThemeData getDarkThemeData(BuildContext context) {
    return dark.getThemeData(context);
  }
}
