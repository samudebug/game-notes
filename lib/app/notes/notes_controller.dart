import 'dart:developer';

import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';
import 'package:get/get.dart';

class NotesPageController extends GetxController {
  final groupRepo = Get.find<NoteGroupRepository>();
  final notesRepo = Get.find<NotesRepository>();
  final currentFocused = Rx<int?>(null);
  final notes = <NoteData>[].obs;
  final group = Rx<NoteGroupData?>(null);
  NotesPageController() {
    final groupId = Get.parameters['groupId'];
    if (groupId == null) throw ("Group ID not set!!");
    final isNew = Get.parameters['new'];
    if (isNew == 'true') {
      addNote();
    }
    group.bindStream(groupRepo.get(id: int.parse(groupId)));
    notes.bindStream(notesRepo.getAllByGroup(groupId: int.parse(groupId)));
  }

  addNote() async {
    final createdNote =
        await notesRepo.create(groupId: group.value!.id);
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
