import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_statistics_usecase.dart';
import 'statistics_event.dart';
import 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc(this._getStatistics) : super(const StatisticsState()) {
    on<StatisticsRequested>(_onRequested);
  }

  final GetStatisticsUseCase _getStatistics;

  Future<void> _onRequested(
    StatisticsRequested event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(state.copyWith(status: StatisticsStatus.loading));
    try {
      final data = await _getStatistics();
      emit(StatisticsState(
        standings: data.standings,
        topPlayers: data.topPlayers,
        status: StatisticsStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: StatisticsStatus.failure));
    }
  }
}

