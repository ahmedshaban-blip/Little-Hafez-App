import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Bottom Daily Mission card with tactile Start Today's Lesson button.
class DailyMissionCard extends StatelessWidget {
  const DailyMissionCard({super.key, required this.onStartLesson});

  final VoidCallback onStartLesson;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md.r),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          borderRadius: AppRadii.borderXl,
          boxShadow: AppShadows.tier2Floating(colors.shadowAmbient),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: colors.ceruleanFixed,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.flag_circle_rounded,
                    size: 22.r,
                    color: colors.ceruleanPrimary,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              l10n.journeyDailyMission,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.labelMd.copyWith(
                                color: colors.ceruleanPrimary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: colors.ceruleanFixed,
                              borderRadius: AppRadii.borderFull,
                            ),
                            child: Text(
                              l10n.journeyMissionBonus,
                              style: AppTypography.labelSm.copyWith(
                                color: colors.ceruleanPrimary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        l10n.journeyMissionBody,
                        style: AppTypography.bodySm.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      size: 18.r,
                      color: colors.textSubdued,
                    ),
                    Text(
                      l10n.journeyMissionFlame,
                      style: AppTypography.labelMd.copyWith(
                        color: colors.textSubdued,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.ceruleanPrimary,
                  borderRadius: AppRadii.borderFull,
                  boxShadow: AppShadows.tactileLip(colors.primary, offsetY: 4),
                ),
                child: ElevatedButton.icon(
                  onPressed: onStartLesson,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.ceruleanPrimary,
                    foregroundColor: colors.onPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadii.borderFull,
                    ),
                  ),
                  icon: const Icon(Icons.play_circle_outline_rounded),
                  label: Text(
                    l10n.journeyStartLessonCta,
                    style: AppTypography.labelLg.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
