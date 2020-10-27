import 'package:data_driven_fitness_app/logic/model/completed_activities/workout_log.dart';

import 'exercise_statistic.dart';

///class to hold user statistics
///
/// contains their personal stats
/// and exercise and lift stats
class UserStatistics {
  UserStatistics(
      this.height, this.weight, this.workoutLogs, this.exerciseStats);

  int height;
  int weight;

  //
  List<WorkoutLog> workoutLogs;
  //
  List<ExerciseStatistic> exerciseStats;
}
