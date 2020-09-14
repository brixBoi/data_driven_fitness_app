import 'package:data_driven_fitness_app/custom_widgets/bottom_navbar.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/screens/history_screen.dart';
import 'package:data_driven_fitness_app/screens/stats_screen.dart';
import 'package:data_driven_fitness_app/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Dashboard user sees open app startup
class HomeScreen extends StatefulWidget {
  // Constant for route navigation
  static final String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stronk"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("beep");
          },
        ),
      ),
      body: Center(
        child: Text(
          "Welcome " + Provider.of<UserData>(context).loggedInUser.firstName,
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

