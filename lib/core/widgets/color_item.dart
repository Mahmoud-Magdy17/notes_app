import 'package:flutter/material.dart';

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
