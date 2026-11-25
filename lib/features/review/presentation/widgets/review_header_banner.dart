import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Soft blue gradient header banner for Spaced Repetition Review.
class ReviewHeaderBanner extends StatelessWidget {
  const ReviewHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.pastelBlueSurface, colors.cardSoftBorder],
        ),
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.cardSoftBorder),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.reviewBannerTitle,
                  style: AppTypography.headlineLgMobile.copyWith(
                    color: colors.textHigh,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  l10n.reviewBannerSubtitle,
                  style: AppTypography.bodyMd.copyWith(
                    color: colors.textSubdued,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 54.r,
            height: 54.r,
            decoration: BoxDecoration(
              color: colors.brandPrimary,
              shape: BoxShape.circle,
              border: Border.all(color: colors.onPrimary, width: 1.5),
            ),
            child: Icon(
              Icons.hotel_class_rounded,
              size: 28.r,
              color: colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
