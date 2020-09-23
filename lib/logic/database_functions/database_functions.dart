import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';

class DatabaseFunctions {
  String _userName;
  String _password;
  User sampleUser = User.blank(1, "testuser@email.com", "Test", "User");

  /// Temp function for testing
  User login(String userName, String userPassword) {
    if (userName == _userName && userPassword == _password) {
      return sampleUser;
    } else {
      print("Invalid username / password");
      return null;
    }
  }

  /// Temp function for testing
  bool checkExistingEmail(String email) {
    bool output = false;
    if (email == 'textemail@email.com') {
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
    return User.blank(99, email, firstName, lastName);
  }
}

enum DatabaseCode {
  SUCCESS,
  EXISTINGUSER,
}
