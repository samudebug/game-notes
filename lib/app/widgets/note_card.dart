import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:game_notes/core/database/database.dart';
import 'package:get/get.dart';

class NoteCard extends StatefulWidget {
  NoteCard(
      {super.key,
      required this.isFocused,
      required this.id,
      required this.content,
      required this.onSave,
      required this.onDelete,
      required this.unFocus});
  final bool isFocused;
  final int id;
  final String content;
  final void Function(int id, String content) onSave;
  final void Function(int id) onDelete;
  final void Function() unFocus;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late final controller = TextEditingController(text: widget.content.trim());

  final _node = FocusNode();

  final textHasFocus = false.obs;
  @override
  void initState() {
    super.initState();
    _node.requestFocus();

    _node.addListener(() {
      if (textHasFocus.value && !_node.hasFocus) {
        handleSave();
      }
      if (_node.hasFocus != textHasFocus.value) {
        textHasFocus.value = _node.hasFocus;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _node.dispose();
    super.dispose();
  }

  void handleSave() {
    if (controller.text.trim().isEmpty) {
      widget.onDelete(widget.id);
      return;
    }
    if (controller.text.trim() != widget.content) {
      widget.onSave(widget.id, controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.isFocused)
            TextField(
              controller: controller,
              focusNode: _node,
              autofocus: true,
              style: context.textTheme.bodyMedium,
              keyboardType: TextInputType.multiline,
              onTapOutside: (event) {
                _node.unfocus();
              },
              maxLength: 10000,
              decoration: InputDecoration(
                hintText: "Write your notes here...",
              ),
            )
          else
            Text(
              widget.content,
              style: context.textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          if (widget.isFocused) Divider(),
          if (widget.isFocused)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.onDelete(widget.id);
                    },
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.errorContainer,
                      foregroundColor: context.theme.colorScheme.onErrorContainer
                    ),),
                ElevatedButton(
                    onPressed: () {
                      _node.unfocus();
                      widget.unFocus();
                    },
                    child: Text("Save"))
              ],
            )
        ],
      ),
    );
  }
}
