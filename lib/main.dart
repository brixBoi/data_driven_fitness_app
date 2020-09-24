import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/application_data.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/login_signup_screen.dart';
import 'package:data_driven_fitness_app/screens/signin_user_screen.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

UserData userData = UserData();
ApplicationData applicationData = ApplicationData();
ApplicationManager appManager = ApplicationManager(userData, applicationData);

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
          Dashboard.routeName: (context) => Dashboard(),
          LoginSignupScreen.routeName: (context) =>
              LoginSignupScreen(appManager),
          SignupScreen.routeName: (context) => SignupScreen(),
          FirstTimeUserScreen.routeName: (context) => FirstTimeUserScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
        },
        initialRoute: appManager.getInitialRoute(),
        theme: Constants.kappLightTheme,
      ),
    );
  }
}
