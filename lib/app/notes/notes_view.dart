import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:game_notes/app/notes/notes_controller.dart';
import 'package:game_notes/app/widgets/note_card.dart';
import 'package:game_notes/core/database/note_group.dart';
import 'package:game_notes/core/repo/games_api/game_info.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (controller.group.value?.game != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CachedNetworkImage(
                            imageUrl: controller.group.value!.game!.coverUrl,
                            height: 80,
                          ),
                        ),
                      Expanded(
                        child: TypeAheadField<GameInfo>(
                          controller: controller.gameNameController,
                          debounceDuration: Duration(milliseconds: 500),
                          hideOnEmpty: true,
                          hideOnUnfocus: true,
                          suggestionsController:
                              controller.suggestionsController,
                          focusNode: controller.gameNameFocusNode,
                          itemSeparatorBuilder: (context, index) => Divider(),
                          suggestionsCallback: (search) async {
                            return await controller.searchGames(search);
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                              controller: controller,
                              style: context.textTheme.titleLarge,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                  hintText: "Game Name",
                                  labelText: "Game Name"),
                            );
                          },
                          itemBuilder: (context, item) {
                            return ListTile(
                              leading: Image.network(item.coverUrl),
                              title: Text(item.name),
                            );
                          },
                          onSelected: (item) {
                            controller.onGameSelected(item);
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: controller.startDateController,
                                  focusNode: controller.startDateFocusNode,
                                  decoration: InputDecoration(
                                      hintText: "Start Date",
                                      suffix: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () =>
                                            controller.onSelectDate(context),
                                      ),
                                      labelText: "Start Date"),
                                ),
                                if (controller.group.value?.group.status !=
                                    Status.playing)
                                  TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    controller: controller.endDateController,
                                    focusNode: controller.endDateFocusNode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          r'^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$'))
                                    ],
                                    decoration: InputDecoration(
                                        hintText: "End Date",
                                        suffix: IconButton(
                                          icon: Icon(Icons.calendar_today),
                                          onPressed: () => controller
                                              .onSelectDate(context, end: true),
                                        ),
                                        labelText: "End Date"),
                                  ),
                              ],
                            ),
                          ),
                        )),
                    Obx(() => Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: DropdownMenu<Status>(
                              initialSelection:
                                  controller.group.value?.group.status,
                              label: Text("Status"),
                              onSelected: (value) =>
                                  controller.onStatusSelected(value),
                              dropdownMenuEntries: Status.values
                                  .map<DropdownMenuEntry<Status>>(
                                      (Status status) {
                                return DropdownMenuEntry(
                                    value: status,
                                    label: status.name.capitalize ?? "");
                              }).toList(),
                            ),
                          ),
                        ))
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
