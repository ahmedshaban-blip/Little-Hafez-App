import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Current Surah summary card with progress bar and next surah indicator.
class CurrentSurahSummaryCard extends StatelessWidget {
  const CurrentSurahSummaryCard({super.key, required this.progressRatio});

  final double progressRatio;

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
          boxShadow: AppShadows.softCard(colors.shadowAmbient),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 38.r,
                        height: 38.r,
                        decoration: BoxDecoration(
                          color: colors.secondaryFixed.withValues(alpha: 0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.auto_stories_rounded,
                          size: 20.r,
                          color: colors.textSubdued,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.journeyCurrentSurahLabel,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.labelSm.copyWith(
                                color: colors.onSurfaceVariant,
                                letterSpacing: 0.8,
                              ),
                            ),
                            Text(
                              l10n.journeyCurrentSurahTitle,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.headlineMd.copyWith(
                                color: colors.textHigh,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 18.r,
                          color: colors.ceruleanPrimary,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          l10n.journeyAyahProgress,
                          style: AppTypography.labelMd.copyWith(
                            color: colors.ceruleanPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      l10n.journeyMastered,
                      style: AppTypography.labelSm.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: AppRadii.borderFull,
              child: LinearProgressIndicator(
                value: progressRatio,
                minHeight: 10.h,
                backgroundColor: colors.surfaceContainer,
                valueColor: AlwaysStoppedAnimation<Color>(
                  colors.ceruleanPrimary,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        size: 15.r,
                        color: colors.ceruleanPrimary,
                      ),
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text(
                          l10n.journeyPerfectMemorizer,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.labelSm.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    l10n.journeyNextSurahLabel,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.labelSm.copyWith(
                      color: colors.textSubdued,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
