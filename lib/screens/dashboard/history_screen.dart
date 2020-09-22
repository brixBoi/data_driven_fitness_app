import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'navbar/navbar_constants.dart';

/// Allows users to browse their workout history
class HistoryScreen extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.HISTORY;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();

  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.calendar_today,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History Screen'),
    );
  }
}
