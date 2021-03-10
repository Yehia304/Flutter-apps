import 'package:flutter/material.dart';
import 'package:quizapp/result.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionindex = 0;
  var _totalscore = 0;

  var _questions = [
    {
      'questiontext': 'What is your favourite company',
      'answer': [
        {'text': 'company1', 'score': 1},
        {'text': 'company2', 'score': 2},
        {'text': 'company3', 'score': 3},
        {'text': 'dahab informatics', 'score': 10},
      ]
    },
    {
      'questiontext': 'What is your favourite color',
      'answer': [
        {'text': 'black', 'score': 1},
        {'text': 'white', 'score': 2},
        {'text': 'blue', 'score': 3},
        {'text': 'gold', 'score': 10},
      ]
    },
    {
      'questiontext': 'What is your favourite animal',
      'answer': [
        {'text': 'animal1', 'score': 1},
        {'text': 'animal2', 'score': 2},
        {'text': 'animal3', 'score': 3},
        {'text': 'animal4', 'score': 4},
      ]
    }
  ];

  void resetquiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
    });
  }

  void _answerquestion(int score) {
    if (_questionindex < _questions.length) {
      print('WE HAVE MORE QUESTIONS');
    }
    _totalscore = _totalscore + score;
    print(_totalscore);

    setState(() {
      _questionindex = _questionindex + 1;
    });
    print(_questionindex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
        ),
        body: _questionindex < _questions.length
            ? Quiz(
                questions: _questions,
                answerquestion: _answerquestion,
                questionindex: _questionindex,
              )
            : Result(_totalscore, resetquiz),
      ),
    );
  }
}
