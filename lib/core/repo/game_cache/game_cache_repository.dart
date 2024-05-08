import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';

abstract class GameCacheRepository {
  Future<GameCacheData?> getFromCache({required int gameId});
  Future<GameCacheData> saveToCache(GameInfo data);
}