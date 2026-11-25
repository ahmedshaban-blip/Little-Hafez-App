import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';
import '../../domain/entities/child_onboarding_profile.dart';

/// Four-column mascot selection grid matching Stitch onboarding screen.
class MascotSelectorGrid extends StatelessWidget {
  const MascotSelectorGrid({
    super.key,
    required this.selectedMascot,
    required this.onSelectMascot,
  });

  final OnboardingMascot selectedMascot;
  final ValueChanged<OnboardingMascot> onSelectMascot;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mascots = [
      (OnboardingMascot.zayd, MascotAvatarType.zayd, l10n.mascotZayd),
      (OnboardingMascot.mariam, MascotAvatarType.mariam, l10n.mascotMariam),
      (OnboardingMascot.adam, MascotAvatarType.adam, l10n.mascotAdam),
      (OnboardingMascot.noor, MascotAvatarType.noor, l10n.mascotNoor),
    ];

    return Row(
      children: List.generate(mascots.length, (index) {
        final item = mascots[index];
        final isSelected = item.$1 == selectedMascot;
        return Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              end: index < mascots.length - 1 ? 8.w : 0,
            ),
            child: _MascotCard(
              avatarType: item.$2,
              label: item.$3,
              isSelected: isSelected,
              onTap: () => onSelectMascot(item.$1),
            ),
          ),
        );
      }),
    );
  }
}

class _MascotCard extends StatelessWidget {
  const _MascotCard({
    required this.avatarType,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final MascotAvatarType avatarType;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.borderXl,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: AppRadii.borderXl,
          border: Border.all(
            color: isSelected
                ? colors.ceruleanPrimary
                : colors.surfaceContainerLow,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? AppShadows.softCard(colors.shadowAmbient)
              : null,
        ),
        child: Column(
          children: [
            CustomAvatarIllustration(
              type: avatarType,
              size: 52,
              borderColor: isSelected
                  ? colors.ceruleanPrimary
                  : colors.ceruleanFixed,
              borderWidth: 2,
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              style: AppTypography.labelMd.copyWith(
                color: colors.textHigh,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
