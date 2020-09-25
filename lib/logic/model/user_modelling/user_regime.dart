import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';

enum UserGoals {
  BULK,
  CUT,
  BOTH,
}

class UserRegime {
  UserRegime(this.programs, this.currentProgram, this.UserGoal);
  UserRegime.blank(this.UserGoal) {
    programs = Set();
    currentProgram = null;
  }

  Set<Program> programs;
  Program currentProgram;
  UserGoals UserGoal;
}
