import 'package:flutter/material.dart';

import 'widgets/custom_text_form_field.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextFormField(
          hint: 'Title',
        ),
        CustomTextFormField(
          hint: 'Content',
          maxLines: 4,
        ),
      ],
    );
  }
}
