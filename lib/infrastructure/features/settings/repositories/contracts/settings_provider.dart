import 'package:deck_marker/domain/entities/buraco.dart';

abstract class SettingsProvider {
  Future<void> setScoreBuraco(Buraco buraco);
  Future<Buraco> getScoreBuraco(Buraco buraco);
  Future<void> deleteTable(String table);
  Future<Buraco> getTeamBuraco(Buraco buraco);
  Future<void> setPlayersBuraco(Buraco buraco);
}
