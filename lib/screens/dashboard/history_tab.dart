import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'navbar/navbar_constants.dart';

/// Allows users to browse their workout history
class HistoryTab extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.HISTORY;

  @override
  _HistoryTabState createState() => _HistoryTabState();

  /// Builds and gets associated NavigatorButton for this tab
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

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History Screen'),
    );
  }
}
