import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/screens/dashboard/history_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/homescreen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/navbar/bottom_navbar.dart';
import 'package:data_driven_fitness_app/screens/dashboard/stats_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum DashboardTabItem { HOME, STATS, WORKOUT, HISTORY }

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";

  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var screens = {
    DashboardTabItem.HOME: HomeScreen(),
    DashboardTabItem.STATS: StatsScreen(),
    DashboardTabItem.WORKOUT: WorkoutScreen(),
    DashboardTabItem.HISTORY: HistoryScreen(),
  };
  DashboardTabItem currentTab = DashboardTabItem.HOME;

  @override
  Widget build(BuildContext context) {
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

  Widget _buildBody() {
    return screens[currentTab];
  }

  Function _selectTab(DashboardTabItem buttonTab) {
    if (currentTab != buttonTab) {
      setState(() {
        currentTab = buttonTab;
      });
    }
  }
}