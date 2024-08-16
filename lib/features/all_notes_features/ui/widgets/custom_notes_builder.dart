import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/add_note_feature/logic/cubit/add_note_cubit.dart';
import 'package:notes_app/features/all_notes_features/logic/cubit/all_notes_cubit.dart';

import 'custom_note_item.dart';

class CustomNotesBuilder extends StatefulWidget {
  const CustomNotesBuilder({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  State<CustomNotesBuilder> createState() => _CustomNotesBuilderState();
}

class _CustomNotesBuilderState extends State<CustomNotesBuilder> {
  List<NoteModel>? notes;
  @override
  void initState() {
    BlocProvider.of<AllNotesCubit>(context).allNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notes = BlocProvider.of<AllNotesCubit>(context).notes;
    return BlocConsumer<AllNotesCubit, AllNotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return CustomNoteItem(
                note: notes![index],
              );
            },
            itemCount: notes!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        );
      },
      listener: (BuildContext context, AllNotesState state) {
        if (state is AddNoteSuccess || state is AllNotesSuccess) {
          BlocProvider.of<AllNotesCubit>(context).allNotes();
        }
      },
    );
  }
}
