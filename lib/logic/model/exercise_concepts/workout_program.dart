import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:flutter/cupertino.dart';

///class to create a new Program
///
///Programs are made up of a set routines
///and work towards a goal, eg: Gaining Mass
class Program {
  Program.name(this.programName, this.description) {
    routines = List<Routine>();
  }

  Program(this.programName, this.description, this.routines, this.goal,
      this.tileGradient);

  LinearGradient tileGradient;
  String programName;
  String description;
  List<Routine> routines;
  UserGoals goal;
}
