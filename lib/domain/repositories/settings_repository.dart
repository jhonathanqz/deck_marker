import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/entities/truco.dart';

abstract class SettingsRepository {
  Future<void> setScoreBuraco(Buraco buraco);
  Future<void> setScoreTruco(Truco truco);
  Future<Buraco> getScoreBuraco(Buraco buraco);
  Future<Truco> getScoreTruco(Truco truco);
  Future<void> deleteTable(String table);
  Future<Buraco> getTeamBuraco(Buraco buraco);
  Future<Truco> getTeamTruco(Truco truco);
  Future<void> setPlayersBuraco(Buraco buraco);
  Future<void> setPlayersTruco(Truco truco);
}
