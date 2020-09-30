import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/calculator_screens/bmi_input_screen.dart';
import 'package:data_driven_fitness_app/screens/calculator_screens/tdee_input_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/login_or_signup_selection_screen.dart';
import 'package:data_driven_fitness_app/screens/signin_user_screen.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

UserData userData = UserData();
ApplicationManager appManager = ApplicationManager(userData);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userData),
        ChangeNotifierProvider(create: (context) => appManager),
      ],
      child: MaterialApp(
        routes: {
          DashboardScreen.routeName: (context) => DashboardScreen(),
          LoginOrSignupNavigationScreen.routeName: (context) =>
              LoginOrSignupNavigationScreen(appManager),
          SignupScreen.routeName: (context) => SignupScreen(),
          FirstTimeUserScreen.routeName: (context) => FirstTimeUserScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
          InputPage.routeName: (context) => InputPage(),
          BMIInputScreen.routeName: (context) => BMIInputScreen(),

        },
        initialRoute: appManager.getInitialRoute(),
        theme: Constants.kappLightTheme,
      ),
    );
  }
}
