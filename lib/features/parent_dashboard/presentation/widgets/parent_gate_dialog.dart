import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Parent verification math gate modal dialog (`7 × 4 = ?`).
class ParentGateDialog extends StatelessWidget {
  const ParentGateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    const options = [21, 28, 32, 35];

    return Dialog(
      backgroundColor: colors.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadii.borderXl,
        side: BorderSide(color: colors.borderHairline),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.r,
              height: 48.r,
              decoration: BoxDecoration(
                color: colors.pastelBlueSurface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_rounded,
                size: 26.r,
                color: colors.brandPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              l10n.parentGateTitle,
              style: AppTypography.headlineMd.copyWith(
                color: colors.brandPrimary,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              l10n.parentGateSubtitle,
              style: AppTypography.labelMd.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: colors.pastelBlueSurface,
                borderRadius: AppRadii.borderMd,
              ),
              child: Text(
                l10n.parentGateQuestion,
                textAlign: TextAlign.center,
                style: AppTypography.headlineMd.copyWith(
                  color: colors.brandPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 2.4,
              children: options.map((val) {
                final isCorrectOption = val == 28;
                return ElevatedButton(
                  onPressed: () {
                    if (isCorrectOption) {
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.parentGateWrongAnswer)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCorrectOption
                        ? colors.brandPrimary
                        : colors.surfaceContainer,
                    foregroundColor: isCorrectOption
                        ? colors.onPrimary
                        : colors.textHigh,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadii.borderFull,
                    ),
                  ),
                  child: Text('$val'),
                );
              }).toList(),
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.parentGateCancel,
                style: AppTypography.labelMd.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
