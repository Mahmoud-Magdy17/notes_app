import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.icon, required this.title, this.onPressed});
  final Icon? icon;
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        icon != null
            ? IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white.withOpacity(0.05),
                  ),
                ),
                onPressed: onPressed ?? () {},
                icon: icon != null
                    ? const Icon(
                        Icons.search,
                      )
                    : const SizedBox(),
              )
            : const SizedBox(),
      ],
    );
  }
}
