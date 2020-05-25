import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int totalScore;
  final Function onReset;

  Results({this.totalScore, this.onReset});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Text(
              'Finished! Score: $totalScore',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            child: Text('Restart quiz'),
            onPressed: onReset,
          )
        ],
      ),
    );
  }
}
