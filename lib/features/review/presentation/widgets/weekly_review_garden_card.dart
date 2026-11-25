import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/review_overview.dart';

/// 7-day Review Garden card tracking daily review stars.
class WeeklyReviewGardenCard extends StatelessWidget {
  const WeeklyReviewGardenCard({super.key, required this.days});

  final List<ReviewDayStatus> days;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.cardSoftBorder),
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
                    Icon(
                      Icons.star_rounded,
                      size: 24.r,
                      color: colors.brandSecondary,
                    ),
                    SizedBox(width: 6.w),
                    Flexible(
                      child: Text(
                        l10n.reviewGardenTitle,
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colors.pastelBlueSurface,
                  borderRadius: AppRadii.borderFull,
                  border: Border.all(color: colors.cardSoftBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.reviewGardenProgress,
                      style: AppTypography.labelMd.copyWith(
                        color: colors.brandSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.star_rounded,
                      size: 16.r,
                      color: colors.brandSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((day) => _DayCircleItem(day: day)).toList(),
          ),
        ],
      ),
    );
  }
}

class _DayCircleItem extends StatelessWidget {
  const _DayCircleItem({required this.day});

  final ReviewDayStatus day;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompleted = day.state == ReviewDayState.completed;
    final isToday = day.state == ReviewDayState.today;
    final isLocked = day.state == ReviewDayState.locked;

    return Expanded(
      child: Column(
        children: [
          Text(
            day.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.labelSm.copyWith(
              color: isToday ? colors.brandPrimary : colors.textSubdued,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? colors.brandSecondary
                  : (isToday
                        ? colors.brandPrimary
                        : colors.surfaceContainerLow),
              border: isToday
                  ? Border.all(color: colors.brandSecondary, width: 2)
                  : null,
              boxShadow: isLocked
                  ? null
                  : AppShadows.tactileLip(
                      isToday ? colors.primary : colors.brandSecondaryHover,
                      offsetY: 3,
                    ),
            ),
            child: Icon(
              isCompleted
                  ? Icons.star_rounded
                  : (isToday
                        ? Icons.play_circle_filled_rounded
                        : Icons.lock_rounded),
              size: isLocked ? 18.r : 22.r,
              color: isLocked ? colors.textGhost : colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
