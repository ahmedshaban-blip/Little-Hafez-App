import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';
import '../utils/l10n_extension.dart';
import 'custom_avatar_illustration.dart';

/// Shared child top bar used on Journey, Recite, Games, and Review screens.
class KidTopBar extends StatelessWidget {
  const KidTopBar({
    super.key,
    required this.onGateTap,
    required this.onProfileTap,
    this.useCeruleanAccent = false,
  });

  final VoidCallback onGateTap;
  final VoidCallback onProfileTap;
  final bool useCeruleanAccent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final accentColor = useCeruleanAccent
        ? colors.ceruleanPrimary
        : colors.brandPrimary;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: AppSpacing.marginMobile.w,
          end: AppSpacing.marginMobile.w,
          top: MediaQuery.paddingOf(context).top + 8.h,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          color: colors.surface.withValues(alpha: 0.94),
          boxShadow: AppShadows.softCard(colors.shadowAmbient),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: _ChildPill(label: l10n.childHeaderNameAge)),
            SizedBox(width: 6.w),
            Row(
              children: [
                _StreakStarsPill(
                  streakLabel: l10n.streakDaysShort,
                  starsLabel: l10n.starsCount240,
                  accentColor: accentColor,
                ),
                SizedBox(width: 6.w),
                _GatePillButton(label: l10n.gateButtonLabel, onTap: onGateTap),
                SizedBox(width: 6.w),
                InkWell(
                  onTap: onProfileTap,
                  borderRadius: AppRadii.borderFull,
                  child: Container(
                    width: 34.r,
                    height: 34.r,
                    decoration: BoxDecoration(
                      color: colors.ceruleanPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 18.r,
                      color: colors.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChildPill extends StatelessWidget {
  const _ChildPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(4.w, 4.h, 10.w, 4.h),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderFull,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomAvatarIllustration(
            type: MascotAvatarType.zayd,
            size: 28,
            borderWidth: 1,
          ),
          SizedBox(width: 6.w),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.labelMd.copyWith(
                color: colors.textHigh,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakStarsPill extends StatelessWidget {
  const _StreakStarsPill({
    required this.streakLabel,
    required this.starsLabel,
    required this.accentColor,
  });

  final String streakLabel;
  final String starsLabel;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: colors.ceruleanFixed.withValues(alpha: 0.45),
        borderRadius: AppRadii.borderFull,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_fire_department_rounded,
            size: 15.r,
            color: colors.textSubdued,
          ),
          SizedBox(width: 2.w),
          Text(
            streakLabel,
            style: AppTypography.labelMd.copyWith(color: colors.textSubdued),
          ),
          SizedBox(width: 6.w),
          Icon(Icons.star_rounded, size: 16.r, color: accentColor),
          SizedBox(width: 2.w),
          Text(
            starsLabel,
            style: AppTypography.labelMd.copyWith(
              color: accentColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _GatePillButton extends StatelessWidget {
  const _GatePillButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.borderFull,
      child: Container(
        height: 34.h,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHigh,
          borderRadius: AppRadii.borderFull,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_rounded, size: 15.r, color: colors.textSubdued),
            SizedBox(width: 4.w),
            Text(
              label,
              style: AppTypography.labelMd.copyWith(color: colors.textSubdued),
            ),
          ],
        ),
      ),
    );
  }
}
