import 'package:flutter/widgets.dart';

/// Ambient navy-tinted shadow tiers from DESIGN.md.
abstract final class AppShadows {
  /// Tier 2: Elevated floating cards, modals, and flyouts.
  static List<BoxShadow> tier2Floating(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.08),
      blurRadius: 32,
      spreadRadius: -8,
      offset: const Offset(0, 12),
    ),
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.04),
      blurRadius: 12,
      spreadRadius: -2,
      offset: const Offset(0, 4),
    ),
  ];

  /// Tier 3: Active overlays and popovers.
  static List<BoxShadow> tier3Focus(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.12),
      blurRadius: 48,
      spreadRadius: -12,
      offset: const Offset(0, 20),
    ),
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.05),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  /// Ambient 3px glow for focused inputs and buttons.
  static List<BoxShadow> focusGlow(Color glowColor) => [
    BoxShadow(color: glowColor, blurRadius: 0, spreadRadius: 3),
  ];

  /// Tactile 3D button bottom lip shadow matching Stitch interactive buttons.
  static List<BoxShadow> tactileLip(
    Color lipColor, {
    double offsetY = 4.0,
    Color? ambientColor,
    double ambientBlur = 16.0,
  }) => [
    BoxShadow(color: lipColor, blurRadius: 0, offset: Offset(0, offsetY)),
    if (ambientColor != null)
      BoxShadow(
        color: ambientColor.withValues(alpha: 0.16),
        blurRadius: ambientBlur,
        offset: const Offset(0, 8),
      ),
  ];

  /// Soft elevated card shadow for Stitch cards.
  static List<BoxShadow> softCard(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.08),
      blurRadius: 24,
      spreadRadius: -4,
      offset: const Offset(0, 8),
    ),
  ];
}
