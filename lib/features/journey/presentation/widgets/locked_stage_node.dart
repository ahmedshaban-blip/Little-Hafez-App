import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../domain/entities/journey_overview.dart';

/// Renders locked or milestone island nodes on the Surah Journey Map.
class LockedStageNode extends StatelessWidget {
  const LockedStageNode({super.key, required this.stage});

  final SurahStage stage;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMilestone = stage.status == SurahStageStatus.milestone;
    final isRequirement = stage.status == SurahStageStatus.lockedRequirement;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: isMilestone ? 150.w : 145.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: isMilestone
                    ? colors.surfaceContainerHigh
                    : (isRequirement
                          ? colors.surfaceContainerLowest
                          : colors.surfaceContainer),
                borderRadius: AppRadii.borderXl,
                boxShadow: isRequirement
                    ? AppShadows.softCard(colors.shadowAmbient)
                    : AppShadows.tactileLip(
                        colors.steppingStoneShadow,
                        offsetY: 5,
                      ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: isMilestone
                          ? colors.ceruleanFixed
                          : (isRequirement
                                ? colors.surfaceContainerHigh
                                : colors.secondaryFixed),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isMilestone
                          ? Icons.emoji_events_rounded
                          : (isRequirement
                                ? Icons.lock_rounded
                                : Icons.diamond_rounded),
                      size: 22.r,
                      color: isMilestone || isRequirement
                          ? colors.ceruleanPrimary
                          : colors.textSubdued,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    stage.arabicTitle,
                    textAlign: TextAlign.center,
                    style: AppTypography.labelLg.copyWith(
                      color: isMilestone || isRequirement
                          ? colors.ceruleanPrimary
                          : colors.textHigh,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    stage.englishSubtitle,
                    textAlign: TextAlign.center,
                    style: AppTypography.labelSm.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  if (stage.requirementBadge != null) ...[
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.ceruleanFixed.withValues(alpha: 0.45),
                        borderRadius: AppRadii.borderFull,
                      ),
                      child: Text(
                        stage.requirementBadge!,
                        textAlign: TextAlign.center,
                        style: AppTypography.labelSm.copyWith(
                          color: colors.ceruleanPrimary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (!isRequirement)
              Positioned(
                top: -6.r,
                right: -6.r,
                child: Container(
                  width: 26.r,
                  height: 26.r,
                  decoration: BoxDecoration(
                    color: isMilestone
                        ? colors.ceruleanContainer
                        : colors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_rounded,
                    size: 14.r,
                    color: isMilestone ? colors.onPrimary : colors.outline,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SteppingStone(color: colors.surfaceVariant),
            SizedBox(width: 8.w),
            _SteppingStone(
              color: isRequirement
                  ? colors.ceruleanFixedDim
                  : colors.surfaceVariant,
            ),
          ],
        ),
      ],
    );
  }
}

class _SteppingStone extends StatelessWidget {
  const _SteppingStone({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 14.w,
      height: 11.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadii.borderFull,
        boxShadow: AppShadows.tactileLip(
          colors.steppingStoneShadow,
          offsetY: 2,
        ),
      ),
    );
  }
}
