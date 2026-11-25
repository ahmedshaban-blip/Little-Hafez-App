/// Stage visual states on the Juz 30 winding journey map.
enum SurahStageStatus {
  completed,
  active,
  lockedRequirement,
  locked,
  milestone,
}

/// Represents a surah node on the winding journey map.
class SurahStage {
  const SurahStage({
    required this.id,
    required this.arabicTitle,
    required this.englishSubtitle,
    required this.status,
    this.requirementBadge,
    this.ayahRangeChip,
  });

  final String id;
  final String arabicTitle;
  final String englishSubtitle;
  final SurahStageStatus status;
  final String? requirementBadge;
  final String? ayahRangeChip;
}

/// Overview entity for the Surah Journey Map screen.
class JourneyOverview {
  const JourneyOverview({
    required this.offlineReadyLabel,
    required this.levelLabel,
    required this.currentSurahTitle,
    required this.ayahProgressLabel,
    required this.progressRatio,
    required this.nextSurahLabel,
    required this.stages,
  });

  final String offlineReadyLabel;
  final String levelLabel;
  final String currentSurahTitle;
  final String ayahProgressLabel;
  final double progressRatio;
  final String nextSurahLabel;
  final List<SurahStage> stages;
}
