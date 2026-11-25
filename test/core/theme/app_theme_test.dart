import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litle_hafez/core/theme/theme.dart';

void main() {
  group('AppTheme', () {
    test('light theme provides light brightness and AppColors extension', () {
      final theme = AppTheme.light;
      final colors = theme.extension<AppColors>();

      expect(theme.brightness, Brightness.light);
      expect(colors, isNotNull);
      expect(colors!.surface, AppColors.light.surface);
      expect(colors.brandPrimary, const Color(0xFF0F294A));
      expect(colors.brandSecondary, const Color(0xFF2563EB));
    });

    test('dark theme provides dark brightness and AppColors extension', () {
      final theme = AppTheme.dark;
      final colors = theme.extension<AppColors>();

      expect(theme.brightness, Brightness.dark);
      expect(colors, isNotNull);
      expect(colors!.surface, AppColors.dark.surface);
    });

    test('AppColors.lerp interpolates between light and dark', () {
      final mid = AppColors.light.lerp(AppColors.dark, 0.5);

      expect(mid.surface, isNot(AppColors.light.surface));
      expect(mid.surface, isNot(AppColors.dark.surface));
    });

    testWidgets('context.colors resolves AppColors from Theme', (tester) async {
      late AppColors resolved;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              resolved = context.colors;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(resolved.primary, AppColors.light.primary);
    });
  });
}

