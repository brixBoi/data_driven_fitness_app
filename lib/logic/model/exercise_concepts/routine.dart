import '../model_constants.dart';
import 'exercise.dart';

///class to create a new Routine
///
/// Routines contain a list of exercises to be
/// performed on certain days and are a part of a
/// Program
class Routine {
  Routine(this.routineExercises, this.day);
  Routine.blank(this.day);

  List<RoutineExercise> routineExercises;
  Days day;

  List<String> getDetails() {
    List<String> output = List();
    for (RoutineExercise re in routineExercises) {
      output.add(re.exercise.name);
    }
    return output;
  }
}

/// An instance of an exercise within a routine, with routine information about the given exercise
abstract class RoutineExercise {
  Exercise exercise;

  RoutineExercise(this.exercise);

  List<String> getDetails() {
    return null;
  }
}

class CardioRoutineExercise extends RoutineExercise {
  CardioRoutineExercise(Exercise exercise, this.duration) : super(exercise);

  int duration;

  List<String> getDetails() {
    List<String> output;

    return output;
  }
}

class CalisthenicRoutineExercise extends RoutineExercise {
  CalisthenicRoutineExercise(
      Exercise exercise, this.sets, this.reps, this.restTime)
      : super(exercise);

  int sets;
  int reps;
  int restTime;
}

class WeightedRoutineExercise extends RoutineExercise {
  WeightedRoutineExercise(Exercise exercise, this.sets, this.reps, this.weight,
      this.restTime, this.skipWarmUp)
      : super(exercise);

  int sets;
  int reps;
  double weight;
  int restTime;
  bool skipWarmUp;
}
