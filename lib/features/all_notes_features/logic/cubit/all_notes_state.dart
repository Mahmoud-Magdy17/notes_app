part of 'all_notes_cubit.dart';

sealed class AllNotesState {}

final class AllNotesInitial extends AllNotesState {}

final class AllNotesSuccess extends AllNotesState {
  final List<NoteModel> notes;

  AllNotesSuccess({required this.notes});
}

final class AllNotesLoading extends AllNotesState {}

final class AllNotesError extends AllNotesState {
  final String errorMsg;

  AllNotesError({required this.errorMsg});
}
