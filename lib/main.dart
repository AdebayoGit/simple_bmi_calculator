import 'package:flutter/material.dart';
import 'package:BMI/calc.dart';

void main() {
  runApp(Bmi());
}

class Bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Calc(),
    );
  }
}