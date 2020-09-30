import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';

/// Class used for database interactions, e.g. Signing in, Signing up, persisting user data changes etc.
class DatabaseFunctions {
  User sampleUser = User.blank(1, "zachmartin9001@gmail.com", "Test", "User");
  Exception invalidEmailorPass;

  /// Temp function for testing
  ///
  /// Return user if given email and password are valid, otherwise throw an exception
  User login(String email, String userPassword) {
    if (email == sampleUser.email && userPassword == 'Abcd1234!') {
      print('Login Successful');
      return sampleUser;
    } else {
      throw invalidEmailorPass;
    }
  }

  /// Temp function for testing
  ///
  /// Check if the given email exists in the system
  bool checkExistingEmail(String email) {
    bool output = false;
    if (email == sampleUser.email) {
      output = true;
    }
    return output;
  }

  /// Temp function for testing
  ///
  /// Check if the given password is empty
  bool checkPasswordNotEmpty(String password) {
    bool output = false;
    if (password.isNotEmpty) {
      output = true;
    }
    return output;
  }

  /// Temp function for testing
  ///
  /// Check if the given password is greater than 6 chars, and contains
  /// both upper and lowercase chars
  bool checkPasswordStrongEnough(String password) {
    RegExp uppercaseRegExp = new RegExp('[A-Z]');
    RegExp lowercaseRegExp = new RegExp('[a-z]');
    if (password.length >= 6 &&
        password.contains(uppercaseRegExp) == true &&
        password.contains(lowercaseRegExp) == true) {
      return true;
    } else {
      return false;
    }
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
