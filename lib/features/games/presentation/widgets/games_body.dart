import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/kid_top_bar.dart';
import '../../domain/entities/games_vault_data.dart';
import 'ayah_ordering_game_view.dart';
import 'badges_vault_view.dart';
import 'games_section_switcher.dart';

/// Pure layout composition for Games & Badges Vault screen.
class GamesBody extends StatelessWidget {
  const GamesBody({
    super.key,
    required this.data,
    required this.activeSection,
    required this.selectedModeIndex,
    required this.selectedAyahIndex,
    required this.onSelectSection,
    required this.onSelectMode,
    required this.onSelectAyah,
    required this.onVerifyTap,
    required this.onGateTap,
    required this.onProfileTap,
  });

  final GamesVaultData data;
  final GamesSection activeSection;
  final int selectedModeIndex;
  final int selectedAyahIndex;
  final ValueChanged<GamesSection> onSelectSection;
  final ValueChanged<int> onSelectMode;
  final ValueChanged<int> onSelectAyah;
  final VoidCallback onVerifyTap;
  final VoidCallback onGateTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KidTopBar(onGateTap: onGateTap, onProfileTap: onProfileTap),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              10.h,
              AppSpacing.marginMobile.w,
              24.h,
            ),
            child: Column(
              children: [
                GamesSectionSwitcher(
                  activeSection: activeSection,
                  onSelectSection: onSelectSection,
                ),
                SizedBox(height: 16.h),
                if (activeSection == GamesSection.badges)
                  BadgesVaultView(badges: data.badges)
                else
                  AyahOrderingGameView(
                    ayahItems: data.ayahItems,
                    selectedModeIndex: selectedModeIndex,
                    selectedAyahIndex: selectedAyahIndex,
                    onSelectMode: onSelectMode,
                    onSelectAyah: onSelectAyah,
                    onVerifyTap: onVerifyTap,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
