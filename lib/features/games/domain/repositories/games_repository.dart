import '../entities/games_vault_data.dart';

/// Contract for loading Games & Badges Vault data.
abstract interface class GamesRepository {
  Future<GamesVaultData> loadGamesVault();
}
