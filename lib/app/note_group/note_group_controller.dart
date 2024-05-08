import 'dart:developer';

import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';
import 'package:game_notes/core/services/game_service.dart';
import 'package:get/get.dart';

class NoteGroupWithNoteWithGame {
  NoteGroupData group;
  NoteData? note;
  GameInfo? game;

  NoteGroupWithNoteWithGame(this.group, this.note, {this.game});
}

class NoteGroupController extends GetxController {
  final repo = Get.find<NoteGroupRepository>();
  final notesRepo = Get.find<NotesRepository>();
  final gameService = Get.find<GameService>();
  final noteGroups = <NoteGroupWithNoteWithGame>[].obs;
  NoteGroupController() {
    final result = repo.getAll().asyncMap((event) async {
      return Future.wait(event.map((e) async {
        final note = await notesRepo.getFirst(groupId: e.id);
        if (e.gameId != null) {
          final game = await gameService.getGame(int.parse(e.gameId!));
          return NoteGroupWithNoteWithGame(e, note, game: game);
        }
        return NoteGroupWithNoteWithGame(e, note);
      }));
    });
    noteGroups.bindStream(result);
  }

  createNoteGroup() async {
    final createdNote = await repo.create();
    openNotesPage(createdNote.id, isNew: true);
  }

  openNotesPage(int id, {bool isNew = false}) {
    if (isNew) {
      Get.toNamed('/groups/$id/notes?new=true');
      return;
    }
    Get.toNamed('/groups/$id/notes');
  }

  onDeleteGroup(int id) {
    repo.delete(id: id);
  }
}
