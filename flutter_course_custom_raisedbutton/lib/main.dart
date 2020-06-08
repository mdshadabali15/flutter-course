import 'package:flutter/material.dart';
import './Question.dart';
import './Button.dart';

void main() => runApp(RaiseButtonApp());

class RaiseButtonApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return RaisedButtonAppState();
  }
}

class RaisedButtonAppState extends State<RaiseButtonApp> {

  var questionList = ['what\'s your pet name' , 'what\'s your first teacher name'];
  int questionIndex =0;

  void changeQuestion(){
    setState(() {
      questionIndex = questionIndex+1;

    });
  }

  void resetQuestion(){
    setState(() {
      questionIndex=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text('Welcome To Quiz App')),
        body: Column(
          children: <Widget>[
            Question(questionList[questionIndex]),
            ButtonWidget('Change Question',changeQuestion),
            ButtonWidget('Reset Question',resetQuestion),

          ],
        ),
      ),
    );
  }
}
