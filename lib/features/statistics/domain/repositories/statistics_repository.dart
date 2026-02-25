import '../entities/statistics_entity.dart';

abstract interface class StatisticsRepository {
  Future<StatisticsData> getStatistics();
}

