import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionString;

  Question(this.questionString);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity, // Allow container to access infinite width
      margin: EdgeInsets.all(10.0),
      child: Text(
        questionString,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
