import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex < _questions.length
          ? _questionIndex++
          : {_questionIndex = 0, _totalScore = 0};
    });
  }

  final _questions = const [
    {
      'question text': 'What\'s you favorite color?',
      'answer text': [
        {'answer': 'Red', 'score': 5},
        {'answer': 'Green', 'score': 4},
        {'answer': 'Blue', 'score': 3},
        {'answer': 'White', 'score': 2},
      ],
    },
    {
      'question text': 'What\'s you favorite animal?',
      'answer text': [
        {'answer': 'Dog', 'score': 7},
        {'answer': 'Cat', 'score': 6},
        {'answer': 'Tiger', 'score': 5},
        {'answer': 'Lion', 'score': 4},
        {'answer': 'Elephant', 'score': 3},
        {'answer': 'Cow', 'score': 2},
        {'answer': 'Panda', 'score': 1},
      ],
    },
    {
      'question text': 'What\'s you favorite music instrument?',
      'answer text': [
        {'answer': 'Piano', 'score': 5},
        {'answer': 'Guitar', 'score': 4},
        {'answer': 'Accordion', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complit guide',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Victorine'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _questionIndex, _answerQuestion)
            : Result(_totalScore, () => _answerQuestion(_totalScore)),
      ),
    );
  }
}
