/// Domain entity representing a child's Surah completion honor certificate.
class CompletionCertificate {
  const CompletionCertificate({
    required this.recipientNameAge,
    required this.surahName,
    required this.ayahCountLabel,
    required this.accuracyValue,
    required this.accuracyNote,
    required this.rewardValue,
    required this.rewardNote,
    required this.quoteAyah,
    required this.hijriYear,
  });

  final String recipientNameAge;
  final String surahName;
  final String ayahCountLabel;
  final String accuracyValue;
  final String accuracyNote;
  final String rewardValue;
  final String rewardNote;
  final String quoteAyah;
  final String hijriYear;
}
