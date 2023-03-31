class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  const QuizQuestion._({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  //A factory method to always create questions with 4 options only.
  factory QuizQuestion.withOptions({
    required String question,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String correctAnswer,
  }) {
    return QuizQuestion._(
      question: question,
      options: [optionA, optionB, optionC, optionD],
      correctAnswer: correctAnswer,
    );
  }
}
