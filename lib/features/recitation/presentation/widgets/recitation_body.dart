import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/kid_top_bar.dart';
import '../../domain/entities/recitation_ayah.dart';
import 'ayah_display_card.dart';
import 'sheikh_audio_strip.dart';
import 'surah_metadata_card.dart';
import 'voice_checker_section.dart';

/// Pure layout composition for the Surah Recitation Voice Checker screen.
class RecitationBody extends StatelessWidget {
  const RecitationBody({
    super.key,
    required this.ayah,
    required this.activeWordIndex,
    required this.isSheikhPlaying,
    required this.isRecording,
    required this.isReplayingChild,
    required this.onWordTap,
    required this.onToggleSheikh,
    required this.onMicTap,
    required this.onReplayTap,
    required this.onRetryTap,
    required this.onGateTap,
    required this.onProfileTap,
  });

  final RecitationAyah ayah;
  final int activeWordIndex;
  final bool isSheikhPlaying;
  final bool isRecording;
  final bool isReplayingChild;
  final ValueChanged<int> onWordTap;
  final VoidCallback onToggleSheikh;
  final VoidCallback onMicTap;
  final VoidCallback onReplayTap;
  final VoidCallback onRetryTap;
  final VoidCallback onGateTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KidTopBar(onGateTap: onGateTap, onProfileTap: onProfileTap),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              10.h,
              AppSpacing.marginMobile.w,
              24.h,
            ),
            child: Column(
              children: [
                const SurahMetadataCard(),
                SizedBox(height: 16.h),
                AyahDisplayCard(
                  ayah: ayah,
                  activeWordIndex: activeWordIndex,
                  onWordTap: onWordTap,
                ),
                SizedBox(height: 16.h),
                SheikhAudioStrip(
                  isPlaying: isSheikhPlaying,
                  onTogglePlay: onToggleSheikh,
                ),
                SizedBox(height: 16.h),
                VoiceCheckerSection(
                  isRecording: isRecording,
                  isReplayingChild: isReplayingChild,
                  onMicTap: onMicTap,
                  onReplayTap: onReplayTap,
                  onRetryTap: onRetryTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
