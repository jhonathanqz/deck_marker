// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_truco_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreTrucoSettingsModel _$ScoreTrucoSettingsModelFromJson(
    Map<String, dynamic> json) {
  return ScoreTrucoSettingsModel(
    id: json['id'] as int?,
    scoreTeam1: json['scoreTeam1'] as String,
    scoreTeam2: json['scoreTeam2'] as String,
  );
}

Map<String, dynamic> _$ScoreTrucoSettingsModelToJson(
        ScoreTrucoSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scoreTeam1': instance.scoreTeam1,
      'scoreTeam2': instance.scoreTeam2,
    };
