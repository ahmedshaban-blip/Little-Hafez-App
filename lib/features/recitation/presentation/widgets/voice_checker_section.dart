import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import 'recitation_feedback_card.dart';

/// Smart Voice Evaluation card with glowing mic button and feedback card.
class VoiceCheckerSection extends StatelessWidget {
  const VoiceCheckerSection({
    super.key,
    required this.isRecording,
    required this.isReplayingChild,
    required this.onMicTap,
    required this.onReplayTap,
    required this.onRetryTap,
  });

  final bool isRecording;
  final bool isReplayingChild;
  final VoidCallback onMicTap;
  final VoidCallback onReplayTap;
  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.surfaceContainerLowest, colors.surfaceContainerLow],
        ),
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: isRecording ? 122.r : 112.r,
                height: isRecording ? 122.r : 112.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.secondaryContainer.withValues(
                    alpha: isRecording ? 0.30 : 0.16,
                  ),
                ),
              ),
              InkWell(
                onTap: onMicTap,
                borderRadius: AppRadii.borderFull,
                child: Container(
                  width: 92.r,
                  height: 92.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [colors.secondaryContainer, colors.primary],
                    ),
                    boxShadow: AppShadows.tactileLip(
                      colors.primary,
                      offsetY: 6,
                      ambientColor: colors.secondary,
                    ),
                  ),
                  child: Icon(
                    isRecording ? Icons.graphic_eq_rounded : Icons.mic_rounded,
                    size: 40.r,
                    color: colors.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            isRecording ? l10n.reciteListeningNow : l10n.reciteTapAndRead,
            style: AppTypography.headlineMd.copyWith(
              color: colors.ceruleanPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 14.h),
          RecitationFeedbackCard(
            isReplayingChild: isReplayingChild,
            onReplayTap: onReplayTap,
            onRetryTap: onRetryTap,
          ),
        ],
      ),
    );
  }
}
