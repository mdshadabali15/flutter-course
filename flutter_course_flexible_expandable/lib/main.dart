import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main()=> runApp(FlexibleApp());

class FlexibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flexible & Expandable App')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

          Flexible(
            //fit: FlexFit.tight,
            //flex: 4,
            child: Container(
              //width: double.infinity,
              height: 100,
              child: Text('Shadab'),
              color: Colors.red,

            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text('Welcome Abroad shadab'),
              color: Colors.blue,

            ),
          ),
          Flexible(
           // flex: 1,
            //fit: FlexFit.tight,
            child: Container(

              height: 100,
              child: Text('How are you'),
              color: Colors.yellow,

            ),
          ),

        ],),
      ),
    );
  }
}
