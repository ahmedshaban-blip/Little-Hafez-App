import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Top bar and festive celebratory medal header for Surah Completion screen.
class CelebrationHeader extends StatelessWidget {
  const CelebrationHeader({super.key, required this.onCloseTap});

  final VoidCallback onCloseTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onCloseTap,
              borderRadius: AppRadii.borderFull,
              child: Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerLowest,
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.softCard(colors.shadowAmbient),
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 26.r,
                  color: colors.ceruleanPrimary,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colors.ceruleanFixed,
                borderRadius: AppRadii.borderFull,
                boxShadow: AppShadows.softCard(colors.shadowAmbient),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.workspace_premium_rounded,
                    size: 18.r,
                    color: colors.onCeruleanFixed,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    l10n.celebrationTopBadge,
                    style: AppTypography.labelMd.copyWith(
                      color: colors.onCeruleanFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 44.r),
          ],
        ),
        SizedBox(height: 16.h),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 80.r,
              height: 80.r,
              decoration: BoxDecoration(
                color: colors.ceruleanFixed,
                shape: BoxShape.circle,
                boxShadow: AppShadows.softCard(colors.ceruleanPrimary),
              ),
              child: Icon(
                Icons.military_tech_rounded,
                size: 44.r,
                color: colors.ceruleanPrimary,
              ),
            ),
            Positioned(
              top: -6,
              right: -2,
              child: Icon(
                Icons.auto_awesome_rounded,
                size: 24.r,
                color: colors.ceruleanContainer,
              ),
            ),
            Positioned(
              bottom: -2,
              left: -8,
              child: Icon(
                Icons.star_rounded,
                size: 22.r,
                color: colors.ceruleanPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          l10n.celebrationTitle,
          textAlign: TextAlign.center,
          style: AppTypography.headlineXlMobile.copyWith(
            color: colors.ceruleanPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 4.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300.w),
          child: Text(
            l10n.celebrationSubtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyLg.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
