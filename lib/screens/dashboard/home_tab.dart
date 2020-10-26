import 'dart:ui';

import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';
import 'package:data_driven_fitness_app/logic/model/model_constants.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/dashboard/navbar/navbar_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Tab user sees open app startup
class HomeScreen extends StatefulWidget {
  static final DashboardTabItem tab = DashboardTabItem.HOME;
  @override
  _HomeScreenState createState() => _HomeScreenState();

  /// Builds and gets associated NavigatorButton for this tab
  static IconButton getTabButton(
      BuildContext context, DashboardTabItem currentTab, Function onPress) {
    Color color =
        (currentTab == tab) ? Theme.of(context).accentColor : Colors.black;
    return IconButton(
      icon: Icon(
        Icons.home,
        color: color,
        size: NavbarConstants.size,
      ),
      onPressed: () {
        onPress(tab);
      },
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    List<Widget> recommendedProgramTiles = List();
    List<Program> recommendedPrograms = appManager.getRecommendedPrograms();
    for (Program program in recommendedPrograms) {
      recommendedProgramTiles.add(ProgramDetails(
        program: program,
        recommended: true,
      ));
    }

    List<Widget> otherProgramTiles = List();
    List<Program> otherPrograms = appManager.getOtherPrograms();
    for (Program program in otherPrograms) {
      otherProgramTiles.add(ProgramDetails(
        program: program,
        recommended: false,
      ));
    }

    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Please select a program to continue',
              style: Constants.kappLightTheme.primaryTextTheme.headline6,
            ),
            Container(
              child: Column(
                children: recommendedProgramTiles,
              ),
            ),
            Column(
              children: otherProgramTiles,
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramDetails extends StatelessWidget {
  const ProgramDetails({
    Key key,
    this.program,
    @required this.recommended,
  }) : super(key: key);

  final Program program;
  final bool recommended;

  List<Widget> getProgramRoutines() {
    List<Widget> output = List();
    for (Routine routine in program.routines) {
      output.add(
        Container(
          child: RoutineDetails(
            routine: routine,
          ),
        ),
      );
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    program.programName + (recommended ? ' (Recommended)' : ""),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      shadows: [
                        Shadow(color: Color(0x44000000), blurRadius: 4),
                      ],
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 45,
                    child: FlatButton(
                      child: Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        appManager.setUserProgram(program);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getProgramRoutines(),
                  ),
                ),
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Text(
                  program.description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: program.tileGradient,
          boxShadow: (recommended)
              ? [
                  BoxShadow(
                    color: Colors.amber,
                    blurRadius: 5,
                    spreadRadius: 3,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}

class RoutineDetails extends StatelessWidget {
  const RoutineDetails({
    Key key,
    this.routine,
  }) : super(key: key);

  final Routine routine;

  Widget details() {
    String day = ModelConstants.dayOfWeekString(routine.day);
    List<Widget> exercises = List();
    List<Widget> columnParts = List();
    columnParts.add(Text(
      day,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        shadows: [Shadow(color: Color(0x44000000), blurRadius: 4)],
      ),
    ));
    for (String string in routine.getDetails()) {
      exercises.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            string,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    columnParts.add(
      Container(
        height: 60,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: exercises,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnParts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: details(),
    );
  }
}
