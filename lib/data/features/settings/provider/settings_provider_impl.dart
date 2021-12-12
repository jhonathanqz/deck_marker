import 'package:deck_marker/data/features/settings/helper/database_helper.dart';
import 'package:deck_marker/data/features/settings/model/players_buraco_settings_model.dart';
import 'package:deck_marker/data/features/settings/model/score_buraco_settings_model.dart';
import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/infrastructure/features/settings/repositories/contracts/settings_provider.dart';

class SettingsProviderImpl implements SettingsProvider {
  @override
  Future<Buraco> getScoreBuraco(Buraco buraco) async {
    try {
      final settingsModel = await DatabaseHelper.getScoreBuraco();

      return buraco.copyWith(
        scoreTeam1: settingsModel.scoreTeam1,
        scoreTeam2: settingsModel.scoreTeam2,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setScoreBuraco(Buraco buraco) async {
    try {
      final settingsModel = ScoreBuracoSettingsModel(
        scoreTeam1: buraco.scoreTeam1,
        scoreTeam2: buraco.scoreTeam2,
      );

      await DatabaseHelper.setScoreBuraco(settingsModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTable(String table) async {
    try {
      await DatabaseHelper.deleteTable(table);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Buraco> getTeamBuraco(Buraco buraco) async {
    try {
      final teamModel = await DatabaseHelper.getPlayersBuraco();

      return buraco.copyWith(
        playersTeam1: teamModel.playersTeam1,
        playersTeam2: teamModel.playersTeam2,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setPlayersBuraco(Buraco buraco) async {
    try {
      final playersModel = PlayersBuracoSettingsModel(
        playersTeam1: buraco.playersTeam1,
        playersTeam2: buraco.playersTeam2,
      );

      await DatabaseHelper.setTeamBuraco(playersModel);
    } catch (e) {
      rethrow;
    }
  }
}
