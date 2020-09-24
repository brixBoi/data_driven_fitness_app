import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/application_data.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';
import 'package:flutter/material.dart';

class ApplicationManager extends ChangeNotifier {
  ApplicationManager(this.userData, this.applicationData);

  UserData userData;
  ApplicationData applicationData;
  DatabaseFunctions dbf = DatabaseFunctions();

  String getInitialRoute() {
    if (userData.userLoggedIn) {
      return Dashboard.routeName;
    } else {
      return LoginSignupScreen.routeName;
    }
  }

  void login(
    BuildContext context,
    String email,
    String password,
  ) {
    try {
      userData.setLoggedInUser(dbf.login(email, password));
      if (userData.loggedInUser.initialized) {
        Navigator.of(context).pushNamed(Dashboard.routeName);
      } else {
        Navigator.of(context).pushNamed(FirstTimeUserScreen.routeName);
      }
    } catch (e) {
      throw Exception('Invalid email / password');
    }
  }

  bool loginWithGoogle(BuildContext context) {
    login(context, 'zachmartin9001@gmail.com', 'Abcd1234!');
  }

  bool loginWithFacebook(BuildContext context) {
    login(context, 'zachmartin9001@gmail.com', 'Abcd1234!');
  }

  bool signup(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    print('Signing up');
    if (dbf.checkExistingEmail(email)) {
      throw new Exception('Email already exists');
    } else {
      dbf.signup(
        firstName,
        lastName,
        email,
        password,
      );
      login(context, email, password);
    }
  }

  void initializeCurrentUser(
    BuildContext context,
    double height,
    double weight,
    UserGoals userGoal,
  ) {
    userData.loggedInUser.initializeUser(height, weight, userGoal);
    Navigator.of(context).pushNamed(Dashboard.routeName);
  }

  void logout(BuildContext context) {
    print('Logging out');

    userData.userLoggedIn = false;
    Navigator.of(context).pushNamed(LoginSignupScreen.routeName);
  }
}
