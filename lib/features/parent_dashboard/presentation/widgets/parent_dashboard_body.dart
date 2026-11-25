import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/parent_dashboard_data.dart';
import 'child_overview_card.dart';
import 'juz_progress_breakdown_card.dart';
import 'parent_controls_card.dart';
import 'parent_stats_grid.dart';
import 'parent_top_bar.dart';

/// Pure layout composition for Parent Dashboard screen.
class ParentDashboardBody extends StatelessWidget {
  const ParentDashboardBody({
    super.key,
    required this.data,
    required this.screenTimeEnabled,
    required this.sheikhVoiceEnabled,
    required this.onToggleScreenTime,
    required this.onToggleSheikhVoice,
    required this.onPinLockTap,
  });

  final ParentDashboardData data;
  final bool screenTimeEnabled;
  final bool sheikhVoiceEnabled;
  final VoidCallback onToggleScreenTime;
  final VoidCallback onToggleSheikhVoice;
  final VoidCallback onPinLockTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Column(
      children: [
        ParentTopBar(onPinLockTap: onPinLockTap),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              14.h,
              AppSpacing.marginMobile.w,
              24.h,
            ),
            child: Column(
              children: [
                const ChildOverviewCard(),
                SizedBox(height: 14.h),
                const ParentStatsGrid(),
                SizedBox(height: 14.h),
                JuzProgressBreakdownCard(items: data.surahBreakdown),
                SizedBox(height: 14.h),
                ParentControlsCard(
                  screenTimeEnabled: screenTimeEnabled,
                  sheikhVoiceEnabled: sheikhVoiceEnabled,
                  onToggleScreenTime: onToggleScreenTime,
                  onToggleSheikhVoice: onToggleSheikhVoice,
                ),
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.pastelBlueSurface,
                    borderRadius: AppRadii.borderXl,
                    border: Border.all(color: colors.cardSoftBorder),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_rounded,
                        size: 18.r,
                        color: colors.brandSecondary,
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          l10n.parentSafeBadge,
                          textAlign: TextAlign.center,
                          style: AppTypography.labelSm.copyWith(
                            color: colors.textSubdued,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
