import 'package:data_driven_fitness_app/logic/model/application_variables/application_data.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';
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
}
