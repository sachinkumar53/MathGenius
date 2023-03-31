import 'package:flutter/material.dart';

import 'option_item.dart';

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final void Function(String option) onSelectAnswer;
  final String? selectedAnswer;

  const QuizCard({
    super.key,
    required this.question,
    required this.options,
    required this.onSelectAnswer,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _questionText(question),
            const SizedBox(height: 30),
            ...List.generate(
              options.length,
              (index) {
                // Convert 0,1,2,3...  to a,b,c,d...
                final optionNumber = String.fromCharCode(97 + index);
                final option = options[index];

                return OptionItem(
                  option: "$optionNumber) $option",
                  selected: selectedAnswer == option,
                  onPressed: () => onSelectAnswer(option),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _questionText(String question) {
    return Text(
      question,
      style: const TextStyle(
        color: Color(0xFF101010),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
