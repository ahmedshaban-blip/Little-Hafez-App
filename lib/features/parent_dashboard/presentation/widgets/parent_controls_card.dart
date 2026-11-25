import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Parent protection & learning settings card with two custom pill switches.
class ParentControlsCard extends StatelessWidget {
  const ParentControlsCard({
    super.key,
    required this.screenTimeEnabled,
    required this.sheikhVoiceEnabled,
    required this.onToggleScreenTime,
    required this.onToggleSheikhVoice,
  });

  final bool screenTimeEnabled;
  final bool sheikhVoiceEnabled;
  final VoidCallback onToggleScreenTime;
  final VoidCallback onToggleSheikhVoice;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.parentControlsTitle,
            style: AppTypography.headlineSm.copyWith(
              color: colors.textHigh,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h),
          _ControlSwitchTile(
            icon: Icons.timer_rounded,
            title: l10n.parentScreenTimeTitle,
            subtitle: l10n.parentScreenTimeSubtitle,
            value: screenTimeEnabled,
            onTap: onToggleScreenTime,
          ),
          SizedBox(height: 10.h),
          _ControlSwitchTile(
            icon: Icons.record_voice_over_rounded,
            title: l10n.parentSheikhVoiceTitle,
            subtitle: l10n.parentSheikhVoiceSubtitle,
            value: sheikhVoiceEnabled,
            onTap: onToggleSheikhVoice,
          ),
        ],
      ),
    );
  }
}

class _ControlSwitchTile extends StatelessWidget {
  const _ControlSwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colors.cardSoftBlue,
        borderRadius: AppRadii.borderLg,
        border: Border.all(color: colors.cardSoftBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 38.r,
                  height: 38.r,
                  decoration: BoxDecoration(
                    color: colors.pastelBlueSurface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 20.r, color: colors.brandSecondary),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodyMd.copyWith(
                          color: colors.textHigh,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.labelSm.copyWith(
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
          InkWell(
            onTap: onTap,
            borderRadius: AppRadii.borderFull,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 50.w,
              height: 28.h,
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                color: value ? colors.brandPrimary : colors.surfaceVariant,
                borderRadius: AppRadii.borderFull,
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 180),
                alignment: value
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                child: Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    color: colors.onPrimary,
                    shape: BoxShape.circle,
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
