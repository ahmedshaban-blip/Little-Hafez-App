import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/journey_cubit.dart';
import '../../logic/journey_state.dart';
import '../widgets/journey_body.dart';

/// Composition screen for the Surah Journey Map tab.
class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JourneyCubit>(
      create: (_) => getIt<JourneyCubit>()..loadJourney(),
      child: BlocBuilder<JourneyCubit, JourneyState>(
        builder: (context, state) {
          return switch (state) {
            JourneyInitial() || JourneyLoading() => const Center(
              child: AppShimmer(width: 320, height: 180),
            ),
            JourneyError(:final message) => AppErrorView(
              message: message,
              onRetry: () => context.read<JourneyCubit>().loadJourney(),
            ),
            JourneySuccess(:final overview) => JourneyBody(
              overview: overview,
              onPlayActiveStage: () => context.go('/recite'),
              onStartLesson: () => context.go('/recite'),
              onGateTap: () => context.go('/parent'),
              onProfileTap: () => context.go('/onboarding'),
            ),
          };
        },
      ),
    );
  }
}
