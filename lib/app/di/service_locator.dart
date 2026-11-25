import 'package:get_it/get_it.dart';

import '../../features/parent_dashboard/data/repositories/mock_parent_dashboard_repository.dart';
import '../../features/parent_dashboard/domain/repositories/parent_dashboard_repository.dart';
import '../../features/parent_dashboard/logic/parent_dashboard_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<ParentDashboardRepository>()) return;
  getIt.registerLazySingleton<ParentDashboardRepository>(MockParentDashboardRepository.new);
  getIt.registerFactory<ParentDashboardCubit>(() => ParentDashboardCubit(getIt<ParentDashboardRepository>()));
}
