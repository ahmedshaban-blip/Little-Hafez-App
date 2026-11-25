import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/review_overview.dart';

/// Individual Surah review card with Start Review CTA button.
class ReviewSurahCard extends StatelessWidget {
  const ReviewSurahCard({
    super.key,
    required this.task,
    required this.onStartReview,
  });

  final ReviewSurahTask task;
  final VoidCallback onStartReview;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final buttonBg = task.isPrimaryNavyButton
        ? colors.brandPrimary
        : colors.brandSecondary;
    final buttonLip = task.isPrimaryNavyButton
        ? colors.primary
        : colors.brandSecondaryHover;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.headlineXlMobile.copyWith(
                        color: colors.brandPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      task.subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMd.copyWith(
                        color: colors.textSubdued,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 52.r,
                height: 52.r,
                decoration: BoxDecoration(
                  color: colors.pastelBlueSurface,
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.cardSoftBorder),
                ),
                child: Icon(
                  task.isPrimaryNavyButton
                      ? Icons.menu_book_rounded
                      : Icons.star_rounded,
                  size: 26.r,
                  color: colors.brandPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: buttonBg,
                borderRadius: AppRadii.borderFull,
                boxShadow: AppShadows.tactileLip(buttonLip, offsetY: 4),
              ),
              child: ElevatedButton.icon(
                onPressed: onStartReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonBg,
                  foregroundColor: colors.onPrimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadii.borderFull,
                  ),
                ),
                icon: Icon(Icons.play_circle_outline_rounded, size: 24.r),
                label: Text(
                  l10n.reviewStartCta,
                  style: AppTypography.headlineMd.copyWith(
                    color: colors.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
