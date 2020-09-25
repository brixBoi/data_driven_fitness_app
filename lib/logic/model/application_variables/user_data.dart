import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:flutter/cupertino.dart';

/// Class used for tracking whether there is a user logged in, and their details
class UserData extends ChangeNotifier {
  //TODO: Initialize user data from database properties
  UserData() {
    userLoggedIn = false;
  }
  bool userLoggedIn;
  User loggedInUser;

  void setLoggedInUser(User user) {
    loggedInUser = user;
    userLoggedIn = true;
  }
}
