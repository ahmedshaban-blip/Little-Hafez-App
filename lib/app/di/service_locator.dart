import 'package:get_it/get_it.dart';

import '../../features/journey/data/repositories/mock_journey_repository.dart';
import '../../features/journey/domain/repositories/journey_repository.dart';
import '../../features/journey/logic/journey_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<JourneyRepository>()) return;
  getIt.registerLazySingleton<JourneyRepository>(MockJourneyRepository.new);
  getIt.registerFactory<JourneyCubit>(() => JourneyCubit(getIt<JourneyRepository>()));
}
