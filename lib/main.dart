import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/calculators/bmi_input_screen.dart';
import 'package:data_driven_fitness_app/screens/calculators/tdee_input_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/login_or_signup_selection_screen.dart';
import 'package:data_driven_fitness_app/screens/profile_information.dart';
import 'package:data_driven_fitness_app/screens/signin_user_screen.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({
    this.testingRoute,
    UserData userData,
  }) {
    if (userData == null) {
      this.userData = UserData();
    } else {
      this.userData = userData;
    }
    this.appManager = ApplicationManager(this.userData);
  }

  ApplicationManager appManager;
  UserData userData;
  String testingRoute;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    UserData userData = widget.userData;
    ApplicationManager appManager = widget.appManager;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userData),
        ChangeNotifierProvider(create: (context) => appManager),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          DashboardScreen.routeName: (context) => DashboardScreen(),
          LoginOrSignupNavigationScreen.routeName: (context) =>
              LoginOrSignupNavigationScreen(appManager),
          SignupScreen.routeName: (context) => SignupScreen(),
          FirstTimeUserScreen.routeName: (context) => FirstTimeUserScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
          InputPage.routeName: (context) => InputPage(),
          BMIInputScreen.routeName: (context) => BMIInputScreen(),
          ProfileInformationScreen.routeName: (context) =>
              ProfileInformationScreen(),
        },
        initialRoute: widget.testingRoute != null
            ? widget.testingRoute
            : appManager.getInitialRoute(),
        theme: Constants.kappLightTheme,
      ),
    );
  }
}
