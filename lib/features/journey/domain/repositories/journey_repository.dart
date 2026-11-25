import '../entities/journey_overview.dart';

/// Contract for loading the child's Surah journey map.
abstract interface class JourneyRepository {
  Future<JourneyOverview> loadJourneyOverview();
}
