import 'package:flutter/material.dart';

import 'answer.dart';

class Result extends StatelessWidget {
  final VoidCallback answerQuestions;
  final int _resultScore;

  const Result(this._resultScore, this.answerQuestions, {Key? key})
      : super(key: key);

  String get finalPhrase {
    String resultText;
    if (_resultScore <= 8) {
      resultText = 'You Bad';
    } else if (_resultScore <= 16) {
      resultText = 'You good';
    } else {
      resultText = 'You awesome';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Your score: $_resultScore'),
        Text(
          finalPhrase,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Answer(answerQuestions, 'Try again!'),
      ],
    );
  }
}
