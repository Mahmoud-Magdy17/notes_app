import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/all_notes_features/logic/build_temp_notes.dart';

import 'note_item.dart';

class CustomNotesBuilder extends StatelessWidget {
  CustomNotesBuilder({super.key});
  final List<NoteModel> notes = [...buildTempNote()];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CustomNoteItem(
            note: notes[index],
          );
        },
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
