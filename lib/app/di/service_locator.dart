import 'package:get_it/get_it.dart';

import '../../features/games/data/repositories/mock_games_repository.dart';
import '../../features/games/domain/repositories/games_repository.dart';
import '../../features/games/logic/games_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<GamesRepository>()) return;
  getIt.registerLazySingleton<GamesRepository>(MockGamesRepository.new);
  getIt.registerFactory<GamesCubit>(() => GamesCubit(getIt<GamesRepository>()));
}
