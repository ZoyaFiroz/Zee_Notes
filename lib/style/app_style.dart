import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color.fromARGB(255, 255, 255, 255);
  static Color mainColor = Color.fromARGB(255, 95, 37, 104);
  static Color accentColor = Color.fromARGB(255, 145, 94, 153);

  static List<Color> cardsColor = [
    Colors.white,
    Color.fromARGB(255, 254, 214, 218),
    Colors.pink.shade100,
    Color.fromARGB(255, 255, 191, 209),
    Color.fromARGB(255, 255, 181, 233),
    Color.fromARGB(255, 255, 200, 205),
    Color.fromARGB(255, 226, 187, 251),
    Color.fromARGB(255, 252, 222, 255),
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);
}
