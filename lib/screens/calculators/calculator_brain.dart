import 'calculator_constants.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {

  CalculatorBrain(
      {this.height, this.weight, this.age, this.gender, this.activityLevel});

  final int height;
  final int weight;
  final int age;
  final Gender gender;
  final int activityLevel;

  double _bmr;
  double _tdee;
  double _bmi;

  String calculateBMR() {
    int s = (gender == Gender.male) ? 5 : -161;
    _bmr = (10 * weight) + (6.25 * height) - (5 * age) + s;
    return _bmr.toStringAsFixed(1);
  }

  String calculateTDEE() {
    double activeRate;
    if (activityLevel == 0) {
      activeRate = 1.2;
    }
    else if (activityLevel == 1) {
      activeRate = 1.375;
    }
    else if (activityLevel == 2) {
      activeRate = 1.55;
    }
    else {
      activeRate = 1.725;
    }
    _tdee = _bmr * activeRate;
    return _tdee.toStringAsFixed(1);
  }

  String calculateTWEE() {
    double twee = _tdee * 7;
    return twee.toStringAsFixed(1);
  }

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMICategory() {
    if (_bmi < 18.5) {
      return 'Underweight';
    }
    if (_bmi >= 18.5 && _bmi < 25.0) {
      return 'Healthy Weight';
    }
    if (_bmi >= 25.0 && _bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getBMIExplanation() {
    if (_bmi < 18.5) {
      return 'You are underweight. Being underweight can damage your health and it is recommended to see your local gp to find any underlying causes and formulate a plan to raise your weight healthily';
    }
    if (_bmi >= 18.5 && _bmi < 25.0) {
      return 'You are a healthy weight for your height. Keep it up';
    }
    if (_bmi >= 25.0 && _bmi < 30) {
      return 'You are a bit heavier than is recommended for your height. This puts you at higher risk for diseases such as heart disease, type 2 diabetes, stroke and some cancers. Recommended to try losing weight. Look into portion control and exercising';
    } else {
      return 'Your weight is well above the healthy weight range. You may have a very high risk of heart disease, type 2 diabetes, stroke and some cancers. Please visit your local gp to get started on a healthier life style';
    }
  }

  Color getBMIColour(){
    if (_bmi < 18.5) {
      return Colors.deepOrange[700];
    }
    if (_bmi >= 18.5 && _bmi < 25.0) {
      return Colors.tealAccent;
    }
    if (_bmi >= 25.0 && _bmi < 30) {
      return Colors.deepOrange[400];
    } else {
      return Colors.deepOrange[900];
    }
  }
}




