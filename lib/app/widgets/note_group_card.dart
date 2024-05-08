import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteGroupCard extends StatelessWidget {
  const NoteGroupCard(
      {super.key,
      required this.groupId,
      this.gameName,
      this.gameCover,
      required this.content,
      required this.updatedAt,
      required this.onDelete});
  final int groupId;
  final String? gameName;
  final String? gameCover;
  final String content;
  final DateTime updatedAt;
  final void Function(int id) onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('dd/MM/yyyy, HH:mm').format(updatedAt),
                style: context.textTheme.labelSmall
                    ?.copyWith(color: context.theme.colorScheme.secondary),
              ),
              IconButton(onPressed: () {
                onDelete(groupId);
              }, icon: Icon(Icons.delete), color: context.theme.colorScheme.error, iconSize: 18,)
            ],
          ),
          if (gameName != null)
            Row(
              children: [
                if (gameCover != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: gameCover!,
                      height: 80,
                    ),
                  ),
                if (gameName != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      gameName!,
                      style: context.textTheme.labelLarge,
                    ),
                  )
              ],
            ),
          Text(
            content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
