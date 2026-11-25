import 'package:equatable/equatable.dart';

import '../domain/entities/journey_overview.dart';

/// Sealed states for [JourneyCubit].
sealed class JourneyState extends Equatable {
  const JourneyState();

  @override
  List<Object?> get props => [];
}

final class JourneyInitial extends JourneyState {
  const JourneyInitial();
}

final class JourneyLoading extends JourneyState {
  const JourneyLoading();
}

final class JourneySuccess extends JourneyState {
  const JourneySuccess(this.overview);

  final JourneyOverview overview;

  @override
  List<Object?> get props => [overview];
}

final class JourneyError extends JourneyState {
  const JourneyError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
