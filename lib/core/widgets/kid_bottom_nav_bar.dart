import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';
import '../utils/l10n_extension.dart';

/// Shared 5-tab bottom navigation bar matching Stitch screens 2 through 6.
class KidBottomNavBar extends StatelessWidget {
  const KidBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final items = [
      (Icons.explore_rounded, l10n.navJourney, colors.ceruleanPrimary),
      (Icons.record_voice_over_rounded, l10n.navRecite, colors.primary),
      (Icons.sports_esports_rounded, l10n.navGames, colors.ceruleanPrimary),
      (Icons.history_edu_rounded, l10n.navReview, colors.brandSecondary),
      (Icons.admin_panel_settings_rounded, l10n.navParent, colors.brandPrimary),
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 6.w,
          end: 6.w,
          top: 8.h,
          bottom: MediaQuery.paddingOf(context).bottom + 8.h,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLowest.withValues(alpha: 0.96),
          border: Border(top: BorderSide(color: colors.borderHairline)),
          boxShadow: AppShadows.softCard(colors.shadowAmbient),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == currentIndex;
            return _NavTabItem(
              icon: item.$1,
              label: item.$2,
              activeColor: item.$3,
              isSelected: isSelected,
              onTap: () => onTabSelected(index),
            );
          }),
        ),
      ),
    );
  }
}

class _NavTabItem extends StatelessWidget {
  const _NavTabItem({
    required this.icon,
    required this.label,
    required this.activeColor,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color activeColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.borderLg,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: BoxConstraints(minWidth: 56.w, minHeight: 54.h),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.w,
          vertical: 6.h,
        ),
        decoration: isSelected
            ? BoxDecoration(
                color: activeColor,
                borderRadius: AppRadii.borderLg,
                boxShadow: AppShadows.tactileLip(colors.primary, offsetY: 3),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24.r,
              color: isSelected ? colors.onPrimary : colors.textSubdued,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: AppTypography.labelSm.copyWith(
                color: isSelected ? colors.onPrimary : colors.textSubdued,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
