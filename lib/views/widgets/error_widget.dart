import 'package:bloc_course_3/core/app_colors.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;
  final void Function() onPressed;
  const MyErrorWidget({super.key, required this.msg, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          msg,
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        MaterialButton(
          color: AppColors.greyColor,
          onPressed: onPressed,
          child: const Text("Try Again"),
        )
      ],
    );
  }
}
