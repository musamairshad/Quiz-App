import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  // List<Map<String, Object>> summaryData() {
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    // final summaryData = summaryData; // Here the name duplication thing occurs.
    // summaryData on the right is the getter basically.
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
          // return data['user_answer'] == data['correct_answer'];
        )
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numOfCorrectQuestions out of $numOfTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 230, 200, 253),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                QuestionsSummary(summaryData),
                // QuestionsSummary(getSummaryData()), // Here getSummaryData
                // executed as a Function. Here we are not passing Function
                // name as a value because we Need List<Map> not Function.
                const SizedBox(height: 30.0),
                TextButton.icon(
                  icon: const Icon(
                    Icons.refresh,
                  ),
                  onPressed: onRestart,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  label: const Text('Restart Quiz!'),
                ),
              ],
            )));
  }
}
