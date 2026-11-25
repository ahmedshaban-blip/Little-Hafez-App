import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/recitation_repository.dart';
import 'recitation_state.dart';

/// Cubit managing recitation ayah word highlighting and audio/mic states.
class RecitationCubit extends Cubit<RecitationState> {
  RecitationCubit(this._repository) : super(const RecitationState.initial());

  final RecitationRepository _repository;

  Future<void> loadAyah() async {
    emit(state.copyWith(status: RecitationStatus.loading));
    final ayah = await _repository.loadCurrentAyah();
    if (isClosed) return;
    emit(state.copyWith(status: RecitationStatus.ready, ayah: ayah));
  }

  void selectWord(int index) {
    emit(state.copyWith(activeWordIndex: index));
  }

  void toggleSheikhPlayback() {
    emit(state.copyWith(isSheikhPlaying: !state.isSheikhPlaying));
  }

  void toggleRecording() {
    emit(state.copyWith(isRecording: !state.isRecording));
  }

  void toggleReplayChild() {
    emit(state.copyWith(isReplayingChild: !state.isReplayingChild));
  }

  void resetAttempt() {
    emit(
      state.copyWith(
        activeWordIndex: 0,
        isRecording: false,
        isReplayingChild: false,
      ),
    );
  }
}
