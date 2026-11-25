import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/parent_dashboard_repository.dart';
import 'parent_dashboard_state.dart';

/// Cubit managing Parent Dashboard progress and toggle controls.
class ParentDashboardCubit extends Cubit<ParentDashboardState> {
  ParentDashboardCubit(this._repository)
    : super(const ParentDashboardState.initial());

  final ParentDashboardRepository _repository;

  Future<void> loadDashboard() async {
    emit(state.copyWith(loadStatus: ParentLoadStatus.loading));
    final data = await _repository.loadDashboard();
    if (isClosed) return;
    emit(
      state.copyWith(
        loadStatus: ParentLoadStatus.ready,
        data: data,
        screenTimeEnabled: data.screenTimeEnabled,
        sheikhVoiceEnabled: data.sheikhVoiceEnabled,
      ),
    );
  }

  void toggleScreenTime() {
    emit(state.copyWith(screenTimeEnabled: !state.screenTimeEnabled));
  }

  void toggleSheikhVoice() {
    emit(state.copyWith(sheikhVoiceEnabled: !state.sheikhVoiceEnabled));
  }
}
