import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';

class ExerciseStatistic {
  ExerciseStatistic(this.exercise, this.sets, this.reps, this.weight);

  Exercise exercise;
  int sets;
  int reps;
  double weight;
}
