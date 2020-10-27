import 'package:data_driven_fitness_app/logic/model/completed_activities/exercise_log.dart';
import 'package:data_driven_fitness_app/logic/model/completed_activities/workout_log.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/samples_workout_programs.dart';
import 'package:flutter/material.dart';

class SampleUserHistory {
  static List<WorkoutLog> sampleWorkoutLogHistory = [
    //1st week
    WorkoutLog(
      DateTime(2020, 10, 5, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 60.0),
        WeightedExerciseLog(SampleExercises.overheadPress, true, 3, 5, 30.0),
        WeightedExerciseLog(SampleExercises.benchPress, true, 3, 5, 40.0)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 7, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.row, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 60.0),
        WeightedExerciseLog(SampleExercises.deadlift, true, 3, 5, 70.0),
        WeightedExerciseLog(SampleExercises.pendlayRow, true, 3, 5, 40.0)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 7, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 60.0),
        CalisthenicExerciseLog(SampleExercises.chinUp, true, 3, 10),
        CalisthenicExerciseLog(SampleExercises.pullUp, true, 3, 10),
      ],
    ),
    //2nd week
    WorkoutLog(
      DateTime(2020, 10, 12, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 62.5),
        WeightedExerciseLog(SampleExercises.overheadPress, true, 3, 5, 32.5),
        WeightedExerciseLog(SampleExercises.benchPress, true, 3, 5, 42.5)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 14, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.row, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 62.5),
        WeightedExerciseLog(SampleExercises.deadlift, true, 3, 5, 72.5),
        WeightedExerciseLog(SampleExercises.pendlayRow, true, 3, 5, 42.5)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 16, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 62.5),
        CalisthenicExerciseLog(SampleExercises.chinUp, true, 3, 10),
        CalisthenicExerciseLog(SampleExercises.pullUp, true, 3, 10),
      ],
    ), //3rd week
    WorkoutLog(
      DateTime(2020, 19, 12, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 65.0),
        WeightedExerciseLog(SampleExercises.overheadPress, true, 3, 5, 35.0),
        WeightedExerciseLog(SampleExercises.benchPress, true, 3, 5, 45.0)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 21, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.row, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 65.0),
        WeightedExerciseLog(SampleExercises.deadlift, true, 3, 5, 75.0),
        WeightedExerciseLog(SampleExercises.pendlayRow, true, 3, 5, 45.0)
      ],
    ),
    WorkoutLog(
      DateTime(2020, 10, 23, 16, 0, 0, 0, 0),
      TimeOfDay(hour: 16, minute: 0),
      TimeOfDay(hour: 17, minute: 0),
      [
        CardioExerciseLog(SampleExercises.cycle, true, 300),
        WeightedExerciseLog(SampleExercises.backSquat, true, 3, 5, 65.0),
        CalisthenicExerciseLog(SampleExercises.chinUp, true, 3, 10),
        CalisthenicExerciseLog(SampleExercises.pullUp, true, 3, 10),
      ],
    )
  ];
}
