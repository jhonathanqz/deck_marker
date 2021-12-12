// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_buraco_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayersBuracoSettingsModel _$PlayersBuracoSettingsModelFromJson(
    Map<String, dynamic> json) {
  return PlayersBuracoSettingsModel(
    id: json['id'] as int?,
    playersTeam1: json['playersTeam1'] as String,
    playersTeam2: json['playersTeam2'] as String,
  );
}

Map<String, dynamic> _$PlayersBuracoSettingsModelToJson(
        PlayersBuracoSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playersTeam1': instance.playersTeam1,
      'playersTeam2': instance.playersTeam2,
    };
