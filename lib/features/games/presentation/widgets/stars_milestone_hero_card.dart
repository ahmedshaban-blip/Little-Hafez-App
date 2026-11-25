import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Royal-blue gradient hero card showing total stars and level progress.
class StarsMilestoneHeroCard extends StatelessWidget {
  const StarsMilestoneHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.brandSecondaryHover, colors.brandPrimary],
        ),
        borderRadius: AppRadii.borderLg,
        boxShadow: AppShadows.softCard(colors.brandPrimary),
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
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: colors.onPrimary.withValues(alpha: 0.15),
                        borderRadius: AppRadii.borderLg,
                      ),
                      child: Icon(
                        Icons.military_tech_rounded,
                        size: 28.r,
                        color: colors.onPrimary,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.badgesTotalStarsLabel,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.labelMd.copyWith(
                              color: colors.focusRing,
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  l10n.badgesTotalStarsValue,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.headlineXlMobile
                                      .copyWith(
                                        color: colors.onPrimary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.star_rounded,
                                size: 22.r,
                                color: colors.onPrimary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: colors.onPrimary.withValues(alpha: 0.20),
                  borderRadius: AppRadii.borderFull,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      size: 16.r,
                      color: colors.onPrimary,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      l10n.badgesLevelValue,
                      style: AppTypography.labelSm.copyWith(
                        color: colors.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: colors.focusRing.withValues(alpha: 0.3)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  l10n.badgesNextMilestone,
                  style: AppTypography.labelSm.copyWith(
                    color: colors.onPrimary,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                l10n.badgesProgressPercent,
                style: AppTypography.labelMd.copyWith(
                  color: colors.focusRing,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: AppRadii.borderFull,
            child: LinearProgressIndicator(
              value: 0.85,
              minHeight: 10.h,
              backgroundColor: colors.brandPrimary.withValues(alpha: 0.45),
              valueColor: AlwaysStoppedAnimation<Color>(
                colors.secondaryFixedDim,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
