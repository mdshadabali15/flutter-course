

import 'package:flutter/material.dart';

import './Question.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {

  var questionList = ['what\'s your pet name', 'what\'s your first school name'];
  int questionIndex = 0;

  void changeQuestion(){
    setState(() {
      questionIndex = questionIndex+1;
    });
  }

  void resetQuestion(){
    setState(() {
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questionList[questionIndex]), // This is custom widget defined in Question.dart
            RaisedButton(
              child: Text('Change Question'),
              onPressed: changeQuestion,
            ),
            RaisedButton(
              child: Text('Reset Question'),
              onPressed: resetQuestion,
            )
          ],
        ),
      ),
    );
  }
}
