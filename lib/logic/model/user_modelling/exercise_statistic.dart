import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';

///class to store the stats of an exercise
///
/// purpose is to allow user to keep their
/// stats(sets, reps and weight lifted) of
/// their each exercises
class ExerciseStatistic {
  ExerciseStatistic(this.exercise, this.sets, this.reps, this.weight);

  Exercise exercise;
  int sets;
  int reps;
  double weight;
}
