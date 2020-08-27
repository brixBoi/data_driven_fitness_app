import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';
import 'package:flutter/material.dart';

class WorkoutLog {
  WorkoutLog(this.date, this.startTime, this.finishTime, this.exercises);

  DateTime date;
  TimeOfDay startTime;
  TimeOfDay finishTime;
  List<Exercise> exercises;
}
