import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';

///class to log details of an exercise that has been attempted
class ExerciseLog {
  ExerciseLog(this.exercise, this.completedSuccessfully, this.reps, this.sets);

  Exercise exercise;
  bool completedSuccessfully;
  int reps;
  int sets;
}
