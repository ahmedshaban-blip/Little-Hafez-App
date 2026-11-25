import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/celebration_repository.dart';
import 'celebration_state.dart';

/// Cubit managing Surah completion celebration state.
class CelebrationCubit extends Cubit<CelebrationState> {
  CelebrationCubit(this._repository) : super(const CelebrationState.initial());

  final CelebrationRepository _repository;

  Future<void> loadCertificate() async {
    emit(state.copyWith(status: CelebrationLoadStatus.loading));
    final cert = await _repository.loadCertificate();
    if (isClosed) return;
    emit(
      state.copyWith(status: CelebrationLoadStatus.ready, certificate: cert),
    );
  }

  void toggleRecitationPlayback() {
    emit(state.copyWith(isPlayingRecitation: !state.isPlayingRecitation));
  }
}
