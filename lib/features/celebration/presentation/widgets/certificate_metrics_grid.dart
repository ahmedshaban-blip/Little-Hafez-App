import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/completion_certificate.dart';

/// Three-column achievement metrics grid inside the Honor Certificate Card.
class CertificateMetricsGrid extends StatelessWidget {
  const CertificateMetricsGrid({super.key, required this.certificate});

  final CompletionCertificate certificate;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: _MetricTile(
            icon: Icons.menu_book_rounded,
            iconColor: colors.ceruleanPrimary,
            label: l10n.celebrationMetricSurahLabel,
            value: certificate.surahName,
            sublabel: certificate.ayahCountLabel,
            subColor: colors.ceruleanPrimary,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _MetricTile(
            icon: Icons.check_circle_rounded,
            iconColor: colors.ceruleanContainer,
            label: l10n.celebrationMetricAccuracyLabel,
            value: certificate.accuracyValue,
            sublabel: certificate.accuracyNote,
            subColor: colors.ceruleanContainer,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _MetricTile(
            icon: Icons.grade_rounded,
            iconColor: colors.ceruleanPrimary,
            label: l10n.celebrationMetricRewardLabel,
            value: certificate.rewardValue,
            sublabel: certificate.rewardNote,
            subColor: colors.ceruleanPrimary,
          ),
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.sublabel,
    required this.subColor,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String sublabel;
  final Color subColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: AppRadii.borderLg,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          Icon(icon, size: 22.r, color: iconColor),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTypography.labelSm.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: AppTypography.labelLg.copyWith(
              color: colors.textHigh,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            sublabel,
            textAlign: TextAlign.center,
            style: AppTypography.labelSm.copyWith(
              color: subColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
