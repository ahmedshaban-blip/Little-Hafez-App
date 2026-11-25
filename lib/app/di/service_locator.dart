import 'package:get_it/get_it.dart';

import '../../features/review/data/repositories/mock_review_repository.dart';
import '../../features/review/domain/repositories/review_repository.dart';
import '../../features/review/logic/review_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<ReviewRepository>()) return;
  getIt.registerLazySingleton<ReviewRepository>(MockReviewRepository.new);
  getIt.registerFactory<ReviewCubit>(() => ReviewCubit(getIt<ReviewRepository>()));
}
