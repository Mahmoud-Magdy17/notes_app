import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/all_notes_features/logic/cubit/all_notes_cubit.dart';
import 'package:notes_app/features/add_note_feature/ui/widgets/edit_note_view.dart';

import '../../../../core/functions/navigate_to.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, EditNoteView(note: note));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  note.delete();
                  debugPrint("removed");
                  BlocProvider.of<AllNotesCubit>(context).allNotes();
                },
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
      ),
    );
  }
}
