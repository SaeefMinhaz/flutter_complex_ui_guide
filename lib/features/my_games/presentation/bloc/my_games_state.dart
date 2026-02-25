import 'package:equatable/equatable.dart';

import '../../domain/entities/my_games_entity.dart';

enum MyGamesStatus { initial, loading, success, failure }

class MyGamesState extends Equatable {
  const MyGamesState({
    this.teams = const [],
    this.matches = const [],
    this.status = MyGamesStatus.initial,
  });

  final List<MyTeamEntity> teams;
  final List<TeamMatchEntity> matches;
  final MyGamesStatus status;

  MyGamesState copyWith({
    List<MyTeamEntity>? teams,
    List<TeamMatchEntity>? matches,
    MyGamesStatus? status,
  }) {
    return MyGamesState(
      teams: teams ?? this.teams,
      matches: matches ?? this.matches,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [teams, matches, status];
}

