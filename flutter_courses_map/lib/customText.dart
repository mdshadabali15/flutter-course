import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  CustomText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 28,color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
  }
}
