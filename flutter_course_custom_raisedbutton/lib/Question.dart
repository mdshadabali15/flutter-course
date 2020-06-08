import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionString;

  Question(this.questionString);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questionString,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
    );
  }
}
