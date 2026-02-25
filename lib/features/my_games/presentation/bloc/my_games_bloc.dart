import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_my_games_usecase.dart';
import 'my_games_event.dart';
import 'my_games_state.dart';

class MyGamesBloc extends Bloc<MyGamesEvent, MyGamesState> {
  MyGamesBloc(this._getMyGames) : super(const MyGamesState()) {
    on<MyGamesRequested>(_onRequested);
  }

  final GetMyGamesUseCase _getMyGames;

  Future<void> _onRequested(
    MyGamesRequested event,
    Emitter<MyGamesState> emit,
  ) async {
    emit(state.copyWith(status: MyGamesStatus.loading));
    try {
      final data = await _getMyGames();
      emit(MyGamesState(
        teams: data.teams,
        matches: data.matches,
        status: MyGamesStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: MyGamesStatus.failure));
    }
  }
}

