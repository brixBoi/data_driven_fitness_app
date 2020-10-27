import 'package:data_driven_fitness_app/logic/model/exercise_concepts/exercise.dart';

///class to log details of an exercise that has been attempted
class ExerciseLog {
  ExerciseLog(this.exercise, this.completedSuccessfully);

  Exercise exercise;
  bool completedSuccessfully;
}

class CardioExerciseLog extends ExerciseLog {
  CardioExerciseLog(
      Exercise exercise, bool completedSuccessfully, this.duration)
      : super(exercise, completedSuccessfully);

  final int duration;
}

class CalisthenicExerciseLog extends ExerciseLog {
  CalisthenicExerciseLog(
      Exercise exercise, bool completedSuccessfully, this.sets, this.reps)
      : super(exercise, completedSuccessfully);

  final int sets;
  final int reps;
}

class WeightedExerciseLog extends ExerciseLog {
  WeightedExerciseLog(Exercise exercise, bool completedSuccessfully, this.sets,
      this.reps, this.weight)
      : super(exercise, completedSuccessfully);

  final int sets;
  final int reps;
  final double weight;
}
