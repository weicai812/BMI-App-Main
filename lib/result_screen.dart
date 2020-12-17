import 'dart:math';

import 'package:flutter/material.dart';

import 'input_screen.dart';

class ResultScreen extends StatelessWidget {
  final Gender selectedGender;
  final int height;
  final int weight;

  ResultScreen(this.selectedGender, this.height, this.weight);
  @override
  Widget build(BuildContext context) {
    var calculator =
        Calculator(gender: selectedGender, height: height, weight: weight);
    var bmiResult = calculator.calculateBMI.toStringAsFixed(2);
    var bmiCategory = calculator.bmiCategory;
    return Column(
      children: [
        Container(
          height: 200,
          width: 300,
          margin: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'images/bmi_info.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 200,
          padding: EdgeInsets.all(8),
          color: Colors.yellow[900],
          child: Row(
            children: [
              Text(
                'Your Result',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.assessment,
                size: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$bmiCategory',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          '$bmiResult',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Calculator {
  final int height;
  final int weight;
  final Gender gender;
  double _result;

  Calculator({this.height, this.weight, this.gender});

  double get calculateBMI {
    _result = weight / pow(height / 100, 2);
    return _result;
  }

  String get bmiCategory {
    if (_result <= 18.4) {
      return 'Underweight';
    } else if (_result <= 24.9) {
      return 'Normal';
    } else if (_result <= 29.9) {
      return 'Overweight';
    } else if (_result <= 34.9) {
      return 'Obese';
    } else {
      return 'Extremely Obese ';
    }
  }
}
