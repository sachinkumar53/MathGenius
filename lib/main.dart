import 'package:flutter/material.dart';
import 'package:quiz/ui/resource/app_strings.dart';
import 'package:quiz/ui/screen/welcome/welcome_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
