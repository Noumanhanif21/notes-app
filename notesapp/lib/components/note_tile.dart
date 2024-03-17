import 'package:flutter/material.dart';
import 'package:notesapp/components/note_setting.dart';

import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;

  final void Function()? onDeletePressed;
  const NoteTile(
      {super.key, required this.text, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 25, right: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () => showPopover(
              backgroundColor: Theme.of(context).colorScheme.background,
              width: 80,
              height: 50,
              context: context,
              bodyBuilder: (context) => NoteSetting(
                onDeleteTap: onDeletePressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
