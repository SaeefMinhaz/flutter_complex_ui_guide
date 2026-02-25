import 'package:equatable/equatable.dart';

class ResultEventEntity extends Equatable {
  const ResultEventEntity({
    required this.competitionText,
    required this.team1Name,
    required this.team1Score,
    required this.team2Name,
    required this.team2Score,
    required this.dateTimeText,
  });

  final String competitionText;
  final String team1Name;
  final String team1Score;
  final String team2Name;
  final String team2Score;
  final String dateTimeText;

  @override
  List<Object?> get props =>
      [competitionText, team1Name, team1Score, team2Name, team2Score, dateTimeText];
}
