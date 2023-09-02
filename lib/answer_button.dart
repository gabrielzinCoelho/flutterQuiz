import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  const AnswerButton(this.answerText, this.handleChooseAnswer, {super.key});

  final String answerText;
  final void Function() handleChooseAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>handleChooseAnswer(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 38, 2, 95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        )
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      )
    );
  }
}
