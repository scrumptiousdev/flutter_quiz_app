import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        { 'text': 'Black', 'score': 10 },
        { 'text': 'Red', 'score': 5 },
        { 'text': 'Green', 'score': 3 },
        { 'text': 'White', 'score': 1 }
      ]
    }, {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        { 'text': 'Rabbit', 'score': 3 },
        { 'text': 'Snake', 'score': 11 },
        { 'text': 'Elephant', 'score': 5 },
        { 'text': 'Lion', 'score': 9 }
      ]
    }, {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        { 'text': 'Ryan', 'score': 1 },
        { 'text': 'Jemma', 'score': 1 },
        { 'text': 'Someone else', 'score': 5 },
        { 'text': 'Me', 'score': 5 }
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) setState(() => _questionIndex = _questionIndex + 1);
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
          ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
          )
          : Result(_totalScore, _restartQuiz)
      )
    );
  }
}