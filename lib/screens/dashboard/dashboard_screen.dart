import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/screens/dashboard/history_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/home_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/navbar/bottom_navbar.dart';
import 'package:data_driven_fitness_app/screens/dashboard/stats_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/workout_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Enum for each tab displayed in DashboardScreen
enum DashboardTabItem { HOME, STATS, WORKOUT, HISTORY }

/// Main screen of the app which hosts a number of tabs
/// Each tab is it's own class/widget, with this widget being used as a means
/// to navigate through and display the tabs.
///
/// A bottom navigation bar is used for navigation
///
/// Contains 4 tabs, the home tab, the statistics tab, the workout tab and
/// the history tab.
class DashboardScreen extends StatefulWidget {
  static const String routeName = "dashboard";

  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  /// Map of tabs which can be displayed using BottomNavigationBar
  var tabs = {
    DashboardTabItem.HOME: HomeScreen(),
    DashboardTabItem.STATS: StatsScreen(),
    DashboardTabItem.WORKOUT: WorkoutScreen(),
    DashboardTabItem.HISTORY: HistoryTab(),
  };
  DashboardTabItem currentTab = DashboardTabItem.HOME;

  @override
  Widget build(BuildContext context) {
    // Prevents returning to previous screen
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Stronk"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
        // Function used to display the currently selected screen in the navigation bar
        body: _buildBody(),
        bottomNavigationBar: BottomNavBar(
          currentTab,
          _selectTab,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 135,
                child: Container(
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Logout'),
                    )
                  ],
                ),
                onPressed: () {
                  Provider.of<ApplicationManager>(context).logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the currently selected tab
  Widget _buildBody() {
    return tabs[currentTab];
  }

  /// Set the current tab to the specified tab
  Function _selectTab(DashboardTabItem buttonTab) {
    if (currentTab != buttonTab) {
      setState(() {
        currentTab = buttonTab;
      });
    }
  }
}
