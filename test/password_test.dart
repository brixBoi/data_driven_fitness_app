import 'package:flutter_test/flutter_test.dart';
import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';

//Tests that user has entered a valid (non empty)
// Currently checks vs sample local account, placeholder for API hooks

void main() {
  test('Password Not Empty Test', () {
    final databaseFunctions = DatabaseFunctions();
    final password = 'Password!123'; /// we know this is a valid pass

    expect(databaseFunctions.checkPasswordNotEmpty(password), true);
    expect(databaseFunctions.checkPasswordNotEmpty(''), false);
  });

}