import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

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

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    //Using IF condition to switch between screen
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
      screenWidget = const QuestionsScreen();
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
