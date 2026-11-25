import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/parent_dashboard_data.dart';

/// Juz Amma memorization progress breakdown card.
class JuzProgressBreakdownCard extends StatelessWidget {
  const JuzProgressBreakdownCard({super.key, required this.items});

  final List<JuzSurahProgressItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.borderHairline),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  l10n.parentJuzProgressTitle,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.headlineSm.copyWith(
                    color: colors.textHigh,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colors.brandPrimary,
                  borderRadius: AppRadii.borderFull,
                ),
                child: Text(
                  l10n.parentJuzProgressBadge,
                  style: AppTypography.labelMd.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _ProgressRow(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({required this.item});

  final JuzSurahProgressItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompleted = item.status == JuzSurahProgressStatus.completed;
    final isInProgress = item.status == JuzSurahProgressStatus.inProgress;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colors.cardSoftBlue,
        borderRadius: AppRadii.borderLg,
        border: Border.all(color: colors.cardSoftBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32.r,
                  height: 32.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? colors.brandPrimary
                        : (isInProgress
                              ? colors.cardSoftBorder
                              : colors.surfaceContainer),
                  ),
                  child: Text(
                    item.numberArabic,
                    style: AppTypography.labelMd.copyWith(
                      color: isCompleted
                          ? colors.onPrimary
                          : (isInProgress
                                ? colors.brandPrimary
                                : colors.onSurfaceVariant),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyLg.copyWith(
                      color: colors.textHigh,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: isCompleted || isInProgress
                  ? colors.pastelBlueSurface
                  : colors.surfaceContainerLow,
              borderRadius: AppRadii.borderFull,
              border: isCompleted || isInProgress
                  ? Border.all(color: colors.cardSoftBorder)
                  : null,
            ),
            child: Text(
              item.statusLabel,
              style: AppTypography.labelMd.copyWith(
                color: isCompleted
                    ? colors.brandPrimary
                    : (isInProgress
                          ? colors.brandSecondary
                          : colors.textSubdued),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
