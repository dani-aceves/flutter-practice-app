import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler,
      this.answerText); //constructor that takes one positional argument- which is a Function

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.cyan,
        child: Text(answerText),
        onPressed:
            selectHandler, //this will point to the function that was passed into the constructor when the class was instantiated
      ),
    );
  }
}
