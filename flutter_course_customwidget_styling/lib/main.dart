import 'package:flutter/material.dart';
import './Question.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();

    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {

  int questionIndex =0;

  var questionList = ['what\'s your pet name', 'what\'s your first school name'];


  void changeQuestion()
  {

    setState(() {
      questionIndex = questionIndex +1;
    });
  }

  void resetQuestion(){
    setState(() {
      questionIndex =0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questionList[questionIndex]),
            RaisedButton(
              child: Text('Change Question'),
              onPressed: changeQuestion,
            ),
            RaisedButton(
              child: Text('Reset Question'),
              onPressed: resetQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
