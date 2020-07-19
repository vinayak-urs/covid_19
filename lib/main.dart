// import 'package:covid19/data.dart';
import 'package:covid19/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Merinda One",
    ),
    home: Container(
        decoration: BoxDecoration(
          color: Colors.lime[50],
          // borderRadius: BorderRadius.circular(10),

          // backgroundBlendMode: BlendMode.luminosity
        ),
        child: HomePage()),
  ));
}
