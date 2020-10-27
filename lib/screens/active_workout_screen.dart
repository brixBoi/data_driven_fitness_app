import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_custom_button.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/application_manager.dart';
import 'package:data_driven_fitness_app/logic/model/completed_activities/exercise_log.dart';
import 'package:data_driven_fitness_app/logic/model/completed_activities/workout_log.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ActiveWorkoutScreen extends StatefulWidget {
  static final routeName = '/active_workout_screen';
  ActiveWorkoutScreen({Key key}) : super(key: key);

  @override
  _ActiveWorkoutScreenState createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends State<ActiveWorkoutScreen> {
  List<RoutineExercise> routineExercises;
  List<Widget> exerciseScreens = List();
  int currentExerciseIndex = 0;
  int currentScreenIndex = 0;
  int totalExercises;
  int failureScreenIndex;
  int restTimerScreenIndex;
  int completedWorkoutIndex;

  DateTime startTime = DateTime.now();
  DateTime finishTime;
  double duration;
  List<ExerciseLog> exerciseLogs = List();

  void success() {
    addExerciseToLogList(routineExercises[currentExerciseIndex], true);
    nextExercise();
  }

  void nextExercise() {
    setState(() {
      if (currentExerciseIndex < totalExercises - 1) {
        currentExerciseIndex++;
        currentScreenIndex = restTimerScreenIndex;
      } else {
        currentScreenIndex = completedWorkoutIndex;
      }
    });
  }

  void failure() {
    addExerciseToLogList(routineExercises[currentExerciseIndex], false);
    setState(() {
      currentScreenIndex = failureScreenIndex;
    });
  }

  void continueFromRest() {
    setState(() {
      currentScreenIndex = currentExerciseIndex;
    });
  }

  void tryAgain() {
    setState(() {
      currentScreenIndex = currentExerciseIndex;
    });
  }

  void skipExercise() {
    nextExercise();
  }

  void cancelWorkout() {
    Navigator.of(context).pushNamed(DashboardScreen.routeName);
  }

  void completeWorkout() {
    submitLog();
    Navigator.of(context).pushNamed(DashboardScreen.routeName);
  }

  void constructExerciseScreens(Routine routine) {
    if (routine != null) {
      routineExercises = routine.routineExercises;
      totalExercises = 0;
      for (RoutineExercise routineExercise in routine.routineExercises) {
        totalExercises++;
        switch (routineExercise.runtimeType) {
          case CardioRoutineExercise:
            exerciseScreens
                .add(CardioExerciseScreen(routineExercise, success, failure));
            break;
          case CalisthenicRoutineExercise:
            exerciseScreens.add(CalisthenicExerciseScreen(
              routineExercise: routineExercise,
              success: success,
              failure: failure,
            ));
            break;
          case WeightedRoutineExercise:
            exerciseScreens.add(WeightedExerciseScreen(
              routineExercise: routineExercise,
              success: success,
              failure: failure,
            ));
            break;
        }
      }
      exerciseScreens.add(FailureScreen(
        cancelWorkout: cancelWorkout,
        tryAgain: tryAgain,
        skipExercise: skipExercise,
      ));
      failureScreenIndex = totalExercises;

      exerciseScreens.add(RestScreen(
        continueFromRest: continueFromRest,
      ));
      restTimerScreenIndex = totalExercises + 1;

      exerciseScreens
          .add(CompletedWorkoutScreen(completeWorkout: completeWorkout));

      completedWorkoutIndex = totalExercises + 2;
    }
  }

  void addExerciseToLogList(
      RoutineExercise routineExercise, bool completedSuccessfully) {
    ExerciseLog log;
    switch (routineExercise.runtimeType) {
      case CalisthenicRoutineExercise:
        CalisthenicRoutineExercise exercise = routineExercise;
        log = CalisthenicExerciseLog(
          exercise.exercise,
          completedSuccessfully,
          exercise.sets,
          exercise.reps,
        );
        break;
      case CardioRoutineExercise:
        CardioRoutineExercise exercise = routineExercise;
        log = CardioExerciseLog(
          exercise.exercise,
          completedSuccessfully,
          exercise.duration,
        );
        break;
      case WeightedRoutineExercise:
        WeightedRoutineExercise exercise = routineExercise;
        log = WeightedExerciseLog(
          exercise.exercise,
          completedSuccessfully,
          exercise.sets,
          exercise.reps,
          exercise.weight,
        );
        break;
    }
    exerciseLogs.add(log);
    print(exerciseLogs.length);
  }

  void submitLog() {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    finishTime = DateTime.now();
    WorkoutLog workoutLog = WorkoutLog(
      startTime,
      TimeOfDay(hour: startTime.hour, minute: startTime.minute),
      TimeOfDay(hour: finishTime.hour, minute: finishTime.minute),
      exerciseLogs,
    );

    setState(() {
      appManager.logWorkoutSession(
        workoutLog,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    Routine dailyWorkoutRoutine = appManager.getDailyWorkoutRoutine();
    constructExerciseScreens(dailyWorkoutRoutine);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: exerciseScreens[currentScreenIndex],
      ),
    );
  }
}

class FailureScreen extends StatelessWidget {
  const FailureScreen(
      {Key key, this.tryAgain, this.skipExercise, this.cancelWorkout})
      : super(key: key);

  final Function tryAgain;
  final Function skipExercise;
  final Function cancelWorkout;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'Oops!',
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You were unable to complete that exercise,\nwould you like to...',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            StronkFlatButton(
              title: 'Try again',
              onPress: tryAgain,
            ),
            StronkFlatButton(
              title: 'Skip this exercise',
              onPress: skipExercise,
            ),
            StronkFlatButton(
              title: 'Cancel the workout',
              onPress: cancelWorkout,
            ),
          ],
        ),
      ),
    );
  }
}

class RestScreen extends StatefulWidget {
  const RestScreen({Key key, @required this.continueFromRest, this.time})
      : super(key: key);

  @override
  _RestScreenState createState() => _RestScreenState();

  final Function continueFromRest;
  final int time;
}

class _RestScreenState extends State<RestScreen> {
  CountdownController countController;
  bool showSkip = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Rest',
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Countdown(
                      startOnInit: true,
                      seconds: (widget.time != null) ? widget.time : 30,
                      build: (BuildContext context, double time) => Text(
                        time.toString(),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      controller: countController,
                      onFinished: () {
                        setState(() {
                          setState(() {
                            showSkip = false;
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StronkFlatButton(
                boxDecoration: BoxDecoration(
                  gradient: Constants.kBackgroundGradientOrange,
                ),
                width: 120.0,
                title: showSkip ? 'Skip' : 'Continue',
                textColor: Colors.white,
                onPress: widget.continueFromRest,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardioExerciseScreen extends StatefulWidget {
  CardioExerciseScreen(
    this.routineExercise,
    this.success,
    this.failure,
  );
  final CardioRoutineExercise routineExercise;
  final Function success;
  final Function failure;

  @override
  _CardioExerciseScreenState createState() => _CardioExerciseScreenState();
}

class _CardioExerciseScreenState extends State<CardioExerciseScreen> {
  int duration;
  String durationString;
  String exerciseName;
  String description;
  Image exerciseImage;
  CountdownController countController;
  bool _isPause = true;

  void initVariables() {
    duration = widget.routineExercise.duration;
    durationString = (duration ~/ 60).toString() + " minutes";
    exerciseName = widget.routineExercise.exercise.name;
    description = widget.routineExercise.exercise.description;
    countController = CountdownController();
  }

  bool showContinueButton = false;

  @override
  Widget build(BuildContext context) {
    initVariables();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      exerciseName,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Countdown(
                      startOnInit: false,
                      seconds: duration,
                      build: (BuildContext context, double time) => Text(
                        time.toString(),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      controller: countController,
                      onFinished: () {
                        setState(() {
                          showContinueButton = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(_isPause ? Icons.play_arrow : Icons.cancel),
              iconSize: 40,
              onPressed: () {
                setState(() {
                  if (_isPause) {
                    countController.resume();
                    _isPause = false;
                  } else {
                    widget.failure();
                  }
                });
              },
            ),
            Visibility(
              visible: showContinueButton,
              child: StronkFlatButton(
                boxDecoration: BoxDecoration(
                  gradient: Constants.kBackgroundGradientOrange,
                ),
                width: 120.0,
                title: 'Continue',
                textColor: Colors.white,
                onPress: () {
                  widget.success();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalisthenicExerciseScreen extends StatefulWidget {
  const CalisthenicExerciseScreen(
      {Key key, this.routineExercise, this.success, this.failure})
      : super(key: key);

  @override
  _CalisthenicExerciseScreenState createState() =>
      _CalisthenicExerciseScreenState();

  final CalisthenicRoutineExercise routineExercise;
  final Function success;
  final Function failure;
}

class _CalisthenicExerciseScreenState extends State<CalisthenicExerciseScreen> {
  int totalSets;
  int reps;
  int restTime;

  String exerciseName;
  String description;
  Image exerciseImage;
  CountdownController countController;
  bool _isPause = true;

  void initVariables() {
    exerciseName = widget.routineExercise.exercise.name;
    description = widget.routineExercise.exercise.description;
    totalSets = widget.routineExercise.sets;
    reps = widget.routineExercise.reps;
    countController = CountdownController();
    restTime = widget.routineExercise.restTime;
  }

  int currentSet = 1;
  bool showContinueButton = false;
  bool resting = false;

  @override
  Widget build(BuildContext context) {
    initVariables();

    void completedSet() {
      setState(() {
        if (currentSet < totalSets) {
          currentSet++;
          resting = true;
        } else {
          widget.success();
        }
      });
    }

    void nextSet() {
      setState(() {
        resting = false;
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      exerciseName,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Text(
                      totalSets.toString() +
                          " sets of " +
                          reps.toString() +
                          " reps",
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: !resting,
                              child: Column(
                                children: [
                                  Text(
                                    "Set " +
                                        currentSet.toString() +
                                        " of " +
                                        totalSets.toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline4,
                                  ),
                                  StronkFlatButton(
                                    title: 'Completed',
                                    onPress: () {
                                      completedSet();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: resting,
                              child: Column(
                                children: [
                                  Text(
                                    'Rest',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline4,
                                  ),
                                  Countdown(
                                    startOnInit: true,
                                    seconds: restTime,
                                    build:
                                        (BuildContext context, double time) =>
                                            Text(
                                      time.toString(),
                                      style: TextStyle(
                                        fontSize: 50,
                                      ),
                                    ),
                                    onFinished: () {
                                      nextSet();
                                    },
                                  ),
                                  StronkFlatButton(
                                    title: 'Skip',
                                    onPress: nextSet,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.cancel,
              ),
              iconSize: 40,
              onPressed: widget.failure,
            ),
          ],
        ),
      ),
    );
  }
}

class WeightedExerciseScreen extends StatefulWidget {
  const WeightedExerciseScreen(
      {Key key, this.routineExercise, this.success, this.failure})
      : super(key: key);

  @override
  _WeightedExerciseScreenState createState() => _WeightedExerciseScreenState();

  final WeightedRoutineExercise routineExercise;
  final Function success;
  final Function failure;
}

class _WeightedExerciseScreenState extends State<WeightedExerciseScreen> {
  int totalSets;
  int reps;
  int restTime;
  double weight;

  String exerciseName;
  String description;
  Image exerciseImage;
  CountdownController countController;
  bool _isPause = true;

  void initVariables() {
    exerciseName = widget.routineExercise.exercise.name;
    description = widget.routineExercise.exercise.description;
    totalSets = widget.routineExercise.sets;
    reps = widget.routineExercise.reps;
    countController = CountdownController();
    restTime = widget.routineExercise.restTime;
    weight = widget.routineExercise.weight;
  }

  int currentSet = 1;
  bool showContinueButton = false;
  bool resting = false;

  @override
  Widget build(BuildContext context) {
    initVariables();

    void completedSet() {
      setState(() {
        if (currentSet < totalSets) {
          currentSet++;
          resting = true;
        } else {
          widget.success();
        }
      });
    }

    void nextSet() {
      setState(() {
        resting = false;
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      exerciseName,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Text(
                      totalSets.toString() +
                          " sets of " +
                          reps.toString() +
                          " reps",
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: !resting,
                              child: Column(
                                children: [
                                  Text(
                                    "Set " +
                                        currentSet.toString() +
                                        " of " +
                                        totalSets.toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline4,
                                  ),
                                  Text(
                                    weight.toString() + "kg",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5,
                                  ),
                                  StronkFlatButton(
                                    title: 'Completed',
                                    onPress: () {
                                      completedSet();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: resting,
                              child: Column(
                                children: [
                                  Text(
                                    'Rest',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline4,
                                  ),
                                  Countdown(
                                    startOnInit: true,
                                    seconds: restTime,
                                    build:
                                        (BuildContext context, double time) =>
                                            Text(
                                      time.toString(),
                                      style: TextStyle(
                                        fontSize: 50,
                                      ),
                                    ),
                                    onFinished: () {
                                      nextSet();
                                    },
                                  ),
                                  StronkFlatButton(
                                    title: 'Skip',
                                    onPress: nextSet,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.cancel,
              ),
              iconSize: 40,
              onPressed: widget.failure,
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedWorkoutScreen extends StatefulWidget {
  const CompletedWorkoutScreen({Key key, this.completeWorkout})
      : super(key: key);

  @override
  _CompletedWorkoutScreenState createState() => _CompletedWorkoutScreenState();

  final Function completeWorkout;
}

class _CompletedWorkoutScreenState extends State<CompletedWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'All done!',
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          StronkFlatButton(
            title: 'Finish',
            onPress: widget.completeWorkout,
          ),
        ],
      ),
    );
  }
}
