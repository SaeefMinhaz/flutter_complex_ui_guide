import 'package:equatable/equatable.dart';

import '../../domain/entities/live_event_entity.dart';
import '../../domain/entities/pre_match_event_entity.dart';
import '../../domain/entities/result_event_entity.dart';

enum ScheduleStatus { initial, loading, success, failure }

class ScheduleState extends Equatable {
  const ScheduleState({
    this.dates = const [],
    this.selectedDate,
    this.liveEvents = const [],
    this.preMatchEvents = const [],
    this.resultEvents = const [],
    this.eventDotDateIndices = const {},
    this.status = ScheduleStatus.initial,
  });

  final List<DateTime> dates;
  final DateTime? selectedDate;
  final List<LiveEventEntity> liveEvents;
  final List<PreMatchEventEntity> preMatchEvents;
  final List<ResultEventEntity> resultEvents;
  final Set<int> eventDotDateIndices;
  final ScheduleStatus status;

  int get selectedDateIndex {
    if (selectedDate == null || dates.isEmpty) return 0;
    for (var i = 0; i < dates.length; i++) {
      final d = dates[i];
      if (d.year == selectedDate!.year &&
          d.month == selectedDate!.month &&
          d.day == selectedDate!.day) {
        return i;
      }
    }
    return 0;
  }

  ScheduleState copyWith({
    List<DateTime>? dates,
    DateTime? selectedDate,
    List<LiveEventEntity>? liveEvents,
    List<PreMatchEventEntity>? preMatchEvents,
    List<ResultEventEntity>? resultEvents,
    Set<int>? eventDotDateIndices,
    ScheduleStatus? status,
  }) {
    return ScheduleState(
      dates: dates ?? this.dates,
      selectedDate: selectedDate ?? this.selectedDate,
      liveEvents: liveEvents ?? this.liveEvents,
      preMatchEvents: preMatchEvents ?? this.preMatchEvents,
      resultEvents: resultEvents ?? this.resultEvents,
      eventDotDateIndices: eventDotDateIndices ?? this.eventDotDateIndices,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        dates,
        selectedDate,
        liveEvents,
        preMatchEvents,
        resultEvents,
        eventDotDateIndices,
        status,
      ];
}
