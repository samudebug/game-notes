import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/models/debouncer.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';
import 'package:get/get.dart';

class NoteGroupWithGame {
  NoteGroupData group;
  GameInfo? game;

  NoteGroupWithGame(this.group, {this.game});
}

class NotesPageController extends GetxController {
  final groupRepo = Get.find<NoteGroupRepository>();
  final notesRepo = Get.find<NotesRepository>();
  final gamesRepo = Get.find<GamesApiRepository>();
  final currentFocused = Rx<int?>(null);
  final notes = <NoteData>[].obs;
  final group = Rx<NoteGroupWithGame?>(null);
  final query = ''.obs;
  final debouncer = Debouncer(milliseconds: 500);
  final gameNameController = TextEditingController();
  NotesPageController() {
    final groupId = Get.parameters['groupId'];
    if (groupId == null) throw ("Group ID not set!!");
    final isNew = Get.parameters['new'];
    if (isNew == 'true') {
      addNote();
    }
    group.bindStream(
        groupRepo.get(id: int.parse(groupId)).asyncMap((event) async {
      if (event.gameId != null) {
        final game = await fetchGame(int.parse(event.gameId!));
        gameNameController.text = game.name;
        return NoteGroupWithGame(event, game: game);
      }
      return NoteGroupWithGame(event);
    }));
    notes.bindStream(notesRepo.getAllByGroup(groupId: int.parse(groupId)));
    debounce(query, (callback) => searchGames(callback),
        time: Duration(milliseconds: 500));
  }

  Future<GameInfo> fetchGame(int gameId) async {
    return gamesRepo.getGame(id: gameId);
  }

  onQueryChanged(String value) {
    query.value = value;
  }

  Future<List<GameInfo>> searchGames(String query) async {
    log("Searching $query");
    final searchResults = await gamesRepo.search(query: query);
    log("Search results ${searchResults.length}");
    return searchResults;
  }

  void onGameSelected(GameInfo game) {
    groupRepo.update(id: group.value!.group.id, gameId: game.id.toString());
    gameNameController.text = game.name;
  }

  addNote() async {
    final createdNote = await notesRepo.create(groupId: group.value!.group.id);
    currentFocused.value = createdNote.id;
  }

  onSaveNote(int id, String content) async {
    log("Saving note $id");
    await notesRepo.update(id: id, content: content);
    currentFocused.value = null;
  }

  onDeleteNote(int id) async {
    await notesRepo.delete(id: id);
    currentFocused.value = null;
  }

  onUnFocus() {
    currentFocused.value = null;
  }
}
