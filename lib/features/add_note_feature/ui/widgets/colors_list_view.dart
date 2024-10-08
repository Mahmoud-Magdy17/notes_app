import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/constants.dart';
import 'package:notes_app/core/widgets/color_item.dart';

import '../../logic/cubit/add_note_cubit.dart';

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
                BlocProvider.of<AddNoteCubit>(context).noteColor =
                    kListOfColos[index].value;
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
