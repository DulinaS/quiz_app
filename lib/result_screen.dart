import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key , required this.chosenAnswers}); //as a named argument

  //Results screen will accept the user selected answers list from gradientContainer
  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answers X out of Y questions correct'),
            const SizedBox(height: 30,),
            const Text('list of answers and questions'),
            const SizedBox(height: 30,),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
