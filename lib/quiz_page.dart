import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget{

  const QuizPage({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizPage> createState()=> _QuizPageState();

}

class _QuizPageState extends State<QuizPage>{

  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){

    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 214, 168, 252),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            const SizedBox(height: 30),
            ...questions[currentQuestionIndex].getShuffledAnswers().map(
              (answer) => AnswerButton(answer, ()=>answerQuestion(answer))
            )
          ],
        ),
      ),
    );
  } 

}