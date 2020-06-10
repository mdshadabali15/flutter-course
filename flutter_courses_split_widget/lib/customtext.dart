import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {


  final questionText;
  CustomText(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width:  double.infinity,

      child: Text(
        questionText,
        style: TextStyle(fontSize: 28, color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
  }
}
