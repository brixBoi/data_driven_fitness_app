import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'navbar/navbar_constants.dart';

/// Allows users to view/manage their workout stats
class StatsScreen extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.STATS;

  @override
  _StatsScreenState createState() => _StatsScreenState();

  /// Builds and gets associated NavigatorButton for this tab
  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.show_chart,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Stats Screen'),
    );
  }
}
