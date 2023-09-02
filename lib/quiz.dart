import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/quiz_page.dart';
import 'package:flutter_quiz/results_page.dart';
import 'package:flutter_quiz/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Widget> screens = [];
  int activeScreenIndex = 0;
  final List<String> selectedAnswers = [];

  void switchScreen([int indexScreen = 1]){
    setState(() {
      activeScreenIndex = indexScreen;
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length >= questions.length){
      switchScreen(2);
    }
  }

  void resetQuiz(){
    selectedAnswers.clear();
    switchScreen(0);
  }

  @override
  void initState() {
    screens = [
      StartPage(switchScreen),
      QuizPage(onSelectAnswer: chooseAnswer),
      ResultsPage(selectedAnswers, resetQuiz)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromRGBO(162, 42, 209, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: screens[activeScreenIndex],
          ),
        ));
  }
}
