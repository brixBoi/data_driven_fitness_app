import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/homescreen.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';

class ApplicationManager {
  ApplicationManager(this.userData);

  UserData userData;

  String getInitialRoute() {
    if (userData.userLoggedIn) {
      return HomeScreen.routeName;
    } else {
      return LoginSignupScreen.routeName;
    }
  }
}
