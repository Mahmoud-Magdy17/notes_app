import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/all_notes_features/logic/cubit/all_notes_cubit.dart';

import 'custom_note_item.dart';

class CustomNotesBuilder extends StatelessWidget {
  const CustomNotesBuilder({super.key, required this.notes});
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesCubit, AllNotesState>(
      builder: (context, state) {
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
      },
    );
  }
}
