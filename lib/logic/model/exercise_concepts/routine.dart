import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';

import '../model_constants.dart';
import 'exercise.dart';

///class to create a new Routine
///
/// Routines contain a list of exercises to be
/// performed on certain days and are a part of a
/// Program
class Routine {
  Program program;
  List<Exercise> exercises;
  Days day;

  Routine(this.program, this.exercises, this.day);

  Routine.blank(this.program, this.day);
}
