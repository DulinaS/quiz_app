import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  }); //as a named argument

  //Results screen will accept the user selected answers list from gradientContainer
  final List<String> chosenAnswers;
  
  //This function handles whether to restart the quiz or not
  final void Function() onRestart;

  //Generate Summary of All Q and A s
  List<Map<String, Object>>  get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i, //Adds the question index
          'question': questions[i].text, //Adds each question one by one to the map
          'correct_answer': questions[i].answers[0], //we assume first answer in questions list is the correct answer
          'user_answer': chosenAnswers[i] //we collect user selected answers because we display the questions from start
                                          // So we load the display from questions list from start answer won;t get mixed
        },);
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    //final summaryData = SummaryData;
    
    final numTotalQuestions =questions.length; //gives number of questions in quiz

    //filters and give the correcct answer number from comparing the sumamryData list's correct answer and user entered answer
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answers $numCorrectQuestions out of $numTotalQuestions questions correct!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 203, 143, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //const Text('list of answers and questions'),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
