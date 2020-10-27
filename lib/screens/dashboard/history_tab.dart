import 'package:data_driven_fitness_app/logic/model/application_variables/application_manager.dart';
import 'package:data_driven_fitness_app/logic/model/completed_activities/exercise_log.dart';
import 'package:data_driven_fitness_app/logic/model/completed_activities/workout_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen.dart';
import 'navbar/navbar_constants.dart';

/// Allows users to browse their workout history
class HistoryTab extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.HISTORY;

  @override
  HistoryTabState createState() => HistoryTabState();

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

class HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    List<WorkoutLog> workoutLogs =
        appManager.userData.loggedInUser.userStatistics.workoutLogs;

    List<Widget> getHistoryTiles() {
      List<Widget> output = List();

      for (WorkoutLog log in workoutLogs.reversed) {
        output.add(WorkoutLogTile(log: log));
      }

      return output;
    }

    return SingleChildScrollView(
      child: Column(
        children: getHistoryTiles(),
      ),
    );
  }
}

class WorkoutLogTile extends StatelessWidget {
  const WorkoutLogTile({Key key, this.log}) : super(key: key);

  final WorkoutLog log;

  @override
  Widget build(BuildContext context) {
    final int day = log.date.day;
    final int month = log.date.month;
    final int year = log.date.year;
    final String dateString =
        day.toString() + "/" + month.toString() + "/" + year.toString();
    final String durationString = "(" +
        ((log.finishTime.hour * 60 + log.finishTime.minute) -
                (log.startTime.hour * 60 + log.startTime.minute))
            .toString() +
        " minutes)";

    List<Widget> getExerciseLogDetails() {
      List<Widget> output = List();

      for (ExerciseLog elog in log.exerciseLogs) {
        Row tileToAppend = Row(
          children: [],
        );
        double detailSpacing = 20;
        double nameDetailSize = 80;
        switch (elog.runtimeType) {
          case CalisthenicExerciseLog:
            CalisthenicExerciseLog celog = elog;
            tileToAppend = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: nameDetailSize,
                    child: Text(
                      celog.exercise.name,
                    )),
                SizedBox(width: detailSpacing),
                Text(celog.sets.toString() + " sets"),
                SizedBox(width: detailSpacing),
                Text(celog.reps.toString() + " reps"),
                SizedBox(width: detailSpacing),
                Text((celog.completedSuccessfully)
                    ? 'Completed'
                    : 'Uncompleted'),
              ],
            );
            break;
          case CardioExerciseLog:
            CardioExerciseLog celog = elog;
            tileToAppend = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: nameDetailSize, child: Text(celog.exercise.name)),
                SizedBox(width: detailSpacing),
                Text((celog.duration ~/ 60).toString() + " minutes"),
                SizedBox(width: detailSpacing),
                Text((celog.completedSuccessfully)
                    ? 'Completed'
                    : 'Uncompleted'),
              ],
            );
            break;
            break;
          case WeightedExerciseLog:
            WeightedExerciseLog celog = elog;
            tileToAppend = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: nameDetailSize, child: Text(celog.exercise.name)),
                SizedBox(width: detailSpacing),
                Text(celog.sets.toString() + " sets"),
                SizedBox(width: detailSpacing),
                Text(celog.reps.toString() + " reps"),
                SizedBox(width: detailSpacing),
                Text(celog.weight.toString() + "kg"),
                SizedBox(width: detailSpacing),
                Text((celog.completedSuccessfully)
                    ? 'Completed'
                    : 'Uncompleted'),
              ],
            );
            break;
        }
        output.add(tileToAppend);
        output.add(SizedBox(height: 3));
      }

      return output;
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black12),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                dateString + " " + durationString,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
            Column(
              children: getExerciseLogDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
