import 'package:get_it/get_it.dart';

import '../../features/celebration/data/repositories/mock_celebration_repository.dart';
import '../../features/celebration/domain/repositories/celebration_repository.dart';
import '../../features/celebration/logic/celebration_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<CelebrationRepository>()) return;
  getIt.registerLazySingleton<CelebrationRepository>(MockCelebrationRepository.new);
  getIt.registerFactory<CelebrationCubit>(() => CelebrationCubit(getIt<CelebrationRepository>()));
}
