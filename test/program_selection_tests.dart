import 'package:data_driven_fitness_app/logic/model/application_variables/application_manager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/samples_workout_programs.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/workout_program.dart';
import 'package:data_driven_fitness_app/logic/model/model_constants.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testing_mocks_and_sample_data.dart';

void main() {
  test('Check for false daily routine', () {
    // Sample userdata and appmanager for testing
    UserData userdata = MocksAndSampleData.createInitializedUserData();
    ApplicationManager appManager = ApplicationManager(userdata);

    // Get a routine which is expected to be null
    Routine nullRoutine =
        appManager.getDailyWorkoutRoutine(customDate: Days.SUNDAY);

    // Check routine is null
    expect(nullRoutine, null);
  });

  test('Check assign program', () {
    // Sample userdata and appmanager for testing
    UserData userdata = MocksAndSampleData.createInitializedUserData();
    ApplicationManager appManager = ApplicationManager(userdata);
    // Set user program to 'loseWeight'
    appManager.setUserProgram(SamplePrograms.loseWeight);

    // Get the current user program
    Program userProgram =
        appManager.userData.loggedInUser.userRegime.currentProgram;

    // Check user program is equal to 'lose weight'
    expect(userProgram, SamplePrograms.loseWeight);
  });

  test('Check for recommended program', () {
    // Sample userdata and appmanager for testing
    UserData userdata = MocksAndSampleData.createInitializedUserData();
    ApplicationManager appManager = ApplicationManager(userdata);
    // Get current logged in user
    User user = appManager.userData.loggedInUser;

    // Get all recommended programs
    List<Program> recommendedPrograms = appManager.getRecommendedPrograms();
    // Check first recommended program has the same base goal as the users selected goal
    expect(recommendedPrograms[0].goal, user.userRegime.UserGoal);
  });
}
