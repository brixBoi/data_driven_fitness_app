import 'package:flutter_test/flutter_test.dart';
import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';

//Tests that a duplicate email is not stored in app.
// Currently checks vs sample local account, placeholder for API hooks
void main() {
  test('Email Duplicate Test', () {
    final databaseFunctions = DatabaseFunctions();
    final notOurSampleEmail = "ben@bhenshall.com";

    expect(databaseFunctions.checkExistingEmail('zachmartin9001@gmail.com'), true);
    expect(databaseFunctions.checkExistingEmail(notOurSampleEmail), false);
  });
}