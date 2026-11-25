import 'package:equatable/equatable.dart';

import '../domain/entities/parent_dashboard_data.dart';

enum ParentLoadStatus { initial, loading, ready, error }

/// Immutable state for [ParentDashboardCubit].
final class ParentDashboardState extends Equatable {
  const ParentDashboardState({
    required this.loadStatus,
    required this.screenTimeEnabled,
    required this.sheikhVoiceEnabled,
    this.data,
    this.errorMessage,
  });

  const ParentDashboardState.initial()
    : loadStatus = ParentLoadStatus.initial,
      screenTimeEnabled = true,
      sheikhVoiceEnabled = true,
      data = null,
      errorMessage = null;

  final ParentLoadStatus loadStatus;
  final bool screenTimeEnabled;
  final bool sheikhVoiceEnabled;
  final ParentDashboardData? data;
  final String? errorMessage;

  ParentDashboardState copyWith({
    ParentLoadStatus? loadStatus,
    bool? screenTimeEnabled,
    bool? sheikhVoiceEnabled,
    ParentDashboardData? data,
    String? errorMessage,
  }) {
    return ParentDashboardState(
      loadStatus: loadStatus ?? this.loadStatus,
      screenTimeEnabled: screenTimeEnabled ?? this.screenTimeEnabled,
      sheikhVoiceEnabled: sheikhVoiceEnabled ?? this.sheikhVoiceEnabled,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loadStatus,
    screenTimeEnabled,
    sheikhVoiceEnabled,
    data,
    errorMessage,
  ];
}
