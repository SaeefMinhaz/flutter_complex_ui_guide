import 'package:equatable/equatable.dart';

import '../../domain/entities/statistics_entity.dart';

enum StatisticsStatus { initial, loading, success, failure }

class StatisticsState extends Equatable {
  const StatisticsState({
    this.standings = const [],
    this.topPlayers = const [],
    this.status = StatisticsStatus.initial,
  });

  final List<StandingsEntryEntity> standings;
  final List<TopPlayerEntity> topPlayers;
  final StatisticsStatus status;

  StatisticsState copyWith({
    List<StandingsEntryEntity>? standings,
    List<TopPlayerEntity>? topPlayers,
    StatisticsStatus? status,
  }) {
    return StatisticsState(
      standings: standings ?? this.standings,
      topPlayers: topPlayers ?? this.topPlayers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [standings, topPlayers, status];
}

