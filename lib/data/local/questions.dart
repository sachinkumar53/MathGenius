import 'package:quiz/data/model/quiz_question.dart';

class QuizData {
  static final List<QuizQuestion> questions = [
    QuizQuestion.withOptions(
      question: "What is the Pythagorean theorem?",
      optionA: "a^2 + b^2 = c^2",
      optionB: "a^2 - b^2 = c^2",
      optionC: "a^2 + b^2 = c",
      optionD: "a + b = c^2",
      correctAnswer: "a^2 + b^2 = c^2",
    ),
    QuizQuestion.withOptions(
      question: "What is the slope-intercept form of a linear equation?",
      optionA: "y = mx + b",
      optionB: "x = my + b",
      optionC: "y = mx - b",
      optionD: "x = my - b",
      correctAnswer: "y = mx + b",
    ),
    QuizQuestion.withOptions(
      question: "What is the formula for the volume of a sphere?",
      optionA: "V = (4/3)πr",
      optionB: "V = (4/3)πr^2",
      optionC: "V = (4/3)πr^3",
      optionD: "V = (4/3)πr^4",
      correctAnswer: "V = (4/3)πr^3",
    ),
    QuizQuestion.withOptions(
      question: "What is the formula for the slope of a line?",
      optionA: "m = (y2 - y1) / (x2 - x1)",
      optionB: "m = (x2 - x1) / (y2 - y1)",
      optionC: "m = (y1 - y2) / (x1 - x2)",
      optionD: "m = (x1 - x2) / (y1 - y2)",
      correctAnswer: "m = (y2 - y1) / (x2 - x1)",
    ),
    QuizQuestion.withOptions(
      question: "What is the quadratic formula?",
      optionA: "x = (-b ± √b^2 - 4ac) / 2a",
      optionB: "x = (-b ± √b^2 + 4ac) / 2a",
      optionC: "x = (b ± √b^2 - 4ac) / 2a",
      optionD: "x = (b ± √b^2 + 4ac) / 2a",
      correctAnswer: "x = (-b ± √b^2 - 4ac) / 2a",
    ),
    QuizQuestion.withOptions(
      question: "What is the formula for the volume of a cylinder?",
      optionA: "V = πr",
      optionB: "V = πr^2h",
      optionC: "V = (4/3)πr^3",
      optionD: "V = πr^2",
      correctAnswer: "V = πr^2h",
    ),
    QuizQuestion.withOptions(
      question: "What is the formula for the sum of an arithmetic sequence?",
      optionA: "S = (n/2)(a1 + an)",
      optionB: "S = n(a1 + an)",
      optionC: "S = (n/3)(a1 + an)",
      optionD: "S = (n/4)(a1 + an)",
      correctAnswer: "S = (n/2)(a1 + an)",
    ),
    QuizQuestion.withOptions(
      question: "If f(x) = x^2 + 2x - 3, what is the value of f(4)?",
      optionA: "20",
      optionB: "10",
      optionC: "18",
      optionD: "21",
      correctAnswer: "21",
    ),
    QuizQuestion.withOptions(
      question:
          "What is the smallest positive integer that is the sum of the squares of two different positive integers?",
      optionA: "1",
      optionB: "3",
      optionC: "2",
      optionD: "5",
      correctAnswer: "5",
    ),
    QuizQuestion.withOptions(
      question:
          "What is the equation of the line perpendicular to y = 3x + 2 that passes through the point (2, -1)",
      optionA: "y = (-1/3)x + 2",
      optionB: "y = (-1/3)x - 4",
      optionC: "y = (-3)x - 1",
      optionD: "y = (-3)x - 7",
      correctAnswer: "y = (-1/3)x + 2",
    ),
  ];
}
