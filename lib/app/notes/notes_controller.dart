import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/database/note_group.dart';
import 'package:game_notes/core/models/debouncer.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:game_notes/core/repo/games_api/games_api_repository.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';
import 'package:game_notes/core/services/game_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteGroupWithGame {
  NoteGroupData group;
  GameInfo? game;

  NoteGroupWithGame(this.group, {this.game});
}

class NotesPageController extends GetxController {
  final groupRepo = Get.find<NoteGroupRepository>();
  final notesRepo = Get.find<NotesRepository>();
  final gameService = Get.find<GameService>();
  final gamesRepo = Get.find<GamesApiRepository>();
  final currentFocused = Rx<int?>(null);
  final notes = <NoteData>[].obs;
  final group = Rx<NoteGroupWithGame?>(null);
  final debouncer = Debouncer(milliseconds: 500);
  final gameNameController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final startDateFocusNode = FocusNode();
  final endDateFocusNode = FocusNode();
  NotesPageController() {
    final groupId = Get.parameters['groupId'];
    if (groupId == null) throw ("Group ID not set!!");
    group.bindStream(
        groupRepo.get(id: int.parse(groupId)).asyncMap((event) async {
      startDateController.text =
          DateFormat("dd/MM/yyyy").format(event.startDate);
      endDateController.text = DateFormat("dd/MM/yyyy").format(event.endDate);
      if (event.gameId != null) {
        final game = await fetchGame(int.parse(event.gameId!));
        gameNameController.text = game.name;
        return NoteGroupWithGame(event, game: game);
      }
      return NoteGroupWithGame(event);
    }));
    notes.bindStream(notesRepo.getAllByGroup(groupId: int.parse(groupId)));
    once(group, (callback) {
      final isNew = Get.parameters['new'];
      if (isNew == 'true') {
        addNote();
      }
    });
    startDateFocusNode.addListener(() {
      onFocusChanged(startDateFocusNode.hasFocus);
    });
    endDateFocusNode.addListener(() {
      onFocusChanged(endDateFocusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    gameNameController.dispose();
    startDateFocusNode.dispose();
    endDateFocusNode.dispose();
    super.dispose();
  }

  void onFocusChanged(bool isFocused) {
    if (!isFocused) {
      saveDates();
    }
  }

  Future<GameInfo> fetchGame(int gameId) async {
    return gameService.getGame(gameId);
  }

  Future<List<GameInfo>> searchGames(String query) async {
    log("Searching $query");
    final searchResults = await gamesRepo.search(query: query);
    log("Search results ${searchResults.length}");
    return searchResults;
  }

  void onGameSelected(GameInfo game) async {
    await groupRepo.update(
        id: group.value!.group.id, gameId: game.id.toString());
    await gameService.saveOnCache(game);
    gameNameController.text = game.name;
  }

  void onStatusSelected(Status? status) {
    if (status != null) {
      if (group.value != null) {
        if (group.value!.group.status != status) {
          groupRepo.update(
              id: group.value!.group.id,
              status: status,
              endDate: status != Status.playing ? DateTime.now() : null);
        }
      }
    }
  }

  onSelectDate(BuildContext context, {bool end = false}) async {
    final date = await showDatePicker(
        context: context,
        firstDate: end
            ? group.value!.group.startDate
            : DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (date != null) {
      if (end) {
        endDateController.text = DateFormat("dd/MM/yyyy").format(date);
        return;
      }
      startDateController.text = DateFormat("dd/MM/yyyy").format(date);
    }
    saveDates();
  }

  addNote() async {
    final createdNote = await notesRepo.create(groupId: group.value!.group.id);
    groupRepo.update(id: group.value!.group.id);
    currentFocused.value = createdNote.id;
  }

  onSaveNote(int id, String content) async {
    await notesRepo.update(id: id, content: content);
    groupRepo.update(id: group.value!.group.id);
    currentFocused.value = null;
  }

  saveDates() {
    final isStartDateValid = RegExp(r'^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$')
        .hasMatch(startDateController.text);
    final isEndDateValid = RegExp(r'^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$')
        .hasMatch(endDateController.text);
    groupRepo.update(
        id: group.value!.group.id,
        startDate: isStartDateValid
            ? DateFormat("dd/MM/yyyy").parse(startDateController.text)
            : null,
        endDate: isEndDateValid
            ? DateFormat("dd/MM/yyyy").parse(endDateController.text)
            : null);
  }

  onDeleteNote(int id) async {
    await notesRepo.delete(id: id);
    currentFocused.value = null;
  }

  onUnFocus() {
    currentFocused.value = null;
  }
}
