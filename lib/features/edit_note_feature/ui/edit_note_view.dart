import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_app/features/all_notes_features/logic/cubit/all_notes_cubit.dart';
import 'package:notes_app/features/edit_note_feature/ui/widgets/colors_list_view.dart';

import '../../add_note_feature/ui/widgets/custom_text_form_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            back: true,
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;

              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<AllNotesCubit>(context).allNotes();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8),
            child: Column(
              children: [
                CustomTextFormField(
                  initialValue: widget.note.title,
                  hint: widget.note.title,
                  onChanged: (val) {
                    title = val;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  initialValue: widget.note.content,
                  onChanged: (val) {
                    content = val;
                  },
                  hint: widget.note.content,
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 24,
                ),
                ColorsListView(note: widget.note)
              ],
            ),
          )
        ],
      ),
    );
  }
}
