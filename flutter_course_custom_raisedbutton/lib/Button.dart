import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;

  final Function buttonOperation;

  ButtonWidget(this.buttonText, this.buttonOperation);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(buttonText),
        onPressed: buttonOperation,
        color: Colors.blue,
      ),
    );
  }
}
