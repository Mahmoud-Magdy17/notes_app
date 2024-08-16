import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/constants.dart';
import 'package:notes_app/core/models/note_model.dart';

import '../../../../core/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = kListOfColos.lastIndexOf(Color(widget.note.color));
    super.initState();
  }

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
                widget.note.color = kListOfColos[index].value;
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
