import '../../domain/entities/journey_overview.dart';
import '../../domain/repositories/journey_repository.dart';

/// In-memory mock repository for Surah Journey Map UI/UX.
class MockJourneyRepository implements JourneyRepository {
  @override
  Future<JourneyOverview> loadJourneyOverview() async {
    return const JourneyOverview(
      offlineReadyLabel: 'Offline Ready • Juz 30 Audio Cached',
      levelLabel: 'Level 4 Hafiz',
      currentSurahTitle: 'Al-Fatihah • الفاتحة',
      ayahProgressLabel: '7/7 Ayahs',
      progressRatio: 1.0,
      nextSurahLabel: 'Next: Al-Ikhlas (الإخلاص)',
      stages: [
        SurahStage(
          id: 'al-kawthar',
          arabicTitle: 'سورة الكوثر',
          englishSubtitle: 'Milestone Oasis',
          status: SurahStageStatus.milestone,
        ),
        SurahStage(
          id: 'an-nas',
          arabicTitle: 'سورة الناس',
          englishSubtitle: 'An-Nas',
          status: SurahStageStatus.locked,
        ),
        SurahStage(
          id: 'al-falaq',
          arabicTitle: 'سورة الفلق',
          englishSubtitle: 'Al-Falaq • Next Up',
          status: SurahStageStatus.lockedRequirement,
          requirementBadge: '⭐ Need 3★ in Al-Ikhlas',
        ),
        SurahStage(
          id: 'al-ikhlas',
          arabicTitle: 'سورة الإخلاص',
          englishSubtitle: 'Al-Ikhlas',
          status: SurahStageStatus.active,
          ayahRangeChip: 'Ayah 1 - 2',
        ),
      ],
    );
  }
}
