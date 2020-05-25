import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function onAnswer;

  Quiz({this.questions, this.questionIndex, this.onAnswer});

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Column(
      children: <Widget>[
        Question(question['questionText']),
        ...(question['answers'] as List<String>).asMap().entries.map(
          (entry) {
            String answer = entry.value;
            int index = entry.key;

            return Answer(
              text: answer,
              onPressed: () => onAnswer(index),
            );
          },
        )
      ],
    );
  }
}
