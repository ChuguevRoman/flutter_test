import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function _answerQuestion;

  const Quiz(
      this.questions,
      this.questionIndex,
      this._answerQuestion,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Question(questions[questionIndex]['question text'] as String),
          ...(questions[questionIndex]['answer text'] as List<Map<String, Object>>).map((answer) {
            return Answer(() => _answerQuestion(answer['score']), answer['answer'] as String);
          }).toList()]
    );
  }
}
