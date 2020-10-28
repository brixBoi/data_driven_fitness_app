import 'dart:io';

import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Class used for database interactions, e.g. Signing in, Signing up, persisting user data changes etc.
class DatabaseFunctions {
  // sampleUser needed with fake api data for login per se, but intermediary functions still do.
  User sampleUser = User.blank(2, "bhenshall@outlook.com", "Ben", "Henshall");
  Exception invalidEmailorPass;
  Exception signUpError;

  /// encodes the string email:password into base64 for inclusion in http authorization header.
  /// Base64 encoding will not operate on Strings, utf is intermediary.
  /// Email and Password strings -> concatenated, correct format string -> utf -> base64.
  /// @params: the user's email and password.
  /// @return
  String encodeAuthString(String email, String password) {
    return base64.encode(utf8.encode(email + ":" + password));
  }

  /// sends GET request with base64auth string to retrieve user info at sign in.
  /// Response header must contain Basic Authorization info: 'Basic EmailInBase64:PassInBase64'
  /// Returns the complete user object
  ///
  /// @param email, password: Sign in form fields
  /// @return the logged in user object, corresponding to input login information.
  Future<User> login(String email, String userPassword) async {
    var base64auth = encodeAuthString(email, userPassword);
    final response = await http.get(
      'https://datadrivenfitness.azurewebsites.net/api/Users/GetUser',
      headers: {HttpHeaders.authorizationHeader: 'Basic ' + base64auth},
    );

    // 200 = successful GET, user information retrieved.
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print('Login Successful');
      return User.fromJson(responseJson);
    } else {
      throw invalidEmailorPass; // ("Http error code: " + response.statusCode.toString());
    }
  }

  /// Attempts to add user to DB.
  /// Header needs to specify application/json and utf-8 encoding.
  /// Body needs to Map email, password, fname and lname.
  ///
  /// @params User: Semi-complete user object from signup form entry.
  /// @params pwd: Password from signup form.
  /// @return http response status code - 201 indicates successful creation.
  Future<int> createInitialUserDbEntry(User user, String pwd) async {
    final response = await http.post(
      'https://datadrivenfitness.azurewebsites.net/api/Users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'email': user.email,
        'password': pwd, // passed from string, as user.pwd only possible until after added to db.
        'firstname': user.firstName,
        'lastname': user.lastName
      }),
    );

    // 201 = successful POST, user successful creation in DB.
    if (response.statusCode == 201) {
      print('Sign up Successful: User added to DB');
      return response.statusCode;
    } else {
      throw signUpError;
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

    createInitialUserDbEntry(sampleUser, password);

    return sampleUser;
  }

  User loginWithGoogle() {
    return sampleUser;
  }

  User loginWithFacebook() {
    return sampleUser;
  }
}
