import 'package:data_driven_fitness_app/logic/model/application_variables/application_data.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class ApplicationManager extends ChangeNotifier {
  ApplicationManager(this.userData, this.applicationData);

  UserData userData;
  ApplicationData applicationData;

  String getInitialRoute() {
    if (userData.userLoggedIn) {
      return Dashboard.routeName;
    } else {
      return LoginSignupScreen.routeName;
    }
  }

  bool login(BuildContext context) {
    print('Logging in');

    userData.userLoggedIn = true;
    Navigator.of(context).pushNamed(Dashboard.routeName);
  }

  bool loginWithGoogle(BuildContext context) {
    login(context);
    print('Via google');
  }

  bool loginWithFacebook(BuildContext context) {
    _firstTimeUser();
  }

  bool signup(BuildContext context) {
    print('Signing up');

    Navigator.of(context).pushNamed(SignupScreen.routeName);
  }

  void _firstTimeUser() {}

  void logout(BuildContext context) {
    print('Logging out');

    userData.userLoggedIn = false;
    Navigator.of(context).pushNamed(LoginSignupScreen.routeName);
  }
}
