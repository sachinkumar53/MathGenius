import 'package:flutter/material.dart';
import 'package:quiz/ui/resource/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const GradientButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppColors.accentGradientColor1,
            AppColors.accentGradientColor2
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
