import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {

  const StartPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/quiz-logo.png",
            height: 250, color: const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height: 50),
        const Text(
          "Aprenda flutter e se divirta",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 25),
        OutlinedButton.icon(
            onPressed: () => startQuiz(),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"))
      ],
    ));
  }
}
