import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/samples_workout_programs.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/login_or_signup_selection_screen.dart';
import 'package:data_driven_fitness_app/screens/program_selection_screen.dart';
import 'package:flutter/material.dart';

/// Class used for managing application model and data
///
/// All userData is modified and accessed through this class.
/// Several functions will take the current buildContext in order to push new screens
/// to the navigator also.
class ApplicationManager extends ChangeNotifier {
  ApplicationManager(this.userData);

  // Class for tracking whether there is a user logged in and their details
  UserData userData;
  // Used for database interaction
  DatabaseFunctions dbf = DatabaseFunctions();

  /// Determines the initial route for the application
  ///
  /// If a user is logged in, the dashboard will be shown.
  /// Otherwise the sign in/up screen will be shown
  String getInitialRoute() {
    if (userData.userLoggedIn) {
      return DashboardScreen.routeName;
    } else {
      return LoginOrSignupNavigationScreen.routeName;
    }
  }

  /// Attempts to log a user into the application, and pushes the next screen.
  /// and pushes the next screen (determined by showPostLoginScreen function)
  ///
  void login(
    BuildContext context,
    String email,
    String password,
  ) async {
    // added async here, SHOULD support the await command below to support a Future<User> constructor
    try {
      // Try log the user in, and set the current logged in user to them
      userData.setLoggedInUser(await dbf.login(email, password));

      showPostLoginScreen(context);
    } catch (e) {
      print('Uh Oh');
      print(e.toString());
      throw Exception('Invalid email / password');
    }
  }

  /// Attempts to log a User into the application with their Google account
  /// and pushes the next screen (determined by showPostLoginScreen function)
  ///
  /// If the login is unsuccessful, an error will be thrown.
  void loginWithGoogle(BuildContext context) {
    try {
      // Try log the user in, and set the current logged in user to them
      userData.setLoggedInUser(dbf.loginWithGoogle());

      showPostLoginScreen(context);
    } catch (e) {
      // Thrown if login fails
      throw Exception('Invalid email / password');
    }
  }

  /// Attempts to log a User into the application with their Facebook account
  /// and pushes the next screen (determined by showPostLoginScreen function)
  ///
  /// If the login is unsuccessful, an error will be thrown.
  void loginWithFacebook(BuildContext context) {
    try {
      // Try log the user in, and set the current logged in user to them
      userData.setLoggedInUser(dbf.loginWithFacebook());

      showPostLoginScreen(context);
    } catch (e) {
      // Thrown if login fails
      throw Exception('Invalid email / password');
    }
  }

  /// Pushes the next screen to the navigator, depending on if the given user is initialized
  /// If a user is un-initialized (No height / weight data etc) then the FirstTimeUser
  /// screen will be shown.
  ///
  /// Otherwise the dashboard will be displayed
  void showPostLoginScreen(BuildContext context) {
    // If the user is initialized, show the dashboard
    if (userData.loggedInUser.initialized) {
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
      // If the user is un-initialized, show the FirstTimeUserScreen
    } else {
      Navigator.of(context).pushNamed(FirstTimeUserScreen.routeName);
    }
  }

  /// Signs a user up to the app using the given details and logs them in.
  ///
  /// Throws an exception if there is an existing user with the given email
  void signup(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    if (dbf.checkExistingEmail(email)) {
      throw new Exception('Email already exists');
    } else {
      dbf.signup(
        firstName,
        lastName,
        email,
        password,
      );
      // Log the user in
      login(context, email, password);
    }
  }

  /// Initialize a user by setting their height, weight and userGoal variables,
  /// then push the Dashboard to screen. Null can be passed in place of context
  void initializeCurrentUser(
    BuildContext context,
    double height,
    double weight,
    UserGoals userGoal,
  ) {
    userData.loggedInUser.initializeUser(height, weight, userGoal);
    Navigator.of(context).pushNamed(ProgramSelectionScreen.routeName);
  }

  /// Log a user out and display the HomeScreen
  void logout(BuildContext context) {
    userData.userLoggedIn = false;
    Navigator.of(context).pushNamed(LoginOrSignupNavigationScreen.routeName);
  }

  getOtherPrograms() {
    List<Program> output = List();

    for (Program program in SamplePrograms.all) {
      if (program.goal != userData.loggedInUser.userRegime.UserGoal) {
        output.add(program);
      }
    }

    return output;
  }

  getRecommendedPrograms() {
    List<Program> output = List();

    for (Program program in SamplePrograms.all) {
      if (program.goal == userData.loggedInUser.userRegime.UserGoal) {
        output.add(program);
      }
    }

    return output;
  }

  void setUserProgram(Program program) {
    userData.loggedInUser.userRegime.setProgram(program);
    print('User Program set to ' + program.programName);
  }
}
