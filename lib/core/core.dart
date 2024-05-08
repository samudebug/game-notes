import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository_igdb.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository_drift.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';
import 'package:game_notes/core/repo/notes/notes_repository_drift.dart';
import 'package:get/get.dart';

Future<void> setupGamesApi() async {
  Get.putAsync<GamesApiRepository>(() async => GamesApiRepositoryIGDB());
}

Future<void> setupDatabase() async {
  final database = AppDatabase();
  Get.putAsync<NoteGroupRepository>(
      () async => NoteGroupRepositoryDrift(database: database));
  Get.putAsync<NotesRepository>(
      () async => NotesRepositoryDrift(database: database));
}

Future<void> init() async {
  await setupDatabase();
  await setupGamesApi();
}
