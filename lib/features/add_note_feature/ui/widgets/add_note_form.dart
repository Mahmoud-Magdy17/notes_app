import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/add_note_feature/logic/cubit/add_note_cubit.dart';
import 'package:notes_app/features/all_notes_features/logic/cubit/all_notes_cubit.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title;
  String? subTitle;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (val) {
                title = val;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (val) {
                subTitle = val;
              },
              hint: 'Content',
              maxLines: 4,
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var date = DateFormat.yMd().format(DateTime.now());
                      NoteModel note = NoteModel(
                        title: title!,
                        content: subTitle!,
                        creationDate: date.toString(),
                        color: Colors.amber.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'Add',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
