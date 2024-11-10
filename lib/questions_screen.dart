import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  //method to assign selected answers to the list
  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  //question index
  var currentQuestionIndex = 0;

  //what happens when user clicks a answer
  void anwserQuestion(String selectedAnswer) {
    
    widget.onSelectAnswer(selectedAnswer); //widget. gives access to the attributes in widget class above

    setState(() {
      currentQuestionIndex++; //increments the question index
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get the current question out of questions list
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 203, 143, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                  answerText: item,
                  onTap: () {
                    anwserQuestion(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
