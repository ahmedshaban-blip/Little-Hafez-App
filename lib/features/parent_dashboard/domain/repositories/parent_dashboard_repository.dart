import '../entities/parent_dashboard_data.dart';

/// Contract for loading Parent Dashboard settings and progress.
abstract interface class ParentDashboardRepository {
  Future<ParentDashboardData> loadDashboard();
}
