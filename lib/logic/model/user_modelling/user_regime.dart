import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';

///enum of goals users are after
enum UserGoals {
  BULK,
  CUT,
  BOTH,
}

///class to create a Regime for the user
///
/// Regime shows the selected programs and recommended based on the
/// users goals, from the enum
class UserRegime {
  UserRegime(this.programs, this.currentProgram, this.UserGoal);

  UserRegime.blank(this.UserGoal) {
    programs = Set();
    currentProgram = null;
  }

  Set<Program> programs;
  Program currentProgram;
  UserGoals UserGoal;

  void setProgram(Program program) {
    currentProgram = program;
  }

  hasProgram() {
    return currentProgram != null;
  }
}
