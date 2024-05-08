import 'dart:developer';

import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';
import 'package:get/get.dart';

class NoteGroupController extends GetxController {
  final repo = Get.find<NoteGroupRepository>();
  final noteGroups = <NoteGroupData>[].obs;
  NoteGroupController() {
    final result = repo.getAll();
    noteGroups.bindStream(result);
  }

  createNoteGroup() async {
    final createdNote = await repo.create();
    openNotesPage(createdNote.id, isNew: true);
  }
  openNotesPage(int id, {bool? isNew}) {
    if (isNew != null && isNew) {
      Get.toNamed('/groups/$id/notes?new=true');
      return;
    }
    Get.toNamed('/groups/$id/notes');
  }
}
