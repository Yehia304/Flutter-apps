import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;
  final Function reset;

  Result(this.totalscore, this.reset);

  String get resultphrase {
    String resulttext;
    if (totalscore >= 4) {
      resulttext = 'You are good';
    } else if (totalscore >= 6) {
      resulttext = 'You are awesome';
    } else {
      resulttext = 'Wow thank you!';
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultphrase,
          style: TextStyle(fontSize: 28, color: Colors.blue),
        ),
        RaisedButton(onPressed: reset, child: Text('Reset quiz'))
      ],
    ));
  }
}
