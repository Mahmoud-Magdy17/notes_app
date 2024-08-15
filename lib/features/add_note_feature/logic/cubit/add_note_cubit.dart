import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(
        AddNoteError(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
