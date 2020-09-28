import 'reusable_card.dart';
import 'dart:math';

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

  String calculateBMI(){
    double bmi = weight / pow((height/100),2);
    return bmi.toStringAsFixed(1);
  }

  String BMICategory(){

  }

  String BMIExplaination(){

  }




}




