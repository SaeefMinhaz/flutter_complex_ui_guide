import 'package:equatable/equatable.dart';

class StandingsEntryEntity extends Equatable {
  const StandingsEntryEntity({
    required this.rank,
    required this.teamName,
    this.points,
  });

  final int rank;
  final String teamName;
  final int? points;

  @override
  List<Object?> get props => [rank, teamName, points];
}

class TopPlayerEntity extends Equatable {
  const TopPlayerEntity({
    required this.rank,
    required this.name,
    required this.country,
    required this.runs,
  });

  final int rank;
  final String name;
  final String country;
  final int runs;

  @override
  List<Object?> get props => [rank, name, country, runs];
}

class StatisticsData extends Equatable {
  const StatisticsData({
    required this.standings,
    required this.topPlayers,
  });

  final List<StandingsEntryEntity> standings;
  final List<TopPlayerEntity> topPlayers;

  @override
  List<Object?> get props => [standings, topPlayers];
}

