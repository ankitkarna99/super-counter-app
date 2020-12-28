import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @required
  final int count;

  Counter({this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$count",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
    );
  }
}
