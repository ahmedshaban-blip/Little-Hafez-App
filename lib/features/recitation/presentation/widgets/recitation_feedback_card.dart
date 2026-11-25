import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// 3-star recitation feedback card with replay and retry buttons.
class RecitationFeedbackCard extends StatelessWidget {
  const RecitationFeedbackCard({
    super.key,
    required this.isReplayingChild,
    required this.onReplayTap,
    required this.onRetryTap,
  });

  final bool isReplayingChild;
  final VoidCallback onReplayTap;
  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.secondaryFixed, width: 1.5),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rounded, size: 34.r, color: colors.secondary),
              SizedBox(width: 6.w),
              Icon(Icons.star_rounded, size: 42.r, color: colors.secondary),
              SizedBox(width: 6.w),
              Icon(Icons.star_rounded, size: 34.r, color: colors.secondary),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            l10n.reciteFeedbackPraise,
            textAlign: TextAlign.center,
            style: AppTypography.headlineMd.copyWith(
              color: colors.textHigh,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: onReplayTap,
                  borderRadius: AppRadii.borderFull,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerLow,
                      borderRadius: AppRadii.borderFull,
                      border: Border.all(color: colors.secondaryFixed),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isReplayingChild
                              ? Icons.pause_circle_rounded
                              : Icons.play_circle_outline_rounded,
                          size: 20.r,
                          color: colors.secondary,
                        ),
                        SizedBox(width: 6.w),
                        Flexible(
                          child: Text(
                            l10n.reciteListenRecording,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.labelMd.copyWith(
                              color: colors.secondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: onRetryTap,
                borderRadius: AppRadii.borderFull,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerLowest,
                    borderRadius: AppRadii.borderFull,
                    border: Border.all(color: colors.outlineVariant),
                  ),
                  child: Text(
                    l10n.reciteRetry,
                    style: AppTypography.labelMd.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
