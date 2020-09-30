import 'package:flutter_test/flutter_test.dart';
import 'package:data_driven_fitness_app/screens/calculators/calculator_brain.dart';
import 'package:data_driven_fitness_app/screens/calculators/calculator_constants.dart';

//group of tests for calculating the bmr, tdee, and twee
//testing if coded formula calculations match true results generated via trusted sources

void main() {
  group('TDEE calculations', () {
    CalculatorBrain brain;

    setUp(() {
      brain = CalculatorBrain(
          height: 180,
          weight: 70,
          age: 20,
          gender: Gender.male,
          activityLevel: 1);
    });

    test('value of bmr (to one decimal place) should be calculated using the Mifflin St Jeor Equation and then returned as a String',
        () {
      String result = brain.calculateBMR();

      expect(result, '1730.0');
    });

    test(
        'value of tdee (to one decimal place) should be calculated by multiplying bmr and activity level constant and then returned as a String',
        () {
      brain.calculateBMR();
      String result = brain.calculateTDEE();

      expect(result, '2378.8');
    });

    test('value of twee should be calculated by multiplying tdee by 7', () {
      brain.calculateBMR();
      brain.calculateTDEE();
      String result = brain.calculateTWEE();

      expect(result, '16651.3');
    });
  });
}
