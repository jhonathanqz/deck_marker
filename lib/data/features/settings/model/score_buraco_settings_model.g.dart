// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_buraco_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreBuracoSettingsModel _$ScoreBuracoSettingsModelFromJson(
    Map<String, dynamic> json) {
  return ScoreBuracoSettingsModel(
    id: json['id'] as int?,
    scoreTeam1: json['scoreTeam1'] as String,
    scoreTeam2: json['scoreTeam2'] as String,
  );
}

Map<String, dynamic> _$ScoreBuracoSettingsModelToJson(
        ScoreBuracoSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scoreTeam1': instance.scoreTeam1,
      'scoreTeam2': instance.scoreTeam2,
    };
