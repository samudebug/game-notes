import 'package:game_notes/core/repo/games_api/game_info.dart';

abstract class GamesApiRepository {
  Future<List<GameInfo>> search({required String query});
  Future<GameInfo> getGame({required int id});
}