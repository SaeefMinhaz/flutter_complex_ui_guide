import '../entities/statistics_entity.dart';
import '../repositories/statistics_repository.dart';

class GetStatisticsUseCase {
  const GetStatisticsUseCase(this._repository);

  final StatisticsRepository _repository;

  Future<StatisticsData> call() => _repository.getStatistics();
}

