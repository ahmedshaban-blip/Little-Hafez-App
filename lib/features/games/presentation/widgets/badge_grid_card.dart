import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/games_vault_data.dart';

/// Individual achievement badge card (completed, in-progress, or locked).
class BadgeGridCard extends StatelessWidget {
  const BadgeGridCard({super.key, required this.badge});

  final BadgeItem badge;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final isCompleted = badge.status == BadgeStatus.completed;
    final isInProgress = badge.status == BadgeStatus.inProgress;
    final isLocked = badge.status == BadgeStatus.locked;

    final iconData = switch (badge.id) {
      'fatihah' => Icons.menu_book_rounded,
      'nightingale' => Icons.mic_rounded,
      'ikhlas' => Icons.auto_stories_rounded,
      'weekly' => Icons.emoji_events_rounded,
      'fajr' => Icons.wb_twilight_rounded,
      _ => Icons.workspace_premium_rounded,
    };

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isLocked ? colors.lockedSurface : colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderLg,
        border: Border.all(
          color: isCompleted
              ? colors.brandSecondary
              : (isInProgress
                    ? colors.brandSecondaryHover
                    : colors.lockedBorder),
          width: isLocked ? 1.5 : 2,
        ),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            end: 0,
            child: _BadgeStatusChip(
              isCompleted: isCompleted,
              isInProgress: isInProgress,
              completedLabel: l10n.badgeCompletedChip,
              progressLabel: l10n.badgeInProgressPercent,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 18.h),
                Container(
                  width: 54.r,
                  height: 54.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? colors.brandSecondary
                        : (isInProgress
                              ? colors.ceruleanContainer
                              : colors.lockedBorder),
                    border: isLocked
                        ? null
                        : Border.all(color: colors.pastelBlueBorder, width: 4),
                  ),
                  child: Icon(
                    iconData,
                    size: 26.r,
                    color: isLocked ? colors.lockedIcon : colors.onPrimary,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  badge.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.labelLg.copyWith(
                    color: isLocked ? colors.lockedIcon : colors.brandPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  badge.subtitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.labelSm.copyWith(
                    color: isInProgress
                        ? colors.brandSecondary
                        : colors.textSubdued,
                  ),
                ),
                if (isInProgress) ...[
                  SizedBox(height: 8.h),
                  ClipRRect(
                    borderRadius: AppRadii.borderFull,
                    child: LinearProgressIndicator(
                      value: badge.progressRatio,
                      minHeight: 6.h,
                      backgroundColor: colors.borderHairline,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colors.brandSecondary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeStatusChip extends StatelessWidget {
  const _BadgeStatusChip({
    required this.isCompleted,
    required this.isInProgress,
    required this.completedLabel,
    required this.progressLabel,
  });

  final bool isCompleted;
  final bool isInProgress;
  final String completedLabel;
  final String progressLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (!isCompleted && !isInProgress) {
      return Container(
        width: 24.r,
        height: 24.r,
        decoration: BoxDecoration(
          color: colors.borderHairline,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.lock_rounded, size: 14.r, color: colors.lockedIcon),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isCompleted ? colors.pastelBlueSurface : colors.skyBadgeBg,
        borderRadius: AppRadii.borderFull,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCompleted) ...[
            Icon(
              Icons.check_circle_rounded,
              size: 12.r,
              color: colors.brandSecondary,
            ),
            SizedBox(width: 2.w),
          ],
          Text(
            isCompleted ? completedLabel : progressLabel,
            style: AppTypography.labelSm.copyWith(
              fontSize: 10.sp,
              color: isCompleted ? colors.brandSecondary : colors.skyBadgeText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
