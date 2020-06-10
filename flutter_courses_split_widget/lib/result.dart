import 'package:flutter/material.dart';
import 'package:flutter_courses_split_widget/customRaisedButton.dart';

class Result extends StatelessWidget {
  final Function resetFunction;

  Result(this.resetFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              'You Did It',
              style: TextStyle(fontSize: 28, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            CustomRaisedButton('Reset', resetFunction),
          ],
        ));
  }
}
