import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/gradient_linear_progress_bar.dart';
import '../../../resource/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;
  final double max;

  const CustomProgressBar({super.key, required this.value, required this.max});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GradientLinearProgressBar(
          value: value,
          gradient: const LinearGradient(colors: [
            AppColors.accentGradientColor1,
            AppColors.accentGradientColor2,
          ]),
          backgroundColor: AppColors.surfaceColor,
          strokeWidth: 3,
          strokeColor: AppColors.outlineColor,
          height: 35,
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Text(
                  "${(value * max).round()} Sec",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 2)
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: const Icon(
                  CupertinoIcons.time,
                  color: AppColors.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
