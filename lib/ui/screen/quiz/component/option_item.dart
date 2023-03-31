import 'package:flutter/material.dart';

import '../../../resource/app_colors.dart';

class OptionItem extends StatelessWidget {
  final String option;
  final bool selected;
  final void Function() onPressed;

  const OptionItem({
    super.key,
    required this.option,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color optionColor;
    final double borderThickness;
    final Color fillColor;

    if (selected) {
      optionColor = AppColors.accentGradientColor1;
      borderThickness = 2.0;
      fillColor = optionColor.withOpacity(0.1);
    } else {
      optionColor = AppColors.highlightColor;
      borderThickness = 1.0;
      fillColor = Colors.transparent;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: optionColor, width: borderThickness),
          color: fillColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              option,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: optionColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
