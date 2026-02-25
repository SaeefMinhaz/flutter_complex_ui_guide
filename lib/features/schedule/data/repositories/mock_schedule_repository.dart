import '../../domain/entities/live_event_entity.dart';
import '../../domain/entities/pre_match_event_entity.dart';
import '../../domain/entities/result_event_entity.dart';
import '../../domain/entities/schedule_data.dart';
import '../../domain/repositories/schedule_repository.dart';

class MockScheduleRepository implements ScheduleRepository {
  static List<DateTime> _dateRange() {
    const year = 2026;
    const month = DateTime.february;
    return List.generate(7, (i) => DateTime(year, month, 14 + i));
  }

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Future<ScheduleData> getScheduleForDate(DateTime date) async {
    final dates = _dateRange();
    var eventDotIndices = <int>{};

    var liveEvents = <LiveEventEntity>[];
    var preMatchEvents = <PreMatchEventEntity>[];
    var resultEvents = <ResultEventEntity>[];

    if (_sameDay(date, DateTime(2026, 2, 18))) {
      eventDotIndices.add(4);
      liveEvents = _liveEvents18;
      preMatchEvents = _preMatchEvents18;
    } else if (_sameDay(date, DateTime(2026, 2, 17))) {
      eventDotIndices.add(3);
      resultEvents = _resultEvents17;
    } else {
      eventDotIndices = {3, 4};
    }

    return ScheduleData(
      dates: dates,
      selectedDate: date,
      liveEvents: liveEvents,
      preMatchEvents: preMatchEvents,
      resultEvents: resultEvents,
      eventDotDateIndices: eventDotIndices,
    );
  }

  static final _liveEvents18 = [
    const LiveEventEntity(
      competitionText: "T20 World Cup. 2026. Group stage. Group D",
      team1Name: 'South Africa',
      team1Score: '0/0',
      team2Name: 'United Arab Emirates',
      team2Score: '29/0 (2.5 ov)',
    ),
  ];

  static final _preMatchEvents18 = [
    const PreMatchEventEntity(
      competitionText: "T20 World Cup. 2026. Group stage. Group A",
      team1Name: 'Pakistan',
      team2Name: 'Namibia',
      countdownText: '03 : 44 : 43',
      dateTimeText: '18.02.26 15:30',
      w1Value: '1.079',
      xValue: '25',
      w2Value: '8.8',
    ),
    const PreMatchEventEntity(
      competitionText: "T20 World Cup. 2026. Group stage. Group A",
      team1Name: 'India',
      team2Name: 'Netherlands',
      countdownText: '05 : 12 : 00',
      dateTimeText: '18.02.26 18:00',
      w1Value: '1.05',
      xValue: '26',
      w2Value: '9.2',
    ),
  ];

  static final _resultEvents17 = [
    const ResultEventEntity(
      competitionText: "T20 World Cup. 2026. Group stage. Group C",
      team1Name: 'Scotland',
      team1Score: '170/7',
      team2Name: 'Nepal',
      team2Score: '171/3',
      dateTimeText: '17.02.2026 (19:00)',
    ),
    const ResultEventEntity(
      competitionText: "T20 World Cup. 2026. Group stage. Group C",
      team1Name: 'West Indies',
      team1Score: '165/8',
      team2Name: 'Italy',
      team2Score: '142',
      dateTimeText: '17.02.2026 (15:30)',
    ),
  ];
}
