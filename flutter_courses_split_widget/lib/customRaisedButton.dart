import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final buttonText;
  final Function callBackFunction;

  CustomRaisedButton(this.buttonText, this.callBackFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black),
        ),
        color: Colors.red,
        onPressed: callBackFunction,
      ),
    );
  }
}
