import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class QuizScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const QuizScaffold({super.key, this.appBar, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            repeat: ImageRepeat.repeatX),
        color: AppColors.backgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: body,
        ),
      ),
    );
  }
}
