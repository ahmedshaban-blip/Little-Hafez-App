import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/games_cubit.dart';
import '../../logic/games_state.dart';
import '../widgets/games_body.dart';

/// Composition screen for Games & Badges Vault.
class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamesCubit>(
      create: (_) => getIt<GamesCubit>()..loadVault(),
      child: BlocBuilder<GamesCubit, GamesState>(
        builder: (context, state) {
          final cubit = context.read<GamesCubit>();
          if (state.loadStatus == GamesLoadStatus.loading ||
              state.loadStatus == GamesLoadStatus.initial) {
            return const Center(child: AppShimmer(width: 320, height: 220));
          }
          if (state.loadStatus == GamesLoadStatus.error || state.data == null) {
            return AppErrorView(
              message: state.errorMessage ?? '',
              onRetry: cubit.loadVault,
            );
          }
          return GamesBody(
            data: state.data!,
            activeSection: state.activeSection,
            selectedModeIndex: state.selectedGameModeIndex,
            selectedAyahIndex: state.selectedAyahIndex,
            onSelectSection: cubit.switchSection,
            onSelectMode: cubit.selectGameMode,
            onSelectAyah: cubit.selectAyahTile,
            onVerifyTap: () => context.push('/celebration'),
            onGateTap: () => context.go('/parent'),
            onProfileTap: () => context.go('/onboarding'),
          );
        },
      ),
    );
  }
}
