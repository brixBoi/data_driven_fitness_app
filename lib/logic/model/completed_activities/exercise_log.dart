import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';

class ExerciseLog {
  ExerciseLog(this.exercise, this.completedSuccessfully, this.reps, this.sets);

  Exercise exercise;
  bool completedSuccessfully;
  int reps;
  int sets;
}
