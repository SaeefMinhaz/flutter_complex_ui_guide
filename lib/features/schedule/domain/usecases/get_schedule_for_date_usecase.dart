import '../entities/schedule_data.dart';
import '../repositories/schedule_repository.dart';

class GetScheduleForDateUseCase {
  GetScheduleForDateUseCase(this._repository);

  final ScheduleRepository _repository;

  Future<ScheduleData> call(DateTime date) => _repository.getScheduleForDate(date);
}
