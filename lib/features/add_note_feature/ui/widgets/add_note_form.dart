import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/constants/constants.dart';
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
            const ColorsListView(),
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

                      BlocProvider.of<AllNotesCubit>(context).allNotes();
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

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: kListOfColos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: ColorItem(
              color: kListOfColos[index].value,
              isActive: currentIndex == index,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final bool isActive;
  final int color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: Color(color),
              radius: 28,
            ),
          )
        : CircleAvatar(
            backgroundColor: Color(color),
            radius: 32,
          );
  }
}
