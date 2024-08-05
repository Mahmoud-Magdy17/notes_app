import 'package:flutter/material.dart';
import 'package:notes_app/features/add_note_feature/ui/widgets/custom_text_form_field.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8),
      child: Column(
        children: [
          CustomTextFormField(hint: title),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hint: content,
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
