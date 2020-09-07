import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/history_screen.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';
import 'package:data_driven_fitness_app/screens/stats_screen.dart';
import 'package:data_driven_fitness_app/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homescreen.dart';

void main() => runApp(MyApp());

UserData userData = UserData();
ApplicationManager appManager = ApplicationManager(userData);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => userData,
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginSignupScreen.routeName: (context) => LoginSignupScreen(),
          StatsScreen.routeName: (context) => StatsScreen(),
          WorkoutScreen.routeName: (context) => WorkoutScreen(),
          HistoryScreen.routeName: (context) => HistoryScreen()
        },
        initialRoute: appManager.getInitialRoute(),
        theme: Constants.kappLightTheme,
      ),
    );
  }
}
