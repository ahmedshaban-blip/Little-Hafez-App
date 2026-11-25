import 'package:flutter/widgets.dart';

/// Spacing, layout grid, and sizing tokens from DESIGN.md (1rem = 16px).
abstract final class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 40.0;

  static const double gutter = 24.0;
  static const double gutterTablet = 20.0;
  static const double gutterMobile = 16.0;

  static const double margin = 48.0;
  static const double marginTablet = 32.0;
  static const double marginMobile = 20.0;

  static const double maxContentWidth = 1280.0;
  static const double inputHeight = 44.0;
  static const double minTouchTarget = 44.0;
  static const double checkboxSize = 20.0;

  static const EdgeInsetsDirectional chipPadding =
      EdgeInsetsDirectional.symmetric(horizontal: 12.0, vertical: 4.0);

  static const EdgeInsetsDirectional pageMobile =
      EdgeInsetsDirectional.symmetric(horizontal: marginMobile, vertical: md);
}

