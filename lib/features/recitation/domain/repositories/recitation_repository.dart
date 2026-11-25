import '../entities/recitation_ayah.dart';

/// Contract for loading recitation ayah data.
abstract interface class RecitationRepository {
  Future<RecitationAyah> loadCurrentAyah();
}
