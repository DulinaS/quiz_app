import 'package:flutter/material.dart';
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
    setState(() {});
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
        ),
        const SizedBox(height: 20),

        const StyledText('Learn flutter the fun way!'),

        const SizedBox(height: 20),

        OutlinedButton(
          onPressed: startScreen,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              )),
          child: const Text('Start Quiz'),
        )
      ],
    );
  }
}
