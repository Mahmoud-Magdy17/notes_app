import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isLoading,
  });
  final bool isLoading;
  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: kPrimaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 56,
        child: isLoading
            ? const CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 24, 19),
            )
            : Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
      ),
    );
  }
}
