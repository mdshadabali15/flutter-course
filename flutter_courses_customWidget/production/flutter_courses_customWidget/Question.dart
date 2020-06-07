import 'package:flutter/material.dart';


class Question extends StatelessWidget{

  final String questionString ;

  Question (this.questionString);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(questionString);
  }

}