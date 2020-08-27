import 'package:flutter/material.dart';

import 'exercise.dart';

class WorkoutLog {
  WorkoutLog(this.date, this.startTime, this.finishTime, this.exercises);

  DateTime date;
  TimeOfDay startTime;
  TimeOfDay finishTime;
  List<Exercise> exercises;
}
