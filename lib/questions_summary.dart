import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,
      {super.key}); //Cosntructor accepts the summary as a list and assigns to summaryData list

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    //This returns a column. In the column each row inside the column represent one piece of infomation from summaryDats
    return SizedBox(
      height: 300,
      child: Column(
        children: summaryData.map(
          (data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
