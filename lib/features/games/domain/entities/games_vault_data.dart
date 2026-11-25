/// Badge progress status in the Badges Vault.
enum BadgeStatus { completed, inProgress, locked }

/// Top-level tab switcher between Memorization Games and Badges Vault.
enum GamesSection { games, badges }

/// Represents a single achievement badge card.
class BadgeItem {
  const BadgeItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    this.progressRatio = 0.0,
  });

  final String id;
  final String title;
  final String subtitle;
  final BadgeStatus status;
  final double progressRatio;
}

/// Represents an ayah ordering tile in the Memorization Games section.
class AyahGameItem {
  const AyahGameItem({required this.orderNumberArabic, required this.ayahText});

  final String orderNumberArabic;
  final String ayahText;
}

/// Combined entity for Games & Badges Vault.
class GamesVaultData {
  const GamesVaultData({required this.badges, required this.ayahItems});

  final List<BadgeItem> badges;
  final List<AyahGameItem> ayahItems;
}
