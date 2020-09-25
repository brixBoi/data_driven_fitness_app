import 'package:flutter_test/flutter_test.dart';
import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';

//Tests that user has entered a strong enough password)
// Check if the given password is greater than 6 chars, and contains
// both upper and lowercase chars
// Currently checks vs sample local account, placeholder for API hooks
void main() {

  test('Password Strength Test', () {
  final databaseFunctions = DatabaseFunctions();
  final validPassword = 'ABCdef';
  final tooShortPass = 'Abc';
  final onlyLowerPassword = 'abcdef';
  final onlyUpperPassword = 'ABCDEF';

  expect(databaseFunctions.checkPasswordStrongEnough(validPassword), true);
  expect(databaseFunctions.checkPasswordStrongEnough(tooShortPass), false);
  expect(databaseFunctions.checkPasswordStrongEnough(onlyLowerPassword), false);
  expect(databaseFunctions.checkPasswordStrongEnough(onlyUpperPassword), false);
  });

}