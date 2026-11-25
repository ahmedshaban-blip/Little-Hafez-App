import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Top offline status & level pills on the Surah Journey Map.
class JourneyStatusStrip extends StatelessWidget {
  const JourneyStatusStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: colors.ceruleanContainer.withValues(alpha: 0.14),
                borderRadius: AppRadii.borderFull,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.cloud_done_rounded,
                    size: 15.r,
                    color: colors.ceruleanPrimary,
                  ),
                  SizedBox(width: 5.w),
                  Flexible(
                    child: Text(
                      l10n.journeyOfflineReady,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.labelSm.copyWith(
                        color: colors.ceruleanPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: colors.ceruleanFixed.withValues(alpha: 0.45),
              borderRadius: AppRadii.borderFull,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.workspace_premium_rounded,
                  size: 15.r,
                  color: colors.ceruleanPrimary,
                ),
                SizedBox(width: 4.w),
                Text(
                  l10n.journeyLevelHafiz,
                  style: AppTypography.labelSm.copyWith(
                    color: colors.ceruleanPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
