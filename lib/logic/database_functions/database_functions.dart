import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';

/// Class used for database interactions, e.g. Signing in, Signing up, persisting user data changes etc.
class DatabaseFunctions {
  User sampleUser = User.blank(1, "zachmartin9001@gmail.com", "Test", "User");

  /// Temp function for testing
  ///
  /// Return user if given email and password are valid, otherwise throw an exception
  User login(String email, String userPassword) {
    if (email == sampleUser.email && userPassword == 'Abcd1234!') {
      print('Login Successful');
      return sampleUser;
    } else {
      throw Exception('Invalid email / password');
      return null;
    }
  }

  /// Temp function for testing
  ///
  /// Check if the given email exists in the system
  bool checkExistingEmail(String email) {
    bool output = false;
    if (email == '') {
      output = true;
    }
    return output;
  }

  /// Temp function for testing
  ///
  /// Sign the user up, return the signed up user
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

  User loginWithGoogle() {
    return sampleUser;
  }

  User loginWithFacebook() {
    return sampleUser;
  }
}
