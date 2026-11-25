/// Day status in the 7-day Review Garden.
enum ReviewDayState { completed, today, locked }

/// Single day item in the 7-day Review Garden.
class ReviewDayStatus {
  const ReviewDayStatus({required this.label, required this.state});

  final String label;
  final ReviewDayState state;
}

/// Surah card item ready for today's spaced repetition review.
class ReviewSurahTask {
  const ReviewSurahTask({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isPrimaryNavyButton,
  });

  final String id;
  final String title;
  final String subtitle;
  final bool isPrimaryNavyButton;
}

/// Combined overview for Spaced Repetition Review screen.
class ReviewOverview {
  const ReviewOverview({required this.days, required this.tasks});

  final List<ReviewDayStatus> days;
  final List<ReviewSurahTask> tasks;
}
