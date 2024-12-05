import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers}); //as a named argument

  //Results screen will accept the user selected answers list from gradientContainer
  final List<String> chosenAnswers;

  //Generate Summary of All Q and A s
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i, //Adds the question index
          'question': questions[i].text, //Adds each question one by one to the map
          'correct_answer': questions[i].answers[0], //we assume first answer in questions list is the correct answer
          'user_answer': chosenAnswers[i] //we collect user selected answers because we display the questions from start
                                          // So we load the display from questions list from start answer won;t get mixed
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answers X out of Y questions correct'),
            const SizedBox(
              height: 30,
            ),
            //const Text('list of answers and questions'),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
