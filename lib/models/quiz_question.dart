//This is not a widget
//This creates a blueprint of each questions
//This tells what are there in a questions
//We can pass answers & questions, and this will show the the model
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
}