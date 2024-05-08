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
                  onTap: () => controller.openNotesPage(item.id),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: NoteGroupCard(
                      groupId: item.id,
                      content:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      updatedAt: item.updatedAt,
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
