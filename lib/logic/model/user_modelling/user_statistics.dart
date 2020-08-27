import 'package:data_driven_fitness_app/logic/model/completed_activities/workout_log.dart';

import 'exercise_statistic.dart';

class UserStatistics {
  UserStatistics(
      this.height, this.weight, this.workoutLogs, this.exerciseStats);

  double height;
  double weight;
  Set<WorkoutLog> workoutLogs;
  Set<ExerciseStatistic> exerciseStats;
}
