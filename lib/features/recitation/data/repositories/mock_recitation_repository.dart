import '../../domain/entities/recitation_ayah.dart';
import '../../domain/repositories/recitation_repository.dart';

/// In-memory mock repository for Surah Recitation Voice Checker UI/UX.
class MockRecitationRepository implements RecitationRepository {
  @override
  Future<RecitationAyah> loadCurrentAyah() async {
    return const RecitationAyah(
      surahNameAr: 'سورة الإخلاص',
      surahMeta: 'Al-Ikhlas • Ayah 1 of 4 • Makkiyah',
      juzBadge: 'Juz 30',
      ayahChip: 'الآية الأولى • سورة الإخلاص',
      basmalah: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      words: ['قُلْ', 'هُوَ', 'اللَّهُ', 'أَحَدٌ'],
      ayahEndSymbol: '۝١',
    );
  }
}
