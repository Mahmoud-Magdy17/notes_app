import 'package:flutter/material.dart';
import 'package:notes_app/features/all_notes_features/ui/widgets/custom_notes_builder.dart';

import '../../../core/models/note_model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../add_note_feature/ui/add_note_view.dart';
import '../logic/build_temp_notes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<NoteModel> notes = [...buildTempNote()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              context: context,
              builder: (ctx) {
                return const AddNoteView();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Text',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Expanded(
            child: CustomNotesBuilder(
              notes: notes,
            ),
          ),
        ],
      ),
    );
  }
}
