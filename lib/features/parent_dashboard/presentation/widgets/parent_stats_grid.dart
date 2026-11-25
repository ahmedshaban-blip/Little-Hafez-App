import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Three-column summary metrics grid (Surahs memorized, Practice, Accuracy).
class ParentStatsGrid extends StatelessWidget {
  const ParentStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: _StatTile(
            value: l10n.parentStatSurahsValue,
            label: l10n.parentStatSurahsLabel,
            valueColor: colors.brandPrimary,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatTile(
            value: l10n.parentStatPracticeValue,
            label: l10n.parentStatPracticeLabel,
            valueColor: colors.brandSecondary,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatTile(
            value: l10n.parentStatAccuracyValue,
            label: l10n.parentStatAccuracyLabel,
            valueColor: colors.brandPrimary,
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    required this.valueColor,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        border: Border.all(color: colors.borderHairline),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTypography.headlineMd.copyWith(
              color: valueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.labelMd.copyWith(
              color: colors.textSubdued,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
