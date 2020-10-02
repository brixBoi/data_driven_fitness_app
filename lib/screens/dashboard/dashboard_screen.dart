import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:data_driven_fitness_app/screens/dashboard/history_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/home_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/navbar/bottom_navbar.dart';
import 'package:data_driven_fitness_app/screens/dashboard/stats_tab.dart';
import 'package:data_driven_fitness_app/screens/dashboard/workout_tab.dart';
import 'package:data_driven_fitness_app/screens/profile_information.dart';
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
  final Key _menuKey = new Key('_menuKey');

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
            key: _menuKey,
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
        drawer: StronkDrawer(),
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

class StronkDrawer extends StatelessWidget {
  const StronkDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    User currentUser = appManager.userData.loggedInUser;
    final Key profileButtonKey = Key('profileButton');
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 135,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Welcome ' + currentUser.firstName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
          StronkDrawerButton(
            key: profileButtonKey,
            iconData: Icons.person,
            label: "Profile",
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ProfileInformationScreen.routeName);
            },
          ),
          StronkDrawerButton(
            iconData: Icons.exit_to_app,
            label: "Logout",
            onPressed: () {
              Provider.of<ApplicationManager>(context).logout(context);
            },
          ),
        ],
      ),
    );
  }
}

class StronkDrawerButton extends StatelessWidget {
  const StronkDrawerButton({
    Key key,
    @required this.iconData,
    @required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        children: [
          Icon(iconData),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(label),
          )
        ],
      ),
      onPressed: () => onPressed(),
    );
  }
}
