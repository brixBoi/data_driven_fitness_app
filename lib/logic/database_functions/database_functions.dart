import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';

class DatabaseFunctions {
  User sampleUser = User.blank(1, "testuser@email.com", "Test", "User");

  /// Temp function for testing
  User login(String userName, String userPassword) {
    if (userName == sampleUser.email && userPassword == 'Abcd1234!') {
      return sampleUser;
    } else {
      throw Exception('Invalid email / password');
      return null;
    }
  }

  /// Temp function for testing
  bool checkExistingEmail(String email) {
    bool output = false;
    if (email == '') {
      output = true;
    }
    return output;
  }

  User signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    bool result = true;
    sampleUser = User.blank(99, email, firstName, lastName);
    return sampleUser;
  }
}
