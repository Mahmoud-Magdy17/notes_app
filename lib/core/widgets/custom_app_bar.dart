import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.icon,
    required this.title,
    this.onPressed,
    this.back,
  });
  final Icon? icon;
  final String title;
  final Function()? onPressed;
  final bool? back;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
      child: Row(
        children: [
          back != null
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                )
              : const SizedBox(),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          const Spacer(),
          icon != null
              ? IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white.withOpacity(0.05),
                    ),
                  ),
                  onPressed: onPressed ?? () {},
                  icon: icon ?? const SizedBox(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
