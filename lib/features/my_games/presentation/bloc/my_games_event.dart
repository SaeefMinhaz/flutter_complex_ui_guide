import 'package:equatable/equatable.dart';

abstract base class MyGamesEvent extends Equatable {
  const MyGamesEvent();

  @override
  List<Object?> get props => [];
}

final class MyGamesRequested extends MyGamesEvent {
  const MyGamesRequested();
}

