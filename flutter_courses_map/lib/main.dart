import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_courses_map/customButton.dart';
import './customText.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {

  int questionIndex = 0;

  void changeQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    // list of map declaration
    var questionList = [
      {
        'question': 'what\'s your pet name ',
        'answer': ['Tomy', 'Jack', 'Tufy']
      },

      {
        'question': 'what\'s your first school name ',
        'answer': ['Salim', 'Little', 'Gandhi']
      }


    ];

   String question =  questionList[questionIndex]['question'];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome To Quiz App'),
          ),
          body: Column(
              children: <Widget>[
          CustomText(questionList[questionIndex]['question']),
          //CustomButton(questionList),

          ...(questionList[questionIndex]['answer'] as List<String>).map((answer){ return
              CustomButton('answer', changeQuestion);}).toList()

      ],
    ),)
    ,
    );
  }
}
