import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/models/note_model.dart';

import '../../../../core/constants/constants.dart';

part 'all_notes_state.dart';

class AllNotesCubit extends Cubit<AllNotesState> {
  AllNotesCubit() : super(AllNotesInitial());
  List<NoteModel>? notes;
  void allNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(AllNotesSuccess());
  }
}
