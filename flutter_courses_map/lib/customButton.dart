

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonTex;
  final Function callBackFunction;

  CustomButton(this.buttonTex,this.callBackFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        child: Text(buttonTex,style: TextStyle(color: Colors.red),),
        onPressed: callBackFunction,
        color: Colors.blue,
      ),
    );
  }
}
