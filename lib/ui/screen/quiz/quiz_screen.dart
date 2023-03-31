import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/ui/components/dash_divider.dart';
import 'package:quiz/ui/components/gradient_button.dart';
import 'package:quiz/ui/components/quiz_scaffold.dart';
import 'package:quiz/ui/resource/app_colors.dart';
import 'package:quiz/ui/resource/app_strings.dart';
import 'package:quiz/ui/screen/quiz/bloc/quiz_cubit.dart';
import 'package:quiz/ui/screen/quiz/bloc/quiz_state.dart';
import 'package:quiz/ui/screen/quiz/component/quiz_card.dart';
import 'package:quiz/ui/screen/score/score_screen.dart';

import 'component/custom_progress_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _listenerAttached = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: QuizCubit.timeout),
    );
    Tween<double>(begin: 0, end: 1).animate(_controller);

    //Update UI to reflect animation value changes
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _moveToNextQuestion(BuildContext context, {required bool skipped}) {
    final QuizCubit cubit = BlocProvider.of<QuizCubit>(context);

    //Evaluate only if question is not skipped
    if (!skipped) {
      cubit.evaluateQuestion();
    }

    if (cubit.state.isLastQuestion()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScoreScreen(
            score: cubit.score,
            maxScore: cubit.maxScore,
          ),
        ),
      );
    } else {
      cubit.moveToNextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(),
      child: QuizScaffold(
        appBar: _topAppBar(),
        body: Column(
          children: [
            _progressBar(),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: _questionNumber(context),
            ),
            const SizedBox(height: 15),
            DashDivider(
              dashWidth: 4,
              dashGap: 4,
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(height: 15),
            _quizCard(),
            const Spacer(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _topAppBar() {
    return AppBar(
      elevation: 0.0,
      actions: [
        BlocBuilder<QuizCubit, QuizState>(builder: (context, _) {
          return TextButton(
            onPressed: () => _moveToNextQuestion(context, skipped: true),
            child: const Text(
              AppStrings.skip,
              style: TextStyle(color: AppColors.textColorPrimary),
            ),
          );
        }),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  Widget _progressBar() => BlocListener<QuizCubit, QuizState>(
        listener: (context, state) {
          if (!_listenerAttached) {
            _controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                _moveToNextQuestion(context, skipped: false);
              }
            });
            _listenerAttached = true;
          }
          _controller.reset();
          _controller.forward();
        },
        listenWhen: (previous, current) {
          return previous.questionNumber != current.questionNumber;
        },
        child: CustomProgressBar(
          value: _controller.value,
          max: 30,
        ),
      );

  Widget _questionNumber(BuildContext context) =>
      BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) => Text.rich(
          TextSpan(
            text: "Question ${state.questionNumber}",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 30),
            children: [
              TextSpan(
                  text: "/${state.totalQuestions}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 18)),
            ],
          ),
        ),
      );

  Widget _quizCard() => BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return QuizCard(
            question: state.question,
            options: state.options,
            selectedAnswer: state.selectedAnswer,
            onSelectAnswer: (option) {
              context.read<QuizCubit>().selectAnswer(option);
            },
          );
        },
      );

  Widget _nextButton() => BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) => GradientButton(
          text: AppStrings.next,
          onPressed: () => _moveToNextQuestion(context, skipped: false),
        ),
      );
}
