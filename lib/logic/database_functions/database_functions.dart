import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';

class DatabaseFunctions {
  String _userName;
  String _password;
  User sampleUser =
      User.blank(1, "testuser@email.com", "Test", "User", 188, 87);

  User login(String userName, String userPassword) {
    if (userName == _userName && userPassword == _password) {
      return sampleUser;
    } else {
      print("Invalid username / password");
      return null;
    }
  }
}
