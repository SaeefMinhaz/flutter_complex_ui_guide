import '../entities/schedule_data.dart';

abstract interface class ScheduleRepository {
  Future<ScheduleData> getScheduleForDate(DateTime date);
}
