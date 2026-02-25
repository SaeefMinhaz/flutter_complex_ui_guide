import '../entities/my_games_entity.dart';
import '../repositories/my_games_repository.dart';

class GetMyGamesUseCase {
  const GetMyGamesUseCase(this._repository);

  final MyGamesRepository _repository;

  Future<MyGamesData> call() => _repository.getMyGames();
}

