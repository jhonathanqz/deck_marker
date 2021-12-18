class Truco {
  final String scoreTeam1;
  final String scoreTeam2;
  final String playersTeam1;
  final String playersTeam2;

  Truco({
    this.scoreTeam1 = '',
    this.scoreTeam2 = '',
    this.playersTeam1 = '',
    this.playersTeam2 = '',
  });

  Truco copyWith({
    String? scoreTeam1,
    String? scoreTeam2,
    String? playersTeam1,
    String? playersTeam2,
  }) =>
      Truco(
        scoreTeam1: scoreTeam1 ?? this.scoreTeam1,
        scoreTeam2: scoreTeam2 ?? this.scoreTeam2,
        playersTeam1: playersTeam1 ?? this.playersTeam1,
        playersTeam2: playersTeam2 ?? this.playersTeam2,
      );
}
