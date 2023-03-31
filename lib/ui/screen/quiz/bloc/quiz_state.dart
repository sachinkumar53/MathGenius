class QuizState {
  final int totalQuestions;
  final int questionNumber;
  final String question;
  final List<String> options;
  final String? selectedAnswer;

  QuizState({
    required this.totalQuestions,
    required this.questionNumber,
    required this.question,
    required this.options,
    this.selectedAnswer,
  });

  QuizState copyWith({
    int? totalQuestions,
    int? questionNumber,
    String? question,
    List<String>? options,
    String? selectedAnswer,
  }) {
    return QuizState(
        totalQuestions: totalQuestions ?? this.totalQuestions,
        questionNumber: questionNumber ?? this.questionNumber,
        question: question ?? this.question,
        options: options ?? this.options,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer);
  }

  static QuizState initial() {
    return QuizState(
      totalQuestions: -1,
      questionNumber: -1,
      question: "",
      options: List.empty(),
      selectedAnswer: null,
    );
  }

  bool isLastQuestion() {
    return questionNumber == totalQuestions;
  }
}
