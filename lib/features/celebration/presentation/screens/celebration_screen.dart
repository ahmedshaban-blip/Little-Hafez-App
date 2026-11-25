import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/celebration_cubit.dart';
import '../../logic/celebration_state.dart';
import '../widgets/celebration_body.dart';

/// Composition screen for Surah Completion Celebration.
class CelebrationScreen extends StatelessWidget {
  const CelebrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CelebrationCubit>(
      create: (_) => getIt<CelebrationCubit>()..loadCertificate(),
      child: Scaffold(
        body: BlocBuilder<CelebrationCubit, CelebrationState>(
          builder: (context, state) {
            final cubit = context.read<CelebrationCubit>();
            if (state.status == CelebrationLoadStatus.loading ||
                state.status == CelebrationLoadStatus.initial) {
              return const Center(child: AppShimmer(width: 320, height: 240));
            }
            if (state.status == CelebrationLoadStatus.error ||
                state.certificate == null) {
              return AppErrorView(
                message: state.errorMessage ?? '',
                onRetry: cubit.loadCertificate,
              );
            }
            return CelebrationBody(
              certificate: state.certificate!,
              isPlayingRecitation: state.isPlayingRecitation,
              onCloseTap: () => context.go('/journey'),
              onNextSurahTap: () => context.go('/journey'),
              onListenTap: cubit.toggleRecitationPlayback,
              onShareTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.celebrationShareSuccess)),
              ),
            );
          },
        ),
      ),
    );
  }
}
