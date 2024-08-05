import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xffffcc80),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              note.content,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Text(note.creationDate.toString()),
        ],
      ),
    );
  }
}
