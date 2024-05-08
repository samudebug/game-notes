import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository_drift.dart';
import 'package:get/get.dart';

Future<void> setupDatabase() async {
  final database = AppDatabase();
  Get.putAsync<NoteGroupRepository>(
      () async => NoteGroupRepositoryDrift(database: database));
}

Future<void> init() async {
  await setupDatabase();
}
