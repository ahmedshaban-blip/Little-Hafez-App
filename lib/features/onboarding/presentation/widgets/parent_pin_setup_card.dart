import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Step 2 card for the 4-digit parent lock PIN dots.
class ParentPinSetupCard extends StatelessWidget {
  const ParentPinSetupCard({
    super.key,
    required this.filledCount,
    required this.onToggleDot,
  });

  final int filledCount;
  final ValueChanged<int> onToggleDot;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colors.surfaceContainerLow),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 28.r,
                        height: 28.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colors.ceruleanPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          l10n.stepTwoNumber,
                          style: AppTypography.labelMd.copyWith(
                            color: colors.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          l10n.onboardingStep2Title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.headlineMd.copyWith(
                            color: colors.textHigh,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.ceruleanFixed,
                    borderRadius: AppRadii.borderFull,
                  ),
                  child: Text(
                    l10n.onboardingStep2Badge,
                    style: AppTypography.labelSm.copyWith(
                      color: colors.onCeruleanFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            l10n.onboardingPinSubtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMd.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              final isFilled = index < filledCount;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: InkWell(
                  onTap: () => onToggleDot(index),
                  borderRadius: AppRadii.borderFull,
                  child: Container(
                    width: 48.r,
                    height: 48.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled
                          ? colors.ceruleanPrimary
                          : colors.surfaceContainerLow,
                      border: isFilled
                          ? null
                          : Border.all(color: colors.ceruleanFixed),
                      boxShadow: isFilled
                          ? AppShadows.softCard(colors.shadowAmbient)
                          : null,
                    ),
                    child: Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFilled
                            ? colors.onPrimary
                            : colors.ceruleanPrimary,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
