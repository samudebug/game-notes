import 'package:game_notes/core/database/database.dart';

class GameInfo {
  int id;
  String name;
  String coverUrl;

  GameInfo({required this.id, required this.name, required this.coverUrl});

  GameInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coverUrl =
            'https://images.igdb.com/igdb/image/upload/t_logo_med/${json['cover']['image_id']}.jpg';
  GameInfo.fromGameCacheData(GameCacheData data)
      : id = data.gameId,
        name = data.name,
        coverUrl = data.coverUrl;
}
