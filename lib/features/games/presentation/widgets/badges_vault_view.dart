import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/games_vault_data.dart';
import 'badge_grid_card.dart';
import 'parent_surprise_banner.dart';
import 'stars_milestone_hero_card.dart';

/// Badges Vault section view matching games_and_badges_vault.jpg.
class BadgesVaultView extends StatelessWidget {
  const BadgesVaultView({super.key, required this.badges});

  final List<BadgeItem> badges;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Column(
      children: [
        const StarsMilestoneHeroCard(),
        SizedBox(height: 14.h),
        const ParentSurpriseBanner(),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.hotel_class_rounded,
                    size: 22.r,
                    color: colors.brandSecondary,
                  ),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      l10n.badgesSectionTitle,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.headlineMd.copyWith(
                        color: colors.brandPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colors.pastelBlueSurface,
                borderRadius: AppRadii.borderFull,
              ),
              child: Text(
                l10n.badgesTotalCount,
                style: AppTypography.labelSm.copyWith(
                  color: colors.brandSecondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: badges.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.96,
          ),
          itemBuilder: (context, index) => BadgeGridCard(badge: badges[index]),
        ),
      ],
    );
  }
}
