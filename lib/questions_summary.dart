import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,
      {super.key}); //Cosntructor accepts the summary as a list and assigns to summaryData list

  final List<Map<String, Object>> summaryData;

  bool checkAnswer() {
    bool value = false;

    return value;
  }

  @override
  Widget build(BuildContext context) {
    //This returns a column. In the column each row inside the column represent one piece of infomation from summaryDats
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30, // Diameter of the circle
                    height: 30, // Diameter of the circle
                    decoration: BoxDecoration(
                      // Background color of the circle
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 97, 159, 230)
                          : const Color.fromARGB(255, 225, 109, 209),
                      shape: BoxShape.circle, // Make it circular
                    ),

                    alignment: Alignment.center, //Center the number in circle

                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 25, //space between 2 row childrens
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //Aligns all to left
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 225, 109, 209),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 97, 159, 230),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
