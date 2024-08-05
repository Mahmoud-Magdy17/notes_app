import 'package:flutter/material.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_text_form_field.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextFormField(
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hint: 'Content',
              maxLines: 4,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              onTap: () {},
              text: 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
