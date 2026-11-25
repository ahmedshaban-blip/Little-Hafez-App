import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/service_locator.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../logic/parent_dashboard_cubit.dart';
import '../../logic/parent_dashboard_state.dart';
import '../widgets/parent_dashboard_body.dart';
import '../widgets/parent_gate_dialog.dart';

/// Composition screen for the Parent Dashboard.
class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParentDashboardCubit>(
      create: (_) => getIt<ParentDashboardCubit>()..loadDashboard(),
      child: BlocBuilder<ParentDashboardCubit, ParentDashboardState>(
        builder: (context, state) {
          final cubit = context.read<ParentDashboardCubit>();
          if (state.loadStatus == ParentLoadStatus.loading ||
              state.loadStatus == ParentLoadStatus.initial) {
            return const Center(child: AppShimmer(width: 320, height: 220));
          }
          if (state.loadStatus == ParentLoadStatus.error ||
              state.data == null) {
            return AppErrorView(
              message: state.errorMessage ?? '',
              onRetry: cubit.loadDashboard,
            );
          }
          return ParentDashboardBody(
            data: state.data!,
            screenTimeEnabled: state.screenTimeEnabled,
            sheikhVoiceEnabled: state.sheikhVoiceEnabled,
            onToggleScreenTime: cubit.toggleScreenTime,
            onToggleSheikhVoice: cubit.toggleSheikhVoice,
            onPinLockTap: () => showDialog<void>(
              context: context,
              builder: (_) => const ParentGateDialog(),
            ),
          );
        },
      ),
    );
  }
}
