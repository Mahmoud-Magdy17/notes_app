import 'package:flutter/material.dart';
import 'package:notes_app/core/models/note_model.dart';

List<NoteModel> buildTempNote() {
  List<NoteModel> notes = [];

  for (var i = 0; i < 6; i++) {
    notes.add(
      NoteModel(
        title: "Note $i",
        content: "this is note $i",
        creationDate: DateTime.now(),
        color: Colors.blue,
      ),
    );
  }

  return notes;
}
