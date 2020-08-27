import 'workout_program.dart';

class UserRegime {
  UserRegime(this.programs, this.currentProgram);
  UserRegime.blank() {
    programs = Set();
    currentProgram = null;
  }

  Set<Program> programs;
  Program currentProgram;
}
