import 'dart:io';

import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Class used for database interactions, e.g. Signing in, Signing up, persisting user data changes etc.
class DatabaseFunctions {
  // sampleUser needed with fake api data for login per se, but intermediary functions still do.
  User sampleUser = User.blank(2, "bhenshall@outlook.com", "Ben", "Henshall");
  Exception invalidEmailorPass;


  /// encodes the string email:password into base64 for inclusion in http authorization header
  String encodeAuthString(String e, String p) {
    var userInformation = e+":"+p;
    print(userInformation);
    var bytes = utf8.encode(userInformation);
    var base64auth = base64.encode(bytes);
    print(base64auth);

    return base64auth;
  }

  /// sends GET request with base64auth string to retrieve user info at sign in
  /// Returns the complete user object
  Future<User> login(String email, String userPassword) async {
    var base64auth = encodeAuthString(email, userPassword);
    final response = await http.get(
      'https://datadrivenfitnessapp.azurewebsites.net/api/Users/GetUser',
      headers: {HttpHeaders.authorizationHeader: 'Basic '+ base64auth},
    );

    // 200 = success, create our user information
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print('Login Successful');
      return User.fromJson(responseJson);
    } else {
     throw  invalidEmailorPass; // ("Http error code: " + response.statusCode.toString());
    }
  }



  /// Temp function for testing
  ///
  /// Return user if given email and password are valid, otherwise throw an exception

  /*User login(String email, String userPassword) {
    User user = login(email, userPassword));
    if (email == sampleUser.email && userPassword == 'Abcd1234!') {
      print('Login Successful');
      return sampleUser;
    } else {
      throw invalidEmailorPass;
    }
  }*/



  ///TODO: replace with HTTP GET call
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
  /// TODO: Configure secure HTTP PUT
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
