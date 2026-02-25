import 'package:equatable/equatable.dart';

class LiveEventEntity extends Equatable {
  const LiveEventEntity({
    required this.competitionText,
    required this.team1Name,
    required this.team1Score,
    required this.team2Name,
    required this.team2Score,
  });

  final String competitionText;
  final String team1Name;
  final String team1Score;
  final String team2Name;
  final String team2Score;

  @override
  List<Object?> get props => [competitionText, team1Name, team1Score, team2Name, team2Score];
}
