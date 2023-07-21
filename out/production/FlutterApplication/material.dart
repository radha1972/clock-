
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now;
  String timeString;

  @override
  void initState() {
    now = DateTime.now();
    timeString = timeToString(now);

    new Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        now = DateTime.now();
        timeString = timeToString(now);
      });
    });
  }

  String timeToString(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString()
        .padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover
            )
        ),
        child: Center(
            child: Text(
              "$timeString",
              style: TextStyle(
                  fontSize: 66.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            )
        ),
      ),
    );
  }
}

