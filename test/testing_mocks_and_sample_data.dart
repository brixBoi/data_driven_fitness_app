import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/logic/model/exercise_concepts/samples_workout_programs.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';

class MocksAndSampleData {
  static Function _getSampleUser = () {
    return User.blank(
      1,
      "zachmartin9001@gmail.com",
      "Zach",
      "Martin",
    );
  };

  static UserData createUninitializedUserData() {
    UserData sampleUserData = UserData();
    sampleUserData.setLoggedInUser(_getSampleUser());
    return sampleUserData;
  }

  static UserData createInitializedUserData() {
    UserData sampleUserData = UserData();
    User user = _getSampleUser();
    user.initializeUser(190, 90, UserGoals.CUT);
    sampleUserData.setLoggedInUser(user);
    sampleUserData.loggedInUser.userRegime.currentProgram =
        SamplePrograms.buildMass;
    return sampleUserData;
  }
}
