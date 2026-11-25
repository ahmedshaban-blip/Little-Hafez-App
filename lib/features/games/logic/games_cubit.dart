import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/games_vault_data.dart';
import '../domain/repositories/games_repository.dart';
import 'games_state.dart';

/// Cubit managing Games & Badges Vault interactions.
class GamesCubit extends Cubit<GamesState> {
  GamesCubit(this._repository) : super(const GamesState.initial());

  final GamesRepository _repository;

  Future<void> loadVault() async {
    emit(state.copyWith(loadStatus: GamesLoadStatus.loading));
    final data = await _repository.loadGamesVault();
    if (isClosed) return;
    emit(state.copyWith(loadStatus: GamesLoadStatus.ready, data: data));
  }

  void switchSection(GamesSection section) {
    emit(state.copyWith(activeSection: section));
  }

  void selectGameMode(int index) {
    emit(state.copyWith(selectedGameModeIndex: index));
  }

  void selectAyahTile(int index) {
    emit(state.copyWith(selectedAyahIndex: index));
  }
}
