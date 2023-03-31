import 'package:flutter/material.dart';
import 'package:quiz/ui/components/gradient_button.dart';
import 'package:quiz/ui/components/quiz_scaffold.dart';
import 'package:quiz/ui/resource/app_colors.dart';
import 'package:quiz/ui/resource/app_strings.dart';
import 'package:quiz/ui/screen/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            AppStrings.letsPlayQuiz,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textSecondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset(
              "assets/images/quiz.png",
              height: 200,
            ),
          ),
          GradientButton(
              text: AppStrings.startQuiz,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              })
        ],
      ),
    );
  }
}
