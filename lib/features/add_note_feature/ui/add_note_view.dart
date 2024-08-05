import 'package:flutter/material.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_text_form_field.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTextFormField(
            hint: 'Title',
          ),
          const CustomTextFormField(
            hint: 'Content',
            maxLines: 4,
          ),
          CustomButton(
            onTap: () {},
            text: 'Add',
          ),
        ],
      ),
    );
  }
}
