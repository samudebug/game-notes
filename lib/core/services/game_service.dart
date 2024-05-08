import 'package:game_notes/core/repo/game_cache/game_cache_repository.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:get/get.dart';

class GameService extends GetxService {
  final gameApiRepo = Get.find<GamesApiRepository>();
  final gameDbRepo = Get.find<GameCacheRepository>();

  Future<GameInfo> getGame(int gameId) async {
    final gameOnCache = await gameDbRepo.getFromCache(gameId: gameId);
    if (gameOnCache == null) {
      final gameFromApi = await gameApiRepo.getGame(id: gameId);
      final savedOnCache = await gameDbRepo.saveToCache(gameFromApi);
      return GameInfo.fromGameCacheData(savedOnCache);
    }
    return GameInfo.fromGameCacheData(gameOnCache);
  }

  Future<GameInfo> saveOnCache(GameInfo data) async {
    final result = await gameDbRepo.saveToCache(data);
    return GameInfo.fromGameCacheData(result);
  }
}
