class BuracoScore {
  final int scoreTeam1;
  final int scoreTeam2;
  final String playersTeam1;
  final String playersTeam2;

  BuracoScore({
    this.scoreTeam1 = 0,
    this.scoreTeam2 = 0,
    this.playersTeam1 = '',
    this.playersTeam2 = '',
  });

  BuracoScore copyWith({
    int? scoreTeam1,
    int? scoreTeam2,
    String? playersTeam1,
    String? playersTeam2,
  }) =>
      BuracoScore(
        scoreTeam1: scoreTeam1 ?? this.scoreTeam1,
        scoreTeam2: scoreTeam2 ?? this.scoreTeam2,
        playersTeam1: playersTeam1 ?? this.playersTeam1,
        playersTeam2: playersTeam2 ?? this.playersTeam2,
      );
}
