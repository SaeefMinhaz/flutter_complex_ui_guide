import 'package:equatable/equatable.dart';

import 'live_event_entity.dart';
import 'pre_match_event_entity.dart';
import 'result_event_entity.dart';

/// Schedule data for a given date range: calendar dates, selected date, and event lists.
class ScheduleData extends Equatable {
  const ScheduleData({
    required this.dates,
    required this.selectedDate,
    required this.liveEvents,
    required this.preMatchEvents,
    required this.resultEvents,
    required this.eventDotDateIndices,
  });

  final List<DateTime> dates;
  final DateTime selectedDate;
  final List<LiveEventEntity> liveEvents;
  final List<PreMatchEventEntity> preMatchEvents;
  final List<ResultEventEntity> resultEvents;
  /// Indices into [dates] for which to show the green event dot.
  final Set<int> eventDotDateIndices;

  int get selectedDateIndex {
    for (var i = 0; i < dates.length; i++) {
      if (_sameDay(dates[i], selectedDate)) return i;
    }
    return 0;
  }

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  List<Object?> get props => [
        dates,
        selectedDate,
        liveEvents,
        preMatchEvents,
        resultEvents,
        eventDotDateIndices,
      ];
}
