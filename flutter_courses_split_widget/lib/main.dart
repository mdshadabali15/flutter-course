import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_courses_split_widget/customtext.dart';
import 'package:flutter_courses_split_widget/questionList.dart';
import 'package:flutter_courses_split_widget/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizAppState();
  }
}


class QuizAppState extends State<QuizApp> {

  var questionIndex = 0;
  var marks = 0;

  void changeQuestion() {

    marks = questionList[questionIndex]['answer'];
    setState(() {
      questionIndex = questionIndex + 1;
    });

  }

  void resetQuestion(){
    setState(() {
      questionIndex =0;
    });
  }

  final questionList = const [
    {
      'question': 'what\'s your pet name',
      'answer': [
        {
          'text': 'Max',
          'score': 20
        },

        {
          'text': 'Tommy',
          'score': 10
        }
      ]
    },

    {
      'question': 'what\'s your first school name',
      'answer': [
        {
          'text': 'Salim',
          'score': 30
        },
        {
          'text': 'Gandhi',
          'score': 15
        },
      ]
    }

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome To Quiz App',
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
          ),
          body: questionIndex < questionList.length ? QuestionList(questionList,
          questionIndex, () => changeQuestion()):  Result(()=>resetQuestion()),
    ),);
  }
}
