import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 95, 234), shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(((summaryData["question-index"] as int) + 1).toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                summaryData["question-label"] as String,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Text(summaryData["user-answer"] as String,
                  style: TextStyle(
                      color: (summaryData["user-answer"] ==
                              summaryData["correct-answer"]
                          ? const Color.fromARGB(255, 62, 219, 67)
                          : Color.fromARGB(255, 255, 53, 70)),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )),
              Text(
                'R: ${summaryData["correct-answer"] as String}',
                style: const TextStyle(color: Colors.white, fontSize: 12)
              ),
              const SizedBox(height: 50)
            ],
          ),
        )
      ],
    );
  }
}
