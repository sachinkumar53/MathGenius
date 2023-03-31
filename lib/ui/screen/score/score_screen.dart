import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/ui/components/gradient_button.dart';
import 'package:quiz/ui/components/quiz_scaffold.dart';
import 'package:quiz/ui/resource/app_colors.dart';
import 'package:quiz/ui/resource/app_strings.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int maxScore;

  const ScoreScreen({super.key, required this.score, required this.maxScore});

  @override
  Widget build(BuildContext context) {
    return QuizScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/trophy.json",
            height: 240,
            fit: BoxFit.fitHeight,
            repeat: false,
          ),
          const SizedBox(height: 40),
          Text(
            AppStrings.yourScore,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  color: AppColors.textSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            "$score/$maxScore",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 35, color: AppColors.textColorPrimary),
          ),
          const SizedBox(height: 40),
          GradientButton(
              text: AppStrings.finish,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              })
        ],
      ),
    );
  }
}
