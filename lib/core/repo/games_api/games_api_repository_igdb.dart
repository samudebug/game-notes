import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:get/get.dart';

class GamesApiRepositoryIGDB extends GetConnect implements GamesApiRepository {
  @override
  void onInit() {
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = Duration(seconds: 30);
  }

  @override
  Future<GameInfo> getGame({required int id}) async {
    final authResponse =
        await post('https://id.twitch.tv/oauth2/token', null, query: {
      'client_id': dotenv.env['IGDB_API_CLIENT_ID'],
      'client_secret': dotenv.env['IGDB_API_CLIENT_SECRET'],
      'grant_type': 'client_credentials'
    });
    final token = authResponse.body['access_token'];
    final body = "where id=$id;\nfields cover.*,name,category;";
    final searchResponse =
        await post('https://api.igdb.com/v4/games', body, headers: {
      'Client-ID': dotenv.env['IGDB_API_CLIENT_ID'] ?? "",
      'Authorization': 'Bearer $token'
    });
    if (searchResponse.statusCode != 200) {
      log("Response code ${searchResponse.statusCode}", name: "GamesAPI");
      log("Response body: ${searchResponse.body}", name: "GamesAPI");
      throw ("An error has ocurred");
    }
    final results = (searchResponse.body as List<dynamic>)
        .map((e) => GameInfo.fromJson(e))
        .toList();
    return results.first;
  }

  @override
  Future<List<GameInfo>> search({required String query}) async {
    final authResponse =
        await post('https://id.twitch.tv/oauth2/token', null, query: {
      'client_id': dotenv.env['IGDB_API_CLIENT_ID'],
      'client_secret': dotenv.env['IGDB_API_CLIENT_SECRET'],
      'grant_type': 'client_credentials'
    });
    final token = authResponse.body['access_token'];
    final body =
        "search \"$query\";\nwhere category = (0,4,8,9,10,11);\nfields cover.*,name,category;";
    final searchResponse =
        await post('https://api.igdb.com/v4/games', body, headers: {
      'Client-ID': dotenv.env['IGDB_API_CLIENT_ID'] ?? "",
      'Authorization': 'Bearer $token'
    });
    if (searchResponse.statusCode != 200) {
      log("Response code ${searchResponse.statusCode}", name: "GamesAPI");
      log("Response body: ${searchResponse.body}", name: "GamesAPI");
      throw ("An error has ocurred");
    }
    final results = (searchResponse.body as List<dynamic>)
        .map((e) => GameInfo.fromJson(e))
        .toList();
    return results;
  }
}
