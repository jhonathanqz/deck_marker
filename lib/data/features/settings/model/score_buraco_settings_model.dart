import 'package:json_annotation/json_annotation.dart';

part 'score_buraco_settings_model.g.dart';

@JsonSerializable()
class ScoreBuracoSettingsModel {
  final int? id;
  final String scoreTeam1;
  final String scoreTeam2;

  ScoreBuracoSettingsModel({
    this.id,
    required this.scoreTeam1,
    required this.scoreTeam2,
  });

  factory ScoreBuracoSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreBuracoSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreBuracoSettingsModelToJson(this);
}
