import 'dart:async';

import 'package:dojo/main.dart';
import 'package:dojo/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Text(
        'DOJO',
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      )),
    );
  }
}
