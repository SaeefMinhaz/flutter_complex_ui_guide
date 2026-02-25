import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_schedule_for_date_usecase.dart';
import 'schedule_event.dart';
import 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(this._getScheduleForDate)
      : super(const ScheduleState()) {
    on<ScheduleRequested>(_onRequested);
    on<ScheduleDateSelected>(_onDateSelected);
  }

  final GetScheduleForDateUseCase _getScheduleForDate;

  Future<void> _onRequested(
    ScheduleRequested event,
    Emitter<ScheduleState> emit,
  ) async {
    final date = event.initialDate ?? DateTime(2026, 2, 18);
    await _loadForDate(emit, date);
  }

  Future<void> _onDateSelected(
    ScheduleDateSelected event,
    Emitter<ScheduleState> emit,
  ) async {
    await _loadForDate(emit, event.date);
  }

  Future<void> _loadForDate(Emitter<ScheduleState> emit, DateTime date) async {
    emit(state.copyWith(status: ScheduleStatus.loading));
    try {
      final data = await _getScheduleForDate(date);
      emit(ScheduleState(
        dates: data.dates,
        selectedDate: data.selectedDate,
        liveEvents: data.liveEvents,
        preMatchEvents: data.preMatchEvents,
        resultEvents: data.resultEvents,
        eventDotDateIndices: data.eventDotDateIndices,
        status: ScheduleStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: ScheduleStatus.failure));
    }
  }
}
