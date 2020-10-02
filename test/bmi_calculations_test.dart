import 'package:flutter_test/flutter_test.dart';
import 'package:data_driven_fitness_app/screens/calculators/calculator_brain.dart';

void main() {
  group('BMI calculation and output', () {
    CalculatorBrain brainNormalBMI;
    CalculatorBrain brainUnderBMI;
    CalculatorBrain brainOverBMI;
    CalculatorBrain brainObeseBMI;
    String result;

    setUp(() {
      brainNormalBMI = CalculatorBrain(height: 180, weight: 70);
      brainUnderBMI = CalculatorBrain(height: 190, weight: 60);
      brainOverBMI = CalculatorBrain(height: 175, weight: 90);
      brainObeseBMI = CalculatorBrain(height: 195, weight: 130);
    });
    //testing CalculatorBrain().calculateBMI() function
    test(
        'value of bmi (to one decimal place) should be calculated using formula weight(kg)/(height(m))^2 and then returned as a String',
        () {
      result = brainNormalBMI.calculateBMI();

      expect(result, '21.6');
    });

    //testing CalculatorBrain().getBMICategory function
    test('correct category for a BMI of 21.6 should be output', () {
      brainNormalBMI.calculateBMI();
      result = brainNormalBMI.getBMICategory();

      expect(result, 'Healthy Weight');
    });

    test('correct category for a BMI of 16.6 should be output', () {
      brainUnderBMI.calculateBMI();
      result = brainUnderBMI.getBMICategory();

      expect(result, 'Underweight');
    });
    test('correct category for a BMI of 29.4 should be output', () {
      brainOverBMI.calculateBMI();
      result = brainOverBMI.getBMICategory();

      expect(result, 'Overweight');
    });
    test('correct category for a BMI of 34.2 should be output', () {
      brainObeseBMI.calculateBMI();
      result = brainObeseBMI.getBMICategory();

      expect(result, 'Obese');
    });

    //testing CalculatorBrain().getBMIExplanation function
    test('returns correct recommendation/definition for a BMI of 21.6',(){
      brainNormalBMI.calculateBMI();
      result = brainNormalBMI.getBMIExplanation();

      expect(result, 'You are a healthy weight for your height. Keep it up');
    });
    test('returns correct recommendation/definition for a BMI of 16.6',(){
      brainUnderBMI.calculateBMI();
      result = brainUnderBMI.getBMIExplanation();

      expect(result, 'You are underweight. Being underweight can damage your health and it is recommended to see your local gp to find any underlying causes and formulate a plan to raise your weight healthily');
    });
    test('returns correct recommendation/definition for a BMI of 29.4',(){
      brainOverBMI.calculateBMI();
      result = brainOverBMI.getBMIExplanation();

      expect(result, 'You are a bit heavier than is recommended for your height. This puts you at higher risk for diseases such as heart disease, type 2 diabetes, stroke and some cancers. Recommended to try losing weight. Look into portion control and exercising');
    });
    test('returns correct recommendation/definition for a BMI of 34.2',(){
      brainObeseBMI.calculateBMI();
      result = brainObeseBMI.getBMIExplanation();

      expect(result, 'Your weight is well above the healthy weight range. You may have a very high risk of heart disease, type 2 diabetes, stroke and some cancers. Please visit your local gp to get started on a healthier life style');
    });
  });
}







