import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/review_cubit.dart';
import '../../logic/review_state.dart';
import '../widgets/review_body.dart';

/// Composition screen for Spaced Repetition Review.
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (_) => getIt<ReviewCubit>()..loadReview(),
      child: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (context, state) {
          return switch (state) {
            ReviewInitial() || ReviewLoading() => const Center(
              child: AppShimmer(width: 320, height: 200),
            ),
            ReviewError(:final message) => AppErrorView(
              message: message,
              onRetry: () => context.read<ReviewCubit>().loadReview(),
            ),
            ReviewSuccess(:final overview) => ReviewBody(
              overview: overview,
              onStartReview: () => context.go('/recite'),
              onGateTap: () => context.go('/parent'),
              onProfileTap: () => context.go('/onboarding'),
            ),
          };
        },
      ),
    );
  }
}
