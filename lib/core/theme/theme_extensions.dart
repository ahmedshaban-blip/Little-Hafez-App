import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Convenience accessors for theme tokens on [BuildContext].
extension AppThemeContext on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.light;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
