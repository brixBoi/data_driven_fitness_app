import 'package:data_driven_fitness_app/screens/dashboard/dashboard.dart';
import 'package:data_driven_fitness_app/screens/dashboard/history_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/homescreen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/stats_screen.dart';
import 'package:flutter/material.dart';

import '../workout_screen.dart';

class BottomNavBar extends StatelessWidget {
  final DashboardTabItem _currentTab;
  final Function _selectTab;
  const BottomNavBar(
    this._currentTab,
    this._selectTab, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HomeScreen.getTabButton(context, _currentTab, _selectTab),
            StatsScreen.getTabButton(context, _currentTab, _selectTab),
            WorkoutScreen.getTabButton(context, _currentTab, _selectTab),
            HistoryScreen.getTabButton(context, _currentTab, _selectTab),
          ],
        ),
      ),
    );
  }
}
