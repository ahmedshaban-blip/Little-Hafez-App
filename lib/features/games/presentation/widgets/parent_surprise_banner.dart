import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Dashed border parental gift surprise banner card.
class ParentSurpriseBanner extends StatelessWidget {
  const ParentSurpriseBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: colors.pastelBlueSurface,
        borderRadius: AppRadii.borderMd,
        border: Border.all(color: colors.brandSecondary, width: 1.4),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: colors.brandSecondary,
              borderRadius: AppRadii.borderMd,
            ),
            child: Icon(
              Icons.redeem_rounded,
              size: 24.r,
              color: colors.onSecondary,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.badgesParentGiftTitle,
                  style: AppTypography.labelLg.copyWith(
                    color: colors.brandPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  l10n.badgesParentGiftSubtitle,
                  style: AppTypography.labelSm.copyWith(
                    color: colors.brandSecondary,
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
