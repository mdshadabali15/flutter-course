import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final questionIndex;

  Question(this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Text(questionIndex);
  }
}
