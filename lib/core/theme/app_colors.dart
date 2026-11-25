import 'package:flutter/material.dart';

/// Semantic and surface color tokens for the Nordic Marine design system.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.outline,
    required this.outlineVariant,
    required this.surfaceTint,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.inversePrimary,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.background,
    required this.onBackground,
    required this.surfaceVariant,
    required this.brandPrimary,
    required this.brandSecondary,
    required this.brandSecondaryHover,
    required this.brandTertiary,
    required this.focusRing,
    required this.textHigh,
    required this.textSubdued,
    required this.textGhost,
    required this.borderSubtle,
    required this.borderHairline,
    required this.rowHover,
    required this.shadowAmbient,
  });

  final Color surface;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color outline;
  final Color outlineVariant;
  final Color surfaceTint;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color inversePrimary;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color primaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixed;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixed;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixed;
  final Color onTertiaryFixedVariant;
  final Color background;
  final Color onBackground;
  final Color surfaceVariant;

  // Component & hierarchy tokens from DESIGN.md
  final Color brandPrimary;
  final Color brandSecondary;
  final Color brandSecondaryHover;
  final Color brandTertiary;
  final Color focusRing;
  final Color textHigh;
  final Color textSubdued;
  final Color textGhost;
  final Color borderSubtle;
  final Color borderHairline;
  final Color rowHover;
  final Color shadowAmbient;

  static const AppColors light = AppColors(
    surface: Color(0xFFF6FAFE),
    surfaceDim: Color(0xFFD6DADE),
    surfaceBright: Color(0xFFF6FAFE),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F4F8),
    surfaceContainer: Color(0xFFEAEEF2),
    surfaceContainerHigh: Color(0xFFE4E9ED),
    surfaceContainerHighest: Color(0xFFDFE3E7),
    onSurface: Color(0xFF171C1F),
    onSurfaceVariant: Color(0xFF44474E),
    inverseSurface: Color(0xFF2C3134),
    inverseOnSurface: Color(0xFFEDF1F5),
    outline: Color(0xFF74777F),
    outlineVariant: Color(0xFFC4C6CF),
    surfaceTint: Color(0xFF485F83),
    primary: Color(0xFF00142F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF0F294A),
    onPrimaryContainer: Color(0xFF7A91B7),
    inversePrimary: Color(0xFFB0C8F1),
    secondary: Color(0xFF0051D5),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF316BF3),
    onSecondaryContainer: Color(0xFFFEFCFF),
    tertiary: Color(0xFF09151F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF1E2A34),
    onTertiaryContainer: Color(0xFF85919E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    primaryFixed: Color(0xFFD5E3FF),
    primaryFixedDim: Color(0xFFB0C8F1),
    onPrimaryFixed: Color(0xFF001B3B),
    onPrimaryFixedVariant: Color(0xFF30476A),
    secondaryFixed: Color(0xFFDBE1FF),
    secondaryFixedDim: Color(0xFFB4C5FF),
    onSecondaryFixed: Color(0xFF00174B),
    onSecondaryFixedVariant: Color(0xFF003EA8),
    tertiaryFixed: Color(0xFFD7E4F2),
    tertiaryFixedDim: Color(0xFFBBC8D5),
    onTertiaryFixed: Color(0xFF101D27),
    onTertiaryFixedVariant: Color(0xFF3C4853),
    background: Color(0xFFF6FAFE),
    onBackground: Color(0xFF171C1F),
    surfaceVariant: Color(0xFFDFE3E7),
    brandPrimary: Color(0xFF0F294A),
    brandSecondary: Color(0xFF2563EB),
    brandSecondaryHover: Color(0xFF1D4ED8),
    brandTertiary: Color(0xFFE0EDFB),
    focusRing: Color(0xFFBFDBFE),
    textHigh: Color(0xFF0B1E36),
    textSubdued: Color(0xFF475B74),
    textGhost: Color(0xFF7C90A8),
    borderSubtle: Color(0xFFDCE5EF),
    borderHairline: Color(0xFFE2E8F0),
    rowHover: Color(0xFFF8FAFC),
    shadowAmbient: Color(0xFF0F294A),
  );

  static const AppColors dark = AppColors(
    surface: Color(0xFF09151F),
    surfaceDim: Color(0xFF060E16),
    surfaceBright: Color(0xFF1E2A34),
    surfaceContainerLowest: Color(0xFF00142F),
    surfaceContainerLow: Color(0xFF0F294A),
    surfaceContainer: Color(0xFF153156),
    surfaceContainerHigh: Color(0xFF1E3C64),
    surfaceContainerHighest: Color(0xFF284772),
    onSurface: Color(0xFFEDF1F5),
    onSurfaceVariant: Color(0xFFBBD0E6),
    inverseSurface: Color(0xFFF0F4F8),
    inverseOnSurface: Color(0xFF171C1F),
    outline: Color(0xFF7C90A8),
    outlineVariant: Color(0xFF30476A),
    surfaceTint: Color(0xFFB0C8F1),
    primary: Color(0xFFB0C8F1),
    onPrimary: Color(0xFF001B3B),
    primaryContainer: Color(0xFF30476A),
    onPrimaryContainer: Color(0xFFD5E3FF),
    inversePrimary: Color(0xFF0F294A),
    secondary: Color(0xFFB4C5FF),
    onSecondary: Color(0xFF00174B),
    secondaryContainer: Color(0xFF003EA8),
    onSecondaryContainer: Color(0xFFDBE1FF),
    tertiary: Color(0xFFBBC8D5),
    onTertiary: Color(0xFF101D27),
    tertiaryContainer: Color(0xFF3C4853),
    onTertiaryContainer: Color(0xFFD7E4F2),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    primaryFixed: Color(0xFFD5E3FF),
    primaryFixedDim: Color(0xFFB0C8F1),
    onPrimaryFixed: Color(0xFF001B3B),
    onPrimaryFixedVariant: Color(0xFF30476A),
    secondaryFixed: Color(0xFFDBE1FF),
    secondaryFixedDim: Color(0xFFB4C5FF),
    onSecondaryFixed: Color(0xFF00174B),
    onSecondaryFixedVariant: Color(0xFF003EA8),
    tertiaryFixed: Color(0xFFD7E4F2),
    tertiaryFixedDim: Color(0xFFBBC8D5),
    onTertiaryFixed: Color(0xFF101D27),
    onTertiaryFixedVariant: Color(0xFF3C4853),
    background: Color(0xFF09151F),
    onBackground: Color(0xFFEDF1F5),
    surfaceVariant: Color(0xFF1E2A34),
    brandPrimary: Color(0xFFB0C8F1),
    brandSecondary: Color(0xFF316BF3),
    brandSecondaryHover: Color(0xFF2563EB),
    brandTertiary: Color(0xFF1E3C64),
    focusRing: Color(0xFF30476A),
    textHigh: Color(0xFFEDF1F5),
    textSubdued: Color(0xFFB0C8F1),
    textGhost: Color(0xFF7C90A8),
    borderSubtle: Color(0xFF30476A),
    borderHairline: Color(0xFF1E3C64),
    rowHover: Color(0xFF153156),
    shadowAmbient: Color(0xFF000A18),
  );

  @override
  AppColors copyWith({
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? outline,
    Color? outlineVariant,
    Color? surfaceTint,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? inversePrimary,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? background,
    Color? onBackground,
    Color? surfaceVariant,
    Color? brandPrimary,
    Color? brandSecondary,
    Color? brandSecondaryHover,
    Color? brandTertiary,
    Color? focusRing,
    Color? textHigh,
    Color? textSubdued,
    Color? textGhost,
    Color? borderSubtle,
    Color? borderHairline,
    Color? rowHover,
    Color? shadowAmbient,
  }) {
    return AppColors(
      surface: surface ?? this.surface,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
      onPrimaryFixedVariant:
          onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
      secondaryFixed: secondaryFixed ?? this.secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
      onTertiaryFixedVariant:
          onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandSecondaryHover: brandSecondaryHover ?? this.brandSecondaryHover,
      brandTertiary: brandTertiary ?? this.brandTertiary,
      focusRing: focusRing ?? this.focusRing,
      textHigh: textHigh ?? this.textHigh,
      textSubdued: textSubdued ?? this.textSubdued,
      textGhost: textGhost ?? this.textGhost,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderHairline: borderHairline ?? this.borderHairline,
      rowHover: rowHover ?? this.rowHover,
      shadowAmbient: shadowAmbient ?? this.shadowAmbient,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t)!,
      surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t)!,
      surfaceContainerLowest: Color.lerp(
        surfaceContainerLowest,
        other.surfaceContainerLowest,
        t,
      )!,
      surfaceContainerLow: Color.lerp(
        surfaceContainerLow,
        other.surfaceContainerLow,
        t,
      )!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      surfaceContainerHigh: Color.lerp(
        surfaceContainerHigh,
        other.surfaceContainerHigh,
        t,
      )!,
      surfaceContainerHighest: Color.lerp(
        surfaceContainerHighest,
        other.surfaceContainerHighest,
        t,
      )!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      inverseOnSurface: Color.lerp(
        inverseOnSurface,
        other.inverseOnSurface,
        t,
      )!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(
        secondaryContainer,
        other.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: Color.lerp(
        onSecondaryContainer,
        other.onSecondaryContainer,
        t,
      )!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: Color.lerp(
        tertiaryContainer,
        other.tertiaryContainer,
        t,
      )!,
      onTertiaryContainer: Color.lerp(
        onTertiaryContainer,
        other.onTertiaryContainer,
        t,
      )!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(
        onErrorContainer,
        other.onErrorContainer,
        t,
      )!,
      primaryFixed: Color.lerp(primaryFixed, other.primaryFixed, t)!,
      primaryFixedDim: Color.lerp(primaryFixedDim, other.primaryFixedDim, t)!,
      onPrimaryFixed: Color.lerp(onPrimaryFixed, other.onPrimaryFixed, t)!,
      onPrimaryFixedVariant: Color.lerp(
        onPrimaryFixedVariant,
        other.onPrimaryFixedVariant,
        t,
      )!,
      secondaryFixed: Color.lerp(secondaryFixed, other.secondaryFixed, t)!,
      secondaryFixedDim: Color.lerp(
        secondaryFixedDim,
        other.secondaryFixedDim,
        t,
      )!,
      onSecondaryFixed: Color.lerp(
        onSecondaryFixed,
        other.onSecondaryFixed,
        t,
      )!,
      onSecondaryFixedVariant: Color.lerp(
        onSecondaryFixedVariant,
        other.onSecondaryFixedVariant,
        t,
      )!,
      tertiaryFixed: Color.lerp(tertiaryFixed, other.tertiaryFixed, t)!,
      tertiaryFixedDim: Color.lerp(
        tertiaryFixedDim,
        other.tertiaryFixedDim,
        t,
      )!,
      onTertiaryFixed: Color.lerp(onTertiaryFixed, other.onTertiaryFixed, t)!,
      onTertiaryFixedVariant: Color.lerp(
        onTertiaryFixedVariant,
        other.onTertiaryFixedVariant,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandSecondaryHover: Color.lerp(
        brandSecondaryHover,
        other.brandSecondaryHover,
        t,
      )!,
      brandTertiary: Color.lerp(brandTertiary, other.brandTertiary, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      textHigh: Color.lerp(textHigh, other.textHigh, t)!,
      textSubdued: Color.lerp(textSubdued, other.textSubdued, t)!,
      textGhost: Color.lerp(textGhost, other.textGhost, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderHairline: Color.lerp(borderHairline, other.borderHairline, t)!,
      rowHover: Color.lerp(rowHover, other.rowHover, t)!,
      shadowAmbient: Color.lerp(shadowAmbient, other.shadowAmbient, t)!,
    );
  }
}

