import 'package:json_annotation/json_annotation.dart';

part 'players_buraco_settings_model.g.dart';

@JsonSerializable()
class PlayersBuracoSettingsModel {
  final int? id;
  final String playersTeam1;
  final String playersTeam2;
  PlayersBuracoSettingsModel({
    this.id,
    required this.playersTeam1,
    required this.playersTeam2,
  });

  factory PlayersBuracoSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PlayersBuracoSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayersBuracoSettingsModelToJson(this);
}
