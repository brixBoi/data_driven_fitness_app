import 'exercise.dart';
import 'model_constants.dart';
import 'workout_program.dart';

class Routine {
  Program program;
  List<Exercise> exercises;
  Days day;

  Routine(this.program, this.exercises, this.day);

  Routine.blank(this.program, this.day);
}
