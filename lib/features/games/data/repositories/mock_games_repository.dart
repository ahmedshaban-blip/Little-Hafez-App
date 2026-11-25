import '../../domain/entities/games_vault_data.dart';
import '../../domain/repositories/games_repository.dart';

/// In-memory mock repository for Games & Badges Vault UI/UX.
class MockGamesRepository implements GamesRepository {
  @override
  Future<GamesVaultData> loadGamesVault() async {
    return const GamesVaultData(
      badges: [
        BadgeItem(
          id: 'fatihah',
          title: 'وسام حافظ الفاتحة',
          subtitle: 'أتقن سورة الفاتحة',
          status: BadgeStatus.completed,
          progressRatio: 1.0,
        ),
        BadgeItem(
          id: 'nightingale',
          title: 'وسام بلبل التلاوة',
          subtitle: 'تلاوة عذبة بصوت نقي',
          status: BadgeStatus.completed,
          progressRatio: 1.0,
        ),
        BadgeItem(
          id: 'ikhlas',
          title: 'سورة الإخلاص',
          subtitle: 'قيد الإنجاز (3/4 آيات)',
          status: BadgeStatus.inProgress,
          progressRatio: 0.75,
        ),
        BadgeItem(
          id: 'weekly',
          title: 'بطل الأسبوع',
          subtitle: 'أكمل 5 أيام متتالية',
          status: BadgeStatus.locked,
        ),
        BadgeItem(
          id: 'fajr',
          title: 'قارئ الفجر',
          subtitle: 'تلاوة صباحية مباركة',
          status: BadgeStatus.locked,
        ),
        BadgeItem(
          id: 'crown',
          title: 'تاج الحافظ الصغير',
          subtitle: 'حفظ جزء عم كاملاً',
          status: BadgeStatus.locked,
        ),
      ],
      ayahItems: [
        AyahGameItem(
          orderNumberArabic: '١',
          ayahText: 'قُلْ هُوَ اللَّهُ أَحَدٌ',
        ),
        AyahGameItem(orderNumberArabic: '٢', ayahText: 'اللَّهُ الصَّمَدُ'),
        AyahGameItem(
          orderNumberArabic: '٣',
          ayahText: 'لَمْ يَلِدْ وَلَمْ يُولَدْ',
        ),
        AyahGameItem(
          orderNumberArabic: '٤',
          ayahText: 'وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
        ),
      ],
    );
  }
}
