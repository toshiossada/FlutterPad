import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';

class ThemeStore {
  final Color primary;

  final Color secondary;

  final Color tertiary;

  final Color surface;

  final Color surfaceVariant;

  final Brightness brightness;

  ThemeStore({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.surface,
    required this.surfaceVariant,
    required this.brightness,
  });

  ColorScheme getColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      surface: surface,
      surfaceVariant: surfaceVariant,
      brightness: brightness,
    );
  }

  ThemeData getThemeData(BuildContext context) {

    final textTheme = context.textTheme;



    final colorScheme = getColorScheme();

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surface,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: surfaceVariant,
        titleTextStyle: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }
}
