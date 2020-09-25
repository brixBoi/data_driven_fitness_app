import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/history_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/home_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/stats_tab.dart';
import 'package:flutter/material.dart';

import '../workout_tab.dart';

/// Bottom Navigation Bar used to cycle through dashboard tabs
/// Stateless, and rebuilt with each button press to highlight current tab
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
          // Gets each DashboardTab's associated navigator button, highlights the selected Tab
          children: <Widget>[
            HomeScreen.getTabButton(context, _currentTab, _selectTab),
            StatsScreen.getTabButton(context, _currentTab, _selectTab),
            WorkoutScreen.getTabButton(context, _currentTab, _selectTab),
            HistoryTab.getTabButton(context, _currentTab, _selectTab),
          ],
        ),
      ),
    );
  }
}
