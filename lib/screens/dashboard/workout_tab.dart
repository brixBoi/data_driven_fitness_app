import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/application_manager.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen.dart';
import 'navbar/navbar_constants.dart';

/// Displayed when a user chooses to start a routine
class WorkoutScreen extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.WORKOUT;

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();

  /// Builds and gets associated NavigatorButton for this tab
  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.fitness_center,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    Routine routine = appManager.getDailyWorkoutRoutine();
    return routine != null ? RoutineDetailsPanel() : RestDayPanel();
  }
}

class RestDayPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Colors.black12,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 210,
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.calendar_today,
                size: 100,
              ),
              Text(
                'No workout today,\nget some rest!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoutineDetailsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    Routine routine = appManager.getDailyWorkoutRoutine();
    List<Widget> getRoutineExerciseDetails() {
      List<Widget> output = List();

      for (RoutineExercise exercise in routine.routineExercises) {
        output.add(ExerciseTile(exercise: exercise));
      }
      return output;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            'Today\'s session:',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                color: Colors.black12,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getRoutineExerciseDetails(),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: Constants.kBackgroundGradientOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Begin Exercise',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      appManager.startDailyWorkout(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({Key key, this.exercise}) : super(key: key);

  final RoutineExercise exercise;

  Widget getExerciseDetails() {
    List<Widget> output = List();

    switch (exercise.runtimeType) {
      case WeightedRoutineExercise:
        WeightedRoutineExercise wExercise = exercise;
        output.add(Text(('Sets: ' + wExercise.sets.toString())));
        output.add(Text(('Reps: ' + wExercise.reps.toString())));
        output.add(Text(('Weight: ' + wExercise.weight.toString() + 'kg')));
        output.add(
            Text(('Rest Time: ' + wExercise.restTime.toString() + ' seconds')));
        break;
      case CalisthenicRoutineExercise:
        CalisthenicRoutineExercise cExercise = exercise;
        output.add(Text(('Sets: ' + cExercise.sets.toString())));
        output.add(Text(('Reps: ' + cExercise.reps.toString())));
        output.add(
            Text(('Rest Time: ' + cExercise.restTime.toString() + ' seconds')));
        break;
      case CardioRoutineExercise:
        CardioRoutineExercise cExercise = exercise;
        output.add(Text(('Duration: ' +
            (cExercise.duration / 60).toString() +
            ' minutes')));
        break;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: output,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.exercise.name,
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                getExerciseDetails(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
