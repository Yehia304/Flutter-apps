import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function opfunction;

  final String answertext;

  Answer(this.opfunction, this.answertext);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.blue,
          child: Text(
            answertext,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: opfunction,
        ));
  }
}
