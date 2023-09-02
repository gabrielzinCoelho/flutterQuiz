import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/question_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(this.chosenAnswers, this.resetQuiz, {super.key});

  final List<String> chosenAnswers;

  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question-label': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = ((summaryData) {
      int numCorrectQuestions = 0;
      for (final data in summaryData) {
        if (data["user-answer"] == data["correct-answer"]) {
          numCorrectQuestions++;
        }
      }
      return numCorrectQuestions;
    })(summaryData);

    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Você respondeu $numCorrectQuestions de $numTotalQuestions questões corretamente!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 214, 168, 252), fontSize: 16),
              ),
              SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 0, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...summaryData.map((data) => QuestionSummary(data))
                        ],
                      ),
                    ),
                  )),
              TextButton.icon(
                  onPressed: resetQuiz,
                  icon: const Icon(Icons.cached_rounded),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 214, 168, 252),
                  ),
                  label: const Text(
                    "Reiniciar Quiz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                  ))
            ],
          )),
    );
  }
}
