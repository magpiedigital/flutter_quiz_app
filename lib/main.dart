import 'package:flutter/material.dart';
import 'package:flutter_complete_course/results.dart';

import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Red', 'Green', "White"]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Dog', 'Monkey', 'Cat', "Horse"]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizInProgress = _questionIndex < _questions.length;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: quizInProgress
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                onAnswer: (index) => _answerQuestion(index),
              )
            : Results(
                totalScore: this._totalScore,
                onReset: resetQuiz,
              ),
      ),
    );
  }
}
