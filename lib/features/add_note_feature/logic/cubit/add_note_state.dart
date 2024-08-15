part of 'add_note_cubit.dart';

sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteError extends AddNoteState {
  final String errorMsg;

  AddNoteError({required this.errorMsg});
}
