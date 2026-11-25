import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/recitation_cubit.dart';
import '../../logic/recitation_state.dart';
import '../widgets/recitation_body.dart';

/// Composition screen for Surah Recitation Voice Checker.
class RecitationScreen extends StatelessWidget {
  const RecitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecitationCubit>(
      create: (_) => getIt<RecitationCubit>()..loadAyah(),
      child: BlocBuilder<RecitationCubit, RecitationState>(
        builder: (context, state) {
          final cubit = context.read<RecitationCubit>();
          if (state.status == RecitationStatus.loading ||
              state.status == RecitationStatus.initial) {
            return const Center(child: AppShimmer(width: 320, height: 220));
          }
          if (state.status == RecitationStatus.error || state.ayah == null) {
            return AppErrorView(
              message: state.errorMessage ?? '',
              onRetry: cubit.loadAyah,
            );
          }
          return RecitationBody(
            ayah: state.ayah!,
            activeWordIndex: state.activeWordIndex,
            isSheikhPlaying: state.isSheikhPlaying,
            isRecording: state.isRecording,
            isReplayingChild: state.isReplayingChild,
            onWordTap: cubit.selectWord,
            onToggleSheikh: cubit.toggleSheikhPlayback,
            onMicTap: cubit.toggleRecording,
            onReplayTap: cubit.toggleReplayChild,
            onRetryTap: cubit.resetAttempt,
            onGateTap: () => context.go('/parent'),
            onProfileTap: () => context.go('/onboarding'),
          );
        },
      ),
    );
  }
}
