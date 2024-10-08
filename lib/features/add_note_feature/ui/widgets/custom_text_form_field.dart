import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLines,
      required this.hint,
      this.onSaved,
      this.onChanged,
      this.initialValue});
  final String? initialValue;
  final int? maxLines;
  final String hint;
  final Function(String? val)? onSaved;
  final Function(String? val)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return '$hint is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
