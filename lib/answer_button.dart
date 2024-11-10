import 'package:flutter/material.dart';

//Button style can be created as a statless widget
class AnswerButton extends StatelessWidget {
  //const AnswerButton(this.answerText, this.onTap, {super.key}); answerText,onTap are positional arguments

  //Constructor as named arguments
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText; //set Text to the button
  final void Function()
      onTap; //Function tells what to do when answer button gets tapped

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40, //Add padding horizontally in button between text
          vertical: 10, //Add padding veritcally in button between text
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 79),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
