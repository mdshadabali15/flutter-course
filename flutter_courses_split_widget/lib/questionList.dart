import 'package:flutter/material.dart';
import 'package:flutter_courses_split_widget/customRaisedButton.dart';
import 'package:flutter_courses_split_widget/customtext.dart';

class QuestionList extends StatelessWidget {
  final questionList;
  final Function function;

  final int questionIndex;

  QuestionList(this.questionList, this.questionIndex, this.function);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomText(questionList[questionIndex]['question']),
        ...(questionList[questionIndex]['answer'] as List).map((answer) {
          return CustomRaisedButton(answer['text'], function);
        }).toList()
      ],
    );
  }
}
