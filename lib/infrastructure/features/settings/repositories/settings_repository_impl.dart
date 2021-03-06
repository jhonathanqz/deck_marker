import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/entities/truco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';
import 'package:deck_marker/infrastructure/features/settings/repositories/contracts/settings_provider.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsProvider settingsProvider;

  SettingsRepositoryImpl({required this.settingsProvider});

  @override
  Future<Buraco> getScoreBuraco(Buraco buraco) async {
    try {
      return await settingsProvider.getScoreBuraco(buraco);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Truco> getScoreTruco(Truco truco) async {
    try {
      return await settingsProvider.getScoreTruco(truco);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setScoreBuraco(Buraco buraco) async {
    try {
      await settingsProvider.setScoreBuraco(
        buraco,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setScoreTruco(Truco truco) async {
    try {
      await settingsProvider.setScoreTruco(
        truco,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTable(String table) async {
    try {
      await settingsProvider.deleteTable(table);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Buraco> getTeamBuraco(Buraco buraco) async {
    try {
      return await settingsProvider.getTeamBuraco(
        buraco,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Truco> getTeamTruco(Truco truco) async {
    try {
      return await settingsProvider.getTeamTruco(
        truco,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setPlayersBuraco(Buraco buraco) async {
    try {
      await settingsProvider.setPlayersBuraco(buraco);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setPlayersTruco(Truco truco) async {
    try {
      await settingsProvider.setPlayersTruco(truco);
    } catch (_) {
      rethrow;
    }
  }
}
