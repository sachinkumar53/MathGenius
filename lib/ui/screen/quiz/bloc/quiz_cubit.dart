import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/repository/quiz_repository.dart';

import '../../../../data/local/questions.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  static const timeout = 30;
  final QuizRepository _repository = QuizRepository(QuizData.questions);

  int get _totalNumberOfQuestions => _repository.getTotalNumberOfQuestions();

  var _currentQuestionIndex = -1;
  final StreamController<int> _questionIndexController = StreamController();

  var _score = 0;

  int get score => _score;

  int get maxScore => _totalNumberOfQuestions;

  QuizCubit() : super(QuizState.initial()) {
    _questionIndexController.stream.listen((index) {
      _updateQuizState(index);
    });

    //Move to first question after initialization
    moveToNextQuestion();
  }

  _updateQuizState(int index) {
    final int totalQuestions = _totalNumberOfQuestions;
    final String question = _repository.getQuestionAtIndex(index);
    final List<String> options = _repository.getOptionsAtIndex(index);

    emit(state.copyWith(
      totalQuestions: totalQuestions,
      questionNumber: index + 1,
      question: question,
      options: options,
      selectedAnswer: null,
    ));
  }

  _incrementQuestionIndex() {
    _currentQuestionIndex++;
    _questionIndexController.sink.add(_currentQuestionIndex);
  }

  evaluateQuestion() {
    if (_repository.checkAnswer(_currentQuestionIndex, state.selectedAnswer)) {
      _score++;
    }
  }

  moveToNextQuestion() {
    _incrementQuestionIndex();
  }

  selectAnswer(String? answer) {
    emit(state.copyWith(selectedAnswer: answer));
  }
}
