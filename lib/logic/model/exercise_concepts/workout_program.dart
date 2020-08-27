import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';

class Program {
  Program.name(this.programName, this.description) {
    routines = Set<Routine>();
  }

  Program(this.programName, this.description, this.routines);

  String programName;
  String description;
  Set<Routine> routines;
}
