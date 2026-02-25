import 'package:equatable/equatable.dart';

class MyTeamEntity extends Equatable {
  const MyTeamEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class TeamMatchEntity extends Equatable {
  const TeamMatchEntity({
    required this.competitionText,
    required this.team1Name,
    required this.team2Name,
    required this.countdownText,
    required this.dateTimeText,
    this.w1Value,
    this.xValue,
    this.w2Value,
  });

  final String competitionText;
  final String team1Name;
  final String team2Name;
  final String countdownText;
  final String dateTimeText;
  final String? w1Value;
  final String? xValue;
  final String? w2Value;

  @override
  List<Object?> get props => [
        competitionText,
        team1Name,
        team2Name,
        countdownText,
        dateTimeText,
        w1Value,
        xValue,
        w2Value,
      ];
}

class MyGamesData extends Equatable {
  const MyGamesData({
    required this.teams,
    required this.matches,
  });

  final List<MyTeamEntity> teams;
  final List<TeamMatchEntity> matches;

  @override
  List<Object?> get props => [teams, matches];
}
