import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';

/// Bottom Little Hafiz mascot encouragement quote card.
class MascotEncouragementCard extends StatelessWidget {
  const MascotEncouragementCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.pastelBlueSurface,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.cardSoftBorder),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomAvatarIllustration(
                type: MascotAvatarType.zayd,
                size: 56,
                borderColor: colors.onPrimary,
                borderWidth: 2,
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Icon(
                  Icons.star_rounded,
                  size: 20.r,
                  color: colors.brandSecondary,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: colors.surfaceContainerLowest,
                borderRadius: AppRadii.borderLg,
                border: Border.all(color: colors.cardSoftBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.reviewMascotTitle,
                    style: AppTypography.labelLg.copyWith(
                      color: colors.brandPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    l10n.reviewMascotQuote,
                    style: AppTypography.bodyMd.copyWith(
                      color: colors.brandPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
