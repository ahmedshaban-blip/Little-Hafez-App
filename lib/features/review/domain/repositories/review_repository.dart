import '../entities/review_overview.dart';

/// Contract for loading daily spaced repetition review tasks.
abstract interface class ReviewRepository {
  Future<ReviewOverview> loadReviewOverview();
}
