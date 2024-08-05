import 'package:flutter/material.dart';
import 'package:notes_app/features/add_note_feature/ui/widgets/custom_text_form_field.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8),
      child: Column(
        children: [
          CustomTextFormField(hint: "Title"),
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hint: "Content",
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
