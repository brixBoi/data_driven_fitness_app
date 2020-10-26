import 'dart:ui';

import 'package:data_driven_fitness_app/custom_widgets/routine_details.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/navbar/navbar_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Tab user sees open app startup
class HomeScreen extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.HOME;
  @override
  _HomeScreenState createState() => _HomeScreenState();

  /// Builds and gets associated NavigatorButton for this tab
  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.home,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    User currentUser = appManager.userData.loggedInUser;

    Program currentProgram = currentUser.userRegime.currentProgram;

    List<Widget> getProgramRoutines() {
      List<Widget> output = List();
      for (Routine routine in currentProgram.routines) {
        output.add(
          Container(
            child: RoutineDetails(
              routine: routine,
              headingStyle: TextStyle(fontSize: 18),
              detailStyle: TextStyle(),
              height: 80,
            ),
          ),
        );
      }
      return output;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Text(
                  'Current Program',
                ),
                Text(
                  currentUser.userRegime.currentProgram.programName,
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: getProgramRoutines(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('data'),
        ],
      ),
    );
  }
}
