import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Top metadata card showing Surah Al-Ikhlas title, ayah count, and Juz badge.
class SurahMetadataCard extends StatelessWidget {
  const SurahMetadataCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 34.r,
                  height: 34.r,
                  decoration: BoxDecoration(
                    color: colors.ceruleanFixed,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.auto_stories_rounded,
                    size: 18.r,
                    color: colors.onCeruleanFixed,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.reciteSurahNameAr,
                        style: AppTypography.headlineMd.copyWith(
                          color: colors.textHigh,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        l10n.reciteSurahMeta,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.labelSm.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: colors.pastelBlueSurface,
              borderRadius: AppRadii.borderFull,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_rounded,
                  size: 14.r,
                  color: colors.brandSecondary,
                ),
                SizedBox(width: 4.w),
                Text(
                  l10n.reciteJuzBadge,
                  style: AppTypography.labelSm.copyWith(
                    color: colors.brandSecondary,
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
