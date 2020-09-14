import 'package:data_driven_fitness_app/screens/history_screen.dart';
import 'package:data_driven_fitness_app/screens/homescreen.dart';
import 'package:data_driven_fitness_app/screens/stats_screen.dart';
import 'package:data_driven_fitness_app/screens/workout_screen.dart';
import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {

  NavBarButton(this._icondata, this._route);

  IconData _icondata;
  double _size = 30;
  String _route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _icondata,
        size: _size,
      ),
      onPressed: () {
        Navigator.pushNamed(context, _route);
      },
    );
  }
}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
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
            NavBarButton(Icons.home, HomeScreen.routeName),
            NavBarButton(Icons.show_chart, StatsScreen.routeName),
            NavBarButton(Icons.fitness_center, WorkoutScreen.routeName),
            NavBarButton(Icons.calendar_today, HistoryScreen.routeName),

          ],
        ),
      ),
    );
  }
}
