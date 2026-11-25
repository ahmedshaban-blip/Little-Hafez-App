import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';

/// Child quick overview card with avatar, name/age, track, and stars pill.
class ChildOverviewCard extends StatelessWidget {
  const ChildOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.borderHairline),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomAvatarIllustration(
                  type: MascotAvatarType.zayd,
                  size: 62,
                  borderColor: colors.cardSoftBorder,
                  borderWidth: 2,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.parentChildNameAge,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.headlineMd.copyWith(
                          color: colors.textHigh,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        l10n.parentChildPath,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodySm.copyWith(
                          color: colors.textSubdued,
                        ),
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
              color: colors.pastelBlueSurface,
              borderRadius: AppRadii.borderFull,
              border: Border.all(color: colors.cardSoftBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 20.r,
                  color: colors.brandSecondary,
                ),
                SizedBox(width: 4.w),
                Text(
                  l10n.parentStarsArabic,
                  style: AppTypography.headlineSm.copyWith(
                    color: colors.brandPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
