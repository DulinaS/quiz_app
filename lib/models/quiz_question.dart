//This is not a widget
//This creates a blueprint of each questions
//This tells what are there in a questions
//We can pass answers & questions, and this will show the the model
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String>  getShuffledAnswers(){
    final shuffledList = List.of(answers); // create a copy of answers list
    shuffledList.shuffle();  //Shuffle list (final keyword won't be a problem when shuffling)                         
    return shuffledList;     //returns the shuffled list  
  }                           
                                      
}