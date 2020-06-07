import 'package:flutter/material.dart';
void main() => runApp(ScaffoldApp());

class ScaffoldApp extends StatelessWidget {
  void answerQuestion(){
    print('Question Answered');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Text('Question '),
            RaisedButton(
              child: Text('Answer1'),
              onPressed: answerQuestion,// we should not write answerQuestion()
              // as flutter will call this method at time of building app.
            ),
            RaisedButton(
              child: Text('Answer2'),
              onPressed: ()=> print('Question 2 Answered'),
            ),
            RaisedButton(
              child: Text('Answer3'),
              onPressed: (){
                // multiple lines
                print('Question 3 Answered');
              },
            ),
          ],
        ),
      ),
    );
  }
}
