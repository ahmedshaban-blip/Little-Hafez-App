import '../entities/completion_certificate.dart';

/// Contract for loading Surah completion certificate data.
abstract interface class CelebrationRepository {
  Future<CompletionCertificate> loadCertificate();
}
