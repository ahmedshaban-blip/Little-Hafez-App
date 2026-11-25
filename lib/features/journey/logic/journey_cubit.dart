import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/journey_repository.dart';
import 'journey_state.dart';

/// Cubit managing the Surah Journey Map state.
class JourneyCubit extends Cubit<JourneyState> {
  JourneyCubit(this._repository) : super(const JourneyInitial());

  final JourneyRepository _repository;

  /// Loads the journey overview and stages.
  Future<void> loadJourney() async {
    emit(const JourneyLoading());
    final overview = await _repository.loadJourneyOverview();
    if (isClosed) return;
    emit(JourneySuccess(overview));
  }
}
