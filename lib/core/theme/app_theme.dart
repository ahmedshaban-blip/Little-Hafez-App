import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Single source of truth for Nordic Marine [ThemeData] (Light & Dark).
abstract final class AppTheme {
  static ThemeData get light =>
      _buildTheme(brightness: Brightness.light, colors: AppColors.light);

  static ThemeData get dark =>
      _buildTheme(brightness: Brightness.dark, colors: AppColors.dark);

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppColors colors,
  }) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      primaryFixed: colors.primaryFixed,
      primaryFixedDim: colors.primaryFixedDim,
      onPrimaryFixed: colors.onPrimaryFixed,
      onPrimaryFixedVariant: colors.onPrimaryFixedVariant,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      secondaryFixed: colors.secondaryFixed,
      secondaryFixedDim: colors.secondaryFixedDim,
      onSecondaryFixed: colors.onSecondaryFixed,
      onSecondaryFixedVariant: colors.onSecondaryFixedVariant,
      tertiary: colors.tertiary,
      onTertiary: colors.onTertiary,
      tertiaryContainer: colors.tertiaryContainer,
      onTertiaryContainer: colors.onTertiaryContainer,
      tertiaryFixed: colors.tertiaryFixed,
      tertiaryFixedDim: colors.tertiaryFixedDim,
      onTertiaryFixed: colors.onTertiaryFixed,
      onTertiaryFixedVariant: colors.onTertiaryFixedVariant,
      error: colors.error,
      onError: colors.onError,
      errorContainer: colors.errorContainer,
      onErrorContainer: colors.onErrorContainer,
      surface: colors.surface,
      onSurface: colors.onSurface,
      surfaceDim: colors.surfaceDim,
      surfaceBright: colors.surfaceBright,
      surfaceContainerLowest: colors.surfaceContainerLowest,
      surfaceContainerLow: colors.surfaceContainerLow,
      surfaceContainer: colors.surfaceContainer,
      surfaceContainerHigh: colors.surfaceContainerHigh,
      surfaceContainerHighest: colors.surfaceContainerHighest,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      shadow: colors.shadowAmbient,
      scrim: colors.primary,
      inverseSurface: colors.inverseSurface,
      onInverseSurface: colors.inverseOnSurface,
      inversePrimary: colors.inversePrimary,
      surfaceTint: colors.surfaceTint,
    );

    final textTheme = AppTypography.toTextTheme(
      primaryTextColor: colors.textHigh,
      secondaryTextColor: colors.textSubdued,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: AppTypography.fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.surface,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.textHigh,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.headlineSm.copyWith(
          color: colors.textHigh,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.brandSecondary,
          foregroundColor: colors.onSecondary,
          minimumSize: const Size(0, AppSpacing.minTouchTarget),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadii.borderDefault,
          ),
          textStyle: AppTypography.labelLg,
          elevation: 0,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.surfaceContainerLow,
          foregroundColor: colors.brandPrimary,
          minimumSize: const Size(0, AppSpacing.minTouchTarget),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadii.borderDefault,
          ),
          textStyle: AppTypography.labelLg,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.brandSecondary,
          minimumSize: const Size(0, AppSpacing.minTouchTarget),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          side: BorderSide(color: colors.brandSecondary, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadii.borderDefault,
          ),
          textStyle: AppTypography.labelLg,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainerLowest,
        constraints: const BoxConstraints(minHeight: AppSpacing.inputHeight),
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        hintStyle: AppTypography.bodyMd.copyWith(color: colors.textGhost),
        labelStyle: AppTypography.bodySm.copyWith(color: colors.textSubdued),
        border: OutlineInputBorder(
          borderRadius: AppRadii.borderDefault,
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.borderDefault,
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.borderDefault,
          borderSide: BorderSide(color: colors.brandSecondary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadii.borderDefault,
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadii.borderDefault,
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surfaceContainerLowest,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.borderLg,
          side: BorderSide(color: colors.borderHairline),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.brandTertiary,
        selectedColor: colors.brandPrimary,
        labelStyle: AppTypography.labelMd.copyWith(color: colors.brandPrimary),
        secondaryLabelStyle: AppTypography.labelMd.copyWith(
          color: colors.onPrimary,
        ),
        padding: AppSpacing.chipPadding,
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.borderFull),
        side: BorderSide.none,
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.brandSecondary;
          }
          return colors.surfaceContainerLowest;
        }),
        checkColor: WidgetStatePropertyAll(colors.onSecondary),
        side: BorderSide(color: colors.textGhost, width: 1.5),
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.borderSm),
      ),
      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.brandSecondary;
          }
          return colors.textGhost;
        }),
      ),
      dividerTheme: DividerThemeData(
        color: colors.surfaceContainerLow,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
