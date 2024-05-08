import 'dart:developer';

import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/game_cache/game_cache_repository.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';

class GameCacheRepositoryDrift implements GameCacheRepository {
  const GameCacheRepositoryDrift(this.database);
  final AppDatabase database;
  @override
  Future<GameCacheData?> getFromCache({required int gameId}) async {
    return (await (database.select(database.gameCache)
          ..where((tbl) => tbl.gameId.equals(gameId)))
        .get()).firstOrNull;
  }

  @override
  Future<GameCacheData> saveToCache(GameInfo data) async {
    log("Saving on cache");
    return await database.into(database.gameCache).insertReturning(
        GameCacheCompanion.insert(
            gameId: data.id, name: data.name, coverUrl: data.coverUrl));
  }
}
