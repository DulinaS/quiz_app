import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() {
    return _GradientContainerState
        .purple(); //Returns a state with pre-defined colours
  }
}

class _GradientContainerState extends State<GradientContainer> {
  //final List<Color> colors;
  final Color color1;
  final Color color2;

  //Another Constructor that accepts user given colours
  _GradientContainerState(this.color1, this.color2);

  //Create Constructor that sets Colors of gradient
  _GradientContainerState.purple()
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  //Stores the selected answers and store to a list
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  //Add selected answers to list
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  //Restart the quiz and set the screen to questions screen
  void restartQuiz() {
    setState(() {
      selectedAnswers = []; //empty the already given answers
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    //Using IF condition to switch between screen
    Widget screenWidget = StartScreen(switchScreen);

    //Change screen to Question Screen
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    //Change screen to Result Screen
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      ); //Passed the list to the named argument chosenAnswers
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: screenWidget,
      ),
    );
  }
}
