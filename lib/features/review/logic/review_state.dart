import 'package:equatable/equatable.dart';

import '../domain/entities/review_overview.dart';

/// Sealed states for [ReviewCubit].
sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object?> get props => [];
}

final class ReviewInitial extends ReviewState {
  const ReviewInitial();
}

final class ReviewLoading extends ReviewState {
  const ReviewLoading();
}

final class ReviewSuccess extends ReviewState {
  const ReviewSuccess(this.overview);

  final ReviewOverview overview;

  @override
  List<Object?> get props => [overview];
}

final class ReviewError extends ReviewState {
  const ReviewError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
