import 'routine.dart';

class Program {
  Program.name(this.programName, this.description) {
    routines = Set<Routine>();
  }

  Program(this.programName, this.description, this.routines);

  String programName;
  String description;
  Set<Routine> routines;
}
