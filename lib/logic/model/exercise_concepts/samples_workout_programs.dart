import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';
import 'package:data_driven_fitness_app/logic/model/model_constants.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';

import 'exercise.dart';

class SampleExercises {
  static final Exercise backSquat = Exercise(
    "Back Squat",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.LEGS,
  );

  static final Exercise frontSquat = Exercise(
    "Back Squat",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.LEGS,
  );

  static final Exercise overheadPress = Exercise(
    "Overhead Press",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise pushPress = Exercise(
    "pushPress",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise snatchPress = Exercise(
    "Snatch Press",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise deadlift = Exercise(
    "Deadlift",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise sumoDeadlift = Exercise(
    "Sumo Deadlift",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise powerClean = Exercise(
    "Power Clean",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise chinUp = Exercise(
    "Chin-up",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise pullUp = Exercise(
    "Pull up",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise pendlayRow = Exercise(
    "Pendlay Row",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise benchPress = Exercise(
    "Bench Press",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.CHEST,
  );

  static final Exercise inclineBenchPress = Exercise(
    "Incline Bench Press",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.BACK,
  );

  static final Exercise dip = Exercise(
    "Dip",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise jog = Exercise(
    "Jog",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise cycle = Exercise(
    "Cycle",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );

  static final Exercise row = Exercise(
    "Row",
    "Lorem Ipsum",
    null,
    ExerciseType.WEIGHTED,
    MuscleGroups.TRICEPS,
  );
}

class SamplePrograms {
  static final Program buildMass = Program(
    "Build Mass",
    "Sessions centered around weighted exercises",
    [
      Routine([
        CardioRoutineExercise(SampleExercises.cycle, 300),
        WeightedRoutineExercise(SampleExercises.backSquat, 3, 5, 60, 30, true),
        WeightedRoutineExercise(
            SampleExercises.overheadPress, 3, 5, 30, 30, true),
        WeightedRoutineExercise(SampleExercises.benchPress, 3, 5, 40, 30, true)
      ], Days.MONDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.row, 300),
        WeightedRoutineExercise(SampleExercises.backSquat, 3, 5, 60, 30, true),
        WeightedRoutineExercise(SampleExercises.deadlift, 3, 5, 70, 30, true),
        WeightedRoutineExercise(SampleExercises.pendlayRow, 3, 5, 40, 30, true)
      ], Days.WEDNESDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.cycle, 300),
        WeightedRoutineExercise(SampleExercises.backSquat, 3, 5, 60, 30, true),
        CalisthenicRoutineExercise(SampleExercises.chinUp, 3, 10, 30),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 10, 30),
      ], Days.FRIDAY),
    ],
    UserGoals.BULK,
    Constants.kGradientLightOrange,
  );

  static final Program loseWeight = Program(
    "Lose Weight",
    "Intensive cardio paired with calisthenics",
    [
      Routine([
        CardioRoutineExercise(SampleExercises.cycle, 600),
        WeightedRoutineExercise(SampleExercises.backSquat, 3, 10, 40, 30, true),
        WeightedRoutineExercise(
            SampleExercises.overheadPress, 3, 10, 20, 30, true),
        WeightedRoutineExercise(
            SampleExercises.benchPress, 3, 10, 30, 30, true),
        CardioRoutineExercise(SampleExercises.cycle, 300),
      ], Days.MONDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.row, 600),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 5, 20),
        CalisthenicRoutineExercise(SampleExercises.dip, 3, 5, 20),
        CardioRoutineExercise(SampleExercises.row, 600)
      ], Days.WEDNESDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.row, 600),
        WeightedRoutineExercise(SampleExercises.backSquat, 3, 10, 40, 30, true),
        WeightedRoutineExercise(
            SampleExercises.sumoDeadlift, 3, 10, 50, 30, true),
        CardioRoutineExercise(SampleExercises.row, 300),
      ], Days.FRIDAY),
    ],
    UserGoals.CUT,
    Constants.kBackgroundGradientBlue,
  );

  static final Program balanced = Program(
    "Balanced",
    "A bit of everything",
    [
      Routine([
        CardioRoutineExercise(SampleExercises.cycle, 900),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 5, 20),
        CalisthenicRoutineExercise(SampleExercises.dip, 3, 5, 20)
      ], Days.MONDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.row, 900),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 5, 20),
        CalisthenicRoutineExercise(SampleExercises.dip, 3, 5, 20)
      ], Days.WEDNESDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.row, 900),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 5, 20),
        CalisthenicRoutineExercise(SampleExercises.dip, 3, 5, 20)
      ], Days.THURSDAY),
      Routine([
        CardioRoutineExercise(SampleExercises.jog, 900),
        CalisthenicRoutineExercise(SampleExercises.pullUp, 3, 5, 20),
        CalisthenicRoutineExercise(SampleExercises.dip, 3, 5, 20)
      ], Days.SATURDAY),
    ],
    UserGoals.BOTH,
    Constants.kBackgroundGradientGreen,
  );

  static final List<Program> all = [
    buildMass,
    loseWeight,
    balanced,
  ];
}
