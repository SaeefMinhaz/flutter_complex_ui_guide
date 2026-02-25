import 'package:equatable/equatable.dart';

class PreMatchEventEntity extends Equatable {
  const PreMatchEventEntity({
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
  List<Object?> get props =>
      [competitionText, team1Name, team2Name, countdownText, dateTimeText, w1Value, xValue, w2Value];
}
