import '../domain/entities/statistics_entity.dart';
import '../domain/repositories/statistics_repository.dart';

class MockStatisticsRepository implements StatisticsRepository {
  const MockStatisticsRepository();

  static const _standings = <StandingsEntryEntity>[
    StandingsEntryEntity(rank: 1, teamName: 'New Zealand', points: 8),
    StandingsEntryEntity(rank: 2, teamName: 'Afghanistan', points: 6),
    StandingsEntryEntity(rank: 3, teamName: 'Scotland', points: 4),
    StandingsEntryEntity(rank: 4, teamName: 'Guyana', points: 2),
  ];

  static const _topPlayers = <TopPlayerEntity>[
    TopPlayerEntity(rank: 1, name: 'Tim Seifert', country: 'New Zealand', runs: 453),
    TopPlayerEntity(rank: 2, name: 'Rahmanullah Gurbaz', country: 'Afghanistan', runs: 331),
    TopPlayerEntity(rank: 3, name: 'George Munsey', country: 'Scotland', runs: 288),
    TopPlayerEntity(rank: 4, name: 'Sherfane Rutherford', country: 'Guyana', runs: 279),
    TopPlayerEntity(rank: 5, name: 'Jacob Graham Bethell', country: 'England', runs: 263),
  ];

  @override
  Future<StatisticsData> getStatistics() async {
    return const StatisticsData(
      standings: _standings,
      topPlayers: _topPlayers,
    );
  }
}

