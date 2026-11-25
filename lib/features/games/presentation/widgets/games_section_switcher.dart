import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/games_vault_data.dart';

/// Top segmented switcher between Memorization Games and Badges Vault.
class GamesSectionSwitcher extends StatelessWidget {
  const GamesSectionSwitcher({
    super.key,
    required this.activeSection,
    required this.onSelectSection,
  });

  final GamesSection activeSection;
  final ValueChanged<GamesSection> onSelectSection;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: colors.pastelBlueSurface,
        borderRadius: AppRadii.borderLg,
        border: Border.all(color: colors.pastelBlueBorder),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SwitcherTab(
              icon: Icons.military_tech_rounded,
              label: l10n.gamesTabBadges,
              isSelected: activeSection == GamesSection.badges,
              onTap: () => onSelectSection(GamesSection.badges),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _SwitcherTab(
              icon: Icons.sports_esports_rounded,
              label: l10n.gamesTabMemorization,
              isSelected: activeSection == GamesSection.games,
              onTap: () => onSelectSection(GamesSection.games),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwitcherTab extends StatelessWidget {
  const _SwitcherTab({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.borderMd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected
              ? colors.brandSecondary
              : colors.surfaceContainerLowest.withValues(alpha: 0),
          borderRadius: AppRadii.borderMd,
          boxShadow: isSelected
              ? AppShadows.tactileLip(colors.brandPrimary, offsetY: 3)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.r,
              color: isSelected ? colors.onSecondary : colors.brandPrimary,
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.labelLg.copyWith(
                  color: isSelected ? colors.onSecondary : colors.brandPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
