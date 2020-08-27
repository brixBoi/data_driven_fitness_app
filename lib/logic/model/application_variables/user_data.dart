import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  UserData() {
    loggedInUser = User.blank(1, "testuser@email.com", "Test", "User", 188, 87);
    userLoggedIn = false;
  }

  bool userLoggedIn;
  User loggedInUser;
}
