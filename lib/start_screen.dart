import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/styleText.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  void startScreen() {
    setState(() {
      const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        const StyledText('Learn flutter the fun way!!!!'),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startScreen,
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
