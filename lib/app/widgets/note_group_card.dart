import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteGroupCard extends StatelessWidget {
  const NoteGroupCard({super.key});

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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                    "https://images.igdb.com/igdb/image/upload/t_logo_med/co1uje.jpg", height: 80,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Zelda II: The Adventure of Link", style: context.textTheme.labelLarge,),
              )
            ],
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", maxLines: 3, overflow: TextOverflow.ellipsis, style: context.textTheme.bodySmall,),
        ],
      ),
    );
  }
}
