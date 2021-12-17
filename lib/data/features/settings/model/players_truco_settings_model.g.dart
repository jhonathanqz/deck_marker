// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_truco_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayersTrucoSettingsModel _$PlayersTrucoSettingsModelFromJson(
    Map<String, dynamic> json) {
  return PlayersTrucoSettingsModel(
    id: json['id'] as int?,
    playersTeam1: json['playersTeam1'] as String,
    playersTeam2: json['playersTeam2'] as String,
  );
}

Map<String, dynamic> _$PlayersTrucoSettingsModelToJson(
        PlayersTrucoSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playersTeam1': instance.playersTeam1,
      'playersTeam2': instance.playersTeam2,
    };
