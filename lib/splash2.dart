import 'package:flutter/material.dart';
import '/Video.dart';
import 'dart:async';
import 'home.dart';

class splash_ss extends StatefulWidget {
  @override
  _splash_ssState createState() => _splash_ssState();
}

class _splash_ssState extends State<splash_ss> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Video_player();
  }
}
