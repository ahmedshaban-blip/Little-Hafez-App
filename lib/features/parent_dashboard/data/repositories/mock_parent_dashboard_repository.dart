import '../../domain/entities/parent_dashboard_data.dart';
import '../../domain/repositories/parent_dashboard_repository.dart';

/// In-memory mock repository for Parent Dashboard UI/UX.
class MockParentDashboardRepository implements ParentDashboardRepository {
  @override
  Future<ParentDashboardData> loadDashboard() async {
    return const ParentDashboardData(
      surahBreakdown: [
        JuzSurahProgressItem(
          numberArabic: '١',
          title: 'سورة الفاتحة',
          statusLabel: 'مكتملة ★',
          status: JuzSurahProgressStatus.completed,
        ),
        JuzSurahProgressItem(
          numberArabic: '١١٢',
          title: 'سورة الإخلاص',
          statusLabel: 'قيد التعلم ٨٥٪',
          status: JuzSurahProgressStatus.inProgress,
        ),
        JuzSurahProgressItem(
          numberArabic: '١١٣',
          title: 'سورة الفلق',
          statusLabel: 'التالية',
          status: JuzSurahProgressStatus.nextUp,
        ),
      ],
      screenTimeEnabled: true,
      sheikhVoiceEnabled: true,
    );
  }
}
