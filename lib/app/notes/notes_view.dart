import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_notes/app/notes/notes_controller.dart';
import 'package:game_notes/app/widgets/note_card.dart';
import 'package:game_notes/core/database/note_group.dart';
import 'package:get/get.dart';

class NotesView extends GetView<NotesPageController> {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        controller.currentFocused.value = null;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                style: context.textTheme.titleLarge,
                decoration: InputDecoration(
                    hintText: "Game Name", labelText: "Game Name"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: "Start Date",
                            suffix: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: DropdownMenu<Status>(
                          initialSelection: Status.playing,
                          requestFocusOnTap: true,
                          label: Text("Status"),
                          dropdownMenuEntries: Status.values
                              .map<DropdownMenuEntry<Status>>((Status status) {
                            return DropdownMenuEntry(
                                value: status,
                                label: status.name.capitalize ?? "");
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Obx(() => ListView.builder(
                        itemBuilder: (context, index) {
                          if (index == controller.notes.length) {
                            return InkWell(
                              onTap: () => controller.addNote(),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: context
                                            .theme.colorScheme.secondary),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text("Add"),
                                ),
                              ),
                            );
                          }
                          final item = controller.notes[index];
                          return Obx(() => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    log("Is focused ${controller.currentFocused.value == item.id}");
                                    controller.currentFocused.value = item.id;
                                  },
                                  child: NoteCard(
                                    key: Key('note-${item.id}'),
                                    id: item.id,
                                    isFocused:
                                        controller.currentFocused.value ==
                                            item.id,
                                    content: item.content,
                                    onSave: (id, content) =>
                                        controller.onSaveNote(id, content),
                                    onDelete: (id) =>
                                        controller.onDeleteNote(id),
                                    unFocus: () => controller.onUnFocus(),
                                  ),
                                ),
                              ));
                        },
                        itemCount: controller.notes.length + 1,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
