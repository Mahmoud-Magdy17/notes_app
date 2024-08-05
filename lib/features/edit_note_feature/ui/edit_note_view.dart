import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';

import 'widgets/edit_note_form.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            back: true,
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
          EditNoteForm(
            title: note.title,
            content: note.content,
          )
        ],
      ),
    );
  }
}
