import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questions;
  int questionIndex;
  VoidCallback answerQuestion;


  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String,
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer( () => answerQuestion(), answer['text'] as String);

        }).toList()
      ],
    ); //Column
  }
}
