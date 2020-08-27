import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';

class UserRegime {
  UserRegime(this.programs, this.currentProgram);
  UserRegime.blank() {
    programs = Set();
    currentProgram = null;
  }

  Set<Program> programs;
  Program currentProgram;
}
