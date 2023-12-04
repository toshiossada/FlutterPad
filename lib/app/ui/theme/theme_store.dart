import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

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
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: GoogleFonts.poppinsTextTheme(),
      iconTheme: const IconThemeData(
        size: 24,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: surfaceVariant,
        titleTextStyle: context.textTheme.titleLarge?.copyWith(
          color: colorScheme.onPrimary,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      listTileTheme: const ListTileThemeData(
        dense: true,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        overlayColor: MaterialStateProperty.all<Color>(
          colorScheme.onSurfaceVariant,
        ),
        checkColor: MaterialStateProperty.all<Color>(
          colorScheme.surfaceVariant,
        ),
        splashRadius: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: const Size.fromHeight(36),
          textStyle: textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 16,
            height: 24 / 16,
            fontWeight: FontWeight.w700,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
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
