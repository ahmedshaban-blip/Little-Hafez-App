import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/review_repository.dart';
import 'review_state.dart';

/// Cubit managing daily spaced repetition review tasks.
class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._repository) : super(const ReviewInitial());

  final ReviewRepository _repository;

  Future<void> loadReview() async {
    emit(const ReviewLoading());
    final overview = await _repository.loadReviewOverview();
    if (isClosed) return;
    emit(ReviewSuccess(overview));
  }
}
