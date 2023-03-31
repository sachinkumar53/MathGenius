import '../model/quiz_question.dart';

class QuizRepository {
  final List<QuizQuestion> _questionList;

  const QuizRepository(this._questionList);

  int getTotalNumberOfQuestions() => _questionList.length;

  //QuizQuestion getQuizQuestionAtIndex(int index) => _questionList[index];

  String getQuestionAtIndex(int index) => _questionList[index].question;

  List<String> getOptionsAtIndex(int index) {
    return _questionList[index].options..shuffle();
  }

  bool checkAnswer(int questionIndex, String? answer) {
    return _questionList[questionIndex].correctAnswer == answer;
  }
}
