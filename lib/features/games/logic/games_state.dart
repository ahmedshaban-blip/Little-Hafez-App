import 'package:equatable/equatable.dart';

import '../domain/entities/games_vault_data.dart';

/// Loading status for [GamesCubit].
enum GamesLoadStatus { initial, loading, ready, error }

/// Immutable state for [GamesCubit].
final class GamesState extends Equatable {
  const GamesState({
    required this.loadStatus,
    required this.activeSection,
    required this.selectedGameModeIndex,
    required this.selectedAyahIndex,
    this.data,
    this.errorMessage,
  });

  const GamesState.initial()
    : loadStatus = GamesLoadStatus.initial,
      activeSection = GamesSection.badges,
      selectedGameModeIndex = 0,
      selectedAyahIndex = 0,
      data = null,
      errorMessage = null;

  final GamesLoadStatus loadStatus;
  final GamesSection activeSection;
  final int selectedGameModeIndex;
  final int selectedAyahIndex;
  final GamesVaultData? data;
  final String? errorMessage;

  GamesState copyWith({
    GamesLoadStatus? loadStatus,
    GamesSection? activeSection,
    int? selectedGameModeIndex,
    int? selectedAyahIndex,
    GamesVaultData? data,
    String? errorMessage,
  }) {
    return GamesState(
      loadStatus: loadStatus ?? this.loadStatus,
      activeSection: activeSection ?? this.activeSection,
      selectedGameModeIndex:
          selectedGameModeIndex ?? this.selectedGameModeIndex,
      selectedAyahIndex: selectedAyahIndex ?? this.selectedAyahIndex,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loadStatus,
    activeSection,
    selectedGameModeIndex,
    selectedAyahIndex,
    data,
    errorMessage,
  ];
}
