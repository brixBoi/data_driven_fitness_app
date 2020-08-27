import 'package:flutter/material.dart';

import 'model_constants.dart';

class Exercise {
  /// Constructs a new exercise object
  Exercise(this.name, this.description, this.image, this.muscleGroup);

  String name;
  String description;
  Image image;
  MuscleGroups muscleGroup;
}
