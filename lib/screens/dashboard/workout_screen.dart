import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'navbar/navbar_constants.dart';

/// Displayed when a user chooses to start a routine
class WorkoutScreen extends StatefulWidget {
  // Constant for route navigation
  static final DashboardTabItem tab = DashboardTabItem.WORKOUT;

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();

  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.fitness_center,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Workout Screen'),
    );
  }
}
