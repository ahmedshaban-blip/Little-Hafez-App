import '../../domain/entities/completion_certificate.dart';
import '../../domain/repositories/celebration_repository.dart';

/// In-memory mock repository for Surah Completion Celebration UI/UX.
class MockCelebrationRepository implements CelebrationRepository {
  @override
  Future<CompletionCertificate> loadCertificate() async {
    return const CompletionCertificate(
      recipientNameAge: 'زَيْد (٧ سَنَوَات)',
      surahName: 'الإخلاص',
      ayahCountLabel: '٤ آيَات',
      accuracyValue: '٩٨٪',
      accuracyNote: 'تَرْتِيلٌ مُمّتَاز',
      rewardValue: '+٥٠',
      rewardNote: 'نَجْمَة زَرْقَاء',
      quoteAyah: '﴿ قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ﴾',
      hijriYear: '١٤٤٦ هـ',
    );
  }
}
