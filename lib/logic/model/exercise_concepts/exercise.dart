import 'package:flutter/material.dart';

import '../model_constants.dart';

/// class to create a new exercise
class Exercise {
  /// Constructs a new exercise object
  Exercise(this.name, this.description, this.image, this.exerciseType,
      this.muscleGroup);

  String name;
  String description;
  Image image;
  ExerciseType exerciseType;
  MuscleGroups muscleGroup;
}
