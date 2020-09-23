import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  //TODO: Initialize user data from database properties
  UserData() {
    userLoggedIn = false;
    loggedInUser = User.blank(1, "testuser@email.com", "Zach", "User");
  }

  bool userLoggedIn;
  User loggedInUser;

  void setLoggedInUser(User user) {
    loggedInUser = user;
    userLoggedIn = true;
  }
}
