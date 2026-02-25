import '../domain/entities/my_games_entity.dart';
import '../domain/repositories/my_games_repository.dart';

class MockMyGamesRepository implements MyGamesRepository {
  const MockMyGamesRepository();

  static const List<MyTeamEntity> _teams = [
    MyTeamEntity(id: 'ind', name: 'India'),
    MyTeamEntity(id: 'pak', name: 'Pakistan'),
    MyTeamEntity(id: 'ned', name: 'Netherlands'),
    MyTeamEntity(id: 'nam', name: 'Namibia'),
    MyTeamEntity(id: 'usa', name: 'USA'),
  ];

  static const List<TeamMatchEntity> _matches = [
    TeamMatchEntity(
      competitionText: 'T20 World Cup. 2026. Group stage. Group A',
      team1Name: 'Pakistan',
      team2Name: 'Namibia',
      countdownText: '03 : 44 : 43',
      dateTimeText: '18.02.26 15:30',
      w1Value: '1.079',
      xValue: '25',
      w2Value: '8.8',
    ),
    TeamMatchEntity(
      competitionText: 'T20 World Cup. 2026. Group stage. Group A',
      team1Name: 'India',
      team2Name: 'Netherlands',
      countdownText: '05 : 12 : 00',
      dateTimeText: '18.02.26 18:00',
      w1Value: '1.05',
      xValue: '26',
      w2Value: '9.2',
    ),
  ];

  @override
  Future<MyGamesData> getMyGames() async {
    // In a real app add network delay / fetching; here return immediately.
    return const MyGamesData(teams: _teams, matches: _matches);
  }
}
