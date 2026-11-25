import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/kid_top_bar.dart';
import '../../domain/entities/review_overview.dart';
import 'mascot_encouragement_card.dart';
import 'review_header_banner.dart';
import 'review_surah_card.dart';
import 'weekly_review_garden_card.dart';

/// Pure layout composition for Spaced Repetition Review screen.
class ReviewBody extends StatelessWidget {
  const ReviewBody({
    super.key,
    required this.overview,
    required this.onStartReview,
    required this.onGateTap,
    required this.onProfileTap,
  });

  final ReviewOverview overview;
  final VoidCallback onStartReview;
  final VoidCallback onGateTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Column(
      children: [
        KidTopBar(onGateTap: onGateTap, onProfileTap: onProfileTap),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              10.h,
              AppSpacing.marginMobile.w,
              24.h,
            ),
            child: Column(
              children: [
                const ReviewHeaderBanner(),
                SizedBox(height: 16.h),
                WeeklyReviewGardenCard(days: overview.days),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_stories_rounded,
                            size: 26.r,
                            color: colors.brandSecondary,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Text(
                              l10n.reviewTodayTitle,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.headlineMd.copyWith(
                                color: colors.textHigh,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.pastelBlueSurface,
                        borderRadius: AppRadii.borderFull,
                        border: Border.all(color: colors.cardSoftBorder),
                      ),
                      child: Text(
                        l10n.reviewSurahsReady,
                        style: AppTypography.labelMd.copyWith(
                          color: colors.brandPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                ...overview.tasks.map(
                  (task) => Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: ReviewSurahCard(
                      task: task,
                      onStartReview: onStartReview,
                    ),
                  ),
                ),
                const MascotEncouragementCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
