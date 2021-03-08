import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement create State
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'Yellow', 'score': 3}
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Shark', 'score': 8},
        {'text': 'Spider', 'score': 11},
        {'text': 'Monkey', 'score': 4},
        {'text': 'Puppy', 'score': 1}
      ],
    },
    {
      'questionText': "What's your favorite food?",
      'answers': [
        {'text': 'Spaghetti', 'score': 1},
        {'text': 'Hot Dog', 'score': 9},
        {'text': 'Pizza', 'score': 5},
        {'text': 'Salad', 'score': 12}
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

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My First Solo App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
