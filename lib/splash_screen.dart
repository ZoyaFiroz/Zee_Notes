import 'package:flutter/material.dart';
import '/splash2.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'Video.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => splash_ss()),
      );
    });
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 249, 197, 247),
      Color.fromARGB(255, 166, 212, 255),
      // Color.fromARGB(255, 255, 159, 252),
    ],
  ).createShader(Rect.fromLTWH(20.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/new.jpeg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text("My NOTES",
                style: GoogleFonts.rampartOne(
                  textStyle: TextStyle(
                      // Color.fromARGB(255, 166, 212, 255)
                      foreground: Paint()..shader = linearGradient,
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      letterSpacing: 5),
                )),
            SizedBox(
              height: 190,
            ),
            // Image(
            //   image: AssetImage('images/book.png'),
            //   height: 100,
            // )
          ],
        ),
      ),
    );
  }
}
