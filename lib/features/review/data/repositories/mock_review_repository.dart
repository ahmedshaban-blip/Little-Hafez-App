import '../../domain/entities/review_overview.dart';
import '../../domain/repositories/review_repository.dart';

/// In-memory mock repository for Spaced Repetition Review UI/UX.
class MockReviewRepository implements ReviewRepository {
  @override
  Future<ReviewOverview> loadReviewOverview() async {
    return const ReviewOverview(
      days: [
        ReviewDayStatus(label: 'سبت', state: ReviewDayState.completed),
        ReviewDayStatus(label: 'أحد', state: ReviewDayState.completed),
        ReviewDayStatus(label: 'اثنين', state: ReviewDayState.completed),
        ReviewDayStatus(label: 'ثلاثاء', state: ReviewDayState.completed),
        ReviewDayStatus(label: 'اليوم', state: ReviewDayState.today),
        ReviewDayStatus(label: 'خميس', state: ReviewDayState.locked),
        ReviewDayStatus(label: 'جمعة', state: ReviewDayState.locked),
      ],
      tasks: [
        ReviewSurahTask(
          id: 'fatihah',
          title: 'سورة الفاتحة',
          subtitle: '7 آيات كاملة ⭐',
          isPrimaryNavyButton: true,
        ),
        ReviewSurahTask(
          id: 'nas',
          title: 'سورة الناس',
          subtitle: 'سهلة وممتعة ⭐',
          isPrimaryNavyButton: false,
        ),
      ],
    );
  }
}
