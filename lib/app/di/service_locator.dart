import 'package:get_it/get_it.dart';

import '../../features/recitation/data/repositories/mock_recitation_repository.dart';
import '../../features/recitation/domain/repositories/recitation_repository.dart';
import '../../features/recitation/logic/recitation_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<RecitationRepository>()) return;
  getIt.registerLazySingleton<RecitationRepository>(MockRecitationRepository.new);
  getIt.registerFactory<RecitationCubit>(() => RecitationCubit(getIt<RecitationRepository>()));
}
