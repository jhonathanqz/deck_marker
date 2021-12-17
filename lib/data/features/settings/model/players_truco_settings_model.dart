import 'package:json_annotation/json_annotation.dart';

part 'players_truco_settings_model.g.dart';

@JsonSerializable()
class PlayersTrucoSettingsModel {
  final int? id;
  final String playersTeam1;
  final String playersTeam2;
  PlayersTrucoSettingsModel({
    this.id,
    required this.playersTeam1,
    required this.playersTeam2,
  });

  factory PlayersTrucoSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PlayersTrucoSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayersTrucoSettingsModelToJson(this);
}
