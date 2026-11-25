/// Surah row item in the Juz Amma progress breakdown card.
enum JuzSurahProgressStatus { completed, inProgress, nextUp }

class JuzSurahProgressItem {
  const JuzSurahProgressItem({
    required this.numberArabic,
    required this.title,
    required this.statusLabel,
    required this.status,
  });

  final String numberArabic;
  final String title;
  final String statusLabel;
  final JuzSurahProgressStatus status;
}

/// Parent dashboard summary entity.
class ParentDashboardData {
  const ParentDashboardData({
    required this.surahBreakdown,
    required this.screenTimeEnabled,
    required this.sheikhVoiceEnabled,
  });

  final List<JuzSurahProgressItem> surahBreakdown;
  final bool screenTimeEnabled;
  final bool sheikhVoiceEnabled;
}
