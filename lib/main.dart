import 'package:flutter/material.dart';
import 'dart:ffi';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. What is 1+1=?',
      'answers': [
        {'text': '1', 'score': -2},
        {'text': '2', 'score': -2},
        {'text': '3', 'score': 10},
        {'text': '4', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Where is India?',
      'answers': [
        {'text': 'Asia', 'score': -2},
        {'text': 'Africa', 'score': -2},
        {'text': 'Australia', 'score': -2},
        {
          'text':
          'America',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. What is 4*8=?',
      'answers': [
        {'text': '30', 'score': 10},
        {'text': '32', 'score': -2},
        {'text': '48', 'score': -2},
        {'text': '84', 'score': -2},
      ],
    },
    {
      'questionText':
      'Q5. What\'s up?',
      'answers': [
        {
          'text': 'Nothing Much',
          'score': -2,
        },
        {'text': 'Just Chilling', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion() {
   // _totalScore = ;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
