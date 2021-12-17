import 'package:json_annotation/json_annotation.dart';

part 'score_truco_settings_model.g.dart';

@JsonSerializable()
class ScoreTrucoSettingsModel {
  final int? id;
  final String scoreTeam1;
  final String scoreTeam2;

  ScoreTrucoSettingsModel({
    this.id,
    required this.scoreTeam1,
    required this.scoreTeam2,
  });

  factory ScoreTrucoSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreTrucoSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreTrucoSettingsModelToJson(this);
}
