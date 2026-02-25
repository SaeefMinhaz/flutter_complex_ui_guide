import '../entities/my_games_entity.dart';

abstract interface class MyGamesRepository {
  Future<MyGamesData> getMyGames();
}

