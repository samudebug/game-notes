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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: NoteGroupCard(),
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}
