/// Domain entity representing the current Ayah being recited.
class RecitationAyah {
  const RecitationAyah({
    required this.surahNameAr,
    required this.surahMeta,
    required this.juzBadge,
    required this.ayahChip,
    required this.basmalah,
    required this.words,
    required this.ayahEndSymbol,
  });

  final String surahNameAr;
  final String surahMeta;
  final String juzBadge;
  final String ayahChip;
  final String basmalah;
  final List<String> words;
  final String ayahEndSymbol;
}
