import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Tactile Sheikh Al-Minshawi audio player strip.
class SheikhAudioStrip extends StatelessWidget {
  const SheikhAudioStrip({
    super.key,
    required this.isPlaying,
    required this.onTogglePlay,
  });

  final bool isPlaying;
  final VoidCallback onTogglePlay;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.brandPrimary,
            borderRadius: AppRadii.borderFull,
            boxShadow: AppShadows.tactileLip(colors.primary, offsetY: 4),
          ),
          child: ElevatedButton.icon(
            onPressed: onTogglePlay,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.brandPrimary,
              foregroundColor: colors.onPrimary,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.borderFull,
              ),
            ),
            icon: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 28.r,
            ),
            label: Text(
              isPlaying ? l10n.recitePauseSheikh : l10n.reciteListenSheikh,
              style: AppTypography.bodyLg.copyWith(
                color: colors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
