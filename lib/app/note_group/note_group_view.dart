import 'package:flutter/material.dart';
import 'package:game_notes/app/note_group/note_group_controller.dart';
import 'package:game_notes/app/widgets/note_group_card.dart';
import 'package:get/get.dart';

class NoteGroupView extends GetView<NoteGroupController> {
  const NoteGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GameNotes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.createNoteGroup(),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => ListView.builder(
              itemBuilder: (context, index) {
                final item = controller.noteGroups[index];
                return InkWell(
                  onTap: () => controller.openNotesPage(item.group.id),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: NoteGroupCard(
                      groupId: item.group.id,
                      content: item.note?.content ?? "No notes",
                      updatedAt: item.group.updatedAt,
                      gameName: item.game?.name,
                      gameCover: item.game?.coverUrl,
                    ),
                  ),
                );
              },
              itemCount: controller.noteGroups.length,
            )),
      ),
    );
  }
}
