import 'package:get_it/get_it.dart';

import '../../features/celebration/data/repositories/mock_celebration_repository.dart';
import '../../features/celebration/domain/repositories/celebration_repository.dart';
import '../../features/celebration/logic/celebration_cubit.dart';
import '../../features/games/data/repositories/mock_games_repository.dart';
import '../../features/games/domain/repositories/games_repository.dart';
import '../../features/games/logic/games_cubit.dart';
import '../../features/journey/data/repositories/mock_journey_repository.dart';
import '../../features/journey/domain/repositories/journey_repository.dart';
import '../../features/journey/logic/journey_cubit.dart';
import '../../features/onboarding/data/repositories/mock_onboarding_repository.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/logic/onboarding_cubit.dart';
import '../../features/parent_dashboard/data/repositories/mock_parent_dashboard_repository.dart';
import '../../features/parent_dashboard/domain/repositories/parent_dashboard_repository.dart';
import '../../features/parent_dashboard/logic/parent_dashboard_cubit.dart';
import '../../features/recitation/data/repositories/mock_recitation_repository.dart';
import '../../features/recitation/domain/repositories/recitation_repository.dart';
import '../../features/recitation/logic/recitation_cubit.dart';
import '../../features/review/data/repositories/mock_review_repository.dart';
import '../../features/review/domain/repositories/review_repository.dart';
import '../../features/review/logic/review_cubit.dart';

final GetIt getIt = GetIt.instance;

/// Registers all lazy singletons (repositories) and factories (Cubits).
void setupServiceLocator() {
  if (getIt.isRegistered<OnboardingRepository>()) return;

  // Repositories
  getIt.registerLazySingleton<OnboardingRepository>(
    MockOnboardingRepository.new,
  );
  getIt.registerLazySingleton<JourneyRepository>(MockJourneyRepository.new);
  getIt.registerLazySingleton<RecitationRepository>(
    MockRecitationRepository.new,
  );
  getIt.registerLazySingleton<GamesRepository>(MockGamesRepository.new);
  getIt.registerLazySingleton<ReviewRepository>(MockReviewRepository.new);
  getIt.registerLazySingleton<ParentDashboardRepository>(
    MockParentDashboardRepository.new,
  );
  getIt.registerLazySingleton<CelebrationRepository>(
    MockCelebrationRepository.new,
  );

  // Cubits
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<OnboardingRepository>()),
  );
  getIt.registerFactory<JourneyCubit>(
    () => JourneyCubit(getIt<JourneyRepository>()),
  );
  getIt.registerFactory<RecitationCubit>(
    () => RecitationCubit(getIt<RecitationRepository>()),
  );
  getIt.registerFactory<GamesCubit>(() => GamesCubit(getIt<GamesRepository>()));
  getIt.registerFactory<ReviewCubit>(
    () => ReviewCubit(getIt<ReviewRepository>()),
  );
  getIt.registerFactory<ParentDashboardCubit>(
    () => ParentDashboardCubit(getIt<ParentDashboardRepository>()),
  );
  getIt.registerFactory<CelebrationCubit>(
    () => CelebrationCubit(getIt<CelebrationRepository>()),
  );
}
