import 'package:data_driven_fitness_app/logic/model/completed_activities/exercise_log.dart';
import 'package:flutter/material.dart';

///class to log workout that has been completed
class WorkoutLog {
  WorkoutLog(this.date, this.startTime, this.finishTime, this.exerciseLogs);

  DateTime date;
  TimeOfDay startTime;
  TimeOfDay finishTime;
  List<ExerciseLog> exerciseLogs;
}
