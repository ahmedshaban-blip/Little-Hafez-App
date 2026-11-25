import 'package:flutter/material.dart';

/// Typography scale tokens powered by Plus Jakarta Sans from DESIGN.md.
abstract final class AppTypography {
  static const String fontFamily = 'Plus Jakarta Sans';

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 56.0,
    fontWeight: FontWeight.w700,
    height: 64.0 / 56.0,
    letterSpacing: -1.68,
  );

  static const TextStyle displayMobile = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
    height: 44.0 / 36.0,
    letterSpacing: -0.72,
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
    height: 44.0 / 36.0,
    letterSpacing: -0.72,
  );

  static const TextStyle headlineLgMobile = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    height: 36.0 / 28.0,
    letterSpacing: -0.28,
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 32.0 / 24.0,
    letterSpacing: -0.24,
  );

  static const TextStyle headlineSm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 28.0 / 20.0,
    letterSpacing: 0.0,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    height: 28.0 / 18.0,
    letterSpacing: -0.09,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 24.0 / 16.0,
    letterSpacing: 0.0,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 20.0 / 14.0,
    letterSpacing: 0.07,
  );

  static const TextStyle labelLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 20.0 / 14.0,
    letterSpacing: 0.14,
  );

  static const TextStyle labelMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    height: 16.0 / 12.0,
    letterSpacing: 0.24,
  );

  static const TextStyle labelSm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    height: 14.0 / 11.0,
    letterSpacing: 0.33,
  );

  /// Builds a Material 3 [TextTheme] bound to the provided text colors.
  static TextTheme toTextTheme({
    required Color primaryTextColor,
    required Color secondaryTextColor,
  }) {
    return TextTheme(
      displayLarge: display.copyWith(color: primaryTextColor),
      displayMedium: displayMobile.copyWith(color: primaryTextColor),
      headlineLarge: headlineLg.copyWith(color: primaryTextColor),
      headlineMedium: headlineMd.copyWith(color: primaryTextColor),
      headlineSmall: headlineSm.copyWith(color: primaryTextColor),
      titleLarge: headlineSm.copyWith(color: primaryTextColor),
      titleMedium: bodyLg.copyWith(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: labelLg.copyWith(color: primaryTextColor),
      bodyLarge: bodyLg.copyWith(color: primaryTextColor),
      bodyMedium: bodyMd.copyWith(color: primaryTextColor),
      bodySmall: bodySm.copyWith(color: secondaryTextColor),
      labelLarge: labelLg.copyWith(color: primaryTextColor),
      labelMedium: labelMd.copyWith(color: secondaryTextColor),
      labelSmall: labelSm.copyWith(color: secondaryTextColor),
    );
  }
}

