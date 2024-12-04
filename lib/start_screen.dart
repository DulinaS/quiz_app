import 'package:flutter/material.dart';
import 'package:quiz_app/styleText.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz ,{super.key});

  final Function() startQuiz;

  @override
  State<StartScreen> createState() {
    return _StartScreenState(startQuiz);
  }
}

class _StartScreenState extends State<StartScreen> {
  //Create a state class constructor that accepts function as a parameter
  _StartScreenState(this.startQuiz);

  final Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 30,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        const StyledText('Learn flutter the fun way!'),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}
