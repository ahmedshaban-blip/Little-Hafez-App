import 'package:get_it/get_it.dart';

import '../../features/onboarding/data/repositories/mock_onboarding_repository.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/logic/onboarding_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<OnboardingRepository>()) return;
  getIt.registerLazySingleton<OnboardingRepository>(MockOnboardingRepository.new);
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit(getIt<OnboardingRepository>()));
}
