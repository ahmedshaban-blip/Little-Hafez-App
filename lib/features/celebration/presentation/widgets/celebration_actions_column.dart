import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Three giant tactile action buttons at the bottom of Celebration screen.
class CelebrationActionsColumn extends StatelessWidget {
  const CelebrationActionsColumn({
    super.key,
    required this.isPlayingRecitation,
    required this.onNextSurahTap,
    required this.onListenTap,
    required this.onShareTap,
  });

  final bool isPlayingRecitation;
  final VoidCallback onNextSurahTap;
  final VoidCallback onListenTap;
  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 62.h,
          child: ElevatedButton.icon(
            onPressed: onNextSurahTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.ceruleanPrimary,
              foregroundColor: colors.onPrimary,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.borderFull,
              ),
              elevation: 4,
            ),
            iconAlignment: IconAlignment.end,
            icon: Icon(Icons.arrow_forward_rounded, size: 24.r),
            label: Text(
              l10n.celebrationNextSurahCta,
              style: AppTypography.headlineMd.copyWith(
                color: colors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: FilledButton.icon(
            onPressed: onListenTap,
            style: FilledButton.styleFrom(
              backgroundColor: colors.surfaceContainer,
              foregroundColor: colors.ceruleanPrimary,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.borderFull,
              ),
            ),
            icon: Icon(
              isPlayingRecitation
                  ? Icons.pause_circle_rounded
                  : Icons.headphones_rounded,
              size: 24.r,
            ),
            label: Text(
              l10n.celebrationListenCta,
              style: AppTypography.labelLg.copyWith(
                color: colors.ceruleanPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: FilledButton.icon(
            onPressed: onShareTap,
            style: FilledButton.styleFrom(
              backgroundColor: colors.surfaceContainerLowest,
              foregroundColor: colors.textHigh,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.borderFull,
              ),
            ),
            icon: Icon(
              Icons.share_rounded,
              size: 20.r,
              color: colors.ceruleanPrimary,
            ),
            label: Text(
              l10n.celebrationShareCta,
              style: AppTypography.labelMd.copyWith(
                color: colors.textHigh,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
