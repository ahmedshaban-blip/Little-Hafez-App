import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/kid_top_bar.dart';
import '../../domain/entities/journey_overview.dart';
import 'current_surah_summary_card.dart';
import 'daily_mission_card.dart';
import 'journey_status_strip.dart';
import 'winding_path_map.dart';

/// Pure layout composition for the Surah Journey Map screen.
class JourneyBody extends StatelessWidget {
  const JourneyBody({
    super.key,
    required this.overview,
    required this.onPlayActiveStage,
    required this.onStartLesson,
    required this.onGateTap,
    required this.onProfileTap,
  });

  final JourneyOverview overview;
  final VoidCallback onPlayActiveStage;
  final VoidCallback onStartLesson;
  final VoidCallback onGateTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KidTopBar(
          onGateTap: onGateTap,
          onProfileTap: onProfileTap,
          useCeruleanAccent: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              10.h,
              AppSpacing.marginMobile.w,
              20.h,
            ),
            child: Column(
              children: [
                const JourneyStatusStrip(),
                SizedBox(height: 12.h),
                CurrentSurahSummaryCard(progressRatio: overview.progressRatio),
                SizedBox(height: 18.h),
                WindingPathMap(
                  stages: overview.stages,
                  onPlayActiveStage: onPlayActiveStage,
                ),
                SizedBox(height: 18.h),
                DailyMissionCard(onStartLesson: onStartLesson),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
