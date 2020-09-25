import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';

///class to create a new Program
///
///Programs are made up of a set routines
///and work towards a goal, eg: Gaining Mass
class Program {
  Program.name(this.programName, this.description) {
    routines = Set<Routine>();
  }

  Program(this.programName, this.description, this.routines);

  String programName;
  String description;
  Set<Routine> routines;
}
