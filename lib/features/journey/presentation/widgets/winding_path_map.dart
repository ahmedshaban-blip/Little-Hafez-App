import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../domain/entities/journey_overview.dart';
import 'active_stage_node.dart';
import 'locked_stage_node.dart';
import 'winding_path_painter.dart';

/// Winding S-curve canvas containing Stages 5 through 2.
class WindingPathMap extends StatelessWidget {
  const WindingPathMap({
    super.key,
    required this.stages,
    required this.onPlayActiveStage,
  });

  final List<SurahStage> stages;
  final VoidCallback onPlayActiveStage;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: WindingPathPainter(
                outerTrackColor: colors.primaryFixed.withValues(alpha: 0.7),
                innerDashColor: colors.brandSecondary,
              ),
            ),
          ),
          Column(
            children: [
              if (stages.isNotEmpty) LockedStageNode(stage: stages[0]),
              SizedBox(height: 28.h),
              if (stages.length > 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: LockedStageNode(stage: stages[1]),
                  ),
                ),
              SizedBox(height: 28.h),
              if (stages.length > 2)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: LockedStageNode(stage: stages[2]),
                  ),
                ),
              SizedBox(height: 18.h),
              ActiveStageNode(onPlayTap: onPlayActiveStage),
              SizedBox(height: 12.h),
              Container(
                width: 210.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHigh.withValues(alpha: 0.7),
                  borderRadius: AppRadii.borderFull,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
