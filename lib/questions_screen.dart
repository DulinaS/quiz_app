import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    //Get the current question out of questions list
    final currentQuestion = questions[0];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          currentQuestion.text,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 30),
        AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
      ],
    );
  }
}
