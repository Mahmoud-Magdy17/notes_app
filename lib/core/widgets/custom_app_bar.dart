import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.icon,
    required this.title,
    this.onPressed,
  });
  final Icon? icon;
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Row(
        children: [
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
                  icon: icon != null
                      ? const Icon(
                          Icons.search,
                        )
                      : const SizedBox(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
