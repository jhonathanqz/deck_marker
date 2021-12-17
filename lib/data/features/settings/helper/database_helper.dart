import 'package:deck_marker/data/features/settings/model/players_truco_settings_model.dart';
import 'package:deck_marker/data/features/settings/model/score_truco_settings_model.dart';
import 'package:path/path.dart';
import 'package:deck_marker/data/features/settings/model/players_buraco_settings_model.dart';
import 'package:deck_marker/data/features/settings/model/score_buraco_settings_model.dart';
import 'package:deck_marker/domain/exceptions/settings_exceptions.dart';
import 'package:deck_marker/utils/strings.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseStrings {
  static const name = 'deck_marker.db';

  static const scoreBuracoTable = 'ScoreBuraco';
  static const teamBuracoTable = 'TeamBuraco';
  static const scoreTrucoTable = 'ScoreTruco';
  static const teamTrucoTable = 'TeamTruco';

  static const scoreBuracoTableScript =
      'CREATE TABLE $scoreBuracoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, scoreTeam1 TEXT, scoreTeam2 TEXT)';
  static const teamBuracoTableScript =
      'CREATE TABLE $teamBuracoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, playersTeam1 TEXT, playersTeam2 TEXT)';

  static const scoreTrucoTableScript =
      'CREATE TABLE $scoreTrucoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, scoreTeam1 TEXT, scoreTeam2 TEXT)';
  static const teamTrucoTableScript =
      'CREATE TABLE $teamTrucoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, playersTeam1 TEXT, playersTeam2 TEXT)';
}

class DatabaseHelper {
  static Database? _database;

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseStrings.scoreBuracoTableScript);
    await db.execute(DatabaseStrings.teamBuracoTableScript);
    await db.execute(DatabaseStrings.scoreTrucoTableScript);
    await db.execute(DatabaseStrings.teamTrucoTableScript);
  }

  static Future<Database> get database async {
    final path = join(
      await getDatabasesPath(),
      DatabaseStrings.name,
    );

    _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    return _database!;
  }

  static Future<ScoreBuracoSettingsModel> getScoreBuraco() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.scoreBuracoTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      return ScoreBuracoSettingsModel.fromJson(result.first);
    } catch (_) {
      rethrow;
    }
  }

  static Future<ScoreTrucoSettingsModel> getScoreTruco() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.scoreTrucoTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      return ScoreTrucoSettingsModel.fromJson(result.first);
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> setScoreBuraco(
      ScoreBuracoSettingsModel scoreBuracoSettingsModel) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(DatabaseStrings.scoreBuracoTable);
      await tmpDb.insert(
        DatabaseStrings.scoreBuracoTable,
        scoreBuracoSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }

  static Future<void> setScoreTruco(
      ScoreTrucoSettingsModel scoreTrucoSettingsModel) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(DatabaseStrings.scoreTrucoTable);
      await tmpDb.insert(
        DatabaseStrings.scoreTrucoTable,
        scoreTrucoSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }

  static Future<void> deleteTable(String table) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(table);
    } catch (_) {
      throw DeleteErrorSettings(Strings.deleteErrorSettings);
    }
  }

  static Future<PlayersBuracoSettingsModel> getPlayersBuraco() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.teamBuracoTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      return PlayersBuracoSettingsModel.fromJson(result.first);
    } catch (_) {
      rethrow;
    }
  }

  static Future<PlayersTrucoSettingsModel> getPlayersTruco() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.teamTrucoTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      return PlayersTrucoSettingsModel.fromJson(result.first);
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> setTeamBuraco(
      PlayersBuracoSettingsModel playersBuracoSettingsModel) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(DatabaseStrings.teamBuracoTable);
      await tmpDb.insert(
        DatabaseStrings.teamBuracoTable,
        playersBuracoSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }

  static Future<void> setTeamTruco(
      PlayersTrucoSettingsModel playersTrucoSettingsModel) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(DatabaseStrings.teamTrucoTable);
      await tmpDb.insert(
        DatabaseStrings.teamTrucoTable,
        playersTrucoSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }
}
